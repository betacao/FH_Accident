//
//  accidentSceneController.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.

//事故现场

#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"

@interface accidentSceneController : BaseViewController<UITableViewDataSource,UITableViewDelegate,MyTableViewCellDelegate>
{
    IBOutlet UITableView *tableview;
    NSArray *titleArray;
    NSMutableArray *contentArray;
}

@end
