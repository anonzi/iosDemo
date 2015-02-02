//
//  BingoViewController.m
//  iosDemo
//
//  Created by long on 15/1/28.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "BingoViewController.h"

@implementation BingoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _listArray = [UIFont familyNames];
    
//    self.tableView.rowHeight = 60;
    // Do any additional setup after loading the view.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";

    
    if (self.cellType == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
            label.tag = 101;
            label.backgroundColor = [UIColor redColor];
            [cell.contentView addSubview:label];
        }
        
        UILabel *label = (UILabel *)[cell.contentView viewWithTag: 101];
        label.text = _listArray[indexPath.row];
        return cell;
    } else if (self.cellType == 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
            label.tag = 101;
            label.backgroundColor = [UIColor redColor];
            [cell.contentView addSubview:label];
        }
        
        UILabel *label = (UILabel *)[cell.contentView viewWithTag: 101];
        label.text = _listArray[indexPath.row];
        return cell;
    }
    return nil;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
// {
//     return 0;
// }

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}


@end
