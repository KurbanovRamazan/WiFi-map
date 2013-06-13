//
//  ViewController.h
//  Wifi
//
//  Created by ДГИНХ on 20.05.13.
//  Copyright (c) 2013 ДГИНХ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YMKMapView.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet YMKMapView *mapView;
- (IBAction)locateMe:(id)sender;

@end
