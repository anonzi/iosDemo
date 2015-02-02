//
//  HoneViewController.h
//  iosDemo
//
//  Created by long on 15/1/15.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_listArray;
}
@property int numrator, denomiator;

@end
