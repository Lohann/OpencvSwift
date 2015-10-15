//
//  ImageUtilitys.h
//  ProjetoHackathon
//
//  Created by Lohann Paterno Coutinho Ferreira on 10/05/14.
//  Copyright (c) 2014 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>

@interface ImageUtilitys : NSObject

+ (cv::Mat)cvMatFromUIImage:(UIImage *)image;
+ (cv::Mat)cvMatFromImageNamed:(NSString *)imageName;
+ (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat;
+ (void)cvMat:(cv::Mat)mat toImageView:(UIImageView *)imageView;
+ (cv::Scalar) arrayToScalar:(NSArray<NSNumber *>*)array;
    
@end
