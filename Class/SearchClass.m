//
//  SearchClass.m
//  ProtectPlants
//
//  Created by komsit on 10/19/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "SearchClass.h"

@implementation SearchClass

- (void)getSearch:(NSString *)keyWord completion:(void (^)(NSMutableDictionary *))completion
{
    NSString *URL  = [NSString stringWithFormat:@"%@search",APISERVER];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"keyword":keyWord};
    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        completion(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completion(nil);
    }];
}

- (void)loadImage:(NSURL *)URL completion:(void (^)(UIImage *))completion
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:URL];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        UIImage *image = [[UIImage alloc] initWithData:responseObject];
        completion(image);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSlog(@"Failure: %@", error.userInfo); //-- มันไม่ failure เพราะถ้าไม่มีรูปมันจะโหลดมาเป็นค่าว่าง
    }];
    
    [operation start];
}
@end
