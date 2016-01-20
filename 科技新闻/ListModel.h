//
//  ListModel.h
//  科技新闻
//
//  Created by llairen on 15/9/6.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject
@property (nonatomic, strong)NSString *contentid;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *thumb;
@property (nonatomic, strong)NSString *published;
@property (nonatomic, strong)NSString *url;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)listWithDict:(NSDictionary *)dict;
@end
