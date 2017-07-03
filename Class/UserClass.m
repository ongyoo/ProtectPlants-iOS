//
//  UserClass.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/17/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "UserClass.h"

@implementation UserClass
-(void)setFeedbackWhitName:(NSString *)neame
                 WhitEmail:(NSString *)email
                   WhitTel:(NSString *)tel
                  WhitTile:(NSString *)tile
                   WhitMsg:(NSString *)msg
                completion:(void (^)(BOOL))completion
{
    
    NSString *URL  = [NSString stringWithFormat:@"%@submit_contact",APISERVER];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"name": neame ,
                                 @"email":email,
                                 @"tel":tel,
                                 @"title":tile,
                                 @"msg":msg};
    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        completion(YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completion(NO);
    }];
    
}

- (void)setDiagnosisWhitTel:(NSString *)tel
               WhitProvince:(NSString *)province
                    WhitLat:(NSString *)lat
                    WhitLng:(NSString *)lng
                  WhitLevel:(NSString *)level
                   WhitName:(NSString *)name
                 completion:(void (^)(BOOL))completion
{
    NSString *URL  = [NSString stringWithFormat:@"%@submit_diagnosis",APISERVER];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"tel": tel ,
                                 @"province":province,
                                 @"lat":lat,
                                 @"lng":lng,
                                 @"level":level,
                                 @"name":name};
    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        completion(YES);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completion(NO);
    }];
}
@end
