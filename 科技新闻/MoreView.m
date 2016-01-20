//
//  MoreView.m
//  科技新闻
//
//  Created by llairen on 15/9/6.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "MoreView.h"

@interface MoreView ()
@property (nonatomic, strong)NSMutableArray * btnArray;
@end
@implementation MoreView
-(NSMutableArray *)btnArray
{
    if (_btnArray==nil)
    {
        _btnArray=[NSMutableArray array];
    }
    return _btnArray;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        
        self.image=[UIImage imageNamed:@"more_pop"];
        self.userInteractionEnabled=YES;
        [self addMoreButton];

    }
    return self;
}
-(void)addMoreButton
{
    [self setWithImage:@"more-search" title:@"搜索" tag:MoreViewStyleSearch];
    [self setWithImage:@"more-collect" title:@"收藏" tag:MoreViewStyleCollect];
    [self setWithImage:@"more-download" title:@"离线下载" tag:MoreViewStyleDownload];
    
}
-(UIButton *)setWithImage:(NSString *)image title:(NSString *)title tag:(MoreViewStyle)tag
{
    UIButton * button=[[UIButton alloc]init];
    button.tag=tag;
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    button.imageEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
    button.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    button.titleLabel.font=[UIFont systemFontOfSize:14];
    [self.btnArray addObject:button];
    
//    [button addTarget:self action:@selector(moreButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}
-(void)moreButton:(UIButton *)sender
{
  
    
    if([self.delegate respondsToSelector:@selector(moreView:clickSelsctedViewTag:)]){
        NSLog(@"11");
        [self.delegate moreView:self clickSelsctedViewTag:sender.tag];
    }
    
}
-(void)layoutSubviews
{
    for (int i=0;i<3;i++)
    {
        UIButton* button= self.btnArray[i];
        button.frame=CGRectMake(0, 3+(self.frame.size.height-3)/3*i, self.frame.size.width,(self.frame.size.height-3)/3);
        [self addSubview:button];
    }
    
}
@end
