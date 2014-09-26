//
//  ViewController.h
//  MyShakeDemo0924
//
//  Created by apple on 2014-09-24.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CamaraView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet CamaraView *camaraView;
@property (strong, nonatomic) IBOutlet UITextView *alphaTextView;
- (IBAction)singleTapAction:(UITapGestureRecognizer *)sender;


@end

