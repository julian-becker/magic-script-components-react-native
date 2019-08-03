// %BANNER_BEGIN%
// ---------------------------------------------------------------------
// %COPYRIGHT_BEGIN%
//
// Copyright (c) 2019 Magic Leap, Inc. (COMPANY) All Rights Reserved.
// Magic Leap, Inc. Confidential and Proprietary
//
// NOTICE: All information contained herein is, and remains the property
// of COMPANY. The intellectual and technical concepts contained herein
// are proprietary to COMPANY and may be covered by U.S. and Foreign
// Patents, patents in process, and are protected by trade secret or
// copyright law. Dissemination of this information or reproduction of
// this material is strictly forbidden unless prior written permission is
// obtained from COMPANY. Access to the source code contained herein is
// hereby forbidden to anyone except current COMPANY employees, managers
// or contractors who have executed Confidentiality and Non-disclosure
// agreements explicitly covering such access.
//
// The copyright notice above does not evidence any actual or intended
// publication or disclosure of this source code, which includes
// information that is confidential and/or proprietary, and is a trade
// secret, of COMPANY. ANY REPRODUCTION, MODIFICATION, DISTRIBUTION,
// PUBLIC PERFORMANCE, OR PUBLIC DISPLAY OF OR THROUGH USE OF THIS
// SOURCE CODE WITHOUT THE EXPRESS WRITTEN CONSENT OF COMPANY IS
// STRICTLY PROHIBITED, AND IN VIOLATION OF APPLICABLE LAWS AND
// INTERNATIONAL TREATIES. THE RECEIPT OR POSSESSION OF THIS SOURCE
// CODE AND/OR RELATED INFORMATION DOES NOT CONVEY OR IMPLY ANY RIGHTS
// TO REPRODUCE, DISCLOSE OR DISTRIBUTE ITS CONTENTS, OR TO MANUFACTURE,
// USE, OR SELL ANYTHING THAT IT MAY DESCRIBE, IN WHOLE OR IN PART.
// %COPYRIGHT_END%
// ---------------------------------------------------------------------
// %BANNER_END%
#import <Foundation/Foundation.h>
#import <simd/simd.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct MLXrBV MLXrBV;

@interface MLXRBoundedVolumePose : NSObject
@property matrix_float4x4 pose;
@end

@interface MLXRBoundedVolumeScale : NSObject
@property vector_float3 scale;
@end

@interface MLXRBoundedVolumeExtents : NSObject
@property vector_float3 extents;
@end

@interface MLXRBoundedVolume : NSObject
/// Default @c init is disabled.
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWith:(MLXrBV *)handle;

- (MLXRBoundedVolumePose * _Nullable)getPose;

- (MLXRBoundedVolumeScale * _Nullable)getScale;

- (MLXRBoundedVolumeExtents * _Nullable)getExtents;

- (NSUUID * _Nullable)getId;

- (NSUUID * _Nullable)getAreaId;

- (NSDictionary<NSString *, NSString *> *)getProperties;
@end

NS_ASSUME_NONNULL_END
