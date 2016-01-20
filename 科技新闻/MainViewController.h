//
//  MainViewController.h
//  科技新闻
//
//  Created by 赵武灵王 on 15/9/1.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreView.h"

@class MainViewController;
@protocol MainViewControllerDelegate <NSObject>

@optional


@end

@interface MainViewController : UITableViewController
@property (nonatomic , assign ,getter=isOpen)BOOL open;

@property (nonatomic , assign ,getter=isOk)BOOL ok;
@property (nonatomic , strong)UISwipeGestureRecognizer * swipeLeft;


@end
