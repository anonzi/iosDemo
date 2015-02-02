//
//  BingoViewController.h
//  iosDemo
//
//  Created by long on 15/1/28.
//  Copyright (c) 2015年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BingoViewController : UITableViewController
{
@private
    NSArray *_listArray;
}

@property (nonatomic,assign) NSInteger cellType;


@end
