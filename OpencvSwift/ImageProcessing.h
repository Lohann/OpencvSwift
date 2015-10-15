//
//  NSObject+ImageProcessing.h
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 18/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageProcessing : NSObject

- (void)log;
+ (UIImage*) grayImageFrom:(UIImage*)input;
+ (NSString*) calibrateWithImages:(NSArray<UIImage*>*)input;

@end
