//
//  CvContour.m
//  OpencvSwift
//
//  Created by Lohann Paterno Coutinho Ferreira on 23/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "CvContour.h"
#import <opencv2/opencv.hpp>
#import <UIKit/UIKit.h>

@implementation CvContour {
    std::vector<cv::Point> *_contoursVector;
    cv::Vec4i *_hierarchy;
}

@synthesize points = _points;

- (instancetype)initWithManager:(CvContourManager*)manager
                          index:(NSUInteger) index
{
    if(self = [super init])
    {
        _manager        = manager;
        _index          = index;
        _contoursVector = &((std::vector<std::vector<cv::Point>> *)[manager getContoursVector])->at(index);
        
        std::vector<cv::Vec4i> *hierarchy = (std::vector<cv::Vec4i> *)[manager getHierarchyVector];
        if(hierarchy->size() > 0) {
            _hierarchy = &hierarchy->at(index);
        }
    }
    return self;
}

- (NSArray<NSValue*>*)contours
{
    if(!_points)
    {
        NSMutableArray<NSValue*> *mutableArray = [[NSMutableArray alloc] initWithCapacity:_contoursVector->size()];
        for(size_t i=0; i<_contoursVector->size(); i++) {
            cv::Point cvPoint = _contoursVector->at(i);
            CGPoint cgpoint = CGPointMake(cvPoint.x, cvPoint.y);
            NSValue *value = [NSValue valueWithCGPoint: cgpoint];
            [mutableArray addObject:value];
        }
        
        _points = [[NSArray alloc] initWithArray:mutableArray];
    }
    
    return _points;
}

@end
