//
//  HoneViewController.m
//  iosDemo
//
//  Created by long on 15/1/15.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "HomeViewController.h"
#import "SettingViewController.h"
#import "BingoViewController.h"

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"cellHeight";
    }
    return self;
}

-(void) loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    view.backgroundColor = [UIColor redColor];
    self.view = view;
    
    _listArray = @[@"不以物喜，不以己悲：不因为外物好坏和自己得失而或喜或悲（此句为互文）。以，因为。", @"不以物喜，不以己悲：不因为外物好坏和自己得失而或喜或悲（此句为互文）。以，因为。", @"不以物喜，不以己悲：不因为外物好坏和自己得失而或喜或悲（此句为互文）。以，因为。", @"不以物喜，不以己悲：不因为外物好坏和自己得失而或喜或悲（此句为互文）。以，因为。"];
    
    _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, 750/2, [[UIScreen mainScreen] bounds].size.height) style: UITableViewStylePlain];
    [self.view addSubview: _tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftItem;

}



#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
    }
    
    cell.textLabel.text = _listArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize: 14];
    return cell;
}

#pragma mark - TableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 80;
}

@end
