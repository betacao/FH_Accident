//
//  CompensationController.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.

//协商赔偿

#import "BaseViewController.h"
#import "MyTableViewCell.h"

@interface CompensationController : BaseViewController<UITableViewDataSource,UITableViewDelegate,MyTableViewCellDelegate>
{
    IBOutlet UITableView *tableview;
    NSArray *titleArray;
    NSMutableArray *contentArray;
}

@end
