//
//  HttpTool.m
//  科技新闻
//
//  Created by llairen on 15/9/14.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool
+(void)getWithUrl:(NSString *)urlStr parms:(NSDictionary *)parmsDict success:(void (^)(id))success failture:(void (^)(id))failture
{
    
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failture)
        {
            failture(error);
        }
    }];
    
}
+(void)postWithUrl:(NSString *)urlStr parms:(NSDictionary *)parmsDict success:(void (^)(id))success failture:(void (^)(id))failture
{
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    NSDictionary * parameters=[NSDictionary dictionary];
    parameters=parmsDict;
//    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (success)
//        {
//            success
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        <#code#>
//    }]
}
@end
