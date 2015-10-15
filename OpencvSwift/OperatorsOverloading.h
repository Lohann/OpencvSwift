//
//  OperatorsOverloading.h
//  OpencvSwift
//
//  Created by Lohann Paterno Coutinho Ferreira on 21/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CvMat.h"

@interface OperatorsOverloading : NSObject

+ (void)add:(CvMat*)src1 src2:(CvMat*)src2 result:(CvMat*)result;
+ (void)subtract:(CvMat*)src1 src2:(CvMat*)src2 result:(CvMat*)result;
+ (void)divide:(CvMat*)src1 src2:(CvMat*)src2 result:(CvMat*)result;
+ (void)multiply:(CvMat*)src1 src2:(CvMat*)src2 result:(CvMat*)result;

+ (void)add:(CvMat*)src1 double:(double)value result:(CvMat*)result;
+ (void)subtract:(CvMat*)src1 double:(double)value result:(CvMat*)result;
+ (void)divide:(CvMat*)src1 double:(double)value result:(CvMat*)result;
+ (void)multiply:(CvMat*)src1 double:(double)value result:(CvMat*)result;

+ (void)add:(CvMat*)src1 int:(NSInteger)value result:(CvMat*)result;
+ (void)subtract:(CvMat*)src1 int:(NSInteger)value result:(CvMat*)result;
+ (void)divide:(CvMat*)src1 int:(NSInteger)value result:(CvMat*)result;
+ (void)multiply:(CvMat*)src1 int:(NSInteger)value result:(CvMat*)result;

+ (void)addTo:(CvMat*)result src:(CvMat*) src;
+ (void)subtractTo:(CvMat*)result src:(CvMat*) src;
+ (void)divideTo:(CvMat*)result src:(CvMat*) src;
+ (void)multiplyTo:(CvMat*)result src:(CvMat*) src;

+ (void)addTo:(CvMat*)result double:(double) value;
+ (void)subtractTo:(CvMat*)result double:(double) value;
+ (void)divideTo:(CvMat*)result double:(double) value;
+ (void)multiplyTo:(CvMat*)result double:(double) value;

+ (void)addTo:(CvMat*)result int:(NSInteger) value;
+ (void)subtractTo:(CvMat*)result int:(NSInteger) value;
+ (void)divideTo:(CvMat*)result int:(NSInteger) value;
+ (void)multiplyTo:(CvMat*)result int:(NSInteger) value;

+ (void)add:(CvMat*)src1 array:(NSArray<NSNumber*>*)scalar result:(CvMat*)result;
+ (void)subtract:(CvMat*)src1 array:(NSArray<NSNumber*>*)scalar result:(CvMat*)result;

+ (void)addTo:(CvMat*)result array:(NSArray<NSNumber*>*)scalar;
+ (void)subtractTo:(CvMat*)result array:(NSArray<NSNumber*>*)scalar;


@end
