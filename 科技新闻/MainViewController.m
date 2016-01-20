//
//  MainViewController.m
//  科技新闻
//
//  Created by 赵武灵王 on 15/9/1.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "MainViewController.h"
#import "MenuTableView.h"

#import "ListModel.h"
#import "NewsCell.h"
#import "WebViewController.h"
#import "MJRefresh.h"

#import "SearchViewController.h"
#import "ScrollModel.h"
#import "AFNetworking.h"
#import "StatusHeadView.h"
#import "MJNewsView.h"
#define MoreVcH   120
#define MoreVcW  100

@interface MainViewController ()<UIGestureRecognizerDelegate,MoreViewDelegate>
{
    int page ;
}
@property (nonatomic, strong)NSMutableArray * newsFrame;

@property (nonatomic,weak) MJNewsView *headerView;
@property (nonatomic,weak) MoreView *moreView;
@end

@implementation MainViewController
-(NSMutableArray *)newsFrame
{
    if (_newsFrame==nil)
    {
        _newsFrame =[NSMutableArray array];
    }
    return _newsFrame;
}

//-(NSArray *)scrollArray
//{
//    if (_scrollArray==nil)
//    {
//        _scrollArray=[[NSArray alloc]init];
//    }
//    return _scrollArray;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigation]; //导航
    
   //添加tabBar的视图
    [self addHeaderView];
    
    [self addGestureRecognizer]; //添加手势
    self.tableView.delegate=self;
    
    [self remoteLoadingData];
    
    //上拉刷新
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullUP) ];
    //下拉加载
    self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(pushUP)];
}

-(void)addHeaderView
{

    MJNewsView* headerView=[MJNewsView newsView];
//    headerView.frame=CGRectMake(0, 0, 320, 130);

    self.headerView=headerView ;
    self.tableView.tableHeaderView=headerView;
    [self scrollRemoteLoadingData];
}

-(void)pushUP
{
//    page++;
//    [self.tableView.footer beginRefreshing];
//    [self remoteLoadingData];
    [self.tableView.footer endRefreshing];
}
-(void)pullUP
{
    
//    page=1;
//    [self.newsFrame removeAllObjects];
//    [self.tableView.header beginRefreshing];
//    [self remoteLoadingData];
    [self.tableView.header endRefreshing];
}
-(void)scrollRemoteLoadingData
{

    //无限滚动视图请求；
    NSString * strScroll=[NSString stringWithFormat:@"http://open.techweb.com.cn/techwebclient/pic/limit/5/s/900"];
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    [manager GET:strScroll parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dict=responseObject;
        NSArray * arr=dict[@"list"];
        NSMutableArray * array=[NSMutableArray array];
        for ( NSDictionary * dic in arr) {
            
            ScrollModel * Model=[[ScrollModel alloc]initWithDict:dic];
            [array addObject:Model];
            
            
            
        }
        self.headerView.newses=array;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
    
    
}

-(void)remoteLoadingData
{
    NSString * strUrl=[NSString stringWithFormat:@"http://open.techweb.com.cn/techwebclient/index/page/limit/5/"];
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * array=responseObject[@"list"];
        NSMutableArray * arr=[NSMutableArray array];
        for (NSDictionary * dict in array)
        {
            NewsFrame * frameModel=[[NewsFrame alloc]init];
            frameModel.list=[[ListModel alloc]initWithDict:dict];
            [arr addObject:frameModel];
        }
        self.newsFrame=arr;
        [self.tableView reloadData];
        //刷新成功 自定义活动指示器
        [self refrechLabel];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败解析");
    }];


    
    
    
}
-(void)refrechLabel
{
    UILabel * label=[[UILabel alloc]init];
    label.backgroundColor=[UIColor grayColor];
    label.frame=CGRectMake(0, 0, 80, 20);
    label.center=self.navigationController.view.center;
    label.text=@"刷新完成!";
    label.layer.cornerRadius=5;
    label.clipsToBounds=YES;
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor whiteColor];
    [self.navigationController.view addSubview:label];
    label.alpha=0;
    [UIView animateWithDuration:1.0 animations:^{
        label.alpha=1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
            label.alpha=0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}
//导航属性设置
-(void)navigation
{
    UIImage *navImage=[UIImage imageNamed:@"logo"];
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:navImage];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(leftButton)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStyleDone target:self action:@selector(rightButton:)];
}
//添加手势
-(void)addGestureRecognizer
{
    //swip
    self.swipeLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftButton)];
    
    self.swipeLeft.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.swipeLeft];
    //tap
    UITapGestureRecognizer * Tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftButton)];
//    UITapGestureRecognizer * Tapp=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightButton)];
//    [self.view addGestureRecognizer:Tapp];
    Tap.delegate=self;
    [self.view addGestureRecognizer:Tap];
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (self.open==YES )
    {
        return YES;
    }
    return NO;
}

#pragma mark 左


//导航left按钮
-(void)leftButton
{
    self.open=!self.isOpen;
    if (self.open)
    {
        [UIView animateWithDuration:0.25 animations:^{
            self.navigationController.view.transform=CGAffineTransformMakeTranslation(self.view.frame.size.width/2, 0);
            
        }];
        
     }
    else{
        [UIView animateWithDuration:0.25 animations:^{
            self.navigationController.view.transform=CGAffineTransformMakeTranslation(0, 0);
        }];
        
    }
}
//导航右按钮
-(void)rightButton:(UIButton*)sender
{
    self.ok=!self.isOk;
    if(self.ok)
    {
      
        MoreView * moreVC=[[MoreView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-MoreVcW,54,MoreVcW,MoreVcH)];
        moreVC.delegate=self;
        [self.navigationController.view addSubview:moreVC];
        self.moreView=moreVC;
        
    }
    else
    {
        [self.moreView removeFromSuperview];
    
    }

}

-(void)moreView:(MoreView *)moreView clickSelsctedViewTag:(MoreViewStyle)tag
{
    SearchViewController *search=[[SearchViewController alloc]init];
    search.str=@"ios";
    [self.navigationController pushViewController:search animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   
    
    return self.newsFrame.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsCell * cell=[NewsCell cellWithTableView:tableView];
    
    NewsFrame *newsFrame=self.newsFrame[indexPath.row];
    cell.newsFrame=newsFrame;
 
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsFrame *newsFrame=self.newsFrame[indexPath.row];
    return newsFrame.cellF;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    self.ok=YES;
    WebViewController * web=[[WebViewController alloc]init];
    NewsFrame * model=self.newsFrame[indexPath.row];
    web.webModeL=model.list;
    [self.navigationController pushViewController:web animated:YES];
    
}

@end
