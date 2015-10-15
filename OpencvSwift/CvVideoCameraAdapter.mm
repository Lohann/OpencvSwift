//
//  CvVideoCameraAdapter.m
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 21/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "CvVideoCameraAdapter.h"

@implementation CvVideoCameraAdapter 

- (instancetype) initWithDelegate:(id<CvCameraDelegate>)delegate
{
    if(self = [super init])
    {
        _delegate = delegate;
    }
    return self;
}

- (void)processImage:(cv::Mat &)image {
    if(_delegate) {
        CvMat *input  = [[CvMat alloc] initWithCvMat:&image];
        CvMat *output = [_delegate processImage:input];
        if(output && output != input) {
            cv::Mat *outputMat = (cv::Mat*)[output getCvMat];
            image = *outputMat;
        }
    }
}

@end
