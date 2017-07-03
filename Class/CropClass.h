//
//  CropClass.h
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/16/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface CropClass : NSObject

-(void)getFeedCatID:(NSString *)catID
           WhitPage:(int)page
         completion:(void(^)(NSMutableDictionary * completion))completion;


#pragma mark Server Image
- (void)loadImage:(NSURL *)URL completion:(void (^)(UIImage *image))completion;
@end
