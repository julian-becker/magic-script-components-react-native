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

class InputAccessoryViewFactorySpec: QuickSpec {
    override func spec() {
        describe("InputAccessoryViewFactory") {
            context("when parent view is kind of InputDataProviding") {
                it("should return correct accessory view") {
                    let inputDataProvider: DataProviding = SimpleInputDataProvider()
                    let view = InputAccessoryViewFactory.createView(for: inputDataProvider, onFinishEditing: nil)
                    expect(view).toNot(beNil())
                }

                context("when requested") {
                    it("should create multiline text accessory view") {
                        let textEdit = UiTextEditNode(props: ["multiline" : true])
                        let view = InputAccessoryViewFactory.createView(for: textEdit, onFinishEditing: nil)
                        expect(view is MultiLineTextAccessoryView).to(beTrue())
                    }

                    it("should create single line text accessory view") {
                        let textEdit = UiTextEditNode(props: ["multiline" : false])
                        let view = InputAccessoryViewFactory.createView(for: textEdit, onFinishEditing: nil)
                        expect(view is SingleLineTextAccessoryView).to(beTrue())
                    }
                }
            }

            context("when parent view isn't kind of InputDataProviding") {
                it("should return nil") {
                    let dataProvider = SimpleDataProvider()
                    let view = InputAccessoryViewFactory.createView(for: dataProvider, onFinishEditing: nil)
                    expect(view).to(beNil())
                }
            }
        }
    }
}

fileprivate struct SimpleDataProvider: DataProviding { }
fileprivate struct SimpleInputDataProvider: InputDataProviding {
    var value: Any? = nil
    var placeholder: String? = nil
    var charLimit: Int = 0
    var multiline: Bool = false
    var password: Bool = false
    var autocapitalizationType: UITextAutocapitalizationType? = nil
    var keyboardType: UIKeyboardType? = nil
    var textContentType: UITextContentType? = nil
}
