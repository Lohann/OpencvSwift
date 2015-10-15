//
//  OperatorsOverloading.m
//  OpencvSwift
//
//  Created by Lohann Paterno Coutinho Ferreira on 21/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "OperatorsOverloading.h"
#import <opencv2/opencv.hpp>
#import "ImageUtilitys.h"

@implementation OperatorsOverloading

+ (void)add:(CvMat*)src1 src2:(CvMat*)src2 result:(CvMat*)result
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *src1Mat + *src2Mat;
}
+ (void)subtract:(CvMat*)src1 src2:(CvMat*)src2 result:(CvMat*)result
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *src1Mat - *src2Mat;
}
+ (void)divide:(CvMat*)src1 src2:(CvMat*)src2 result:(CvMat*)result
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *src1Mat / (*src2Mat);
}
+ (void)multiply:(CvMat*)src1 src2:(CvMat*)src2 result:(CvMat*)result
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = (*src1Mat) * (*src2Mat);
}


+ (void)add:(CvMat*)src double:(double)value result:(CvMat*)result
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat + value;
}
+ (void)subtract:(CvMat*)src double:(double)value result:(CvMat*)result
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat - value;
}
+ (void)divide:(CvMat*)src double:(double)value result:(CvMat*)result
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat / value;
}
+ (void)multiply:(CvMat*)src double:(double)value result:(CvMat*)result
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat * value;
}

+ (void)add:(CvMat*)src int:(NSInteger)value result:(CvMat*)result
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat + value;
}
+ (void)subtract:(CvMat*)src int:(NSInteger)value result:(CvMat*)result
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat - value;
}
+ (void)divide:(CvMat*)src int:(NSInteger)value result:(CvMat*)result
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat / value;
}
+ (void)multiply:(CvMat*)src int:(NSInteger)value result:(CvMat*)result
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat * value;
}


+ (void)addTo:(CvMat*)result src:(CvMat*) src
{
    cv::Mat *resultMat = (cv::Mat*)[result getCvMat];
    cv::Mat *srcMat    = (cv::Mat*)[src getCvMat];
    
    *resultMat += (*srcMat);
}
+ (void)subtractTo:(CvMat*)result src:(CvMat*) src
{
    cv::Mat *resultMat = (cv::Mat*)[result getCvMat];
    cv::Mat *srcMat    = (cv::Mat*)[src getCvMat];
    
    *resultMat -= *srcMat;
}
+ (void)divideTo:(CvMat*)result src:(CvMat*) src
{
    cv::Mat *resultMat = (cv::Mat*)[result getCvMat];
    cv::Mat *srcMat    = (cv::Mat*)[src getCvMat];
    
    *resultMat /= *srcMat;
}
+ (void)multiplyTo:(CvMat*)result src:(CvMat*) src
{
    cv::Mat *resultMat = (cv::Mat*)[result getCvMat];
    cv::Mat *srcMat    = (cv::Mat*)[src getCvMat];
    
    *resultMat *= *srcMat;
}

+ (void)addTo:(CvMat*)result double:(double) value
{
    cv::Mat *srcMat = (cv::Mat*)[result getCvMat];
    *srcMat += value;
}
+ (void)subtractTo:(CvMat*)result double:(double) value
{
    cv::Mat *srcMat = (cv::Mat*)[result getCvMat];
    *srcMat -= value;
}
+ (void)divideTo:(CvMat*)result double:(double) value
{
    cv::Mat *srcMat = (cv::Mat*)[result getCvMat];
    *srcMat /= value;
}
+ (void)multiplyTo:(CvMat*)result double:(double) value
{
    cv::Mat *srcMat = (cv::Mat*)[result getCvMat];
    *srcMat *= value;
}

+ (void)addTo:(CvMat*)result int:(NSInteger) value
{
    cv::Mat *srcMat = (cv::Mat*)[result getCvMat];
    *srcMat += value;
}
+ (void)subtractTo:(CvMat*)result int:(NSInteger) value
{
    cv::Mat *srcMat = (cv::Mat*)[result getCvMat];
    *srcMat -= value;
}
+ (void)divideTo:(CvMat*)result int:(NSInteger) value
{
    cv::Mat *srcMat = (cv::Mat*)[result getCvMat];
    *srcMat /= value;
}
+ (void)multiplyTo:(CvMat*)result int:(NSInteger) value
{
    cv::Mat *srcMat = (cv::Mat*)[result getCvMat];
    *srcMat *= value;
}

+ (void)add:(CvMat*)src1 array:(NSArray<NSNumber*>*)scalar result:(CvMat*)result
{
    cv::Mat *srcMat     = (cv::Mat*)[src1 getCvMat];
    cv::Scalar cvScalar = [ImageUtilitys arrayToScalar:scalar];
    cv::Mat *dstMat     = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat + cvScalar;
}
+ (void)subtract:(CvMat*)src1 array:(NSArray<NSNumber*>*)scalar result:(CvMat*)result
{
    cv::Mat *srcMat     = (cv::Mat*)[src1 getCvMat];
    cv::Scalar cvScalar = [ImageUtilitys arrayToScalar:scalar];
    cv::Mat *dstMat     = (cv::Mat*)[result getCvMat];
    
    *dstMat = *srcMat - cvScalar;
}

+ (void)addTo:(CvMat*)result array:(NSArray<NSNumber*>*)scalar
{
    cv::Mat *dstMat     = (cv::Mat*)[result getCvMat];
    cv::Scalar cvScalar = [ImageUtilitys arrayToScalar:scalar];

    *dstMat += cvScalar;
}
+ (void)subtractTo:(CvMat*)result array:(NSArray<NSNumber*>*)scalar
{
    cv::Mat *dstMat     = (cv::Mat*)[result getCvMat];
    cv::Scalar cvScalar = [ImageUtilitys arrayToScalar:scalar];
    
    *dstMat -= cvScalar;
}

@end
