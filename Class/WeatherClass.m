//
//  WeatherClass.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/20/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "WeatherClass.h"

@implementation WeatherClass
-(void) getFeedWeathercompletion:(void (^)(NSMutableDictionary *))completion
{
    NSString *URL  = [NSString stringWithFormat:@"%@weather",APISERVER];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL]];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject )
     {
         //         NSLog(@"Json :%@",responseObject);
         //         NSLog(@"URL :%@",URL);
         completion(responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error op: %@", error);
         completion(Nil);
     }];
    [[NSOperationQueue mainQueue] addOperation:op];

}

- (void)getFeedWeather:(NSString *)weatherID completion:(void (^)(NSMutableDictionary *))completion
{
    NSString *URL  = [NSString stringWithFormat:@"%@eather_detail?weather_id=%@",APISERVER,weatherID];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL]];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject )
     {
         //         NSLog(@"Json :%@",responseObject);
         //         NSLog(@"URL :%@",URL);
         completion(responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error op: %@", error);
         completion(Nil);
     }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

#pragma mark Loadimage
-(void)loadImage:(NSURL *)URL completion:(void (^)(UIImage *image))completion
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
