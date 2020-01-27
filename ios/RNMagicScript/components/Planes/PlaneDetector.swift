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

    func handleNodeTap(_ planeNode: PlaneNode, _ touchPoint: CGPoint?) {
        print("BUKA touchPoint: \(touchPoint)")
        var vertices = [[CGFloat]]()
        if let planeVertices = planeNode.vertices {
            for vertice in planeVertices {
                vertices.append([CGFloat(vertice.x), CGFloat(vertice.y), CGFloat(vertice.z)])
            }
        }

        // notify JSX layer
        self.onPlaneTapped?(self,
                              planeNode,
                              planeNode.id,
                              planeNode.type,
                              planeNode.position.toArrayOfCGFloat,
                              planeNode.rotation.toArrayOfCGFloat,
                              vertices,
                              planeNode.center.toArrayOfCGFloat,
                              planeNode.normal.toArrayOfCGFloat,
                              CGFloat(planeNode.width),
                              CGFloat(planeNode.height))
    }
    
    @objc public var onPlaneDetected: ((_ sender: PlaneDetector, _ plane: PlaneNode, _ id: UUID?, _ type: String, _ position: [CGFloat], _ rotation: [CGFloat], _ vertices: [[CGFloat]], _ center: [CGFloat], _ normal: [CGFloat], _ width: CGFloat, _ height: CGFloat) -> Void)?
    @objc public var onPlaneUpdated:  ((_ sender: PlaneDetector, _ plane: PlaneNode, _ id: UUID?, _ type: String, _ position: [CGFloat], _ rotation: [CGFloat], _ vertices: [[CGFloat]], _ center: [CGFloat], _ normal: [CGFloat], _ width: CGFloat, _ height: CGFloat) -> Void)?
    @objc public var onPlaneRemoved:  ((_ sender: PlaneDetector, _ plane: PlaneNode, _ id: UUID?, _ type: String, _ position: [CGFloat], _ rotation: [CGFloat], _ vertices: [[CGFloat]], _ center: [CGFloat], _ normal: [CGFloat], _ width: CGFloat, _ height: CGFloat) -> Void)?
    @objc public var onPlaneTapped:  ((_ sender: PlaneDetector, _ plane: PlaneNode, _ id: UUID?, _ type: String, _ position: [CGFloat], _ rotation: [CGFloat], _ vertices: [[CGFloat]], _ center: [CGFloat], _ normal: [CGFloat], _ width: CGFloat, _ height: CGFloat) -> Void)?
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        let planeNode = PlaneNode()
        planeNode.planeAnchor = planeAnchor

        planeNode.setupWith(planeAnchor: planeAnchor)
        planeNode.updateLayout()
        planes.append(planeNode)
        node.addChildNode(planeNode)

        var vertices = [[CGFloat]]()
        if let planeVertices = planeNode.vertices {
            for vertice in planeVertices {
                vertices.append([CGFloat(vertice.x), CGFloat(vertice.y), CGFloat(vertice.z)])
            }
        }

        // notify JSX layer
        self.onPlaneDetected?(self,
                              planeNode,
                              planeNode.id,
                              planeNode.type,
                              planeNode.position.toArrayOfCGFloat,
                              planeNode.rotation.toArrayOfCGFloat,
                              vertices,
                              planeNode.center.toArrayOfCGFloat,
                              planeNode.normal.toArrayOfCGFloat,
                              CGFloat(planeNode.width),
                              CGFloat(planeNode.height))
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

        var vertices = [[CGFloat]]()
        if let planeVertices = planeNode.vertices {
            for vertice in planeVertices {
                vertices.append([CGFloat(vertice.x), CGFloat(vertice.y), CGFloat(vertice.z)])
            }
        }

        // notify JSX layer
        self.onPlaneDetected?(self,
                              planeNode,
                              planeNode.id,
                              planeNode.type,
                              planeNode.position.toArrayOfCGFloat,
                              planeNode.rotation.toArrayOfCGFloat,
                              vertices,
                              planeNode.center.toArrayOfCGFloat,
                              planeNode.normal.toArrayOfCGFloat,
                              CGFloat(planeNode.width),
                              CGFloat(planeNode.height))
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard let _ = anchor as? ARPlaneAnchor,
            let planeNode = node.childNodes.first as? PlaneNode
            else { return }
        planes.removeAll { $0 == planeNode }


        var vertices = [[CGFloat]]()
        if let planeVertices = planeNode.vertices {
            for vertice in planeVertices {
                vertices.append([CGFloat(vertice.x), CGFloat(vertice.y), CGFloat(vertice.z)])
            }
        }

        // notify JSX layer
        self.onPlaneDetected?(self,
                              planeNode,
                              planeNode.id,
                              planeNode.type,
                              planeNode.position.toArrayOfCGFloat,
                              planeNode.rotation.toArrayOfCGFloat,
                              vertices,
                              planeNode.center.toArrayOfCGFloat,
                              planeNode.normal.toArrayOfCGFloat,
                              CGFloat(planeNode.width),
                              CGFloat(planeNode.height))
    }
}

extension SCNVector3 {
    var toArrayOfCGFloat: [CGFloat] {
        return [CGFloat(x), CGFloat(y), CGFloat(z)]
    }
}

extension SCNVector4 {
    var toArrayOfCGFloat: [CGFloat] {
        return [CGFloat(x), CGFloat(y), CGFloat(z), CGFloat(w)]
    }
}
