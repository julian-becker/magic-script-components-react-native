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

    fileprivate(set) var surfaces: [String: Surface] = [:]
    fileprivate weak var arView: RCTARView?
    fileprivate(set) var configuration: [String: Any] = [:]

    @objc public func register(arView: RCTARView) {
        self.arView = arView

        // trigger stored configuration (if ARView was created after PlaneDetector)
        let planeDetection = Convert.toPlaneDetection(configuration["planeType"])
        self.arView?.enablePlaneDetection(planeDetection)
    }

    @objc public func enablePlaneDetection(with configuration: [String: Any]) {
        self.configuration = configuration
        let planeDetection = Convert.toPlaneDetection(configuration["planeType"])
        self.arView?.enablePlaneDetection(planeDetection)
    }

    @objc public func disablePlaneDetection() {
        self.configuration = [:]
        self.arView?.disablePlaneDetection()
    }

    @objc public func getAllPlanes(with configuration: [String: Any]) -> [String: Any] {
        var result: [String: Any] = [:]
        for (id, surface) in self.surfaces {
            var vertices = [[CGFloat]]()
            for vertice in surface.vertices {
                vertices.append([CGFloat(vertice.x), CGFloat(vertice.y), CGFloat(vertice.z)])
            }

            result[id] = [ "id": surface.id, "type": surface.type, "vertices": vertices, "center": surface.center, "normal": surface.normal]
        }
        return result
    }

    @objc public var onPlaneDetected: ((_ sender: PlaneDetector, _ id: UUID?, _ type: String, _ vertices: [[CGFloat]], _ center: [CGFloat], _ normal: [CGFloat]) -> Void)?
    @objc public var onPlaneUpdated: ((_ sender: PlaneDetector, _ id: UUID?, _ type: String, _ vertices: [[CGFloat]], _ center: [CGFloat], _ normal: [CGFloat]) -> Void)?
    @objc public var onPlaneRemoved: ((_ sender: PlaneDetector, _ id: UUID?, _ type: String, _ vertices: [[CGFloat]], _ center: [CGFloat], _ normal: [CGFloat]) -> Void)?
    @objc public var onPlaneTapped: ((_ sender: PlaneDetector, _ id: UUID?, _ type: String, _ vertices: [[CGFloat]], _ center: [CGFloat], _ normal: [CGFloat]) -> Void)?

    func handleNodeTap(_ surfaceNode: SurfaceNode, _ touchPoint: CGPoint?) {
        var vertices = [[CGFloat]]()
        for vertice in surfaceNode.surface.vertices {
            vertices.append([CGFloat(vertice.x), CGFloat(vertice.y), CGFloat(vertice.z)])
        }

        // notify JSX layer
        self.onPlaneDetected?(self,
                            surfaceNode.surface.id,
                            surfaceNode.surface.type,
                            vertices,
                            surfaceNode.surface.center.toArrayOfCGFloat,
                            surfaceNode.surface.normal.toArrayOfCGFloat)

    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let surfaceAnchor = anchor as? ARPlaneAnchor else { return }

        let surface = Surface(anchor: surfaceAnchor)

        var vertices = [[CGFloat]]()
        for vertice in surface.vertices {
            vertices.append([CGFloat(vertice.x), CGFloat(vertice.y), CGFloat(vertice.z)])
        }

        surfaces[surface.id.uuidString] = surface

        // notify JSX layer
        self.onPlaneDetected?(self,
                            surface.id,
                            surface.type,
                            vertices,
                            surface.center.toArrayOfCGFloat,
                            surface.normal.toArrayOfCGFloat)
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let surfaceAnchor = anchor as? ARPlaneAnchor,
            let surface = surfaces[surfaceAnchor.identifier.uuidString] else { return }

        surface.update(anchor: surfaceAnchor)

        var vertices = [[CGFloat]]()
        for vertice in surface.vertices {
            vertices.append([CGFloat(vertice.x), CGFloat(vertice.y), CGFloat(vertice.z)])
        }

        // notify JSX layer
        self.onPlaneUpdated?(self,
                            surface.id,
                            surface.type,
                            vertices,
                            surface.center.toArrayOfCGFloat,
                            surface.normal.toArrayOfCGFloat)
    }

    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard let surfaceAnchor = anchor as? ARPlaneAnchor,
            let surface = surfaces[surfaceAnchor.identifier.uuidString] else { return }

        surfaces.removeValue(forKey: surface.id.uuidString)

        var vertices = [[CGFloat]]()
        for vertice in surface.vertices {
            vertices.append([CGFloat(vertice.x), CGFloat(vertice.y), CGFloat(vertice.z)])
        }

        // notify JSX layer
        self.onPlaneRemoved?(self,
                            surface.id,
                            surface.type,
                            vertices,
                            surface.center.toArrayOfCGFloat,
                            surface.normal.toArrayOfCGFloat)
    }
}
