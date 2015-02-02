//
//  MainViewController.m
//  iosDemo
//
//  Created by long on 15/1/17.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "SearchViewController.h"
#import "SettingViewController.h"
#import "OtherViewController.h"
#import "TestViewController.h"

@implementation MainViewController
{
    @private
    UIImageView *_selectView;

}


- (void) viewDidLoad {
    [super viewDidLoad];
    [self loadViewControllers];
    [self loadCuttomTabBarView];
    }

- (void) loadViewControllers
{
    
    // Home
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController: vc1];
    //    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTabBarSystemItem: UITabBarSystemItemFavorites tag:1];
    //    vc1.tabBarItem = homeItem;
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor yellowColor];
    
    // Message
    MessageViewController *messageViewController = [[MessageViewController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController: messageViewController];
    
    // Search
    SearchViewController *searchViewController = [[SearchViewController alloc] init];
    searchViewController.title = @"SearchTitle";
//    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController: searchViewController];
    searchViewController.view.backgroundColor = [UIColor purpleColor];
    
    // Setting
    //    UIViewController *vc4 = [[UIViewController alloc] init];
    //    vc4.title = @"我";
    //    vc4.view.backgroundColor = [UIColor purpleColor];
    SettingViewController *vc4 = [[SettingViewController alloc] init];
    UINavigationController *setNav = [[UINavigationController alloc] initWithRootViewController: vc4];
    TestViewController *testViewController = [[TestViewController alloc] init];
    UINavigationController *testNav = [[UINavigationController alloc] initWithRootViewController: testViewController];
    
//    UIViewController *vc5 = [[UIViewController alloc] init];
//    vc5.view.backgroundColor = [UIColor grayColor];

    NSArray *viewControllers = @[homeNav, messageNav, searchViewController, setNav, testNav];
    
    [self setViewControllers:viewControllers animated:YES];
}

- (void) loadCuttomTabBarView {
    UIImageView *tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 615, 380, 52)];
    tabBarBG.userInteractionEnabled = YES;
    tabBarBG.image = [UIImage imageNamed:@"tabBar"];
    
    [self.view addSubview:tabBarBG];
    
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 3, 53, 45)];
    _selectView.image = [UIImage imageNamed: @"select"];
    [tabBarBG addSubview: _selectView];
    
    float coordinateX = 0;
    for (int index=0; index < 5; index++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = index;
        button.frame = CGRectMake(15+coordinateX, 49.0/2-20, 42, 40);
//        button.backgroundColor = [UIColor blackColor];
        NSString *imageName = [NSString stringWithFormat:@"%d", index+1];
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState: UIControlStateNormal];
        [tabBarBG addSubview:button];
        [button addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
        coordinateX += 74;
    }
    
    
}

-(void) push
{
    NSLog(@"test push");
}

- (void) changeViewController:(UIButton *) button {
//    NSLog(@"%f", 49.0/2-45.0/3);
    [UIView beginAnimations:nil context:NULL];
    self.selectedIndex = button.tag;
    _selectView.frame = CGRectMake(10+button.tag*74, 3, 53, 45);
    [UIView commitAnimations];
}


@end
