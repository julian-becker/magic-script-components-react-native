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

#import "ARPlaneDetector.h"
#import "ARPlaneDetectorEvents.h"
#import "RNMagicScript-Swift.h"

@interface ARPlaneDetector ()
@end

@implementation ARPlaneDetector

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addOnPlaneDetectedEventHandler) {
    NSLog(@"addOnPlaneDetectedEventHandler");
    PlaneDetector.instance.onPlaneDetected = ^(PlaneDetector *sender) {
        [[ARPlaneDetectorEvents instance] onPlaneDetectedEventReceived:sender];
    };
}

RCT_EXPORT_METHOD(addOnPlaneTappedEventHandler) {
    NSLog(@"addOnPlaneTappedEventHandler");
    PlaneDetector.instance.onPlaneTapped = ^(PlaneDetector *sender) {
        [[ARPlaneDetectorEvents instance] onPlaneTappedEventReceived:sender];
    };
}

RCT_EXPORT_METHOD(startPlaneDetection) {
    NSLog(@"startPlaneDetection");
    [[PlaneDetector instance] enablePlaneDetection];
}

RCT_EXPORT_METHOD(stopPlaneDetection) {
    NSLog(@"stopPlaneDetection");
    [[PlaneDetector instance] disablePlaneDetection];
}

@end
