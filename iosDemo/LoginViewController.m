//
//  LoginViewController.m
//  iosDemo
//
//  Created by long on 15/1/24.
//  Copyright (c) 2015年 long. All rights reserved.
//

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#import "LoginViewController.h"
#import "MainViewController.h"
#import "RegisterViewController.h"
#import "AFHTTPRequestOperationManager.h"

@implementation LoginViewController

- (void) loadView
{
    // [super loadView];
    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor greenColor];//RGBA(67,202,185,1);
     view.backgroundColor = RGBA(67,202,185,1);
    
    UITextField *mobileField = [[UITextField alloc] initWithFrame:CGRectMake(90, 190, 200, 35)];
    mobileField.tag = 101;
//    mobileField.keyboardType = UIKeyboardTypeNumberPad;
    mobileField.text = @"13524815231";
    mobileField.keyboardType = UIKeyboardTypeNumberPad;
    mobileField.returnKeyType = UIReturnKeyNext;
    mobileField.borderStyle = UITextBorderStyleRoundedRect;
//    mobileField.clearsOnBeginEditing = YES;
    mobileField.clearButtonMode = UITextFieldViewModeWhileEditing;
    mobileField.placeholder = @"手机号";
    [view addSubview:mobileField];
    
    
    UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectMake(90, 240, 200, 35)];
    passwordField.tag = 102;
    passwordField.text = @"123456";
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    passwordField.placeholder = @"密码";
    [view addSubview:passwordField];

    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 320, 140, 40)];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor blackColor];
    [view addSubview:loginButton];
    
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 380, 140, 40)];
    [registerButton addTarget:self action:@selector(register) forControlEvents:UIControlEventTouchUpInside];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    registerButton.backgroundColor = [UIColor blackColor];

    [view addSubview:registerButton];
    self.view = view;
    self.title = @"登陆";

}

-(void) viewDidLoad
{
    [super viewDidLoad];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
     UITextField *mobileField = (UITextField *)[self.view.window viewWithTag: 101];
    [mobileField resignFirstResponder];
    
    UITextField *passwordField = (UITextField *)[self.view.window viewWithTag: 102];
    [passwordField resignFirstResponder];
}

-(void) login
{
    UITextField *mobileField = (UITextField *)[self.view.window viewWithTag: 101];
    UITextField *passwordField = (UITextField *)[self.view.window viewWithTag: 102];
    
    if ((mobileField.text.length !=11)||(![mobileField.text hasPrefix:@"1"])) {
        [self showAlertView:@"请输入正确的手机号码"];
    } else if(passwordField.text.length < 1) {
        [self showAlertView:@"请输入你的密码"];
    } else {
        MainViewController *mainViewController = [[MainViewController alloc] init];
                           
                     
        UIView *aa = [[UIView alloc] init];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:aa];
        mainViewController.navigationItem.leftBarButtonItem = leftItem;
        self.view.window.rootViewController = mainViewController;
//        [self.navigationController pushViewController:mainViewController animated:YES];
       
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        NSDictionary *parameters = @{@"mobile": @"13524815231", @"password": @"123456"};
//        [manager POST:@"http://localhost:3000/mobile_login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"JSON: %@", responseObject);
//            
//            NSDictionary *dic = (NSDictionary *)responseObject;
//            NSString *code = [NSString stringWithFormat:@"%@", [dic objectForKey:@"code"]];
//            
//            NSString *info = [NSString stringWithFormat:@"%@", [dic objectForKey:@"info"]];
//            NSArray *arr = (NSArray *)info;
//            NSLog(@"this is a array: %@", arr);
//            
//            if ([code isEqualToString:@"403"]) {
//               NSLog(@"http request return code is, %@", code);
//            } else {
//            MainViewController *mainViewController = [[MainViewController alloc] init];
//            //        self.view.window.rootViewController = mainViewController;
//            //        mainViewController.navigationItem.leftBarButtonItem =;
//            //        UIView *aa = [[UIView alloc] init];
//            //        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:aa];
//            //        mainViewController.navigationItem.leftBarButtonItem = leftItem;
//            //
//            [self.navigationController pushViewController:mainViewController animated:YES];
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//        }];
//        
   }
}

-(void) register
{
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}


-(void)showAlertView :(NSString*)text
{
    if (!_alertView) {
        _alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    }
    _alertView.title = text;
    [_alertView show];
}
@end



