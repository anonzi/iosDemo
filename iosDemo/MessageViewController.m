//
//  MessageViewController.m
//  iosDemo
//
//  Created by long on 15/1/15.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "MessageViewController.h"
#import "TestTableViewViewController.h"

@implementation MessageViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"MessageViewController.h";
    }
    return self;
}



- (void) loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor greenColor];
    
    self.listArray = @[@"单元格的格式", @"第二种样式示例"];
    _tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview: _tableView];
    
}

#pragma TableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = _listArray[indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    return cell;
}


// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}


#pragma TableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTableViewViewController *bingoViewController = [[TestTableViewViewController alloc] init];
    NSLog(@"index paht row is %ld", indexPath.row);
    bingoViewController.isPlain = (NSInteger *)indexPath.row;
    if (indexPath.row == 1) {
        bingoViewController.isBaseCell = (NSInteger *)1;
    }
    [self.navigationController pushViewController:bingoViewController animated:YES];
} // 当用户选择某一行时

@end
