//
//  WebViewController.m
//  科技新闻
//
//  Created by llairen on 15/9/6.
//  Copyright (c) 2015年 llairen. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView * web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSString * htmlStr=self.webModeL.url;
    NSURL * url=[NSURL URLWithString:htmlStr];
    NSURLRequest * request=[NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    [self.view addSubview:web];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
