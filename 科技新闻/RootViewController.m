//
//  RootViewController.m
//  科技新闻
//
//  Created by llairen on 15/9/2.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "RootViewController.h"
#import "MenuTableView.h"
#import "MainViewController.h"
#import "SearchViewController.h"
#import "SaveController.h"
#import "SettingVireController.h"


#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
@interface RootViewController ()<MenuTableViewDelegate>
@property (nonatomic,strong) MainViewController *mainVc;

@property (nonatomic,strong) UINavigationController *nav;

@end

@implementation RootViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //左边的菜单
    MenuTableView *menuT=[[MenuTableView alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController * navMenu=[[UINavigationController alloc]initWithRootViewController:menuT];
    navMenu.view.frame=CGRectMake(0, 0, ScreenW/2, ScreenH);
    [self addChildViewController:navMenu];
    [self.view addSubview:navMenu.view];
    menuT.delegate=self;
    //主要新闻
    MainViewController *mainView=[[MainViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:mainView];
    //[self addChildViewController:nav];
    [self.view addSubview:nav.view];
    self.nav=nav;
    
   
}



-(void)menuTableView:(MenuTableView *)menuTableView indexPath:(int)indexPath
{
    if (indexPath==0)
    {
        SearchViewController *search=[[SearchViewController alloc]init];
        search.view.backgroundColor=[UIColor redColor];
        [self.navigationController pushViewController:search animated:YES];
        
    }
    else if (indexPath==1)
    {
        SaveController * save=[[SaveController alloc]initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:save animated:YES];
    }
    else if (indexPath==2)
    {
        UILabel * view=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        [self.view addSubview:view];
        view.textAlignment=NSTextAlignmentCenter;
        
    }
    else{
        SettingVireController * setting=[[SettingVireController alloc]initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:setting animated:YES];
    }
    
}
//更多button的代理事件



@end
