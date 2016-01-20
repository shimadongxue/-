//
//  NewsCell.m
//  科技新闻
//
//  Created by llairen on 15/9/6.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "NewsCell.h"
#import "ListModel.h"
#import "NewsFrame.h"
#import "UIView+Extension.h"
@implementation NewsCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * strID=@"news";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell==nil)
    {
        cell=[[NewsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        UIImageView * imageView=[[UIImageView alloc]init];
        [self.contentView addSubview:imageView];
        self.iconView=imageView;
        
        UILabel * titleLable=[[UILabel alloc]init];
        [self.contentView addSubview:titleLable];
        self.titleLable=titleLable;
        self.titleLable.font=[UIFont systemFontOfSize:14];
        self.titleLable.numberOfLines=0;
    }
    return self;
}
-(void)setNewsFrame:(NewsFrame *)newsFrame
{
    _newsFrame=newsFrame;
   
    ListModel * model=self.newsFrame.list;
    self.titleLable.text=model.title;
    self.titleLable.frame=newsFrame.titleF;
    
    NSString * strImage=[NSString stringWithFormat:@"%@",model.thumb];
    NSURL * url=[NSURL URLWithString:strImage];
    NSData * data=[NSData dataWithContentsOfURL:url];
    self.iconView.image=[UIImage imageWithData:data];
    self.iconView.frame=newsFrame.imageF;
    
    
}
//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    CGFloat cellMargin = 5;
//    
//    self.iconView.x=cellMargin;
//    self.iconView.y=cellMargin;
//    self.iconView.width=70;
//    self.iconView.height=self.iconView.width;
//    self.titleLable
//}


@end
