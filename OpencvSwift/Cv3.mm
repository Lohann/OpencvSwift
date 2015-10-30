//
//  Cv3.m
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 18/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "Cv3.h"
#import <opencv2/opencv.hpp>
#import "ImageUtilitys.h"

@implementation Cv3

+ (NSArray<NSNumber *>*) scalarToArray:(cv::Scalar)scalar {
    return @[@(scalar[0]), @(scalar[1]), @(scalar[2]), @(scalar[3])];
}

// ------------  Convert Space Color  ------------ //
#pragma mark CvtColor
+ (void)cvtColor:(CvMat*)input output:(CvMat*)output type:(CvColor)type {
    cv::Mat *inputMat;
    cv::Mat *outputMat;
    
    inputMat  = (cv::Mat*)[input getCvMat];
    outputMat = (cv::Mat*)[output getCvMat];
    
    cv::cvtColor(*inputMat, *outputMat, type);
}

// ------------ Adaptative Threshold ------------ //
#pragma mark Adaptive Threshold
+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue
            adaptiveMethod:(CvAdaptiveMethod) adaptiveMethod
             thresholdType:(CvThresholdType) thresholdType
                 blockSize:(int) blockSize
                         c:(double) C
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::adaptiveThreshold(*srcMat, *dstMat, maxValue, adaptiveMethod, thresholdType, blockSize, C);
}

+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue
            adaptiveMethod:(CvAdaptiveMethod) adaptiveMethod
             thresholdType:(CvThresholdType) thresholdType
                 blockSize:(int) blockSize
{
    [self adaptiveThreshold:src
                        dst:dst
                   maxValue:maxValue
             adaptiveMethod:adaptiveMethod
              thresholdType:thresholdType
                  blockSize:blockSize
                          c:5];
}

+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue
            adaptiveMethod:(CvAdaptiveMethod) adaptiveMethod
             thresholdType:(CvThresholdType) thresholdType
{
    [self adaptiveThreshold:src
                        dst:dst
                   maxValue:maxValue
             adaptiveMethod:adaptiveMethod
              thresholdType:thresholdType
                  blockSize:3];
}

+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue
            adaptiveMethod:(CvAdaptiveMethod) adaptiveMethod
{
    [self adaptiveThreshold:src
                        dst:dst
                   maxValue:maxValue
             adaptiveMethod:adaptiveMethod
              thresholdType:THRESH_BINARY];
}

+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue
{
    [self adaptiveThreshold:src
                        dst:dst
                   maxValue:maxValue
             adaptiveMethod:ADAPTIVE_THRESH_MEAN_C];
}

// ------------     Threshold      ------------ //
#pragma mark Threshold
+ (double) threshold:(CvMat*) src
                 dst:(CvMat*) dst
           threshold:(double) threshold
              maxval:(double) maxval
                type:(CvThresholdType) type
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    
    return cv::threshold(*srcMat, *dstMat, threshold, maxval, type);
}

// ------------     In Range      ------------ //
#pragma mark In Range
+ (void) inRange:(CvMat*) src
           lower:(NSArray<NSNumber *>*)lower
           upper:(NSArray<NSNumber *>*) upper
             dst:(CvMat*) dst
{
    cv::Mat *srcMat        = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat        = (cv::Mat*)[dst getCvMat];
    cv::Scalar lowerScalar = [ImageUtilitys arrayToScalar:lower];
    cv::Scalar upperScalar = [ImageUtilitys arrayToScalar:upper];
    
    cv::inRange(*srcMat, lowerScalar, upperScalar, *dstMat);
}

// ------------       Erode        ------------ //
#pragma mark Erode
+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel
        anchor:(CGPoint) anchor
    iterations:(int) iterations
    borderType:(CvBorderType) borderType
   borderValue:(NSArray<NSNumber*>*) borderValue
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    cv::Scalar cvScalar = [ImageUtilitys arrayToScalar:borderValue];
    
    cv::erode(*srcMat, *dstMat, *kernelMat, cvAnchor, iterations, borderType, cvScalar);
}

+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel
        anchor:(CGPoint) anchor
    iterations:(int) iterations
    borderType:(CvBorderType) borderType
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    
    cv::erode(*srcMat, *dstMat, *kernelMat, cvAnchor, iterations, borderType);
}

+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel
        anchor:(CGPoint) anchor
    iterations:(int) iterations
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    
    cv::erode(*srcMat, *dstMat, *kernelMat, cvAnchor, iterations);
}

+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel
        anchor:(CGPoint) anchor
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    
    cv::erode(*srcMat, *dstMat, *kernelMat, cvAnchor);
}

+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    
    cv::erode(*srcMat, *dstMat, *kernelMat);
}

// ------------      Dilate       ------------ //
#pragma mark Dilate
+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel
         anchor:(CGPoint) anchor
     iterations:(int) iterations
     borderType:(CvBorderType) borderType
    borderValue:(NSArray<NSNumber*>*) borderValue
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    cv::Scalar cvScalar  = [ImageUtilitys arrayToScalar:borderValue];
    
    cv::dilate(*srcMat, *dstMat, *kernelMat, cvAnchor, iterations, borderType, cvScalar);
}

+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel
         anchor:(CGPoint) anchor
     iterations:(int) iterations
     borderType:(CvBorderType) borderType
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    
    cv::dilate(*srcMat, *dstMat, *kernelMat, cvAnchor, iterations, borderType);
}

+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel
         anchor:(CGPoint) anchor
     iterations:(int) iterations
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    
    cv::dilate(*srcMat, *dstMat, *kernelMat, cvAnchor, iterations);
}

+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel
         anchor:(CGPoint) anchor
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    
    cv::dilate(*srcMat, *dstMat, *kernelMat, cvAnchor);
}

+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    
    cv::dilate(*srcMat, *dstMat, *kernelMat);
}

// ------------     MorphologyEx     ------------ //
#pragma mark MorphologyEx
+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel
               anchor:(CGPoint) anchor
           iterations:(int) iterations
           borderType:(CvBorderType) borderType
          borderValue:(NSArray<NSNumber*>*) borderValue
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    cv::Scalar cvScalar  = [ImageUtilitys arrayToScalar:borderValue];
    
    cv::morphologyEx(*srcMat, *dstMat, operation, *kernelMat, cvAnchor, iterations, borderType, cvScalar);
}

+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel
               anchor:(CGPoint) anchor
           iterations:(int) iterations
           borderType:(CvBorderType) borderType
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    
    cv::morphologyEx(*srcMat, *dstMat, operation, *kernelMat, cvAnchor, iterations, borderType);
}

+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel
               anchor:(CGPoint) anchor
           iterations:(int) iterations
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    
    cv::morphologyEx(*srcMat, *dstMat, operation, *kernelMat, cvAnchor, iterations);
}

+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel
               anchor:(CGPoint) anchor
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    cv::Point cvAnchor   = cv::Point(anchor.x, anchor.y);
    
    cv::morphologyEx(*srcMat, *dstMat, operation, *kernelMat, cvAnchor);
}

+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Mat *kernelMat   = (cv::Mat*)[kernel getCvMat];
    
    cv::morphologyEx(*srcMat, *dstMat, operation, *kernelMat);
}

// ------------ Get Structuring Element ------------ //
#pragma mark Get Structuring Element
+ (CvMat*)getStructuringElement:(CvMorphShape)shape
                           size:(CGSize)size
                         anchor:(CGPoint)anchor
{
    cv::Size  cvSize  = cv::Size(size.width, size.height);
    cv::Point cvPoint = cv::Point(anchor.x, anchor.y);
    cv::Mat structuringElement = cv::getStructuringElement(shape, cvSize, cvPoint);
    return [[CvMat alloc] initWithCvMat:&structuringElement retain:YES];
}

+ (CvMat*)getStructuringElement:(CvMorphShape)shape
                           size:(CGSize)size
{
    cv::Size  cvSize  = cv::Size(size.width, size.height);
    cv::Mat structuringElement = cv::getStructuringElement(shape, cvSize);
    return [[CvMat alloc] initWithCvMat:&structuringElement retain:YES];
}

// ------------        Resize        ------------ //
#pragma mark Resize
+ (void) resize:(CvMat*) src
            dst:(CvMat*) dst
           size:(CGSize) size
             fx:(double) fx
             fy:(double) fy
  interpolation:(CvInterpolationAlgorithm) interpolation
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    
    cv::resize(*srcMat, *dstMat, cvSize, fx, fy, interpolation);
}

+ (void) resize:(CvMat*) src
            dst:(CvMat*) dst
           size:(CGSize) size
             fx:(double) fx
             fy:(double) fy
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    
    cv::resize(*srcMat, *dstMat, cvSize, fx, fy);
}

+ (void) resize:(CvMat*) src
            dst:(CvMat*) dst
           size:(CGSize) size
             fx:(double) fx
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    
    cv::resize(*srcMat, *dstMat, cvSize, fx);
}

+ (void) resize:(CvMat*) src
            dst:(CvMat*) dst
           size:(CGSize) size
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    
    cv::resize(*srcMat, *dstMat, cvSize);
}

// ------------      Gaussian Blur      ------------ //
#pragma mark Gaussian Blur
+ (void) gaussianBlur:(CvMat*) src
                  dst:(CvMat*) dst
                 size:(CGSize) size
               sigmaX:(double) sigmaX
               sigmaY:(double) sigmaY
           borderType:(CvBorderType) borderType
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    
    cv::GaussianBlur(*srcMat, *dstMat, cvSize, sigmaX, sigmaY, borderType);
}

+ (void) gaussianBlur:(CvMat*) src
                  dst:(CvMat*) dst
                 size:(CGSize) size
               sigmaX:(double) sigmaX
               sigmaY:(double) sigmaY
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    
    cv::GaussianBlur(*srcMat, *dstMat, cvSize, sigmaX, sigmaY);
}

+ (void) gaussianBlur:(CvMat*) src
                  dst:(CvMat*) dst
                 size:(CGSize) size
               sigmaX:(double) sigmaX
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    
    cv::GaussianBlur(*srcMat, *dstMat, cvSize, sigmaX);
}

// ------------         Blur        ------------ //
#pragma mark Blur

+ (void) blur:(CvMat*) src
          dst:(CvMat*) dst
         size:(CGSize) size
       anchor:(CGPoint) anchor
   borderType:(CvBorderType) borderType
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    cv::Point cvPoint    = cv::Point(anchor.x, anchor.y);
    
    cv::blur(*srcMat, *dstMat, cvSize, cvPoint, borderType);
}

+ (void) blur:(CvMat*) src
          dst:(CvMat*) dst
         size:(CGSize) size
       anchor:(CGPoint) anchor
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    cv::Point cvPoint    = cv::Point(anchor.x, anchor.y);
    
    cv::blur(*srcMat, *dstMat, cvSize, cvPoint);
}

+ (void) blur:(CvMat*) src
          dst:(CvMat*) dst
         size:(CGSize) size
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    cv::Size cvSize      = cv::Size(size.width, size.height);
    
    cv::blur(*srcMat, *dstMat, cvSize);
}

// ------------     Median Blur     ------------ //
#pragma mark Median Blur

+ (void) medianBlur:(CvMat*) src
                dst:(CvMat*) dst
               size:(int) size
{
    cv::Mat *srcMat      = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat      = (cv::Mat*)[dst getCvMat];
    
    cv::medianBlur(*srcMat, *dstMat, size);
}

// ------------         Add         ------------ //
#pragma mark Add
+ (void) add:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst
        mask:(CvMat*) mask
       dtype:(int) dtype
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    cv::Mat *maskMat = (cv::Mat*)[mask getCvMat];
    
    cv::add(*src1Mat, *src2Mat, *dstMat, *maskMat, dtype);
}

+ (void) add:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst
        mask:(CvMat*) mask
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    cv::Mat *maskMat = (cv::Mat*)[mask getCvMat];
    
    cv::add(*src1Mat, *src2Mat, *dstMat, *maskMat);
}

+ (void) add:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::add(*src1Mat, *src2Mat, *dstMat);
}

// ------------      Subtract      ------------ //
#pragma mark Subtract
+ (void) subtract:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
             mask:(CvMat*) mask
            dtype:(int) dtype
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    cv::Mat *maskMat = (cv::Mat*)[mask getCvMat];
    
    cv::subtract(*src1Mat, *src2Mat, *dstMat, *maskMat, dtype);
}

+ (void) subtract:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
             mask:(CvMat*) mask
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    cv::Mat *maskMat = (cv::Mat*)[mask getCvMat];
    
    cv::subtract(*src1Mat, *src2Mat, *dstMat, *maskMat);
}

+ (void) subtract:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::subtract(*src1Mat, *src2Mat, *dstMat);
}

// ------------      Multiply      ------------ //
#pragma mark Multiply
+ (void) multiply:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
            scale:(double) scale
            dtype:(int) dtype
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::multiply(*src1Mat, *src2Mat, *dstMat, scale, dtype);
}

+ (void) multiply:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
            scale:(double) scale
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::multiply(*src1Mat, *src2Mat, *dstMat, scale);
}

+ (void) multiply:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::multiply(*src1Mat, *src2Mat, *dstMat);
}

// ------------       Divide       ------------ //
#pragma mark Divide
+ (void) divide:(CvMat*) src1
           src2:(CvMat*) src2
            dst:(CvMat*) dst
          scale:(double) scale
          dtype:(int) dtype
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::divide(*src1Mat, *src2Mat, *dstMat, scale, dtype);
}

+ (void) divide:(CvMat*) src1
           src2:(CvMat*) src2
            dst:(CvMat*) dst
          scale:(double) scale
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::divide(*src1Mat, *src2Mat, *dstMat, scale);
}

+ (void) divide:(CvMat*) src1
           src2:(CvMat*) src2
            dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::divide(*src1Mat, *src2Mat, *dstMat);
}

// ------------  Divide Weighted  ------------ //
#pragma mark Divide Weighted
+ (void) divide:(double) scale
            src:(CvMat*) src
            dst:(CvMat*) dst
          dtype:(int) dtype
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::divide(scale, *srcMat, *dstMat, dtype);
}

+ (void) divide:(double) scale
            src:(CvMat*) src
            dst:(CvMat*) dst
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::divide(scale, *srcMat, *dstMat);
}

// ------------     Scale Add     ------------ //
#pragma mark Scale Add
+ (void) scaleAdd:(CvMat*) src1
            alpha:(double) alpha
             src2:(CvMat*) src2
              dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::scaleAdd(*src1Mat, alpha, *src2Mat, *dstMat);
}

// ------------   Add Weighted   ------------ //
#pragma mark Add Weighted
+ (void) addWeighted:(CvMat*) src1
               alpha:(double) alpha
                src2:(CvMat*) src2
                beta:(double) beta
               gamma:(double) gamma
                 dst:(CvMat*) dst
               dtype:(int) dtype
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::addWeighted(*src1Mat, alpha, *src2Mat, beta, gamma, *dstMat, dtype);
}

+ (void) addWeighted:(CvMat*) src1
               alpha:(double) alpha
                src2:(CvMat*) src2
                beta:(double) beta
               gamma:(double) gamma
                 dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::addWeighted(*src1Mat, alpha, *src2Mat, beta, gamma, *dstMat);
}

// ------------ Convert Scale Abs ------------ //
#pragma mark Convert Scale Abs
+ (void) convertScaleAbs:(CvMat*) src
                     dst:(CvMat*) dst
                   alpha:(double) alpha
                    beta:(double) beta
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::convertScaleAbs(*srcMat, *dstMat, alpha, beta);
}

+ (void) convertScaleAbs:(CvMat*) src
                     dst:(CvMat*) dst
                   alpha:(double) alpha
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::convertScaleAbs(*srcMat, *dstMat, alpha);
}

+ (void) convertScaleAbs:(CvMat*) src
                     dst:(CvMat*) dst
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::convertScaleAbs(*srcMat, *dstMat);
}

// ------------      SQRT      ------------ //
#pragma mark sqrt
+ (void) sqrt:(CvMat*) src
          dst:(CvMat*) dst
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::sqrt(*srcMat, *dstMat);
}

+ (void) sqrt:(CvMat*) src
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::sqrt(*srcMat, *srcMat);
}

// ------------      POW      ------------ //
#pragma mark pow
+ (void) pow:(CvMat*) src
       power:(double) power
         dst:(CvMat*) dst
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::pow(*srcMat, power, *dstMat);
}

+ (void) pow:(CvMat*) src
       power:(double) power
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::pow(*srcMat, power, *srcMat);
}

// ------------      EXP      ------------ //
#pragma mark exp
+ (void) exp:(CvMat*) src
         dst:(CvMat*) dst
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::exp(*srcMat, *dstMat);
}

+ (void) exp:(CvMat*) src
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::exp(*srcMat, *srcMat);
}

// ------------      LOG      ------------ //
#pragma mark log
+ (void) log:(CvMat*) src
         dst:(CvMat*) dst
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::log(*srcMat, *dstMat);
}

+ (void) log:(CvMat*) src
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::log(*srcMat, *srcMat);
}


// ------------  Find Contours  ------------ //
#pragma mark Find Contours

+ (NSArray<CvContour*>*)findContours:(CvMat*) image
                                mode:(CvContourRetrievalAlgorithm) mode
                              method:(CvContourApproximationAlgorithm) method
                              offset:(CGPoint) offset
{
    NSMutableArray<CvContour*> *contoursArray = [[NSMutableArray alloc] init];
    
    CvContourManager *contourManager = [[CvContourManager alloc] init];
    std::vector<std::vector<cv::Point>> *contours = (std::vector<std::vector<cv::Point>> *)[contourManager getContoursVector];
    std::vector<cv::Vec4i> *hierarchy = (std::vector<cv::Vec4i> *)[contourManager getHierarchyVector];
    
    cv::Mat  *srcMat = (cv::Mat*)[image getCvMat];
    
    cv::findContours(*srcMat, *contours, *hierarchy, mode, method, cv::Point(offset.x, offset.y));
    
    for(size_t i=0; i<contours->size(); i++) {
        CvContour *contour = [[CvContour alloc] initWithManager:contourManager index:i];
        [contoursArray addObject:contour];
    }
    
    return [[NSArray alloc] initWithArray:contoursArray];
}

+ (NSArray<CvContour*>*)findContours:(CvMat*) image
                                mode:(CvContourRetrievalAlgorithm) mode
                              method:(CvContourApproximationAlgorithm) method
{
    return [self findContours:image mode:mode method:method offset:CGPointMake(-1, -1)];
}

+ (NSArray<CvContour*>*)findContours:(CvMat*) image
{
    return [self findContours:image mode:RETR_LIST method:CHAIN_APPROX_SIMPLE];
}

// ------------  Draw Contours  ------------ //
#pragma mark Draw Contours
+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color
            thickness:(int) thickness
             lineType:(CvLineType) lineType
             maxLevel:(int) maxLevel
               offset:(CGPoint) offset
{
    CvContourManager *contourManager = contour.manager;
    std::vector<std::vector<cv::Point>> *stdContours = (std::vector<std::vector<cv::Point>> *)[contourManager getContoursVector];
    std::vector<cv::Vec4i> *stdHierarchy = (std::vector<cv::Vec4i> *)[contourManager getHierarchyVector];
    
    cv::Mat *srcMat   = (cv::Mat*)[image getCvMat];
    cv::Scalar scalar = [ImageUtilitys arrayToScalar:color];
    
    cv::drawContours(*srcMat, *stdContours, (int)contour.index, scalar, thickness, lineType, *stdHierarchy, maxLevel, cv::Point(offset.x, offset.y));
}

+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color
            thickness:(int) thickness
             lineType:(CvLineType) lineType
             maxLevel:(int) maxLevel
{
    [self drawContours:image
               contour:contour
                 color:color
             thickness:thickness
              lineType:lineType
              maxLevel:maxLevel
                offset:CGPointMake(-1, -1)];
}

+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color
            thickness:(int) thickness
             lineType:(CvLineType) lineType
{
    [self drawContours:image
               contour:contour
                 color:color
             thickness:thickness
              lineType:lineType
              maxLevel:1];
}

+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color
            thickness:(int) thickness
{
    [self drawContours:image
               contour:contour
                 color:color
             thickness:thickness
              lineType:LINE_8];
}

+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color
{
    [self drawContours:image
               contour:contour
                 color:color
             thickness:1];
}

// ------------  Bounding Rect  ------------ //
#pragma mark Bounding Rect
+ (CGRect) boundingRect:(CvMat*) points
{
    cv::Mat *srcMat = (cv::Mat*)[points getCvMat];
    cv::Rect rect   = cv::boundingRect(*srcMat);
    
    return CGRectMake(rect.x, rect.y, rect.width, rect.height);
}

// ------------  Contour Area  ------------ //
#pragma mark Contour Area
+ (double) contourArea:(CvContour*) contour oriented:(BOOL) oriented
{
    std::vector<std::vector<cv::Point>> *stdContours = (std::vector<std::vector<cv::Point>> *)[contour.manager getContoursVector];
    return cv::contourArea(stdContours->at(contour.index), oriented);
}

+ (double) contourArea:(CvContour*) contour
{
    return [self contourArea:contour oriented:NO];
}

// ------------      Canny      ------------ //
#pragma mark Canny
+ (void) canny:(CvMat*) image
         edges:(CvMat*) edges
    threshold1:(double) threshold1
    threshold2:(double) threshold2
  apertureSize:(NSInteger) apertureSize
    l2gradient:(BOOL) l2gradient
{
    cv::Mat *srcMat   = (cv::Mat*)[image getCvMat];
    cv::Mat *edgesMat = (cv::Mat*)[edges getCvMat];
    
    cv::Canny(*srcMat, *edgesMat, threshold1, threshold2, (int)apertureSize, l2gradient);
}

+ (void) canny:(CvMat*) image
         edges:(CvMat*) edges
    threshold1:(double) threshold1
    threshold2:(double) threshold2
  apertureSize:(NSInteger) apertureSize
{
    cv::Mat *srcMat   = (cv::Mat*)[image getCvMat];
    cv::Mat *edgesMat = (cv::Mat*)[edges getCvMat];
    
    cv::Canny(*srcMat, *edgesMat, threshold1, threshold2, (int)apertureSize);
}

+ (void) canny:(CvMat*) image
         edges:(CvMat*) edges
    threshold1:(double) threshold1
    threshold2:(double) threshold2
{
    cv::Mat *srcMat   = (cv::Mat*)[image getCvMat];
    cv::Mat *edgesMat = (cv::Mat*)[edges getCvMat];
    
    cv::Canny(*srcMat, *edgesMat, threshold1, threshold2);
}

// ------------      Sobel      ------------ //
#pragma mark Sobel
+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy
         ksize:(int) ksize
         scale:(double) scale
         delta:(double) delta
    borderType:(CvBorderType) borderType
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::Sobel(*srcMat, *dstMat, ddepth, dx, dy, ksize, scale, delta, borderType);
}

+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy
         ksize:(int) ksize
         scale:(double) scale
         delta:(double) delta
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::Sobel(*srcMat, *dstMat, ddepth, dx, dy, ksize, scale, delta);
}

+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy
         ksize:(int) ksize
         scale:(double) scale
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::Sobel(*srcMat, *dstMat, ddepth, dx, dy, ksize, scale);
}

+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy
         ksize:(int) ksize
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::Sobel(*srcMat, *dstMat, ddepth, dx, dy, ksize);
}

+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::Sobel(*srcMat, *dstMat, ddepth, dx, dy);
}

// ------------   Bitwise And   ------------ //
#pragma mark Bitwise And
+ (void) bitwise_and:(CvMat*) src1
                src2:(CvMat*) src2
                 dst:(CvMat*) dst
                mask:(CvMat*) mask
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    cv::Mat *maskMat = (cv::Mat*)[dst getCvMat];
    
    cv::bitwise_and(*src1Mat, *src2Mat, *dstMat, *maskMat);
}

+ (void) bitwise_and:(CvMat*) src1
                src2:(CvMat*) src2
                 dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::bitwise_and(*src1Mat, *src2Mat, *dstMat);
}

// ------------   Bitwise Or   ------------ //
#pragma mark Bitwise Or
+ (void) bitwise_or:(CvMat*) src1
               src2:(CvMat*) src2
                dst:(CvMat*) dst
               mask:(CvMat*) mask
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    cv::Mat *maskMat = (cv::Mat*)[dst getCvMat];
    
    cv::bitwise_or(*src1Mat, *src2Mat, *dstMat, *maskMat);
}

+ (void) bitwise_or:(CvMat*) src1
               src2:(CvMat*) src2
                dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::bitwise_or(*src1Mat, *src2Mat, *dstMat);
}

// ------------   Bitwise Xor   ------------ //
#pragma mark Bitwise Xor
+ (void) bitwise_xor:(CvMat*) src1
                src2:(CvMat*) src2
                 dst:(CvMat*) dst
                mask:(CvMat*) mask
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    cv::Mat *maskMat = (cv::Mat*)[dst getCvMat];
    
    cv::bitwise_xor(*src1Mat, *src2Mat, *dstMat, *maskMat);
}

+ (void) bitwise_xor:(CvMat*) src1
                src2:(CvMat*) src2
                 dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::bitwise_xor(*src1Mat, *src2Mat, *dstMat);
}

// ------------   Bitwise Not   ------------ //
#pragma mark Bitwise Not
+ (void) bitwise_not:(CvMat*) src
                 dst:(CvMat*) dst
                mask:(CvMat*) mask
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    cv::Mat *maskMat = (cv::Mat*)[dst getCvMat];
    
    cv::bitwise_not(*srcMat, *dstMat, *maskMat);
}

+ (void) bitwise_not:(CvMat*) src
                 dst:(CvMat*) dst
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::bitwise_not(*srcMat, *dstMat);
}

// ------------    Absdiff    ------------ //
#pragma mark Absdiff
+ (void) absdiff:(CvMat*) src1
            src2:(CvMat*) src2
             dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::absdiff(*src1Mat, *src2Mat, *dstMat);
}

// ------------    Compare    ------------ //
#pragma mark Absdiff
+ (void) compare:(CvMat*) src1
            src2:(CvMat*) src2
             dst:(CvMat*) dst
           cmpop:(int)cmpop
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::compare(*src1Mat, *src2Mat, *dstMat, cmpop);
}

// ------------      Min      ------------ //
#pragma mark Min
+ (void) min:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::min(*src1Mat, *src2Mat, *dstMat);
}

// ------------      Max      ------------ //
#pragma mark Max
+ (void) max:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst
{
    cv::Mat *src1Mat = (cv::Mat*)[src1 getCvMat];
    cv::Mat *src2Mat = (cv::Mat*)[src2 getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::max(*src1Mat, *src2Mat, *dstMat);
}

// ------------ MinMax Location ------------ //
#pragma mark Max
+ (CvMinMax) minMaxLoc:(CvMat*) src mask:(CvMat*) mask
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *maskMat = (cv::Mat*)[mask getCvMat];
    
    double minVal, maxVal;
    cv::Point minLoc, maxLoc;
    
    cv::minMaxLoc(*srcMat, &minVal, &maxVal, &minLoc, &maxLoc, *maskMat);
    
    CvMinMax output = CvMinMax();
    output.minValue = minVal;
    output.maxValue = maxVal;
    output.minLocation = CGPointMake(minLoc.x, minLoc.y);
    output.maxLocation = CGPointMake(maxLoc.x, maxLoc.y);
    return output;
}
+ (CvMinMax) minMaxLoc:(CvMat*) src
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    
    double minVal, maxVal;
    cv::Point minLoc, maxLoc;
    
    cv::minMaxLoc(*srcMat, &minVal, &maxVal, &minLoc, &maxLoc);
    
    CvMinMax output = CvMinMax();
    output.minValue = minVal;
    output.maxValue = maxVal;
    output.minLocation = CGPointMake(minLoc.x, minLoc.y);
    output.maxLocation = CGPointMake(maxLoc.x, maxLoc.y);
    return output;
}

// ------------      Sum      ------------ //
#pragma mark Sum
+ (NSArray<NSNumber*>*) sum:(CvMat*) src
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Scalar scalar = cv::sum(*srcMat);
    return [self scalarToArray:scalar];
}

// ------------ Edge Preserving Filter ------------ //
#pragma mark Edge Preserving Filter
+ (void) edgePreservingFilter:(CvMat*) src
                          dst:(CvMat*) dst
                        flags:(CvEdgePreservingFilter) flags
                       sigmaS:(float) sigmaS
                       sigmaR:(float) sigmaR
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::edgePreservingFilter(*srcMat, *dstMat, flags, sigmaS, sigmaR);
}

+ (void) edgePreservingFilter:(CvMat*) src
                          dst:(CvMat*) dst
                        flags:(CvEdgePreservingFilter) flags
                       sigmaS:(float) sigmaS
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::edgePreservingFilter(*srcMat, *dstMat, flags, sigmaS);
}

+ (void) edgePreservingFilter:(CvMat*) src
                          dst:(CvMat*) dst
                        flags:(CvEdgePreservingFilter) flags
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::edgePreservingFilter(*srcMat, *dstMat, flags);
}

// ------------   Detail Enhance   ------------ //
#pragma mark Detail Enhance
+ (void) detailEnhance:(CvMat*) src
                   dst:(CvMat*) dst
                sigmaS:(float) sigmaS
                sigmaR:(float) sigmaR
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::detailEnhance(*srcMat, *dstMat, sigmaS, sigmaR);
}

+ (void) detailEnhance:(CvMat*) src
                   dst:(CvMat*) dst
                sigmaS:(float) sigmaS
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::detailEnhance(*srcMat, *dstMat, sigmaS);
}

+ (void) detailEnhance:(CvMat*) src
                   dst:(CvMat*) dst
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::detailEnhance(*srcMat, *dstMat);
}

// ------------    Stylization    ------------ //
#pragma mark Stylization
+ (void) stylization:(CvMat*) src
                 dst:(CvMat*) dst
              sigmaS:(float) sigmaS
              sigmaR:(float) sigmaR
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::stylization(*srcMat, *dstMat, sigmaS, sigmaR);
}

+ (void) stylization:(CvMat*) src
                 dst:(CvMat*) dst
              sigmaS:(float) sigmaS
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::stylization(*srcMat, *dstMat, sigmaS);
}

+ (void) stylization:(CvMat*) src
                 dst:(CvMat*) dst
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat  = (cv::Mat*)[dst getCvMat];
    
    cv::stylization(*srcMat, *dstMat);
}

// ------------  Pencil Sketch  ------------ //
#pragma mark Pencil Sketch
+ (void) pencilSketch:(CvMat*) src
                 dst1:(CvMat*) dst1
                 dst2:(CvMat*) dst2
               sigmaS:(float) sigmaS
               sigmaR:(float) sigmaR
          shadeFactor:(float) shadeFactor
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dst1Mat = (cv::Mat*)[dst1 getCvMat];
    cv::Mat *dst2Mat = (cv::Mat*)[dst2 getCvMat];
    
    cv::pencilSketch(*srcMat, *dst1Mat, *dst2Mat, sigmaS, sigmaR, shadeFactor);
}

+ (void) pencilSketch:(CvMat*) src
                 dst1:(CvMat*) dst1
                 dst2:(CvMat*) dst2
               sigmaS:(float) sigmaS
               sigmaR:(float) sigmaR
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dst1Mat = (cv::Mat*)[dst1 getCvMat];
    cv::Mat *dst2Mat = (cv::Mat*)[dst2 getCvMat];
    
    cv::pencilSketch(*srcMat, *dst1Mat, *dst2Mat, sigmaS, sigmaR);
}

+ (void) pencilSketch:(CvMat*) src
                 dst1:(CvMat*) dst1
                 dst2:(CvMat*) dst2
               sigmaS:(float) sigmaS
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dst1Mat = (cv::Mat*)[dst1 getCvMat];
    cv::Mat *dst2Mat = (cv::Mat*)[dst2 getCvMat];
    
    cv::pencilSketch(*srcMat, *dst1Mat, *dst2Mat, sigmaS);
}

+ (void) pencilSketch:(CvMat*) src
                 dst1:(CvMat*) dst1
                 dst2:(CvMat*) dst2
{
    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    cv::Mat *dst1Mat = (cv::Mat*)[dst1 getCvMat];
    cv::Mat *dst2Mat = (cv::Mat*)[dst2 getCvMat];
    
    cv::pencilSketch(*srcMat, *dst1Mat, *dst2Mat);
}


// ------------     Split     ------------ //
#pragma mark Split
+ (NSArray<CvMat*>*) split:(CvMat*)src {

    cv::Mat *srcMat  = (cv::Mat*)[src getCvMat];
    
    std::vector<cv::Mat> channels(srcMat->channels());
    cv::split(*srcMat, channels);
    
    NSMutableArray *output = [[NSMutableArray alloc] initWithCapacity:channels.size()];
    for(size_t i=0; i<channels.size(); i++) {
        CvMat *mat = [[CvMat alloc] initWithCvMat:&channels[i] retain:YES];
        [output addObject:mat];
    }
    
    return [[NSArray alloc] initWithArray:output];
}

// ------------     Merge     ------------ //
#pragma mark Merge
+ (void) merge:(NSArray<CvMat*>*)channels dst:(CvMat*) dst;
{
    std::vector<cv::Mat> channelsVector(channels.count);
    
    for(NSUInteger i=0; i<channels.count; i++) {
        cv::Mat *mat = (cv::Mat*)[channels[i] getCvMat];
        channelsVector[i] = *mat;
    }
    
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    cv::merge(channelsVector, *dstMat);
}

// ------------     Flip     ------------ //
#pragma mark Flip
+ (void) flip:(CvMat*) src
          dst:(CvMat*) dst
         mode:(int) flip_mode
{
    cv::Mat *srcMat = (cv::Mat*)[src getCvMat];
    cv::Mat *dstMat = (cv::Mat*)[dst getCvMat];
    
    cv::flip(*srcMat, *dstMat, flip_mode);
}

@end
