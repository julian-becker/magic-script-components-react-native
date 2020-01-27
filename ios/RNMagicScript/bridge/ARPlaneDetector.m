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

#import <Foundation/Foundation.h>

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

RCT_EXPORT_METHOD(startDetecting:(NSDictionary *)configuration) {
    NSLog(@"startDetecting %@", configuration);
    [[PlaneDetector instance] enablePlaneDetection];
}

RCT_EXPORT_METHOD(stopDetecting) {
    NSLog(@"stopDetecting");
    [[PlaneDetector instance] disablePlaneDetection];
}

RCT_EXPORT_METHOD(getAllPlanes:(NSDictionary *)configuration callback:(RCTResponseSenderBlock)callback) {
    NSLog(@"getAllPlanes %@", configuration);
    callback(@[[NSNull null], @[]]);
}

RCT_EXPORT_METHOD(reset) {
    NSLog(@"reset");
}

RCT_EXPORT_METHOD(requestPlaneCast:(NSDictionary *)configuration callback:(RCTResponseSenderBlock)callback) {
    NSLog(@"requestPlaneCast %@", configuration);
    callback(@[[NSNull null], @[]]);
}

RCT_EXPORT_METHOD(addOnPlaneDetectedEventHandler) {
    NSLog(@"addOnPlaneDetectedEventHandler");
    PlaneDetector.instance.onPlaneDetected = ^(PlaneDetector *sender, PlaneNode *plane, NSUUID *id, NSString *type, NSArray<NSNumber *> *position, NSArray<NSNumber *> *rotation, NSArray<NSArray<NSNumber *> *> *vertices, NSArray<NSNumber *> *center, NSArray<NSNumber *> *normal, CGFloat width, CGFloat height) {
        [[ARPlaneDetectorEvents instance] onPlaneDetectedEventReceived:sender plane:plane id:id type:type position:position rotation:rotation vertices:vertices center:center normal:normal width:width height:height];
    };
}

RCT_EXPORT_METHOD(addOnPlaneUpdatedEventHandler) {
    NSLog(@"addOnPlaneUpdatedEventHandler");
    PlaneDetector.instance.onPlaneUpdated = ^(PlaneDetector *sender, PlaneNode *plane, NSUUID *id, NSString *type, NSArray<NSNumber *> *position, NSArray<NSNumber *> *rotation, NSArray<NSArray<NSNumber *> *> *vertices, NSArray<NSNumber *> *center, NSArray<NSNumber *> *normal, CGFloat width, CGFloat height) {
        [[ARPlaneDetectorEvents instance] onPlaneUpdatedEventReceived:sender plane:plane id:id type:type position:position rotation:rotation vertices:vertices center:center normal:normal width:width height:height];
    };
}

RCT_EXPORT_METHOD(addOnPlaneRemovedEventHandler) {
    NSLog(@"addOnPlaneUpdatedEventHandler");
    PlaneDetector.instance.onPlaneRemoved = ^(PlaneDetector *sender, PlaneNode *plane, NSUUID *id, NSString *type, NSArray<NSNumber *> *position, NSArray<NSNumber *> *rotation, NSArray<NSArray<NSNumber *> *> *vertices, NSArray<NSNumber *> *center, NSArray<NSNumber *> *normal, CGFloat width, CGFloat height) {
        [[ARPlaneDetectorEvents instance] onPlaneRemovedEventReceived:sender plane:plane id:id type:type position:position rotation:rotation vertices:vertices center:center normal:normal width:width height:height];
    };
}

RCT_EXPORT_METHOD(addOnPlaneTappedEventHandler) {
    NSLog(@"addOnPlaneTappedEventHandler");
    PlaneDetector.instance.onPlaneTapped = ^(PlaneDetector *sender, PlaneNode *plane, NSUUID *id, NSString *type, NSArray<NSNumber *> *position, NSArray<NSNumber *> *rotation, NSArray<NSArray<NSNumber *> *> *vertices, NSArray<NSNumber *> *center, NSArray<NSNumber *> *normal, CGFloat width, CGFloat height) {
        [[ARPlaneDetectorEvents instance] onPlaneTappedEventReceived:sender plane:plane id:id type:type position:position rotation:rotation vertices:vertices center:center normal:normal width:width height:height];
    };
}

@end
