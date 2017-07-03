//
//  DiagnosisClass.h
//  ProtectPlants
//
//  Created by komsit on 11/12/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface DiagnosisClass : NSObject

#pragma mark GET 1 Menu
-(void)getDiagnosisWhitID:(NSString *)Id
                completion:(void(^)(NSMutableDictionary * completion))completion;

#pragma mark GET 2 sub Menu
-(void)getDiagnosisSubWhitMainID:(NSString *)MainID
                      whitMenuID:(NSString *)menuID
               completion:(void(^)(NSMutableDictionary * completion))completion;

#pragma mark GET 3 sub Menu
-(void)getDiagnosisSub3WhitMainID:(NSString *)MainID
                      completion:(void(^)(NSMutableDictionary * completion))completion;
#pragma mark Server Image
- (void)loadImage:(NSURL *)URL completion:(void (^)(UIImage *image))completion;
@end
