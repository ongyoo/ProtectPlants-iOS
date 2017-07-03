//
//  DiagnosisClass.m
//  ProtectPlants
//
//  Created by komsit on 11/12/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import "DiagnosisClass.h"

@implementation DiagnosisClass
- (void)getDiagnosisWhitID:(NSString *)Id completion:(void (^)(NSMutableDictionary *))completion
{
    NSString *URL  = [NSString stringWithFormat:@"%@get_root_diagnosis?menu_id=%@",APISERVER,Id];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL]];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject )
     {
         
         completion(responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error op: %@", error);
         completion(Nil);
     }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

-(void)getDiagnosisSubWhitMainID:(NSString *)MainID
                      whitMenuID:(NSString *)menuID
                      completion:(void(^)(NSMutableDictionary * completion))completion
{
    NSString *URL  = [NSString stringWithFormat:@"%@get_parent_diagnosis?plants_head_menu=%@&plants_id=%@",APISERVER,MainID,menuID];
    NSLog(@"URL :%@",URL);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL]];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject )
     {
         
         completion(responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error op: %@", error);
         completion(Nil);
     }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

- (void)getDiagnosisSub3WhitMainID:(NSString *)MainID
                        completion:(void (^)(NSMutableDictionary *))completion
{
    NSString *URL  = [NSString stringWithFormat:@"%@get_detail_diagnosis?plants_key=%@",APISERVER,MainID];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL]];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject )
     {
         
         completion(responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error op: %@", error);
         completion(Nil);
     }];
    [[NSOperationQueue mainQueue] addOperation:op];
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
