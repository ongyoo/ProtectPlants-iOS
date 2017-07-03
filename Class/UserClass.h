//
//  UserClass.h
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/17/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface UserClass : NSObject



-(void)setFeedbackWhitName:(NSString *)neame
                 WhitEmail:(NSString *)email
                   WhitTel:(NSString *)tel
                  WhitTile:(NSString *)tile
                   WhitMsg:(NSString *)msg
         completion:(void(^)(BOOL completion))completion;


-(void)setDiagnosisWhitTel:(NSString *)tel
              WhitProvince:(NSString *)province
                   WhitLat:(NSString *)lat
                   WhitLng:(NSString *)lng
                   WhitLevel:(NSString *)level
                    WhitName:(NSString *)name
                completion:(void(^)(BOOL completion))completion;
@end
