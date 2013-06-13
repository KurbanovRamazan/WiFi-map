/*
 * YMKTrafficInformer.h
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
 Traffic light colors representing the levels of congestion on the Yandex scale.
 */
typedef enum {
	YMKTrafficInformerColorNo,      /**< there is no traffic data available */
	YMKTrafficInformerColorRed,     /**< red color, the level of congestion is high */
	YMKTrafficInformerColorYellow,  /**< yellow color, the level of congestion is moderate */
	YMKTrafficInformerColorGreen    /**< green color, the level of congestion is low */
} YMKTrafficInformerColor;

/**
 The Yandex traffic congestion informer.
 */
@interface YMKTrafficInformer : NSObject {
@private
	YMKMapCoordinate _coord;
	NSInteger _value;
	YMKTrafficInformerColor _color;
	NSDate * _expirationDate;
}

/**
 The geographical coordinate for which the traffic jam data is valid.
 */
@property (nonatomic, assign) YMKMapCoordinate coord;

/**
 * The congestion level (1-10).
 */
@property (nonatomic, assign) NSInteger value;

/**
 The Yandex traffic light color (unknown, green, yellow, red).
 @see YMKTrafficInformerColor
 */
@property (nonatomic, assign) YMKTrafficInformerColor color;

/**
 * The date when the traffic jam data expires.
 */
@property (nonatomic, retain) NSDate * expirationDate;

@end
