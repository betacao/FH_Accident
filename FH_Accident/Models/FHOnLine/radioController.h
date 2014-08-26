//
//  radioController.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"

@interface radioController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tableview;
    NSArray *titleArray;
}
@end
