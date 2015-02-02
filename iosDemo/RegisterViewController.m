//
//  RegisterViewController.m
//  iosDemo
//
//  Created by long on 15/1/24.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "RegisterViewController.h"
#import "PasswordViewController.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@implementation RegisterViewController


-(void) viewDidLoad
{
    self.view.backgroundColor = RGBA(67,202,185,1);
    
    
    UITextField *mobileField = [[UITextField alloc] initWithFrame:CGRectMake(90, 200, 200, 35)];
    mobileField.tag = 101;
    mobileField.borderStyle = UITextBorderStyleRoundedRect;
    //    mobileField.clearsOnBeginEditing = YES;
    mobileField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    mobileField.placeholder = @"手机号";
    [self.view addSubview:mobileField];
    
    
    
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 330, 140, 40)];
    [registerButton addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [registerButton setTitle:@"下一步" forState:UIControlStateNormal];
    registerButton.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:registerButton];
    self.title = @"注册";


}

-(void) next
{
    NSLog(@"this is commit register");
    PasswordViewController *passwordViewController = [[PasswordViewController alloc] init];
    [self.navigationController pushViewController:passwordViewController animated:YES];
}

@end
