//
//  CvVideoCameraAdapter.h
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 21/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>
#import "CvCamera.h"

using namespace cv;

@interface CvVideoCameraAdapter : NSObject <CvVideoCameraDelegate>

@property (nonatomic, assign) id<CvCameraDelegate> delegate;

- (instancetype) initWithDelegate:(id<CvCameraDelegate>)delegate;

@end
