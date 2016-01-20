//
//  NewsFrame.m
//  科技新闻
//
//  Created by llairen on 15/9/6.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "NewsFrame.h"
#import "UIView+Extension.h"
@implementation NewsFrame
-(void)setList:(ListModel *)list
{
    _list=list;
    int padding=10;
    CGFloat imageX=padding;
    CGFloat imageY=padding;
    CGFloat  imageW=80;
    CGFloat imageH=44;
    _imageF=CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleX=CGRectGetMaxX(self.imageF)+padding+10;
    CGFloat titleY=padding;
    CGSize titleSize=CGSizeMake(250, MAXFLOAT);
    CGSize size=[self sizeWithText:list.title font:[UIFont systemFontOfSize:14] maxSize:titleSize];
    _titleF=(CGRect){{titleX, titleY},size};
    
    self.cellF=CGRectGetMaxY(self.imageF)+padding;
}
-(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs=@{NSFontAttributeName :font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
@end
