//
//  MenuTableView.m
//  科技新闻
//
//  Created by 赵武灵王 on 15/9/1.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "MenuTableView.h"
#import "MainViewController.h"
#import "SearchViewController.h"

@interface MenuTableView ()
@property (nonatomic,strong)NSArray * titleArray;
@property (nonatomic,strong)NSArray * iconArray;
@end

@implementation MenuTableView
-(NSArray *)titleArray
{
    if (_titleArray==nil)
    {
        _titleArray=@[@"搜索",@"收藏",@"离线下载",@"设置",];
    }
    return _titleArray;
}
-(NSArray *)iconArray
{
    if (_iconArray==nil)
    {
        _iconArray=@[@"more-search",@"more-collect",@"more-download",@"more-setting",];
    }
    return _iconArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage * bg=[UIImage imageNamed:@"bottom_bg"];
    
    UIImageView * imageView=[[UIImageView alloc]initWithImage:bg];
    self.tableView.backgroundView=imageView;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //导航背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg"] forBarMetrics:UIBarMetricsDefaultPrompt];
    //导航图片
    UIImage *navImage=[UIImage imageNamed:@"logo"];
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:navImage];

    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * strID=@"news";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    UIImage * image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.iconArray[indexPath.row]]];
    cell.imageView.image=image;
    cell.textLabel.text=self.titleArray[indexPath.row];
    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_bg"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(menuTableView:indexPath:)])
    {
        [self.delegate menuTableView:self indexPath:indexPath.row];
    }
    
}



@end
