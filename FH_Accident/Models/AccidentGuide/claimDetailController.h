//
//  claimDetailController.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.

//保险公司理赔项目

#import "BaseViewController.h"

@interface claimDetailController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tableview;
    NSArray *titleArray;
    NSArray *detailArray;
}
@end
