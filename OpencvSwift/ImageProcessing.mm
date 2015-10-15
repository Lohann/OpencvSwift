//
//  NSObject+ImageProcessing.m
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 18/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "ImageProcessing.h"
#import "ImageUtilitys.h"
#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>

@implementation ImageProcessing

- (void)log
{
    NSLog(@"Ola");
}

+ (UIImage*) grayImageFrom:(UIImage*)input
{
    cv::Mat output = [ImageUtilitys cvMatFromUIImage:input];
    cv::cvtColor(output, output, cv::COLOR_BGRA2GRAY);
    return [ImageUtilitys UIImageFromCVMat:output];
}

+ (NSString*) calibrateWithImages:(NSArray<UIImage*>*)input {

    std::vector<cv::Mat> images(input.count);
    
    for(UIImage* image in input) {
        cv::Mat matImage = [ImageUtilitys cvMatFromUIImage:image];
        images.push_back(matImage);
    }
    
    cv::Mat cameraMatrix;

    return nil;
}

@end
