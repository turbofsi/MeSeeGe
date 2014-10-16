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
    
//Set up the magic events

    _cfMagicEvents = [[CFMagicEvents alloc] init];
    
//Set the notification.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventDetected:) name:@"onMagicEventDetected" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventNotDetected:) name:@"onMagicEventNotDetected" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shakingAction:) name:@"shakingEventActivated" object:nil];
    
//Set the default camaraView
    
    [_camaraView setDefauts];
    
//Add the alphaView to the mainView, ***: Not the camaraView
    
    [self.view addSubview:_alphaTextView];
    [_camaraView becomeFirstResponder];
    
    
}
#pragma mark - Notification Actions for magic events(detected & not detected)
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

#pragma mark - activate when shaking event is detected
- (void)shakingAction: (NSNotification *) notification
{
//    [_camaraView.captureVideoPreviewLayer removeFromSuperlayer];
    
    [_camaraView.session stopRunning];
    //The Session will stop running, when recieve magic event, it will turn to [_camaraView startFaceCam] and show Live Background.
    
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

- (IBAction)unwindToMainView:(UIStoryboardSegue *)segue
{
    
}

@end
