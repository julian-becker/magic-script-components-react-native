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

import SceneKit

//sourcery: AutoMockable
protocol TapSimulating {
    var onTap: ((_ sender: UiNode) -> (Void))? { get set }
    func simulateTap()
}

extension TapSimulating where Self: UiNode {
    func simulateTap() {
        assert(enabled, "Node must be enabled in order to tap it!")
        onTap?(self)
        let initialPosition = contentNode.position
        let animation = CABasicAnimation(keyPath: "position.z")
        animation.fromValue = initialPosition.z
        animation.toValue = initialPosition.z - 0.05
        animation.duration = 0.1
        animation.autoreverses = true
        animation.repeatCount = 1
        let objectTypeIdentifier = String(describing: type(of: self))
        let objectAnimationKey = objectTypeIdentifier + (name ?? "")
        contentNode.addAnimation(animation, forKey: objectAnimationKey)
    }
}