//
//  NewsFrame.h
//  科技新闻
//
//  Created by llairen on 15/9/6.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ListModel.h"
@interface NewsFrame : NSObject
@property (nonatomic, assign)CGRect imageF;
@property (nonatomic, assign)CGRect titleF;
@property (nonatomic, assign)CGFloat cellF;
@property (nonatomic, strong)ListModel * list;
@end
