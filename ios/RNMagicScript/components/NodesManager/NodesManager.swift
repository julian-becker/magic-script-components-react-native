//
//  Copyright (c) 2019-2020 Magic Leap, Inc. All Rights Reserved
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import SceneKit
import ARKit

//sourcery: AutoMockable
//sourcery: ObjcProtocol
@objc protocol NodesManaging: NSObjectProtocol {
    @objc var scene: Scene? { get }
    @objc var prismsById: [String: Prism] { get }

    @objc func registerScene(_ scene: Scene, sceneId: String)
    @objc func registerPrism(_ prism: Prism, prismId: String)
    @objc func registerNode(_ node: TransformNode, nodeId: String)
    @objc func unregisterNode(_ nodeId: String)

    @objc func updateNode(_ nodeId: String, properties: [String: Any]) -> Bool
}

@objc open class NodesManager: NSObject {
    @objc public static let instance = NodesManager(rootNode: BaseNode(), nodesById: [:], prismsByAnchorUuid: [:])
    @objc public private (set) var rootNode: BaseNode

    fileprivate var nodesById: [String: BaseNode]
    fileprivate var prismsByAnchorUuid: [String: Prism]
    fileprivate var anchorNodesByAnchorUuid: [String: SCNNode] = [:]

    fileprivate(set) var nodeSelector: UiNodeSelector!
    fileprivate weak var ARView: RCTARView?
    var dialogPresenter: DialogPresenting?

    init(rootNode: BaseNode, nodesById: [String: TransformNode], prismsByAnchorUuid: [String: Prism]) {
        self.rootNode = rootNode
        self.nodesById = nodesById
        self.prismsByAnchorUuid = prismsByAnchorUuid
    }

    @objc public func registerARView(_ arView: RCTARView) {
        ARView = arView
        arView.scene.rootNode.addChildNode(rootNode)
        arView.register(self)
        nodeSelector = UiNodeSelector(rootNode)
    }

    @objc public func findNodeWithId(_ nodeId: String) -> BaseNode? {
        return nodesById[nodeId]
    }

    @objc public func findUiNodeWithId(_ nodeId: String) -> UiNode? {
        return nodesById[nodeId] as? UiNode
    }

    @objc public func findPrismWithAnchorUuid(_ anchorUuid: String) -> Prism? {
        return prismsByAnchorUuid[anchorUuid]
    }

    @objc public private(set) var scene: Scene?
    @objc public func registerScene(_ scene: Scene, sceneId: String) {
        scene.name = sceneId
        self.scene = scene
    }

    @objc public private(set) var prismsById: [String: Prism] = [:]
    @objc public func registerPrism(_ prism: Prism, prismId: String) {
        prism.name = prismId
        prismsById[prismId] = prism
        updatePrismAnchorUuid(prism, oldAnchorUuid: "")
    }

    @objc public func updatePrismAnchorUuid(_ prism: Prism, oldAnchorUuid: String) {
        if !oldAnchorUuid.isEmpty {
            prismsByAnchorUuid.removeValue(forKey: oldAnchorUuid)
        }
        if !prism.anchorUuid.isEmpty {
            prismsByAnchorUuid[prism.anchorUuid] = prism
            if let anchorNode = anchorNodesByAnchorUuid[prism.anchorUuid] {
                prism.applyTransform(from: anchorNode)
            }
        }
    }

    @objc public func registerNode(_ node: TransformNode, nodeId: String) {
        node.name = nodeId
        nodesById[nodeId] = node
    }

    @objc public func unregisterNode(_ nodeId: String) {
        if let node = nodesById[nodeId] {
            node.removeFromParentNode()
            nodesById.removeValue(forKey: nodeId)
            if let dialog = node as? DialogDataProviding {
                dialogPresenter?.dismiss(dialog)
            }
            if let uiNode = node as? UiNode {
                uiNode.onDelete?(uiNode)
            }
        }
    }

    @objc public func addNode(_ nodeId: String, toParent parentId: String) {
        if let node = getNodeById(nodeId) {
            if let parentNode = getNodeById(parentId) {
                if parentNode.addNode(node) {
                    if let dialog = node as? DialogDataProviding {
                        dialogPresenter?.present(dialog)
                    }
                    return
                }
            }

            // Remove node which does not have a parent or
            // the parent does not want to add the node to its hierarchy.
            removeNodeWithDescendants(node)
        }

    }

    @objc public func addNodeToRoot(_ nodeId: String) {
        if let scene = self.scene, scene.name == nodeId {
            rootNode.addChildNode(scene)
        }
    }

    @objc public func removeNode(_ nodeId: String, fromParent parentId: String) {
        if let node = getNodeById(nodeId),
            let parentNode = getNodeById(parentId) {
            parentNode.removeNode(node)
            removeNodeWithDescendants(node)
        }
    }

    @objc public func removeNodeFromRoot(_ nodeId: String) {
        if let scene = self.scene,
            scene.name == nodeId,
            rootNode == scene.parent {
            scene.removeFromParentNode()
            removeSceneWithDescendants(scene)
        }
    }

    @objc fileprivate func removeSceneWithDescendants(_ scene: Scene) {
        scene.enumerateBaseNodes { (item) in
            if let id = item.name {
                unregisterNode(id)
            }
        }
    }

    @objc fileprivate func removeNodeWithDescendants(_ node: BaseNode) {
        node.enumerateBaseNodes { (item) in
            if let id = item.name {
                unregisterNode(id)
            }
        }
    }

    @objc public func clear() {
        nodesById.forEach { $0.value.removeFromParentNode() }
        nodesById.removeAll()
        
        prismsById.forEach { $0.value.removeFromParentNode() }
        prismsById.removeAll()
        prismsByAnchorUuid.removeAll()
        
        scene?.removeFromParentNode()
        scene = nil
    }

    private func getNodeById(_ nodeId: String) -> BaseNode? {
        var result: BaseNode?
        result = nodesById[nodeId]
        if result == nil { result = prismsById[nodeId] }
        if result == nil { result = self.scene?.name == nodeId ? self.scene : nil }
        return result
    }

    @objc public func updateNode(_ nodeId: String, properties: [String: Any]) -> Bool {
        guard let node = getNodeById(nodeId) else { return false }
        node.update(properties)
        if let uiNode = node as? UiNode {
            uiNode.onUpdate?(uiNode)
        }
        return true
    }

    @objc public func updateLayout() {
        assert(Thread.isMainThread, "updateLayout must be called in main thread!")
        rootNode.enumerateTransformNodes { node in
            node.layoutIfNeeded()
        }

        rootNode.enumerateTransformNodes { node in
            node.layoutContainerIfNeeded()
        }

        rootNode.enumerateTransformNodes { node in
            node.postUpdate()
        }
    }

    func registerAnchorNode(_ node: SCNNode, anchorId: String) {
        anchorNodesByAnchorUuid[anchorId] = node
    }

    func unregisterAnchorNode(anchorId: String) {
        anchorNodesByAnchorUuid.removeValue(forKey: anchorId)
    }
}
