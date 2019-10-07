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

import Foundation
import UIKit

@objc open class SystemIcon: NSObject {

    let name: String
    let imageName: String

    var image: UIImage {
        let image = UIImage(named: imageName, in: SystemIcon.bundle, compatibleWith: UIScreen.main.traitCollection)
        guard let result = image else {
            print("Unable to load image \"\(imageName)\".")
            return SystemIcon.missingImage
        }
        return result
    }

    init(_ name: String) {
        self.name = name
        self.imageName = SystemIcon.getImageName(name)
    }
}

// MARK: - Bundle
extension SystemIcon {
    fileprivate static func getImageName(_ text: String) -> String {
        return text.split(separator: "-").map { $0.prefix(1).uppercased() + $0.dropFirst() }.joined()
    }

    fileprivate static var missingImage: UIImage = {
        return UIImage.image(from: [UIColor.systemPink], size: 16)!
    }()

    fileprivate static var bundle: Bundle = {
        // First check if icon exists in the main bundle.
        // If so, that means the lumin system icons have been installed.
        let mainBundle = Bundle.main
        if let randomIconImage = UIImage(named: "Actions", in: mainBundle, compatibleWith: UIScreen.main.traitCollection) {
            print("Using \"lumin-system-icons\"")
            return mainBundle
        }

        print("Using \"default-system-icons\"")
        // Then, use default sytem icons from RNMagicScriptResources.
        return Bundle.resourcesBundle()!
    }()
}
