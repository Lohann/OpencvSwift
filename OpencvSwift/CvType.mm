//
//  CvType.m
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 19/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "CvType.h"
#import <opencv2/opencv.hpp>

@implementation CvType
/*
static CvType *_CV_8U       = [[CvType alloc] initWithCode:CV_8U];
static CvType *_CV_8S       = [[CvType alloc] initWithCode:CV_8S];

static CvType *_CV_16U      = [[CvType alloc] initWithCode:CV_16U];
static CvType *_CV_16S      = [[CvType alloc] initWithCode:CV_16S];

static CvType *_CV_32S      = [[CvType alloc] initWithCode:CV_32S];
static CvType *_CV_32F      = [[CvType alloc] initWithCode:CV_32F];

static CvType *_CV_64F      = [[CvType alloc] initWithCode:CV_64F];

static CvType *_CV_USRTYPE1 = [[CvType alloc] initWithCode:CV_USRTYPE1];

static CvType *_CV_8UC1     = [[CvType alloc] initWithCode:CV_8UC1];
static CvType *_CV_8UC2     = [[CvType alloc] initWithCode:CV_8UC2];
static CvType *_CV_8UC3     = [[CvType alloc] initWithCode:CV_8UC3];
static CvType *_CV_8UC4     = [[CvType alloc] initWithCode:CV_8UC4];

static CvType *_CV_8SC1     = [[CvType alloc] initWithCode:CV_8SC1];
static CvType *_CV_8SC2     = [[CvType alloc] initWithCode:CV_8SC2];
static CvType *_CV_8SC3     = [[CvType alloc] initWithCode:CV_8SC3];
static CvType *_CV_8SC4     = [[CvType alloc] initWithCode:CV_8SC4];

static CvType *_CV_16UC1    = [[CvType alloc] initWithCode:CV_16UC1];
static CvType *_CV_16UC2    = [[CvType alloc] initWithCode:CV_16UC2];
static CvType *_CV_16UC3    = [[CvType alloc] initWithCode:CV_16UC3];
static CvType *_CV_16UC4    = [[CvType alloc] initWithCode:CV_16UC4];

static CvType *_CV_16SC1    = [[CvType alloc] initWithCode:CV_16SC1];
static CvType *_CV_16SC2    = [[CvType alloc] initWithCode:CV_16SC2];
static CvType *_CV_16SC3    = [[CvType alloc] initWithCode:CV_16SC3];
static CvType *_CV_16SC4    = [[CvType alloc] initWithCode:CV_16SC4];

static CvType *_CV_32SC1    = [[CvType alloc] initWithCode:CV_32SC1];
static CvType *_CV_32SC2    = [[CvType alloc] initWithCode:CV_32SC2];
static CvType *_CV_32SC3    = [[CvType alloc] initWithCode:CV_32SC3];
static CvType *_CV_32SC4    = [[CvType alloc] initWithCode:CV_32SC4];

static CvType *_CV_32FC1    = [[CvType alloc] initWithCode:CV_32FC1];
static CvType *_CV_32FC2    = [[CvType alloc] initWithCode:CV_32FC2];
static CvType *_CV_32FC3    = [[CvType alloc] initWithCode:CV_32FC3];
static CvType *_CV_32FC4    = [[CvType alloc] initWithCode:CV_32FC4];

static CvType *_CV_64FC1    = [[CvType alloc] initWithCode:CV_64FC1];
static CvType *_CV_64FC2    = [[CvType alloc] initWithCode:CV_64FC2];
static CvType *_CV_64FC3    = [[CvType alloc] initWithCode:CV_64FC3];
static CvType *_CV_64FC4    = [[CvType alloc] initWithCode:CV_64FC4];
*/
- (instancetype)initWithCode:(int) code {

	if(self = [super init])
	{
		_code = code;
	}
	return self;
}

+ (CvType*)getTypeWithCode:(int)code {
    
    static CvType* none;
    static const NSMutableArray *allTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        none     = [[CvType alloc] initWithCode:-1];
        allTypes = [[NSMutableArray alloc] initWithCapacity:512];
        for(int i=0; i<512; i++) {
            [allTypes addObject:none];
        }
    });
    
    if(code == -1) {
        return none;
    }
    
    CvType *type = allTypes[code];
    
    if(type.code != code) {
        type = [[CvType alloc] initWithCode:code];
        allTypes[code] = type;
    }
    
    return type;
}

+ (CvType *) UInt8 {
    return [self getTypeWithCode:CV_8U];
}
+ (CvType *) Int8 {
    return [self getTypeWithCode:CV_8S];
}

+ (CvType *) UInt16 {
    return [self getTypeWithCode:CV_16U];
}
+ (CvType *) Int16 {
    return [self getTypeWithCode:CV_16S];
}

+ (CvType *) Int32 {
    return [self getTypeWithCode:CV_32S];
}
+ (CvType *) Float32 {
    return [self getTypeWithCode:CV_32F];
}

+ (CvType *) Float64 {
    return [self getTypeWithCode:CV_64F];
}

+ (CvType *) USRTYPE1 {
    return [self getTypeWithCode:CV_USRTYPE1];
}

+ (CvType *) UInt8C1 {
    return [self getTypeWithCode:CV_8UC1];
}
+ (CvType *) UInt8C2 {
    return [self getTypeWithCode:CV_8UC2];
}
+ (CvType *) UInt8C3 {
    return [self getTypeWithCode:CV_8UC3];
}
+ (CvType *) UInt8C4 {
    return [self getTypeWithCode:CV_8UC4];
}
+ (CvType *) UInt8C:(UInt8) channels {
    int code = [self MAKE_TYPE:CV_8U channels:channels];
    return [self getTypeWithCode:code];
}

+ (CvType *) Int8C1 {
    return [self getTypeWithCode:CV_8SC1];
}
+ (CvType *) Int8C2 {
    return [self getTypeWithCode:CV_8SC2];
}
+ (CvType *) Int8C3 {
    return [self getTypeWithCode:CV_8SC3];
}
+ (CvType *) Int8C4 {
    return [self getTypeWithCode:CV_8SC4];
}
+ (CvType *) Int8C:(UInt8) channels {
    int code = [self MAKE_TYPE:CV_8S channels:channels];
    return [self getTypeWithCode:code];
}

+ (CvType *) UInt16C1 {
    return [self getTypeWithCode:CV_16UC1];
}
+ (CvType *) UInt16C2 {
    return [self getTypeWithCode:CV_16UC2];
}
+ (CvType *) UInt16C3 {
    return [self getTypeWithCode:CV_16UC3];
}
+ (CvType *) UInt16C4 {
    return [self getTypeWithCode:CV_16UC4];
}
+ (CvType *) UInt16C:(UInt8) channels {
    int code = [self MAKE_TYPE:CV_16U channels:channels];
    return [self getTypeWithCode:code];
}

+ (CvType *) Int16C1 {
    return [self getTypeWithCode:CV_16SC1];
}
+ (CvType *) Int16C2 {
    return [self getTypeWithCode:CV_16SC2];
}
+ (CvType *) Int16C3 {
    return [self getTypeWithCode:CV_16SC3];
}
+ (CvType *) Int16C4 {
    return [self getTypeWithCode:CV_16SC4];
}
+ (CvType *) Int16C:(UInt8) channels {
    int code = [self MAKE_TYPE:CV_16S channels:channels];
    return [self getTypeWithCode:code];
}

+ (CvType *) Int32C1 {
    return [self getTypeWithCode:CV_32SC1];
}
+ (CvType *) Int32C2 {
    return [self getTypeWithCode:CV_32SC2];
}
+ (CvType *) Int32C3 {
    return [self getTypeWithCode:CV_32SC3];
}
+ (CvType *) Int32C4 {
    return [self getTypeWithCode:CV_32SC4];
}
+ (CvType *) Int32C:(UInt8) channels {
    int code = [self MAKE_TYPE:CV_32S channels:channels];
    return [self getTypeWithCode:code];
}

+ (CvType *) Float32C1 {
    return [self getTypeWithCode:CV_32FC1];
}
+ (CvType *) Float32C2 {
    return [self getTypeWithCode:CV_32FC2];
}
+ (CvType *) Float32C3 {
    return [self getTypeWithCode:CV_32FC3];
}
+ (CvType *) Float32C4 {
    return [self getTypeWithCode:CV_32FC4];
}
+ (CvType *) Float32C:(UInt8) channels {
    int code = [self MAKE_TYPE:CV_32F channels:channels];
    return [self getTypeWithCode:code];
}

+ (CvType *) Float64C1 {
    return [self getTypeWithCode:CV_64FC1];
}
+ (CvType *) Float64C2 {
    return [self getTypeWithCode:CV_64FC2];
}
+ (CvType *) Float64C3 {
    return [self getTypeWithCode:CV_64FC3];
}
+ (CvType *) Float64C4 {
    return [self getTypeWithCode:CV_64FC4];
}
+ (CvType *) Float64C:(UInt8) channels {
    int code = [self MAKE_TYPE:CV_64F channels:channels];
    return [self getTypeWithCode:code];
}

+ (int)MAKE_TYPE:(int)depth channels:(int)cn {

    return ((depth) & CV_MAT_DEPTH_MASK) + (((cn)-1) << CV_CN_SHIFT);
}

@end
