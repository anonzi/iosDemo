//
//  SettingViewController.m
//  iosDemo
//
//  Created by long on 15/1/15.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "SettingViewController.h"

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"SelectCell";
//        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void) loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor yellowColor];
    _listArray = [UIFont familyNames];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _index = -1;
    [self.view addSubview:_tableView];
}


- (void) viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
    }
    
    cell.textLabel.text = _listArray[indexPath.row];
    
    if (_index == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
 */

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *lastIndex = [NSIndexPath indexPathForRow: _index inSection:0];
    UITableViewCell *lastCell = [tableView cellForRowAtIndexPath: lastIndex];
    lastCell.accessoryType = UITableViewCellAccessoryNone;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    _index = indexPath.row;
    [_tableView performSelector:@selector(deselectRowAtIndexPath:animated:) withObject:indexPath afterDelay:.5];
}

@end
