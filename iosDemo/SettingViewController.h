//
//  SettingViewController.h
//  iosDemo
//
//  Created by long on 15/1/15.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    @private
    UITableView *_tableView;
    NSInteger _index;
}

//@property (nonatomic, assign) kTableViewCellType cellType;
@property (nonatomic, retain) NSArray *listArray;

@end
