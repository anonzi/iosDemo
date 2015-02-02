//
//  TestTableViewViewController.h
//  iosDemo
//
//  Created by long on 15/1/30.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

{
    UITableView *_tableView;
}

@property (nonatomic, retain) NSMutableArray *fontArray;
@property (nonatomic, assign) NSInteger *isPlain;
@property (nonatomic, assign) NSInteger *isBaseCell;

@end
