//
//  SearchViewController.m
//  iosDemo
//
//  Created by long on 15/1/15.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "SearchViewController.h"

@implementation SearchViewController

- (void) loadView
{
    [super loadView];
    UIScrollView *uiScrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, 750/2, 250)];
    uiScrollView.backgroundColor = [UIColor redColor];
    
    //设置内容大小
    uiScrollView.contentSize = CGSizeMake(750, 250);
    [self.view addSubview:uiScrollView];
    //是否反弹
    uiScrollView.bounces = NO;
    //是否分页
    uiScrollView.pagingEnabled = YES;
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(320, 200, 320, 40)];
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"学习ScrollView";
    [uiScrollView addSubview: label];
}

@end
