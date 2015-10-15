//
//  CvFileStorage.h
//  OpencvSwift
//
//  Created by Lohann Paterno Coutinho Ferreira on 01/10/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CvMat.h"

@interface CvFileManager : NSObject

typedef NS_ENUM(NSInteger, CvFileStorageMode)
{
    READ        = 0, //! read mode
    WRITE       = 1, //! write mode
    APPEND      = 2, //! append mode
    MEMORY      = 4,
    FORMAT_MASK = (7<<3),
    FORMAT_AUTO = 0,
    FORMAT_XML  = (1<<3),
    FORMAT_YAML = (2<<3)
};

- (instancetype)initWithFilename:(NSString*)filename
                            mode:(CvFileStorageMode)mode;

- (void) write:(NSString*)text value:(NSNumber*)value;

- (void) writeMap:(NSString*)name values:(NSDictionary*)values;

- (void) writeSequence:(NSString*)name values:(NSArray*)values;

- (void) writeMat:(NSString*)name value:(CvMat*)value;

- (NSNumber*) readValue:(NSString*)key;

- (NSDictionary*) readMap:(NSString*)key;

- (NSArray*) readSequence:(NSString*)key;

- (CvMat*) readMat:(NSString*)key;

- (BOOL) isOpened;

@end
