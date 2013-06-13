/*
 * YMKGeoObject.h
 *
 * This file is a part of the Yandex Map Kit.
 *
 * Version for iOS © 2011-2012 YANDEX
 * 
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://legal.yandex.ru/mapkit/
 */

#import <Foundation/Foundation.h>
#import "YMKMapStructs.h"


/**
 Defines generic geographical object
 */
@protocol YMKGeoObject <NSObject>
@required

/**
 The map coordinates of the center point of an object.
 */
- (YMKMapCoordinate)coordinate;

@end
