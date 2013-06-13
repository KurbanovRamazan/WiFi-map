//
//  ViewController.m
//  Wifi
//
//  Created by ДГИНХ on 20.05.13.
//  Copyright (c) 2013 ДГИНХ. All rights reserved.
//

#import "ViewController.h"
#import "PointAnnotation.h"
#import "YMKUserLocation.h"
//#import "Hotspot.h"

@interface ViewController ()<CLLocationManagerDelegate>
//@property NSMutableArray *hotspots;
@property CLLocationManager *locationManager;

@end

@implementation ViewController 

- (void)addHotSpot:(CGPoint)location place:(NSString *)place ssid:(NSString *)ssid password:(NSString *)password {
    //Hotspot *hotspot = [[Hotspot alloc] initWithLocation:location place:place ssid:ssid password:password];
    ///[self.hotspots addObject:hotspot];
    
    if (password == nil) password = @"без пароля";
    if (password.length == 0)password = @"без пароля";
    
    PointAnnotation *annotation = [PointAnnotation pointAnnotation];
    annotation.coordinate = YMKMapCoordinateMake(location.x, location.y);
    annotation.title = place;
    annotation.subtitle = [NSString stringWithFormat:@"WiFi:%@ \nПароль: %@", ssid, password];    
    [self.mapView addAnnotation:annotation];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.hotspots = [NSMutableArray array];
    
    [self configureMapView];
}

- (void)configureMapView {
    self.mapView.showsUserLocation = YES;
    self.mapView.showTraffic = NO;

    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"plist"];
    NSArray *myArray = [[NSArray alloc] initWithContentsOfFile:filepath];
    for (NSDictionary *hotspot in myArray) {
        [self addHotSpot:CGPointMake([hotspot[@"lat"] floatValue], [hotspot[@"lon"] floatValue]) place:hotspot[@"place"] ssid:hotspot[@"ssid"] password:hotspot[@"password"]];
    }
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [self.locationManager stopUpdatingLocation];
    [self.mapView setCenterCoordinate:YMKMapCoordinateMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude) atZoomLevel:16 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)locateMe:(id)sender {
[self.locationManager startUpdatingLocation];
}


- (IBAction)zoomPlusButtonTapped:(id)sender {
    [self.mapView zoomIn];    }
- (IBAction)zoomMinusButtonTapped:(id)sender {
    [self.mapView zoomOut];    
}



@end
