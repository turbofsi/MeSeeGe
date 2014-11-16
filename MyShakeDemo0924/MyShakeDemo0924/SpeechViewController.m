//
//  SpeechViewController.m
//  MeSeeGe
//
//  Created by apple on 2014-10-28.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import "SpeechViewController.h"

@interface SpeechViewController ()

@end

@implementation SpeechViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)singleTap:(UITapGestureRecognizer *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pauseOrStartAction" object:nil];
}

- (IBAction)rotateAction:(UIRotationGestureRecognizer *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RestartAction" object:nil];
}
@end
