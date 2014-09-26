//
//  ViewController.m
//  MyShakeDemo0924
//
//  Created by apple on 2014-09-24.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import "ViewController.h"
#import "CamaraView.h"
#import "CFMagicEvents.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//#pragma mark - Set the magic events
//    _cfMagicEvents = [[CFMagicEvents alloc] init];
//
#pragma mark - Magic events Notification Define
    _cfMagicEvents = [[CFMagicEvents alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventDetected:) name:@"onMagicEventDetected" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventNotDetected:) name:@"onMagicEventNotDetected" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shakingAction:) name:@"shakingEventActivated" object:nil];

    [_camaraView setDefauts];
//    [_camaraView startFaceCam];
    
    [self.view addSubview:_alphaTextView];
    [_camaraView becomeFirstResponder];
    
    
}

- (void)receiveOnMagicEventDetected:(NSNotification *) notification
{

    [_camaraView startFaceCam];
    [_cfMagicEvents stopCapture];
    NSLog(@"receiveOnMagicEventDetected");
    
}

- (void)receiveOnMagicEventNotDetected:(NSNotification *) notification
{
    NSLog(@"receiveOnMagicEventNotDetected");
}

- (void)shakingAction: (NSNotification *) notification
{
//    [_camaraView.captureVideoPreviewLayer removeFromSuperlayer];
    [_camaraView.session stopRunning];
    [_cfMagicEvents startCapture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)singleTapAction:(UITapGestureRecognizer *)sender {
    [_alphaTextView resignFirstResponder];
    [_camaraView becomeFirstResponder];
}

@end
