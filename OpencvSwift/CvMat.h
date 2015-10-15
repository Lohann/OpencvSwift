//
//  CvMat.h
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 18/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CvType.h"
#import "CvContour.h"

@interface CvMat : NSObject

@property (nonatomic, readonly) CGSize size;
@property (nonatomic, readonly) CvType *type;

+ (CvMat*)zeros:(CGSize) size
           type:(CvType*) type;

+ (CvMat*)ones:(CGSize) size
          type:(CvType*) type;

+ (CvMat*)eye:(CGSize) size
         type:(CvType*) type;

- (instancetype)initWithCvMat:(void*)cvMat;
- (instancetype)initWithCvMat:(void*)cvMat retain:(BOOL)retain;

- (instancetype)initWithImage:(UIImage*)image;
- (instancetype)initWithImageNamed:(NSString*)name;

- (instancetype)initWithSize:(CGSize) size
                        type:(CvType*) type;

- (instancetype)initWithSize:(CGSize) size
                        type:(CvType*) type
                      scalar:(NSArray<NSNumber*>*) scalar;

- (instancetype)initWithSize:(CGSize) size
                        type:(CvType*) type
                        data:(void*) data
                        step:(NSUInteger) step;

- (instancetype)initWithSize:(CGSize) size
                        type:(CvType*) type
                        data:(void*) data;

- (instancetype)initWithContour:(CvContour*) contour;

- (UIImage*) toUIImage;

- (void)setCvMat:(void*)cvMat;
- (void*)getCvMat;

- (NSInteger)cols;
- (NSInteger)rows;

- (CvMat*)col:(int)index;
- (CvMat*)row:(int)index;

- (CvMat*)colRange:(int)start end:(int)end;
- (CvMat*)rowRange:(int)index end:(int)end;

- (NSUInteger)total;

- (void)copyTo:(CvMat*)mat;
- (void)copyTo:(CvMat*)mat mask:(CvMat*)mask;

- (CvMat*)clone;

- (void)convertTo:(CvMat*) mat type:(CvType*)type alpha:(double) alpha beta:(double) beta;
- (void)convertTo:(CvMat*) mat type:(CvType*)type alpha:(double) alpha;
- (void)convertTo:(CvMat*) mat type:(CvType*)type;

- (CvMat*)crop:(CGRect)rect;

- (CvMat*)cross:(CvMat*)mat;

- (double)dot:(CvMat*)mat;

- (NSUInteger)elemSize;

- (int)depth;

- (BOOL)empty;

- (BOOL)isContinuous;

- (BOOL)isSubmatrix;

- (CvMat*)reshape:(int)cn;

- (CvMat*)setTo:(CvMat*)mat;

- (NSInteger)channels;

- (NSInteger)step:(int)row;

- (UInt8*)ptr;

- (UInt8*)data;

@end
