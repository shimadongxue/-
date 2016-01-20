//
//  NewsCell.h
//  科技新闻
//
//  Created by llairen on 15/9/6.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsFrame.h"
@interface NewsCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong)NewsFrame * newsFrame;

@property (nonatomic, strong)UIImageView * iconView;
@property (nonatomic, strong)UILabel * titleLable;
@end
