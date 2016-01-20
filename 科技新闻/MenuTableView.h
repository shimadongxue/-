//
//  MenuTableView.h
//  科技新闻
//
//  Created by 赵武灵王 on 15/9/1.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuTableView;
@protocol MenuTableViewDelegate <NSObject>

@optional
-(void)menuTableView:(MenuTableView *)menuTableView indexPath:(int)indexPath;

@end
@interface MenuTableView : UITableViewController
@property (nonatomic, strong)id<MenuTableViewDelegate>delegate;
@end
