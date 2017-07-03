//
//  SearchClass.h
//  ProtectPlants
//
//  Created by komsit on 10/19/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface SearchClass : NSObject


-(void)getSearch:(NSString *)keyWord
           completion:(void(^)(NSMutableDictionary * completion))completion;


#pragma mark Server Image
- (void)loadImage:(NSURL *)URL completion:(void (^)(UIImage *image))completion;
@end
