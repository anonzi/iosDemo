//
//  TestViewController.m
//  iosDemo
//
//  Created by long on 15/1/28.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import "TestViewController.h"
#import "BingoViewController.h"

@implementation TestViewController

- (id) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self){
        
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.title = @"testTitle";
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.listArray count];
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    NSLog(@"------row: %ld", indexPath.row);
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"default ext";
            break;
        case 1:
            cell.textLabel.text = @"contectView";
            break;
        case 2:
            cell.textLabel.text = @"nib";
            break;
        case 3:
            cell.textLabel.text = @"CustomCell";
            break;
        default:
            break;
    }
    
    return cell;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
// {
//     return 0;
// }
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BingoViewController *bingoViewController = [[BingoViewController alloc] init];
    bingoViewController.title = @"BingoTitle";
    bingoViewController.cellType = indexPath.row;
    [self.navigationController pushViewController:bingoViewController animated:YES];
}


@end
