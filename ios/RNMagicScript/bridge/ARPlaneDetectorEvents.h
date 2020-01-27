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

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

@class PlaneDetector;
@class PlaneNode;

@interface ARPlaneDetectorEvents : RCTEventEmitter <RCTBridgeModule>
+ (instancetype)instance;

- (void)onPlaneDetectedEventReceived:(PlaneDetector *)sender plane:(PlaneNode *)plane id:(NSUUID *)id type:(NSString *)type  position:(NSArray<NSNumber *> *)position rotation:(NSArray<NSNumber *> *)rotation vertices:(NSArray<NSArray<NSNumber *> *> *)vertices center:(NSArray<NSNumber *> *)center normal:(NSArray<NSNumber *> *)normal width:(CGFloat)width height:(CGFloat)height;
- (void)onPlaneUpdatedEventReceived:(PlaneDetector *)sender plane:(PlaneNode *)plane id:(NSUUID *)id type:(NSString *)type  position:(NSArray<NSNumber *> *)position rotation:(NSArray<NSNumber *> *)rotation vertices:(NSArray<NSArray<NSNumber *> *> *)vertices center:(NSArray<NSNumber *> *)center normal:(NSArray<NSNumber *> *)normal width:(CGFloat)width height:(CGFloat)height;
- (void)onPlaneRemovedEventReceived:(PlaneDetector *)sender plane:(PlaneNode *)plane id:(NSUUID *)id type:(NSString *)type  position:(NSArray<NSNumber *> *)position rotation:(NSArray<NSNumber *> *)rotation vertices:(NSArray<NSArray<NSNumber *> *> *)vertices center:(NSArray<NSNumber *> *)center normal:(NSArray<NSNumber *> *)normal width:(CGFloat)width height:(CGFloat)height;
- (void)onPlaneTappedEventReceived:(PlaneDetector *)sender plane:(PlaneNode *)plane id:(NSUUID *)id type:(NSString *)type  position:(NSArray<NSNumber *> *)position rotation:(NSArray<NSNumber *> *)rotation vertices:(NSArray<NSArray<NSNumber *> *> *)vertices center:(NSArray<NSNumber *> *)center normal:(NSArray<NSNumber *> *)normal width:(CGFloat)width height:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
