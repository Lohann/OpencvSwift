//
//  CvTest.m
//  CameraCalibration
//
//  Created by Lohann Paterno Coutinho Ferreira on 21/09/15.
//  Copyright © 2015 Lohann Paterno Coutinho Ferreira. All rights reserved.
//

#import "CvCamera.h"

#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>
#import "CvVideoCameraAdapter.h"


@implementation CvCamera {
    CvVideoCamera *_videoCamera;
    CvVideoCameraAdapter *_videoCameraAdapter;
}

- (instancetype)init
{
    if(self = [super init])
    {
        _videoCameraAdapter = [[CvVideoCameraAdapter alloc] init];
        _videoCamera = [[CvVideoCamera alloc] init];
        _videoCamera.delegate = _videoCameraAdapter;
        [self setupCamera];
    }
    return self;
}

- (instancetype) initWithParentView:(UIView*)view
{
    if(self = [super init])
    {
        _videoCameraAdapter = [[CvVideoCameraAdapter alloc] init];
        _videoCamera = [[CvVideoCamera alloc] initWithParentView:view];
        _videoCamera.delegate = _videoCameraAdapter;
        [self setupCamera];
    }
    return self;
}

- (void) setupCamera {
    _videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    _videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset640x480;
    _videoCamera.defaultFPS = 30;
    _videoCamera.grayscaleMode = NO;
    
    switch ([[UIDevice currentDevice] orientation]) {
        case UIDeviceOrientationPortrait:            // Device oriented vertically, home button on the bottom
            _videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
            break;
        case UIDeviceOrientationPortraitUpsideDown:  // Device oriented vertically, home button on the top
            _videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortraitUpsideDown;
            break;
        case UIDeviceOrientationLandscapeLeft:       // Device oriented horizontally, home button on the right
            _videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationLandscapeLeft;
            break;
        case UIDeviceOrientationLandscapeRight:      // Device oriented horizontally, home button on the left
            _videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationLandscapeRight;
            break;
        default:
            _videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
            break;
    }
}

- (void)setDelegate:(id<CvCameraDelegate>)delegateP
{
    _videoCameraAdapter.delegate = delegateP;
}

- (id<CvCameraDelegate>)delegate
{
    return _videoCameraAdapter.delegate;
}

- (void)setParentView:(UIView *)parentView
{
    _videoCamera.parentView = parentView;
}

- (UIView *)parentView
{
    return _videoCamera.parentView;
}

- (void) setGrayscaleMode:(BOOL)grayscaleModeP
{
    _videoCamera.grayscaleMode = grayscaleModeP;
}

- (BOOL) grayscaleMode
{
    return _videoCamera.grayscaleMode;
}

- (void) setRecordVideo:(BOOL)recordVideoP
{
    _videoCamera.recordVideo = recordVideoP;
}

- (BOOL) recordVideo
{
    return _videoCamera.recordVideo;
}

- (void) setRotateVideo:(BOOL)rotateVideoP
{
    _videoCamera.rotateVideo = rotateVideoP;
}

- (BOOL) rotateVideo
{
    return _videoCamera.rotateVideo;
}

- (void)setRecordAssetWriterInput:(AVAssetWriterInput *)recordAssetWriterInputP
{
    _videoCamera.recordAssetWriterInput = recordAssetWriterInputP;
}

- (AVAssetWriterInput *) recordAssetWriterInput
{
    return _videoCamera.recordAssetWriterInput;
}

- (void)setImageSize:(CGSize)imageSize
{
    _imageSize = imageSize;
    _videoCamera.imageWidth  = (int)_imageSize.width;
    _videoCamera.imageHeight = (int)_imageSize.height;
}

- (BOOL)running
{
    return _videoCamera.running;
}

- (void)adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    [_videoCamera adjustLayoutToInterfaceOrientation:interfaceOrientation];
}

- (void)layoutPreviewLayer
{
    [_videoCamera layoutPreviewLayer];
}

- (void)saveVideo
{
    [_videoCamera saveVideo];
}

- (NSURL *)videoFileURL
{
    return [_videoCamera videoFileURL];
}

- (void)start
{
    _videoCamera.imageWidth  = (int)_imageSize.width;
    _videoCamera.imageHeight = (int)_imageSize.height;
    [_videoCamera start];
}

- (void)stop
{
    [_videoCamera stop];
}

- (void)switchCameras
{
    [_videoCamera switchCameras];
}

- (void)createCaptureOutput
{
    [_videoCamera createCaptureOutput];
}

- (void)createVideoPreviewLayer
{
    [_videoCamera createVideoPreviewLayer];
}

- (void)updateOrientation
{
    [_videoCamera updateOrientation];
}


- (void)lockFocus
{
    [_videoCamera lockFocus];
}

- (void)unlockFocus
{
    [_videoCamera unlockFocus];
}

- (void)lockExposure
{
    [_videoCamera lockExposure];
}

- (void)unlockExposure
{
    [_videoCamera unlockExposure];
}

- (void)lockBalance
{
    [_videoCamera lockBalance];
}

- (void)unlockBalance
{
    [_videoCamera unlockBalance];
}

- (void)setDefaultFPS:(int)defaultFPSP
{
    _videoCamera.defaultFPS = defaultFPSP;
}

- (int)defaultFPS
{
    return _videoCamera.defaultFPS;
}

- (void)setDefaultAVCaptureDevicePosition:(AVCaptureDevicePosition)defaultAVCaptureDevicePositionP
{
    _videoCamera.defaultAVCaptureDevicePosition = defaultAVCaptureDevicePositionP;
}

- (AVCaptureDevicePosition)defaultAVCaptureDevicePosition
{
    return _videoCamera.defaultAVCaptureDevicePosition;
}

- (void)setDefaultAVCaptureVideoOrientation:(AVCaptureVideoOrientation)defaultAVCaptureVideoOrientationP
{
    _videoCamera.defaultAVCaptureVideoOrientation = defaultAVCaptureVideoOrientationP;
}

- (AVCaptureVideoOrientation)defaultAVCaptureVideoOrientation
{
    return _videoCamera.defaultAVCaptureVideoOrientation;
}

- (void)setUseAVCaptureVideoPreviewLayer:(BOOL)useAVCaptureVideoPreviewLayerP
{
    _videoCamera.useAVCaptureVideoPreviewLayer = useAVCaptureVideoPreviewLayerP;
}

- (BOOL)useAVCaptureVideoPreviewLayer
{
    return _videoCamera.useAVCaptureVideoPreviewLayer;
}

- (void)setDefaultAVCaptureSessionPreset:(NSString *)defaultAVCaptureSessionPresetP
{
    _videoCamera.defaultAVCaptureSessionPreset = defaultAVCaptureSessionPresetP;
}

- (NSString *)defaultAVCaptureSessionPreset
{
    return _videoCamera.defaultAVCaptureSessionPreset;
}

@end
