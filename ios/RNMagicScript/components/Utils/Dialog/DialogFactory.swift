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

class DialogFactory {
    static func createDialog(for dialogData: DialogDataProviding) -> UIView? {
        let dialog = DialogView(frame: CGRect(x: 0.0, y: 0.0, width: DialogView.width, height: DialogView.height), dialogData: dialogData)
        dialog.dialogData = dialogData
        return dialog
    }
}