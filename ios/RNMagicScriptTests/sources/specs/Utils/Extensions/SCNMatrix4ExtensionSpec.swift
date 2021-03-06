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

import Quick
import Nimble
import SceneKit
@testable import RNMagicScriptHostApplication

class SCNMatrix4ExtensionSpec: QuickSpec {
    override func spec() {
        describe("SCNMatrix4+Extension") {
            context("quaternion") {
                it("should initialize matrix from a quaternion") {
                    let mat1 = SCNMatrix4.fromQuaternion(quat: SCNQuaternionIdentity)
                    expect(mat1).to(beCloseTo(SCNMatrix4Identity))

                    let axis = SCNVector3(1, 0, 1).normalized()
                    let angle: Float = 0.5 * Float.pi
                    let quat2 = SCNQuaternion.fromAxis(axis, andAngle: angle)
                    let mat2 = SCNMatrix4.fromQuaternion(quat: quat2)
                    expect(mat2).to(beCloseTo(SCNMatrix4MakeRotation(angle, axis.x, axis.y, axis.z)))
                }

                it("should return apropriate quaternion") {
                    let angle: Float = 0.1
                    let axis = SCNVector3(0.2, 0.3, 0.4).normalized()
                    let mat = SCNMatrix4MakeRotation(angle, axis.x, axis.y, axis.z)
                    expect(mat.toQuaternion()).to(beCloseTo(SCNQuaternion.fromAxis(axis, andAngle: angle)))
                }
            }

            context("vectors") {
                it("should get matrix directional vectors and position"){
                    let matrix = SCNMatrix4Identity
                    expect(matrix.right).to(beCloseTo(SCNVector3(1, 0, 0)))
                    expect(matrix.up).to(beCloseTo(SCNVector3(0, 1, 0)))
                    expect(matrix.forward).to(beCloseTo(SCNVector3(0, 0, 1)))
                    expect(matrix.position).to(beCloseTo(SCNVector3(0, 0, 0)))
                }

                it("should set matrix right vector") {
                    let right = SCNVector3(0.1, 0.2, 0.3).normalized()
                    var matrix = SCNMatrix4Identity
                    matrix.right = right
                    expect(matrix.right).to(beCloseTo(right))
                    expect(matrix.m11).to(beCloseTo(right.x))
                    expect(matrix.m12).to(beCloseTo(right.y))
                    expect(matrix.m13).to(beCloseTo(right.z))
                }

                it("should set matrix up vector") {
                    let up = SCNVector3(0.1, 0.2, 0.3).normalized()
                    var matrix = SCNMatrix4Identity
                    matrix.up = up
                    expect(matrix.up).to(beCloseTo(up))
                    expect(matrix.m21).to(beCloseTo(up.x))
                    expect(matrix.m22).to(beCloseTo(up.y))
                    expect(matrix.m23).to(beCloseTo(up.z))
                }

                it("should set matrix forward vector") {
                    let forward = SCNVector3(0.1, 0.2, 0.3).normalized()
                    var matrix = SCNMatrix4Identity
                    matrix.forward = forward
                    expect(matrix.forward).to(beCloseTo(forward))
                    expect(matrix.m31).to(beCloseTo(forward.x))
                    expect(matrix.m32).to(beCloseTo(forward.y))
                    expect(matrix.m33).to(beCloseTo(forward.z))
                }

                it("should set matrix position vector") {
                    let position = SCNVector3(0.1, 0.2, 0.3)
                    var matrix = SCNMatrix4Identity
                    matrix.position = position
                    expect(matrix.position).to(beCloseTo(position))
                    expect(matrix.m41).to(beCloseTo(position.x))
                    expect(matrix.m42).to(beCloseTo(position.y))
                    expect(matrix.m43).to(beCloseTo(position.z))
                }
            }
        }
        
        describe("float4x4 extension") {
            context("float4x4 init") {
                it("should init float4x4") {
                    let quat = SCNQuaternion.fromAxis(SCNVector3(2.7, 4.5, 3.8).normalized(), andAngle: Float(34.0).toRadians)
                    let referenceMatrix = SCNMatrix4.fromQuaternion(quat: quat)
                    let result = float4x4(referenceMatrix)
                    expect(result.columns.0.x).to(beCloseTo(referenceMatrix.m11))
                    expect(result.columns.0.y).to(beCloseTo(referenceMatrix.m12))
                    expect(result.columns.0.z).to(beCloseTo(referenceMatrix.m13))
                    expect(result.columns.0.w).to(beCloseTo(referenceMatrix.m14))
                    
                    expect(result.columns.1.x).to(beCloseTo(referenceMatrix.m21))
                    expect(result.columns.1.y).to(beCloseTo(referenceMatrix.m22))
                    expect(result.columns.1.z).to(beCloseTo(referenceMatrix.m23))
                    expect(result.columns.1.w).to(beCloseTo(referenceMatrix.m24))
                    
                    expect(result.columns.2.x).to(beCloseTo(referenceMatrix.m31))
                    expect(result.columns.2.y).to(beCloseTo(referenceMatrix.m32))
                    expect(result.columns.2.z).to(beCloseTo(referenceMatrix.m33))
                    expect(result.columns.2.w).to(beCloseTo(referenceMatrix.m34))
                    
                    expect(result.columns.3.x).to(beCloseTo(referenceMatrix.m41))
                    expect(result.columns.3.y).to(beCloseTo(referenceMatrix.m42))
                    expect(result.columns.3.z).to(beCloseTo(referenceMatrix.m43))
                    expect(result.columns.3.w).to(beCloseTo(referenceMatrix.m44))
                }
            }
        }
    }
}
