//
//  MoreView.h
//  科技新闻
//
//  Created by llairen on 15/9/6.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    MoreViewStyleSearch,
    MoreViewStyleCollect,
    MoreViewStyleDownload
}MoreViewStyle;

@class MoreView;
@protocol  MoreViewDelegate <NSObject>

@optional
-(void)moreView:(MoreView *)moreView clickSelsctedViewTag:(MoreViewStyle)tag;

@end
@interface MoreView : UIImageView
@property (nonatomic, strong)UIButton * button;
@property (nonatomic, weak)id<MoreViewDelegate>delegate;
@end
