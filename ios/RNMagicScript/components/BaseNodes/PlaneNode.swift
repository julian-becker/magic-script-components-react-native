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

class PlaneNode: UiNode {
    var planeAnchor: ARPlaneAnchor?

    @objc var id: UUID? {
        return planeAnchor?.identifier
    }

    @objc var width: Float {
        return planeAnchor?.extent.x ?? 0.0
    }

    @objc var height: Float {
        return planeAnchor?.extent.y ?? 0.0
    }

    @objc override var position: SCNVector3 { // looks like it's position of center
        set { }
        get { return SCNVector3(CGFloat(planeAnchor?.center.x ?? 0.0), CGFloat(planeAnchor?.center.y ?? 0.0), CGFloat(planeAnchor?.center.z ?? 0.0)) }
    }

    @objc var center: SCNVector3 {
        return SCNVector3(CGFloat(planeAnchor?.center.x ?? 0.0), CGFloat(planeAnchor?.center.y ?? 0.0), CGFloat(planeAnchor?.center.z ?? 0.0))
    }

    @objc var normal: SCNVector3 {
        return transform.forward
    }

    @objc var vertices: [SCNVector3]? {
        //        Convert vertices to correct format
        //        return planeAnchor?.geometry.vertices // [vector_float3]
        return []
    }

    @objc var type: String {
        if #available(iOS 12.0, *), ARPlaneAnchor.isClassificationSupported, let anchor = planeAnchor {
            return anchor.classification.description
        }

        return "Sth went wrong"
    }

    override func hitTest(ray: Ray) -> TransformNode? {
        return self
    }
}

extension PlaneNode {
    func setupWith(planeAnchor: ARPlaneAnchor) {
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        let plane = SCNPlane(width: width, height: height)

        plane.materials.first?.diffuse.contents = UIColor.red.withAlphaComponent(0.65)

        let planeNode = SCNNode(geometry: plane)

        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x,y,z)

        // Planes in SceneKit are vertical by default so we need to rotate
        // 90 degrees to match planes in ARKit
        planeNode.eulerAngles.x = -.pi / 2

        addChildNode(planeNode)
    }

    func updateWith(planeAnchor: ARPlaneAnchor) {
        guard let planeNode = childNodes.first,
            let plane = planeNode.geometry as? SCNPlane else { return }

        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        plane.width = width
        plane.height = height

        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x, y, z)
    }
}

@available(iOS 12.0, *)
extension ARPlaneAnchor.Classification {
    var description: String {
        switch self {
        case .wall:
            return "Wall"
        case .floor:
            return "Floor"
        case .ceiling:
            return "Ceiling"
        case .table:
            return "Table"
        case .seat:
            return "Seat"
        case .none(.unknown):
            return "Unknown"
        default:
            return ""
        }
    }
}
