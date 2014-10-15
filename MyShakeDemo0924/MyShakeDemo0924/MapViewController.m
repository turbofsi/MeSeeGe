//
//  MapViewController.m
//  MeSeeGe
//
//  Created by apple on 2014-10-15.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CLLocationCoordinate2D coord = {48.904299, -79.22169};
    
    MKCoordinateSpan span = {0.1,0.1};
    
    MKCoordinateRegion region = {coord,span};
    
    [_myMap setRegion:region];
    
    _myMap.delegate = self;
    
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


@end
