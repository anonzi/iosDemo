//
//  TestTableViewViewController.m
//  iosDemo
//
//  Created by long on 15/1/30.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "TestTableViewViewController.h"

@implementation  TestTableViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"TestTableViewViewController";
    }
    return self;
}



- (void) loadView
{
    [super loadView];
    
    
    self.view.backgroundColor = [UIColor greenColor];
    
//    NSLog(@"isplain's value is %d", self.isPlain);
    
    UITableViewStyle style = UITableViewStyleGrouped;
    if (self.isPlain == (NSInteger *)1) {
        style = UITableViewStylePlain;
    }
    _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, 750/2, [[UIScreen mainScreen] bounds].size.height) style: style];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 80;
    
    UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 750/2, 80)];
    headerView.backgroundColor = [UIColor redColor];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, 200, 80)];
    headerLabel.text = @"秋高气爽";
    headerLabel.numberOfLines = 0;
    [headerView addSubview: headerLabel];
    _tableView.tableHeaderView = headerView;
    
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 750/2, 80)];
    footView.backgroundColor = [UIColor yellowColor];
    _tableView.tableFooterView = footView;
    
    NSMutableArray *temp = nil;

    NSArray *array = [UIFont familyNames];
    _fontArray = [[NSMutableArray alloc] initWithCapacity: 13];
    for (int index = 0; index < [array count]; index++) {
        
        NSString *font = array[index];

        if (index % 5 == 0) {
            temp = [[NSMutableArray alloc] initWithCapacity:5];
            [_fontArray addObject: temp];
        }
        [temp addObject: font];
    }
    [self.view addSubview: _tableView];
    
}

#pragma TableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isBaseCell == (NSInteger *)1) {
        return 4;
    }
    return [_fontArray[section] count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (self.isBaseCell == (NSInteger *)1) {
        /*
         * UITableViewCellStyleDefault   0
         * UITableViewCellStyleValue1    1
         * UITableViewCellStyleValue2    2
         * UITableViewCellStyleSubtitle  3
         */
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle: indexPath.row reuseIdentifier:nil];
        switch (indexPath.row) {
            case 0:
                NSLog(@"1111");
                cell.textLabel.text = @"这是一个默认风格";
                cell.imageView.image = [UIImage imageNamed: @"ios_demo1.jpg"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            case 1:
                cell.textLabel.text = @"这是一个value1风格";
                cell.imageView.image = [UIImage imageNamed: @"ios_demo1.jpg"];
                cell.detailTextLabel.text = @"这是副标题";
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                break;
            case 2:
                cell.textLabel.text = @"这是一个value2风格";
                cell.detailTextLabel.text = @"这是副标题";
                cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                break;
            case 3:
                cell.textLabel.text = @"这是一个subTitle风格";
                cell.imageView.image = [UIImage imageNamed: @"ios_demo1.jpg"];
                cell.detailTextLabel.text = @"这是副标题";
                break;
            default:
                break;
        }
        return cell;
    } else {
        static NSString *cellIdentifier = @"cell";
        // 检查是否限制单元格
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        // 创建单元格
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.text = _fontArray[indexPath.section][indexPath.row];
        cell.textLabel.backgroundColor = [UIColor whiteColor];
        // 设置选中的风格
//        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        UIImageView *selectView = [[UIImageView alloc] initWithFrame:CGRectZero];
        selectView.backgroundColor =[UIColor yellowColor];
        cell.selectedBackgroundView = selectView;
        return cell;
    }
    
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.isBaseCell == (NSInteger *)1) {
        return 1;
    }
    return  [_fontArray count]; //13
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = [NSString stringWithFormat: @"header 第%ld个 section", section + 1];
    return title;
} // 设置section's title

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
{
    NSString *title = [NSString stringWithFormat: @"footer 第%ld个 section", section + 1];
    return title;
} // 设置section footer title

#pragma TableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 2) {
        return 80;
    }
    return 44;
}

// custom view for header. will be adjusted to default or specified header height
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//}

// custom view for footer. will be adjusted to default or specified footer height
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectZero];
    footerView.backgroundColor = [UIColor cyanColor];
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 200, 30)];
    tipLabel.numberOfLines = 0;
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.text = [NSString stringWithFormat: @"section footer %ld", section+1];
    tipLabel.backgroundColor = [UIColor whiteColor];
    [footerView addSubview: tipLabel];
    return footerView;
}


//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 100;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    return 40;
}
@end

