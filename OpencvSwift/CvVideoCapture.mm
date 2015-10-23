//
// Created by Lohann Paterno Coutinho Ferreira on 15/10/15.
// Copyright (c) 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "CvVideoCapture.h"
#import <opencv2/opencv.hpp>
#import "ImageUtilitys.h"

@implementation CvVideoCapture
{
	cv::VideoCapture _videoCapture;
}

- (instancetype)init
{
	if(self = [super init]) {
        _videoCapture = cv::VideoCapture();
	}
	return self;
}

- (instancetype)initWithUrl:(NSString*)url
{
	if(self = [super init]) {
		_videoCapture = cv::VideoCapture([url UTF8String]);
	}
	return self;
}

- (BOOL)isOpened
{
	return _videoCapture.isOpened();
}

- (BOOL)open:(NSString*)url
{
	return _videoCapture.open([url UTF8String]);
}

- (BOOL)grab
{
    return _videoCapture.grab();
}

- (CvMat*)retrieve
{
    cv::Mat frame;
    if(_videoCapture.retrieve(frame)) {
        return [[CvMat alloc]initWithCvMat:&frame retain:YES];
    }
    return nil;
}

- (CvMat* )read
{
    cv::Mat frame;
    if (_videoCapture.read(frame)) {
        return [[CvMat alloc]initWithCvMat:&frame retain:YES];
    }
    return nil;
}

@end