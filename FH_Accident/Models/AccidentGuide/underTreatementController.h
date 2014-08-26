//
//  underTreatementController.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.

//在治疗中

#import "BaseViewController.h"
#import "MyTableViewCell.h"

@interface underTreatementController : BaseViewController<UITableViewDataSource,UITableViewDelegate,MyTableViewCellDelegate>
{
    IBOutlet UITableView *tableview;
    NSArray *titleArray;
    NSMutableArray *contentArray;
}

@end
