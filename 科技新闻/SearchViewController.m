//
//  SearchViewController.m
//  科技新闻
//
//  Created by 赵武灵王 on 15/9/5.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

-(void)viewWillAppear:(BOOL)animated
{
    if(!self.str){
        self.navigationController.navigationBarHidden=NO;
    }
    
}

-(void)viewWillDisappear:(BOOL)animated

{
    if(!self.str){
        self.navigationController.navigationBarHidden=YES;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"搜索";
    UISearchBar * search=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,40)];
    [self.view addSubview:search];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
