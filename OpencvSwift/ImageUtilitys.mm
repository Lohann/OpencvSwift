//
//  ImageUtilitys.m
//  ProjetoHackathon
//
//  Created by Lohann Paterno Coutinho Ferreira on 10/05/14.
//  Copyright (c) 2014 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "ImageUtilitys.h"

@implementation ImageUtilitys

+ (cv::Mat)cvMatFromUIImage:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;
    
    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels (color channels + alpha)
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    
    return cvMat;
}

+ (void)cvMat:(cv::Mat)mat toImageView:(UIImageView *)imageView;
{
    UIImage *image;
    image = [self UIImageFromCVMat:mat];
    [imageView setImage:image];
}

+ (cv::Mat)cvMatFromImageNamed:(NSString *)imageName
{
    cv::Mat mat;
    //mat = cv::imread([imagemPath UTF8String], CV_LOAD_IMAGE_COLOR);
    
    UIImage *image = [UIImage imageNamed:imageName];
    mat = [self cvMatFromUIImage:image];
    
    cv::cvtColor(mat, mat, cv::COLOR_BGRA2BGR);
    /*
    dispatch_async(dispatch_get_main_queue(), ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        kLatestKivaLoansURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
     */
    return mat;
}

+ (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat
{
    NSData *data = [NSData dataWithBytes:cvMat.data length:cvMat.elemSize() * cvMat.total()];
    
    CGColorSpaceRef colorSpace;
    
    if (cvMat.elemSize() == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    CGImageRef imageRef = CGImageCreate(cvMat.cols,                                     // Width
                                        cvMat.rows,                                     // Height
                                        8,                                              // Bits per component
                                        8 * cvMat.elemSize(),                           // Bits per pixel
                                        cvMat.step[0],                                  // Bytes per row
                                        colorSpace,                                     // Colorspace
                                        kCGImageAlphaNone | kCGBitmapByteOrderDefault,  // Bitmap info flags
                                        provider,                                       // CGDataProviderRef
                                        NULL,                                           // Decode
                                        false,                                          // Should interpolate
                                        kCGRenderingIntentDefault);                     // Intent
    
    UIImage *image = [[UIImage alloc] initWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);
    
    return image;
}

+ (cv::Scalar) arrayToScalar:(NSArray<NSNumber *>*)array {
    switch (array.count) {
        case 0:
            return cv::Scalar();
        case 1:
            return cv::Scalar(array[0].doubleValue);
        case 2:
            return cv::Scalar(array[0].doubleValue, array[1].doubleValue);
        case 3:
            return cv::Scalar(array[0].doubleValue, array[1].doubleValue, array[2].doubleValue);
        default:
            return cv::Scalar(array[0].doubleValue, array[1].doubleValue, array[2].doubleValue, array[3].doubleValue);
    }
}

@end
