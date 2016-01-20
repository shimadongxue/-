//
//  StatusHeadView.m
//  科技新闻
//
//  Created by llairen on 15/12/17.
//  Copyright © 2015年 llairen. All rights reserved.
//

#import "StatusHeadView.h"
#import "UIView+Extension.h"
#import "UIImageView+WebCache.h"

@interface StatusHeadView ()<UIScrollViewDelegate>
/**滚动视图*/
@property (nonatomic, weak)UIScrollView *scrollView;

/**分页视图*/
@property (nonatomic, weak)UIPageControl *pageControl;

/**标题lable*/
@property (nonatomic, weak)UILabel  *titleLabel;


// @property(nonatomic,strong)NSTimer *timer;
@end
@implementation StatusHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        UIScrollView  *scrollView=[[UIScrollView alloc]init];
        [self addSubview:scrollView];
        self.scrollView=scrollView;
        scrollView.delegate=self;
        scrollView.pagingEnabled=YES;
//        UILabel *titleLabel=[[UILabel alloc]init];
//        [self addSubview:titleLabel];
//        titleLabel.textAlignment=NSTextAlignmentLeft;
//        titleLabel.tintColor=[UIColor lightGrayColor];
//        self.titleLabel=titleLabel;
//        scrollView.backgroundColor=[UIColor greenColor];
        UIPageControl *pageControl=[[UIPageControl alloc]init];
        [self addSubview:pageControl];
        self.pageControl=pageControl;
        self.pageControl.currentPageIndicatorTintColor=[UIColor greenColor];
        self.pageControl.pageIndicatorTintColor=[UIColor blackColor];
//        [self addNSTimer];
//        pageControl.backgroundColor=[UIColor redColor];
    }
    return self;
}

//-(void)addNSTimer
// {
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//     //添加到runloop中
//     [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
//     self.timer=timer;
// }
-(void)setScrollArr:(NSArray *)scrollArr
{
    _scrollArr=scrollArr;
    self.scrollView.contentSize=CGSizeMake(self.width*scrollArr.count, self.height-self.pageControl.height);
    self.pageControl.numberOfPages=scrollArr.count;
    
    for (int i=0;i<scrollArr.count;i++)
    {
        ScrollModel *model=scrollArr[i];
        NSURL * strUrl=[NSURL URLWithString:model.thumb];
        UIImageView * imageView=[[UIImageView alloc]init];
        imageView.y=0;
        imageView.width=self.width;
        imageView.height=self.scrollView.height;
        imageView.x=i*self.width;
        [imageView sd_setImageWithURL:strUrl];
//        [imageView sd_setImageWithURL:strUrl placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        [self.scrollView addSubview:imageView];
//        self.titleLabel.text=model.title;
    }
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat pageX=0;
    CGFloat pageH=25;
    CGFloat pageW=self.width;
//    self.titleLabel.x=titleX;
//    self.titleLabel.y=self.height-titleH;
//    self.titleLabel.width=titleW;
//    self.titleLabel.height=titleH;
    /**  page坐标*/
    
    
    self.pageControl.x=pageX;
    self.pageControl.y=self.height-pageH;
    self.pageControl.width=pageW;
    self.pageControl.height=pageH;
    self.scrollView.x=0;
    self.scrollView.y=0;
    self.scrollView.width=self.width;
    self.scrollView.height=self.height-pageH;
}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    
//}
//准确确定pageControl的页数
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page=scrollView.contentOffset.x/self.scrollView.width;
    self.pageControl.currentPage=(int)(page+0.5);
}
//#pragma mark-UICollectionViewDelegate
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
// {
//     [self removeNSTimer];
// }
// //删除定时器
// -(void)removeNSTimer
// {
//     [self.timer invalidate];
//     self.timer=nil;
// }
// //当用户停止拖拽的时候调用
// -(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
// {
//     [self addNSTimer];
// }
@end
