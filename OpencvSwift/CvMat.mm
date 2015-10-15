//
//  CvMat.m
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 18/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "CvMat.h"
#import <opencv2/opencv.hpp>
#import "ImageUtilitys.h"

@implementation CvMat {
    cv::Mat *_cvMat;
    cv::Mat _mat;
}

+ (CvMat*)zeros:(CGSize) size
           type:(CvType*) type
{
    cv::Mat zeros = cv::Mat::zeros((int)size.height, (int)size.width, type.code);
    return [[CvMat alloc] initWithCvMat:&zeros retain:YES];
}

+ (CvMat*)ones:(CGSize) size
          type:(CvType*) type
{
    cv::Mat ones = cv::Mat::ones((int)size.height, (int)size.width, type.code);
    return [[CvMat alloc] initWithCvMat:&ones retain:YES];
}

+ (CvMat*)eye:(CGSize) size
         type:(CvType*) type
{
    cv::Mat eye = cv::Mat::eye((int)size.height, (int)size.width, type.code);
    return [[CvMat alloc] initWithCvMat:&eye retain:YES];
}

- (instancetype)init
{
    if(self = [super init]) {
        _mat   = cv::Mat();
        _cvMat = &_mat;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage*)image {
    if(self = [super init]) {
        _mat   = [ImageUtilitys cvMatFromUIImage:image];
        _cvMat = &_mat;
    }
    return self;
}

- (instancetype)initWithImageNamed:(NSString*)name {
    if(self = [super init]) {
        _mat   = [ImageUtilitys cvMatFromImageNamed:name];
        _cvMat = &_mat;
    }
    return self;
}

- (instancetype)initWithCvMat:(void*)cvMat {
    if(self = [super init]) {
        _cvMat = ((cv::Mat*)cvMat);
    }
    return self;
}

- (instancetype)initWithCvMat:(void*)cvMat retain:(BOOL)retain {
    if(self = [super init]) {
        if(retain) {
            _mat   = *((cv::Mat*)cvMat);
            _cvMat = &_mat;
        } else {
            _cvMat = ((cv::Mat*)cvMat);
        }
    }
    return self;
}

- (instancetype)initWithSize:(CGSize) size
                        type:(CvType*) type
{
    if(self = [super init]) {
        _mat   = cv::Mat(size.height, size.height, type.code);
        _cvMat = &_mat;
    }
    return self;
}

- (instancetype)initWithSize:(CGSize) size
                        type:(CvType*) type
                      scalar:(NSArray<NSNumber*>*) scalar
{
    if(self = [super init]) {
        cv::Scalar cvScalar = [ImageUtilitys arrayToScalar:scalar];
        _mat   = cv::Mat(size.height, size.width, type.code, cvScalar);
        _cvMat = &_mat;
    }
    return self;
}

- (instancetype)initWithSize:(CGSize) size
                        type:(CvType*) type
                        data:(void*) data
                        step:(NSUInteger) step
{
    if(self = [super init]) {
        _mat   = cv::Mat(size.height, size.width, type.code, data, (size_t)step);
        _cvMat = &_mat;
    }
    return self;
}

- (instancetype)initWithSize:(CGSize) size
                        type:(CvType*) type
                        data:(void*) data
{
    if(self = [super init]) {
        _mat   = cv::Mat(size.height, size.width, type.code, data);
        _cvMat = &_mat;
    }
    return self;
}

- (instancetype)initWithContour:(CvContour*) contour
{
    if(self = [super init]) {
        std::vector<std::vector<cv::Point>> *stdContours = (std::vector<std::vector<cv::Point>> *)[contour.manager getContoursVector];
        _mat   = cv::Mat(stdContours->at(contour.index));
        _cvMat = &_mat;
    }
    return self;
}

- (UIImage*)toUIImage {
    return [ImageUtilitys UIImageFromCVMat:*_cvMat];
}

- (void)setCvMat:(void*)cvMat {
    _cvMat = (cv::Mat*)cvMat;
}

- (void*)getCvMat {
    return _cvMat;
}

- (CGSize)size
{
    return CGSizeMake([self cols], [self rows]);
}

- (CvType*)type
{
    return [CvType getTypeWithCode:_cvMat->type()];
}

- (NSInteger)cols {
    return _cvMat->cols;
}
- (NSInteger)rows {
    return _cvMat->rows;
}

- (CvMat*)col:(int)index {
    cv::Mat mat = _cvMat->col(index);
    return [[CvMat alloc] initWithCvMat:&mat retain:YES];
}

- (CvMat*)row:(int)index {
    cv::Mat mat = _cvMat->row(index);
    return [[CvMat alloc] initWithCvMat:&mat retain:YES];
}

- (CvMat*)colRange:(int)start end:(int)end {
    cv::Mat mat = _cvMat->colRange(start, end);
    return [[CvMat alloc] initWithCvMat:&mat retain:YES];
}

- (CvMat*)rowRange:(int)start end:(int)end {
    cv::Mat mat = _cvMat->rowRange(start, end);
    return [[CvMat alloc] initWithCvMat:&mat retain:YES];
}

- (NSUInteger)total {
    return _cvMat->total();
}

- (void)copyTo:(CvMat*)input {
    cv::Mat* mat = (cv::Mat*)[input getCvMat];
    _cvMat->copyTo(*mat);
}

- (void)copyTo:(CvMat*)input mask:(CvMat*)mask {
    cv::Mat* cvMat  = (cv::Mat*)[input getCvMat];
    cv::Mat* cvMask = (cv::Mat*)[mask getCvMat];
    _cvMat->copyTo(*cvMat, *cvMask);
}

- (CvMat*)crop:(CGRect)rect
{
    cv::Rect cvRect = cv::Rect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    cv::Mat cropMat = (*_cvMat)(cvRect);
    return [[CvMat alloc] initWithCvMat:&cropMat retain:YES];
}

- (CvMat*)clone {
    cv::Mat clone = _cvMat->clone();
    return [[CvMat alloc] initWithCvMat:&clone retain:YES];
}

- (void)convertTo:(CvMat*) mat type:(CvType*)type alpha:(double) alpha beta:(double) beta
{
    cv::Mat* cvMat  = (cv::Mat*)[mat getCvMat];
    _cvMat->convertTo(*cvMat, type.code, alpha, beta);
}

- (void)convertTo:(CvMat*) mat type:(CvType*)type alpha:(double) alpha
{
    cv::Mat* cvMat  = (cv::Mat*)[mat getCvMat];
    _cvMat->convertTo(*cvMat, type.code, alpha);
}

- (void)convertTo:(CvMat*)mat type:(CvType*)type {
    cv::Mat* cvMat  = (cv::Mat*)[mat getCvMat];
    _cvMat->convertTo(*cvMat, type.code);
}

- (CvMat*)cross:(CvMat*)mat {
    cv::Mat* cvMat = (cv::Mat*)[mat getCvMat];
    cv::Mat cross  = _cvMat->cross(*cvMat);
    return [[CvMat alloc] initWithCvMat:&cross retain:YES];
}

- (double)dot:(CvMat*)mat {
    cv::Mat* input  = (cv::Mat*)[mat getCvMat];
    return _cvMat->dot(*input);
}

- (NSUInteger)elemSize {
    return _cvMat->elemSize();
}

- (int)depth {
    return _cvMat->depth();
}

- (BOOL)empty {
    return _cvMat->empty();
}

- (BOOL)isContinuous {
    return _cvMat->isContinuous();
}

- (BOOL)isSubmatrix {
    return _cvMat->isSubmatrix();
}

- (CvMat*)reshape:(int)cn {
    cv::Mat reshape = _cvMat->reshape(cn);
    return [[CvMat alloc] initWithCvMat:&reshape retain:YES];
}

- (CvMat*)setTo:(CvMat*)mat {
    cv::Mat* input = (cv::Mat*)[mat getCvMat];
    cv::Mat setTo  = _cvMat->setTo(*input);
    return [[CvMat alloc] initWithCvMat:&setTo retain:YES];
}

- (NSInteger)channels {
    return _cvMat->channels();
}

- (NSInteger)step:(int)row {
    return _cvMat->step[row];
}

- (UInt8*)ptr {
    return _cvMat->ptr();
}

- (UInt8*)data {
    return _cvMat->data;
}

@end
