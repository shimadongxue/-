//
//  ScrollModel.m
//  科技新闻
//
//  Created by llairen on 15/9/7.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "ScrollModel.h"
#import "SDWebImageManager.h"
@implementation ScrollModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init])
    {
        self.title=dict[@"title"];
        self.thumb=dict[@"thumb"];
        self.url=dict[@"url"];
        self.published=dict[@"published"];
        self.contentid=dict[@"contentid"];
    }
    return self;
}
+(instancetype)listWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
