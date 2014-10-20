//
//  MapViewController.h
//  MeSeeGe
//
//  Created by apple on 2014-10-15.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "WYanotation.h"

@interface MapViewController : UIViewController<MKMapViewDelegate>

@property (strong, nonatomic) MKPinAnnotationView *annotationView;
@property (strong, nonatomic) WYanotation *lastNotation;

@property CLLocationCoordinate2D coordinate;

@property (strong, nonatomic) IBOutlet MKMapView *myMap;

- (IBAction)longPressAction:(UILongPressGestureRecognizer *)sender;




@end
