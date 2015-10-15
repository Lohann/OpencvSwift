//
//  CvContour.h
//  OpencvSwift
//
//  Created by Lohann Paterno Coutinho Ferreira on 23/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CvContourManager.h"

@interface CvContour : NSObject

@property (nonatomic, readonly) NSUInteger index;
@property (nonatomic, readonly) CvContourManager *manager;
@property (nonatomic, readonly) NSArray<NSValue*> *points;

- (instancetype)initWithManager:(CvContourManager*)manager
                          index:(NSUInteger) index;

@end
