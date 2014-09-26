//
//  ViewController.m
//  MyShakeDemo0924
//
//  Created by apple on 2014-09-24.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import "ViewController.h"
#import "CamaraView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [_camaraView setDefauts];
//    [_camaraView startFaceCam];
//    [_camaraView addSubview:_alphaTextView];
    [self.view addSubview:_alphaTextView];
    [_camaraView becomeFirstResponder];
    
    
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
