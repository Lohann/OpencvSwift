//
//  CvType.h
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 19/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CvColor.h"

@interface CvType : NSObject

@property (nonatomic, readonly) int code;

+ (CvType*)getTypeWithCode:(int)code;

+ (CvType *) UInt8;
+ (CvType *) Int8;

+ (CvType *) UInt16;
+ (CvType *) Int16;

+ (CvType *) Int32;
+ (CvType *) Float32;

+ (CvType *) Float64;

+ (CvType *) USRTYPE1;

+ (CvType *) UInt8C1;
+ (CvType *) UInt8C2;
+ (CvType *) UInt8C3;
+ (CvType *) UInt8C4;
+ (CvType *) UInt8C:(UInt8) channels;

+ (CvType *) Int8C1;
+ (CvType *) Int8C2;
+ (CvType *) Int8C3;
+ (CvType *) Int8C4;
+ (CvType *) Int8C:(UInt8) channels;

+ (CvType *) UInt16C1;
+ (CvType *) UInt16C2;
+ (CvType *) UInt16C3;
+ (CvType *) UInt16C4;
+ (CvType *) UInt16C:(UInt8) channels;

+ (CvType *) Int16C1;
+ (CvType *) Int16C2;
+ (CvType *) Int16C3;
+ (CvType *) Int16C4;
+ (CvType *) Int16C:(UInt8) channels;

+ (CvType *) Int32C1;
+ (CvType *) Int32C2;
+ (CvType *) Int32C3;
+ (CvType *) Int32C4;
+ (CvType *) Int32C:(UInt8) channels;

+ (CvType *) Float32C1;
+ (CvType *) Float32C2;
+ (CvType *) Float32C3;
+ (CvType *) Float32C4;
+ (CvType *) Float32C:(UInt8) channels;

+ (CvType *) Float64C1;
+ (CvType *) Float64C2;
+ (CvType *) Float64C3;
+ (CvType *) Float64C4;
+ (CvType *) Float64C:(UInt8) channels;

@end
