//
//  Hotspot.h
//  Wifi
//
//  Created by Kurbanov Ramazan on 28.05.13.
//  Copyright (c) 2013 ДГИНХ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hotspot : NSObject

@property CGPoint location;
@property NSString *place;
@property NSString *ssid;
@property NSString *password;

-(id)initWithLocation:(CGPoint)location place:(NSString*)place ssid:(NSString*)ssid password:(NSString*)password;

@end
