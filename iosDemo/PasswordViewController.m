//
//  PasswordViewController.m
//  iosDemo
//
//  Created by long on 15/1/24.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "PasswordViewController.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


@implementation PasswordViewController


-(void) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(67,202,185,1);
    self.title = @"设置密码";
    
    
    UITextField *mobileField = [[UITextField alloc] initWithFrame:CGRectMake(90, 200, 200, 35)];
    mobileField.tag = 109;
    mobileField.borderStyle = UITextBorderStyleRoundedRect;
    //    mobileField.clearsOnBeginEditing = YES;
    mobileField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    mobileField.placeholder = @"6位验证码";
    [self.view addSubview:mobileField];
    
    
    UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectMake(90, 250, 200, 35)];
    passwordField.tag = 1010;
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    //    mobileField.clearsOnBeginEditing = YES;
    passwordField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    passwordField.placeholder = @"密码";
    [self.view addSubview:passwordField];
    
    
    UITextField *passwordConfirmField = [[UITextField alloc] initWithFrame:CGRectMake(90, 290, 200, 35)];
    passwordConfirmField.tag = 1011;
    passwordConfirmField.borderStyle = UITextBorderStyleRoundedRect;
    //    mobileField.clearsOnBeginEditing = YES;
    passwordConfirmField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    passwordConfirmField.placeholder = @"确认密码";
    [self.view addSubview:passwordConfirmField];
    
    
    
    
    UIButton *commitButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 350, 140, 40)];
    [commitButton addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    [commitButton setTitle:@"提交" forState:UIControlStateNormal];
    commitButton.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:commitButton];
}

-(void) commit
{
    NSLog(@"完成注册");
}
@end
