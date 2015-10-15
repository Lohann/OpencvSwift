//
//  CvTest.h
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 21/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "CvMat.h"

@protocol CvCameraDelegate <NSObject>

- (CvMat*)processImage:(CvMat*)image;

@end

@interface CvCamera : NSObject

@property (nonatomic, assign) BOOL grayscaleMode;

@property (nonatomic, assign) BOOL recordVideo;
@property (nonatomic, assign) BOOL rotateVideo;
@property (nonatomic, retain) AVAssetWriterInput* recordAssetWriterInput;
@property (nonatomic, retain) AVAssetWriterInputPixelBufferAdaptor* recordPixelBufferAdaptor;
@property (nonatomic, retain) AVAssetWriter* recordAssetWriter;

@property (nonatomic, retain) AVCaptureSession* captureSession;
@property (nonatomic, retain) AVCaptureConnection* videoCaptureConnection;

@property (nonatomic, readonly) BOOL running;
@property (nonatomic, readonly) BOOL captureSessionLoaded;

@property (nonatomic, assign) int defaultFPS;
@property (nonatomic, assign) AVCaptureDevicePosition defaultAVCaptureDevicePosition;
@property (nonatomic, assign) AVCaptureVideoOrientation defaultAVCaptureVideoOrientation;
@property (nonatomic, assign) BOOL useAVCaptureVideoPreviewLayer;
@property (nonatomic, strong) NSString *const defaultAVCaptureSessionPreset;

@property (nonatomic, assign) CGSize imageSize;

@property (nonatomic, retain) UIView* parentView;

@property (nonatomic, assign) id<CvCameraDelegate> delegate;

- (instancetype) initWithParentView:(UIView*)view;

- (void)adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
- (void)layoutPreviewLayer;
- (void)saveVideo;
- (NSURL *)videoFileURL;

- (void)start;
- (void)stop;
- (void)switchCameras;

- (void)createCaptureOutput;
- (void)createVideoPreviewLayer;
- (void)updateOrientation;

- (void)lockFocus;
- (void)unlockFocus;
- (void)lockExposure;
- (void)unlockExposure;
- (void)lockBalance;
- (void)unlockBalance;

@end
