//
//  Hotspot.m
//  Wifi
//
//  Created by Kurbanov Ramazan on 28.05.13.
//  Copyright (c) 2013 ДГИНХ. All rights reserved.
//

#import "Hotspot.h"

@implementation Hotspot

-(id)initWithLocation:(CGPoint)location place:(NSString *)place ssid:(NSString *)ssid password:(NSString *)password {
    if ((self = [super init])) {
        self.location = location;
        self.place = place;
        self.ssid = ssid;
        self.password = password;
    }
    return self;
}

@end
