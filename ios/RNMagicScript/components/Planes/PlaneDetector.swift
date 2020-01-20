//
//  Copyright (c) 2019 Magic Leap, Inc. All Rights Reserved
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

import UIKit
import ARKit
import SceneKit

@objc open class PlaneDetector: NSObject, RCTARViewObserving {
    @objc public static var instance: PlaneDetector = PlaneDetector()
    
    @objc var planes: [PlaneNode] = []
    fileprivate weak var arView: RCTARView?

    @objc public func register(arView: RCTARView) {
        self.arView = arView
    }

    @objc public var detectedPlanes: [TransformNode] {
        return planes.map { $0 as TransformNode }
    }

    @objc public func enablePlaneDetection() {
        self.arView?.planeDetection = true
    }

    @objc public func disablePlaneDetection() {
        self.arView?.planeDetection = false
    }

    func handleNodeTap(_ node: PlaneNode) {
        self.onPlaneTapped?(self)
    }
    
    @objc public var onPlaneDetected: ((_ sender: PlaneDetector) -> Void)?
    @objc public var onPlaneTapped: ((_ sender: PlaneDetector) -> Void)?
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        let planeNode = PlaneNode()
        planeNode.planeAnchor = planeAnchor

        planeNode.setupWith(planeAnchor: planeAnchor)
        planeNode.updateLayout()
        planes.append(planeNode)
        node.addChildNode(planeNode)

        // notify JSX layer
        self.onPlaneDetected?(self)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor) {
        // if expected more effective way of handling plane/anchor update put some logic here
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor,
            let planeNode = node.childNodes.first as? PlaneNode
            else { return }

        planeNode.planeAnchor = planeAnchor

        planeNode.updateWith(planeAnchor: planeAnchor)

        // notify JSX layer
        self.onPlaneDetected?(self)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard let _ = anchor as? ARPlaneAnchor,
            let planeNode = node.childNodes.first as? PlaneNode
            else { return }
        planes.removeAll { $0 == planeNode }
    }
}
