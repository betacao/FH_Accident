//
//  AccidentListViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"

@interface AccidentListViewController : BaseViewController

{
    IBOutlet UITableView *table;
    NSMutableArray *dataList;
}
@end
