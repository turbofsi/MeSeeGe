//
//  CamaraView.m
//  MyShakeDemo0924
//
//  Created by apple on 2014-09-24.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import "CamaraView.h"

@implementation CamaraView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)setDefauts {
    [self setBackgroundColor:[UIColor darkGrayColor]];
//    self.layer.cornerRadius = 5;
//    self.layer.masksToBounds = YES;
    self.frame = CGRectMake(0, 0, 320, 568);
    self.cameraType = AVCaptureDevicePositionBack;
    self.draggable = NO;
}

-(void)startFaceCam{
    AVCaptureDevice *device = [self CameraIfAvailable];
    
    if (device) {
        if (!_session) {
            _session = [[AVCaptureSession alloc] init];
        }
        _session.sessionPreset = AVCaptureSessionPresetMedium;
        
        NSError *error = nil;
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
        if (!input) {
            // Handle the error appropriately.
            NSLog(@"ERROR: trying to open camera: %@", error);
        } else {
            if ([_session canAddInput:input]) {
                [_session addInput:input];
                
                _captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
                
                _captureVideoPreviewLayer.frame = self.bounds;
                _captureVideoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
                
                [self.layer addSublayer:_captureVideoPreviewLayer];
                
                [_session startRunning];
            } else {
                NSLog(@"Couldn't add input");
            }
        }
    } else {
        NSLog(@"Camera not available");
    }

}

-(AVCaptureDevice *)CameraIfAvailable
{
    NSArray *videoDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    AVCaptureDevice *captureDevice = nil;
    for (AVCaptureDevice *device in videoDevices)
    {
        if (device.position == self.cameraType)
        {
            captureDevice = device;
            break;
        }
    }
    
    //just in case
    if (!captureDevice) {
        captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    
    return captureDevice;
}
#pragma mark - Motion Detection
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        // Put in code here to handle shake
        NSLog(@"Your iPhone is Shaking!!!");
        [self startFaceCam];
        
    }
    
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}

- (BOOL)canBecomeFirstResponder
{ return YES; }


@end
