//
//  HttpTool.h
//  科技新闻
//
//  Created by llairen on 15/9/14.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface HttpTool : NSObject
+(void)getWithUrl:(NSString *)urlStr parms:(NSDictionary *)parmsDict success:(void(^)(id json))success failture:(void(^)(id failture))failture;
+(void)postWithUrl:(NSString *)urlStr parms:(NSDictionary *)parmsDict success:(void(^)(id json))success failture:(void(^)(id failture))failture;
@end
