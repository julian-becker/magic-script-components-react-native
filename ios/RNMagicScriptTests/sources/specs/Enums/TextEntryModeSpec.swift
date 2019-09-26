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

import Quick
import Nimble
@testable import RNMagicScriptHostApplication

class TextEntryModeSpec: QuickSpec {
    override func spec() {
        describe("TextEntryMode") {
            let objectByRawValue: [String: TextEntryMode] = [
                "email" : TextEntryMode.email,
                "none" : TextEntryMode.none,
                "normal" : TextEntryMode.normal,
                "numeric" : TextEntryMode.numeric,
                "url" : TextEntryMode.url,
            ]

            context("raw value") {
                it("should create proper object from raw value") {
                    objectByRawValue.forEach({ (arg0) in
                        let (key, value) = arg0
                        expect(TextEntryMode(rawValue: key)).to(equal(value))
                    })
                }

                it("should return proper raw value") {
                    objectByRawValue.forEach({ (arg0) in
                        let (key, value) = arg0
                        expect(value.rawValue).to(equal(key))
                    })
                }

                it("should return nil for unknown text entry mode") {
                    expect(TextEntryMode(rawValue: "hologram")).to(beNil())
                }
            }
        }
    }
}