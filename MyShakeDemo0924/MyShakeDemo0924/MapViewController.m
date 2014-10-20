//
//  MapViewController.m
//  MeSeeGe
//
//  Created by apple on 2014-10-15.
//  Copyright (c) 2014 UofT. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation MapViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CLLocationCoordinate2D coord = {43.704299, -79.40169};
    
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


- (IBAction)longPressAction:(UILongPressGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:_myMap];
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [_myMap removeAnnotation:_lastNotation];
        _coordinate = [_myMap convertPoint:point toCoordinateFromView:_myMap];
        NSLog(@"Long press done, the location is: %.6f %.6f", _coordinate.latitude, _coordinate.longitude);
        
        WYanotation *newNotation = [[WYanotation alloc] initWithCoordinate2D:_coordinate];
        newNotation.title = @"Destination";
        [_myMap addAnnotation:newNotation];
        _lastNotation = newNotation;
    }

}



#pragma mark - mapView_annotation delegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    //----------------------Creat Pin------------------------------
    //    static NSString *identifier = @"Annotation";
    //    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    //    if (annotationView == nil) {
    //        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    //        annotationView.canShowCallout = YES;
    //    }
    
    _annotationView.annotation = annotation;
    _annotationView.pinColor = MKPinAnnotationColorRed;
    _annotationView.animatesDrop = YES;
    
    return _annotationView;
}

#pragma mark - Preparation for segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.doneButton) return;
    self.coordinate = _coordinate;
}


@end
