//
//  CvContourManager.m
//  OpencvSwift
//
//  Created by Lohann Paterno Coutinho Ferreira on 23/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "CvContourManager.h"
#import <opencv2/opencv.hpp>

@implementation CvContourManager {
    std::vector<std::vector<cv::Point>> _contours;
    std::vector<cv::Vec4i> _hierarchy;
}

+ (id)sharedManager {
    static CvContourManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void*)getContoursVector {
    return &_contours;
}
- (void*)getHierarchyVector {
    return &_hierarchy;
}

@end
