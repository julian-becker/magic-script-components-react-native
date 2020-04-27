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
@testable import RNMagicScriptHostApplication

class DialogFactorySpec: QuickSpec {
    override func spec() {
        describe("DialogFactory") {
            context("when parent view is kind of DialogDataProviding") {
                it("should return correct input view") {
                    let simpleDialogDataProvider = SimpleDialogDataProvider()
                    let dialogView = DialogFactory.createDialog(for: simpleDialogDataProvider)
                    expect(dialogView).toNot(beNil())
                }
            }
        }
    }
}

fileprivate class SimpleDialogDataProvider: DialogDataProviding {
    var id: String {
        return "fakeID"
    }
    var dialogType: DialogType = .dualAction
    var buttonType: ButtonType = .textWithIcon
    var title: String?
    var message: String?
    var confirmText: String?
    var confirmIcon: SystemIcon?
    var cancelText: String?
    var cancelIcon: SystemIcon?
    var scrolling: Bool = false
    var expireTime: CGFloat = 0.0
    func dialogConfirmed() { }
    func dialogCanceled() { }
    func dialogTimeExpired() { }
}
