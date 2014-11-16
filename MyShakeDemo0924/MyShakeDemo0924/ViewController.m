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
#import "GeoPointCompass.h"
#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

GeoPointCompass *geoCompassView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//Set up the magic events

    _cfMagicEvents = [[CFMagicEvents alloc] init];
    
//Set the notification.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventDetected:) name:@"onMagicEventDetected" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventNotDetected:) name:@"onMagicEventNotDetected" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shakingAction:) name:@"shakingEventActivated" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pauseOrStart) name:@"pauseOrStartAction" object:nil];
    
//Set the default camaraView
    
    [_camaraView setDefauts];
    
//Add the alphaView to the mainView, ***: Not the camaraView
    
    [self.view addSubview:_alphaTextView];
    [_camaraView becomeFirstResponder];
    
//Add arrow View
    UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(140, 300, 40, 40)];
    arrowImageView.tag = 101;
    arrowImageView.image = [UIImage imageNamed:@"arrow.png"];
    [self.view addSubview:arrowImageView];
    
    NSString *speechString = _alphaTextView.text;
    _av = [[AVSpeechSynthesizer alloc] init];
    AVSpeechUtterance *targetText = [[AVSpeechUtterance alloc] initWithString:speechString];
    targetText.rate = 0.2;
    
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
    
        [_camaraView becomeFirstResponder];
        MapViewController *source = [segue sourceViewController];
        CLLocationCoordinate2D coodinate = source.coordinate;
        if (coodinate.latitude != 0)
        {
            geoCompassView = [[GeoPointCompass alloc] init];
            UIImageView *arrowImageView = (UIImageView *)[self.view viewWithTag:101];
            geoCompassView.arrowImageView = arrowImageView;
            geoCompassView.latitudeOfTargetedPoint = coodinate.latitude;
            geoCompassView.longitudeOfTargetedPoint = coodinate.longitude;
        }
    
}

- (IBAction)unwindToMainView2:(UIStoryboardSegue *)segue{
    [_av stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    sp = 0;
}

int sp = 0;
- (void)pauseOrStart{
    NSString *speechString = _alphaTextView.text;
    AVSpeechUtterance *targetText = [[AVSpeechUtterance alloc] initWithString:speechString];
    targetText.rate = 0.2;

    if (sp == 0) {
        [_av speakUtterance:targetText];
    }
    if (sp % 2 != 0) {
        [_av continueSpeaking];
    }
    else{
        [_av pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
    }
    sp++;
}

@end
