//
//  NewsClass.h
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/16/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NewsClass : NSObject

-(void)getNewsWhitPage:(int)page
            completion:(void(^)(NSMutableDictionary * completion))completion;

-(void)getNewsWeekWhitPage:(int)page
                completion:(void(^)(NSMutableDictionary * completion))completion;

-(void)getNewsWeekcompletion:(void(^)(NSMutableDictionary * completion))completion;


#pragma mark GET News Detail
-(void)getNewsDetailWhitID:(NSString *)Id
            completion:(void(^)(NSMutableDictionary * completion))completion;
#pragma mark Server Image
- (void)loadImage:(NSURL *)URL completion:(void (^)(UIImage *image))completion;
@end
