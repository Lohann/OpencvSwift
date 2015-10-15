//
//  CvFileStorage.m
//  OpencvSwift
//
//  Created by Lohann Paterno Coutinho Ferreira on 01/10/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "CvFileManager.h"
#import <opencv2/opencv.hpp>

@implementation CvFileManager {
    cv::FileStorage _fileStorage;
}

- (instancetype)initWithFilename:(NSString*)filename
                            mode:(CvFileStorageMode)mode
{
    if(self = [super init])
    {
        _fileStorage = cv::FileStorage([filename UTF8String], mode);
    }
    return self;
}

- (void) write:(NSString*)text value:(NSNumber*)n
{
    if (strcmp([n objCType], @encode(BOOL)) == 0) {
        _fileStorage << [text UTF8String] << [n boolValue];
    } else if (strcmp([n objCType], @encode(int)) == 0) {
        _fileStorage << [text UTF8String] << [n intValue];
    } else if (strcmp([n objCType], @encode(double)) == 0) {
        _fileStorage << [text UTF8String] << [n doubleValue];
    } else if (strcmp([n objCType], @encode(NSInteger)) == 0) {
        _fileStorage << [text UTF8String] << [n integerValue];
    } else if (strcmp([n objCType], @encode(float)) == 0) {
        _fileStorage << [text UTF8String] << [n floatValue];
    } else if (strcmp([n objCType], @encode(char)) == 0) {
        _fileStorage << [text UTF8String] << [n charValue];
    } else if (strcmp([n objCType], @encode(unsigned char)) == 0) {
        _fileStorage << [text UTF8String] << [n unsignedCharValue];
    } else if (strcmp([n objCType], @encode(short)) == 0) {
        _fileStorage << [text UTF8String] << [n shortValue];
    } else if (strcmp([n objCType], @encode(unsigned short)) == 0) {
        _fileStorage << [text UTF8String] << [n unsignedShortValue];
    } else {
        _fileStorage << [text UTF8String] << [n doubleValue];
    }
}

- (void) writeMap:(NSString*)name values:(NSDictionary*)values
{
    _fileStorage << [name UTF8String];
    _fileStorage << "{";
    for(NSString *key in values) {
        id value = values[key];
        if([value isKindOfClass:[NSString class]]) {
            _fileStorage << [key UTF8String] << [value UTF8String];
        } else if([value isKindOfClass:[NSNumber class]]) {
            [self write:key value:value];
        } else {
            _fileStorage << [key UTF8String] << [[value description] UTF8String];
        }
    }
    _fileStorage << "}";
}

- (void) writeSequence:(NSString*)name values:(NSArray*)values
{
    _fileStorage << [name UTF8String];
    _fileStorage << "[";
    for(id value in values) {
        if([value isKindOfClass:[NSString class]]) {
            _fileStorage << [value UTF8String];
        } else if([value isKindOfClass:[NSNumber class]]) {
            [self writeNSNumber:value];
        } else {
            _fileStorage << [[value description] UTF8String];
        }
    }
    _fileStorage << "]";
}

- (void) writeMat:(NSString*)name value:(CvMat*)value
{
    cv::Mat *mat = (cv::Mat*)[value getCvMat];
    _fileStorage << [name UTF8String] << *mat;
}

- (void) writeNSNumber:(NSNumber*)n {
    if (strcmp([n objCType], @encode(BOOL)) == 0) {
        _fileStorage << [n boolValue];
    } else if (strcmp([n objCType], @encode(int)) == 0) {
        _fileStorage << [n intValue];
    } else if (strcmp([n objCType], @encode(double)) == 0) {
        _fileStorage << [n doubleValue];
    } else if (strcmp([n objCType], @encode(NSInteger)) == 0) {
        _fileStorage << [n integerValue];
    } else if (strcmp([n objCType], @encode(float)) == 0) {
        _fileStorage << [n floatValue];
    } else if (strcmp([n objCType], @encode(char)) == 0) {
        _fileStorage << [n charValue];
    } else if (strcmp([n objCType], @encode(unsigned char)) == 0) {
        _fileStorage << [n unsignedCharValue];
    } else if (strcmp([n objCType], @encode(short)) == 0) {
        _fileStorage << [n shortValue];
    } else if (strcmp([n objCType], @encode(unsigned short)) == 0) {
        _fileStorage << [n unsignedShortValue];
    } else {
        _fileStorage << [n doubleValue];
    }
}

- (NSNumber*) readValue:(NSString*)key
{
    return @((double)_fileStorage[[key UTF8String]]);
}

- (NSDictionary*) readMap:(NSString*)key
{
    cv::FileNode n = _fileStorage[[key UTF8String]];
    if (n.type() != cv::FileNode::MAP)
    {
        [NSException raise:@"Erro ao recuperar o atributo"
                    format:@"O atributo \"%@\" não existe ou não é um Map", key];
    }
    
    NSMutableDictionary *map = [[NSMutableDictionary alloc] init];
    
    for(cv::FileNodeIterator fit = n.begin(); fit != n.end(); ++fit)
    {
        cv::FileNode item = *fit;
        std::string key = item.name();
        NSString *nsKey = [NSString stringWithCString:key.c_str()
                                                encoding:[NSString defaultCStringEncoding]];
        
        std::string value = (std::string)item;
        NSString *nsValue = [NSString stringWithCString:value.c_str()
                                               encoding:[NSString defaultCStringEncoding]];
        
        [map setValue:nsValue forKey:nsKey];
    }
    
    return [[NSDictionary alloc] initWithDictionary:map];
}

- (NSArray*) readSequence:(NSString*)key
{
    cv::FileNode n = _fileStorage[[key UTF8String]];
    if (n.type() != cv::FileNode::SEQ)
    {
        [NSException raise:@"Erro ao recuperar o atributo"
                    format:@"O atributo \"%@\" não existe ou não é um dicionario", key];
    }
    
    NSMutableArray *sequence = [[NSMutableArray alloc] init];
    
    cv::FileNodeIterator it = n.begin(), it_end = n.end(); // Go through the node
    for (; it != it_end; ++it) {
        std::string string = (std::string)*it;
        NSString *nsstring = [NSString stringWithCString:string.c_str()
                                                encoding:[NSString defaultCStringEncoding]];
        [sequence addObject:nsstring];
    }
    
    return [[NSArray alloc] initWithArray:sequence];
}

- (CvMat*) readMat:(NSString*)key
{
    cv::Mat mat;
    _fileStorage[[key UTF8String]] >> mat;
    return [[CvMat alloc] initWithCvMat:&mat retain:YES];
}

- (BOOL) isOpened
{
    return _fileStorage.isOpened();
}

@end
