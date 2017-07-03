//
//  WeatherClass.h
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/20/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface WeatherClass : NSObject

-(void)getFeedWeathercompletion:(void(^)(NSMutableDictionary * completion))completion;

-(void)getFeedWeather:(NSString *)weatherID
         completion:(void(^)(NSMutableDictionary * completion))completion;


#pragma mark Server Image
- (void)loadImage:(NSURL *)URL completion:(void (^)(UIImage *image))completion;


@end
