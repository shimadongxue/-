//
//  NewsScrollView.h
//  科技新闻
//
//  Created by llairen on 16/1/18.
//  Copyright © 2016年 llairen. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NewsScrollView : UIView

@property (strong, nonatomic) NSArray *newses;
+ (instancetype)newsView;
@end
