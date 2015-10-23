//
// Created by Lohann Paterno Coutinho Ferreira on 15/10/15.
// Copyright (c) 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CvMat.h"

@interface CvVideoCapture : NSObject

- (instancetype)initWithUrl:(NSString*)url;

- (BOOL)isOpened;

- (BOOL)open:(NSString*)url;

- (BOOL)grab;

- (CvMat*)retrieve;

- (CvMat*)read;

@end