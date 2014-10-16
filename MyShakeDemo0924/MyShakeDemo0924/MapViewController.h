//
//  MapViewController.h
//  MeSeeGe
//
//  Created by apple on 2014-10-15.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>


@property (strong, nonatomic) IBOutlet MKMapView *myMap;



@end
