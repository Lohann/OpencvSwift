//
//  Cv3.h
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 18/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CvMat.h"
#import "CvType.h"
#import "CvColor.h"
#import "CvContour.h"

typedef NS_ENUM(NSInteger, CvAdaptiveMethod) {
    ADAPTIVE_THRESH_MEAN_C     = 0,
    ADAPTIVE_THRESH_GAUSSIAN_C = 1
};

typedef NS_ENUM(NSInteger, CvThresholdType) {
    THRESH_BINARY     = 0, // value = value > threshold ? max_value : 0
    THRESH_BINARY_INV = 1, // value = value > threshold ? 0 : max_value
    THRESH_TRUNC      = 2, // value = value > threshold ? threshold : value
    THRESH_TOZERO     = 3, // value = value > threshold ? value : 0
    THRESH_TOZERO_INV = 4, // value = value > threshold ? 0 : value
    THRESH_MASK       = 7,
    THRESH_OTSU       = 8  // use Otsu algorithm to choose the optimal threshold value
};

typedef NS_ENUM(NSInteger, CvBorderType) {
    BORDER_CONSTANT    = 0, // iiiiii|abcdefgh|iiiiiii  with some specified 'i'
    BORDER_REPLICATE   = 1, // aaaaaa|abcdefgh|hhhhhhh
    BORDER_REFLECT     = 2, // fedcba|abcdefgh|hgfedcb
    BORDER_WRAP        = 3, // cdefgh|abcdefgh|abcdefg
    BORDER_REFLECT_101 = 4, // gfedcb|abcdefgh|gfedcba
    BORDER_TRANSPARENT = 5, // uvwxyz|absdefgh|ijklmno
    
    BORDER_REFLECT101  = BORDER_REFLECT_101,
    BORDER_DEFAULT     = BORDER_REFLECT_101,
    BORDER_ISOLATED    = 16 // do not look outside of ROI
};

// Shape of the structuring element
typedef NS_ENUM(NSInteger, CvMorphShape) {
    RECT    = 0,
    CROSS   = 1,
    ELLIPSE = 2
};

// Type of morphological operation
typedef NS_ENUM(NSInteger, CvMorphOperation) {
    ERODE    = 0,
    DILATE   = 1,
    OPEN     = 2,
    CLOSE    = 3,
    GRADIENT = 4,
    TOPHAT   = 5,
    BLACKHAT = 6
};

// Interpolation algorithm
typedef NS_ENUM(NSInteger, CvInterpolationAlgorithm) {
    INTER_NEAREST        = 0, //!< nearest neighbor interpolation
    INTER_LINEAR         = 1, //!< bilinear interpolation
    INTER_CUBIC          = 2, //!< bicubic interpolation
    INTER_AREA           = 3, //!< area-based (or super) interpolation
    INTER_LANCZOS4       = 4, //!< Lanczos interpolation over 8x8 neighborhood
    
    INTER_MAX            = 7, //!< mask for interpolation codes
    WARP_FILL_OUTLIERS   = 8,
    WARP_INVERSE_MAP     = 16
};

//! mode of the contour retrieval algorithm
typedef NS_ENUM(NSInteger, CvContourRetrievalAlgorithm) {
    RETR_EXTERNAL  = 0, //!< retrieve only the most external (top-level) contours
    RETR_LIST      = 1, //!< retrieve all the contours without any hierarchical information
    RETR_CCOMP     = 2, //!< retrieve the connected components (that can possibly be nested)
    RETR_TREE      = 3, //!< retrieve all the contours and the whole hierarchy
    RETR_FLOODFILL = 4
};

//! the contour approximation algorithm
typedef NS_ENUM(NSInteger, CvContourApproximationAlgorithm) {
    CHAIN_APPROX_NONE      = 1,
    CHAIN_APPROX_SIMPLE    = 2,
    CHAIN_APPROX_TC89_L1   = 3,
    CHAIN_APPROX_TC89_KCOS = 4
};

//! line type
typedef NS_ENUM(NSInteger, CvLineType) {
    FILLED  = -1,
    LINE_4  = 4,
    LINE_8  = 8,
    LINE_AA = 16
};

typedef NS_ENUM(NSInteger, CvEdgePreservingFilter)
{
    RECURS_FILTER = 1,
    NORMCONV_FILTER = 2
};

struct CvMinMax
{
    double minValue;
    double maxValue;
    CGPoint minLocation;
    CGPoint maxLocation;
};
typedef struct CvMinMax CvMinMax;

@interface Cv3 : NSObject

// Converts image from one color space to another
+ (void)cvtColor:(CvMat*)input output:(CvMat*)output type:(CvColor)type;

// Applies variable (adaptive) threshold to the image
+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue
            adaptiveMethod:(CvAdaptiveMethod) adaptiveMethod
             thresholdType:(CvThresholdType) thresholdType
                 blockSize:(int) blockSize
                         c:(double) C;

+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue
            adaptiveMethod:(CvAdaptiveMethod) adaptiveMethod
             thresholdType:(CvThresholdType) thresholdType
                 blockSize:(int) blockSize;

+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue
            adaptiveMethod:(CvAdaptiveMethod) adaptiveMethod
             thresholdType:(CvThresholdType) thresholdType;

+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue
            adaptiveMethod:(CvAdaptiveMethod) adaptiveMethod;

+ (void) adaptiveThreshold:(CvMat*) src
                       dst:(CvMat*) dst
                  maxValue:(double) maxValue;

//! applies fixed threshold to the image
+ (double) threshold:(CvMat*) src
                 dst:(CvMat*) dst
           threshold:(double) threshold
              maxval:(double) maxval
                type:(CvThresholdType) type;

//! set mask elements for those array elements which are within the element-specific bounding box (dst = lowerb <= src && src < upperb)
+ (void) inRange:(CvMat*) src
           lower:(NSArray<NSNumber *>*)lower
           upper:(NSArray<NSNumber *>*) upper
             dst:(CvMat*) dst;

// Erodes the image (applies the local minimum operator)
+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel
        anchor:(CGPoint) anchor
    iterations:(int) iterations
    borderType:(CvBorderType) borderType
   borderValue:(NSArray<NSNumber*>*) borderValue;

+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel
        anchor:(CGPoint) anchor
    iterations:(int) iterations
    borderType:(CvBorderType) borderType;

+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel
        anchor:(CGPoint) anchor
    iterations:(int) iterations;

+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel
        anchor:(CGPoint) anchor;

+ (void) erode:(CvMat*) src
           dst:(CvMat*) dst
        kernel:(CvMat*) kernel;


// Dilates the image (applies the local maximum operator)
+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel
         anchor:(CGPoint) anchor
     iterations:(int) iterations
     borderType:(CvBorderType) borderType
    borderValue:(NSArray<NSNumber*>*) borderValue;

+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel
         anchor:(CGPoint) anchor
     iterations:(int) iterations
     borderType:(CvBorderType) borderType;

+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel
         anchor:(CGPoint) anchor
     iterations:(int) iterations;

+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel
         anchor:(CGPoint) anchor;

+ (void) dilate:(CvMat*) src
            dst:(CvMat*) dst
         kernel:(CvMat*) kernel;


// Applies an advanced morphological operation to the image
+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel
               anchor:(CGPoint) anchor
           iterations:(int) iterations
           borderType:(CvBorderType) borderType
          borderValue:(NSArray<NSNumber*>*) borderValue;

+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel
               anchor:(CGPoint) anchor
           iterations:(int) iterations
           borderType:(CvBorderType) borderType;

+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel
               anchor:(CGPoint) anchor
           iterations:(int) iterations;

+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel
               anchor:(CGPoint) anchor;

+ (void) morphologyEx:(CvMat*) src
                  dst:(CvMat*) dst
            operation:(CvMorphOperation) operation
               kernel:(CvMat*) kernel;

// Returns structuring element of the specified shape and size
+ (CvMat*)getStructuringElement:(CvMorphShape)shape
                           size:(CGSize)size
                         anchor:(CGPoint)anchor;

+ (CvMat*)getStructuringElement:(CvMorphShape)shape
                           size:(CGSize)size;

// Resizes the image
+ (void) resize:(CvMat*) src
            dst:(CvMat*) dst
           size:(CGSize) size
             fx:(double) fx
             fy:(double) fy
  interpolation:(CvInterpolationAlgorithm) interpolation;

+ (void) resize:(CvMat*) src
            dst:(CvMat*) dst
           size:(CGSize) size
             fx:(double) fx
             fy:(double) fy;

+ (void) resize:(CvMat*) src
            dst:(CvMat*) dst
           size:(CGSize) size
             fx:(double) fx;

+ (void) resize:(CvMat*) src
            dst:(CvMat*) dst
           size:(CGSize) size;

// Smooths the image using Gaussian filter.
+ (void) gaussianBlur:(CvMat*) src dst:(CvMat*) dst
                 size:(CGSize) size
               sigmaX:(double) sigmaX
               sigmaY:(double) sigmaY
           borderType:(CvBorderType) borderType;

+ (void) gaussianBlur:(CvMat*) src dst:(CvMat*) dst
                 size:(CGSize) size
               sigmaX:(double) sigmaX
               sigmaY:(double) sigmaY;

+ (void) gaussianBlur:(CvMat*) src dst:(CvMat*) dst
                 size:(CGSize) size
               sigmaX:(double) sigmaX;

// A synonym for normalized box filter
+ (void) blur:(CvMat*) src
          dst:(CvMat*) dst
         size:(CGSize) size
       anchor:(CGPoint) anchor
   borderType:(CvBorderType) borderType;

+ (void) blur:(CvMat*) src
          dst:(CvMat*) dst
         size:(CGSize) size
       anchor:(CGPoint) anchor;

+ (void) blur:(CvMat*) src
          dst:(CvMat*) dst
         size:(CGSize) size;

// Smooths the image using median filter.
+ (void) medianBlur:(CvMat*) src
                dst:(CvMat*) dst
               size:(int) size;

//! adds one matrix to another (dst = src1 + src2)
+ (void) add:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst
        mask:(CvMat*) mask
       dtype:(int) dtype;

+ (void) add:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst
        mask:(CvMat*) mask;

+ (void) add:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst;

//! subtracts one matrix from another (dst = src1 + src2)
+ (void) subtract:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
             mask:(CvMat*) mask
            dtype:(int) dtype;

+ (void) subtract:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
             mask:(CvMat*) mask;

+ (void) subtract:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst;

//! computes element-wise weighted product of the two arrays (dst = scale*src1*src2)
+ (void) multiply:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
            scale:(double) scale
            dtype:(int) dtype;

+ (void) multiply:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst
            scale:(double) scale;

+ (void) multiply:(CvMat*) src1
             src2:(CvMat*) src2
              dst:(CvMat*) dst;

//! computes element-wise weighted quotient of the two arrays (dst = scale * src1 / src2)
+ (void) divide:(CvMat*) src1
           src2:(CvMat*) src2
            dst:(CvMat*) dst
          scale:(double) scale
          dtype:(int) dtype;

+ (void) divide:(CvMat*) src1
           src2:(CvMat*) src2
            dst:(CvMat*) dst
          scale:(double) scale;

+ (void) divide:(CvMat*) src1
           src2:(CvMat*) src2
            dst:(CvMat*) dst;

//! computes element-wise weighted reciprocal of an array (dst = scale/src2)
+ (void) divide:(double) scale
            src:(CvMat*) src
            dst:(CvMat*) dst
          dtype:(int) dtype;

+ (void) divide:(double) scale
            src:(CvMat*) src
            dst:(CvMat*) dst;

//! adds scaled array to another one (dst = alpha*src1 + src2)
+ (void) scaleAdd:(CvMat*) src1
            alpha:(double) alpha
             src2:(CvMat*) src2
              dst:(CvMat*) dst;

//! computes weighted sum of two arrays (dst = alpha*src1 + beta*src2 + gamma)
+ (void) addWeighted:(CvMat*) src1
               alpha:(double) alpha
                src2:(CvMat*) src2
                beta:(double) beta
               gamma:(double) gamma
                 dst:(CvMat*) dst
               dtype:(int) dtype;

+ (void) addWeighted:(CvMat*) src1
               alpha:(double) alpha
                src2:(CvMat*) src2
                beta:(double) beta
               gamma:(double) gamma
                 dst:(CvMat*) dst;

//! scales array elements, computes absolute values and converts the results to 8-bit unsigned integers: dst(i)=saturate_cast<uchar>abs(src(i)*alpha+beta)
+ (void) convertScaleAbs:(CvMat*) src
                     dst:(CvMat*) dst
                   alpha:(double) alpha
                    beta:(double) beta;

+ (void) convertScaleAbs:(CvMat*) src
                     dst:(CvMat*) dst
                   alpha:(double) alpha;

+ (void) convertScaleAbs:(CvMat*) src
                     dst:(CvMat*) dst;

//! computes square root of each matrix element (dst = src**0.5)
+ (void) sqrt:(CvMat*) src
          dst:(CvMat*) dst;

+ (void) sqrt:(CvMat*) src;

//! raises the input matrix elements to the specified power (b = a**power)
+ (void) pow:(CvMat*) src
       power:(double) power
         dst:(CvMat*) dst;

+ (void) pow:(CvMat*) src
       power:(double) power;

//! computes exponent of each matrix element (dst = e**src)
+ (void) exp:(CvMat*) src
         dst:(CvMat*) dst;

+ (void) exp:(CvMat*) src;

//! computes natural logarithm of absolute value of each matrix element: dst = log(abs(src))
+ (void) log:(CvMat*) src
         dst:(CvMat*) dst;

+ (void) log:(CvMat*) src;

//! retrieves contours and the hierarchical information from black-n-white image.
+ (NSArray<CvContour*>*)findContours:(CvMat*) image
                                mode:(CvContourRetrievalAlgorithm) mode
                              method:(CvContourApproximationAlgorithm) method
                              offset:(CGPoint) offset;

+ (NSArray<CvContour*>*)findContours:(CvMat*) image
                                mode:(CvContourRetrievalAlgorithm) mode
                              method:(CvContourApproximationAlgorithm) method;

+ (NSArray<CvContour*>*)findContours:(CvMat*) image;

//! draws contours in the image
+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color
            thickness:(int) thickness
             lineType:(CvLineType) lineType
             maxLevel:(int) maxLevel
               offset:(CGPoint) offset;

+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color
            thickness:(int) thickness
             lineType:(CvLineType) lineType
             maxLevel:(int) maxLevel;

+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color
            thickness:(int) thickness
             lineType:(CvLineType) lineType;

+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color
            thickness:(int) thickness;

+ (void) drawContours:(CvMat*) image
              contour:(CvContour*) contour
                color:(NSArray<NSNumber*>*) color;


//! computes the bounding rectangle for a contour
+ (CGRect) boundingRect:(CvMat*) points;

//! computes the contour area
+ (double) contourArea:(CvContour*) contour oriented:(BOOL) oriented;
+ (double) contourArea:(CvContour*) contour;

//! applies Canny edge detector and produces the edge map.
+ (void) canny:(CvMat*) image
         edges:(CvMat*) edges
    threshold1:(double) threshold1
    threshold2:(double) threshold2
  apertureSize:(NSInteger) apertureSize
    l2gradient:(BOOL) L2gradient;

+ (void) canny:(CvMat*) image
         edges:(CvMat*) edges
    threshold1:(double) threshold1
    threshold2:(double) threshold2
  apertureSize:(NSInteger) apertureSize;

+ (void) canny:(CvMat*) image
         edges:(CvMat*) edges
    threshold1:(double) threshold1
    threshold2:(double) threshold2;

//! applies generalized Sobel operator to the image
+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy
         ksize:(int) ksize
         scale:(double) scale
         delta:(double) delta
    borderType:(CvBorderType) borderType;

+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy
         ksize:(int) ksize
         scale:(double) scale
         delta:(double) delta;

+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy
         ksize:(int) ksize
         scale:(double) scale;

+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy
         ksize:(int) ksize;

+ (void) sobel:(CvMat*) src
           dst:(CvMat*) dst
        ddepth:(int) ddepth
            dx:(int) dx
            dy:(int) dy;

//! computes bitwise conjunction of the two arrays (dst = src1 & src2)
+ (void) bitwise_and:(CvMat*) src1
                src2:(CvMat*) src2
                 dst:(CvMat*) dst
                mask:(CvMat*) mask;

+ (void) bitwise_and:(CvMat*) src1
                src2:(CvMat*) src2
                 dst:(CvMat*) dst;

//! computes bitwise disjunction of the two arrays (dst = src1 | src2)
+ (void) bitwise_or:(CvMat*) src1
               src2:(CvMat*) src2
                dst:(CvMat*) dst
               mask:(CvMat*) mask;

+ (void) bitwise_or:(CvMat*) src1
               src2:(CvMat*) src2
                dst:(CvMat*) dst;

//! computes bitwise exclusive-or of the two arrays (dst = src1 ^ src2)
+ (void) bitwise_xor:(CvMat*) src1
                src2:(CvMat*) src2
                 dst:(CvMat*) dst
                mask:(CvMat*) mask;

+ (void) bitwise_xor:(CvMat*) src1
                src2:(CvMat*) src2
                 dst:(CvMat*) dst;

//! inverts each bit of array (dst = ~src)
+ (void) bitwise_not:(CvMat*) src
                 dst:(CvMat*) dst
                mask:(CvMat*) mask;

+ (void) bitwise_not:(CvMat*) src
                 dst:(CvMat*) dst;

//! computes element-wise absolute difference of two arrays (dst = abs(src1 - src2))
+ (void) absdiff:(CvMat*) src1
            src2:(CvMat*) src2
             dst:(CvMat*) dst;

//! compares elements of two arrays (dst = src1 <cmpop> src2)
+ (void) compare:(CvMat*) src1
            src2:(CvMat*) src2
             dst:(CvMat*) dst
           cmpop:(int)cmpop;

//! computes per-element minimum of two arrays (dst = min(src1, src2))
+ (void) min:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst;

//! computes per-element maximum of two arrays (dst = max(src1, src2))
+ (void) max:(CvMat*) src1
        src2:(CvMat*) src2
         dst:(CvMat*) dst;

//! finds global minimum and maximum array elements and returns their values and their locations
+ (CvMinMax) minMaxLoc:(CvMat*) src mask:(CvMat*) mask;
+ (CvMinMax) minMaxLoc:(CvMat*) src;

//! computes sum of array elements
+ (NSArray<NSNumber*>*) sum:(CvMat*) src;

//! Edge Preserving Filter
+ (void) edgePreservingFilter:(CvMat*) src
                          dst:(CvMat*) dst
                        flags:(CvEdgePreservingFilter) flags
                       sigmaS:(float) sigmaS
                       sigmaR:(float) sigmaR;

+ (void) edgePreservingFilter:(CvMat*) src
                          dst:(CvMat*) dst
                        flags:(CvEdgePreservingFilter) flags
                       sigmaS:(float) sigmaS;

+ (void) edgePreservingFilter:(CvMat*) src
                          dst:(CvMat*) dst
                        flags:(CvEdgePreservingFilter) flags;

//! Detail Enhance
+ (void) detailEnhance:(CvMat*) src
                   dst:(CvMat*) dst
                sigmaS:(float) sigmaS
                sigmaR:(float) sigmaR;

+ (void) detailEnhance:(CvMat*) src
                   dst:(CvMat*) dst
                sigmaS:(float) sigmaS;

+ (void) detailEnhance:(CvMat*) src
                   dst:(CvMat*) dst;

//! Stylization
+ (void) stylization:(CvMat*) src
                 dst:(CvMat*) dst
              sigmaS:(float) sigmaS
              sigmaR:(float) sigmaR;

+ (void) stylization:(CvMat*) src
                 dst:(CvMat*) dst
              sigmaS:(float) sigmaS;

+ (void) stylization:(CvMat*) src
                 dst:(CvMat*) dst;

//! PencilSketch
+ (void) pencilSketch:(CvMat*) src
                 dst1:(CvMat*) dst1
                 dst2:(CvMat*) dst2
               sigmaS:(float) sigmaS
               sigmaR:(float) sigmaR
          shadeFactor:(float) shadeFactor;

+ (void) pencilSketch:(CvMat*) src
                 dst1:(CvMat*) dst1
                 dst2:(CvMat*) dst2
               sigmaS:(float) sigmaS
               sigmaR:(float) sigmaR;

+ (void) pencilSketch:(CvMat*) src
                 dst1:(CvMat*) dst1
                 dst2:(CvMat*) dst2
               sigmaS:(float) sigmaS;

+ (void) pencilSketch:(CvMat*) src
                 dst1:(CvMat*) dst1
                 dst2:(CvMat*) dst2;

//! copies each plane of a multi-channel array to a dedicated array
+ (NSArray<CvMat*>*) split:(CvMat*)src;

//! makes multi-channel array out of several single-channel arrays
+ (void) merge:(NSArray<CvMat*>*)channels dst:(CvMat*) dst;

@end
