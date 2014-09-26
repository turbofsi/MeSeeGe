//
//  CamaraView.h
//  MyShakeDemo0924
//
//  Created by apple on 2014-09-24.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "CFMagicEvents.h"

@interface CamaraView : UIView

@property (nonatomic, assign) AVCaptureDevicePosition cameraType;
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, assign) BOOL draggable;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;
@property (nonatomic, strong) CFMagicEvents *cfmagicEvents;

-(void)startFaceCam;
-(void)setDefauts;

@end
