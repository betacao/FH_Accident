//
//  claimController.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.

//保险理赔

#import "BaseViewController.h"

@interface claimController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tableview;
    NSArray *titleArray;
}
@end
