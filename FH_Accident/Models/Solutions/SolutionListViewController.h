//
//  SolutionListViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"

@interface SolutionListViewController : BaseViewController
{
    IBOutlet UITableView *table;
    NSMutableArray *dataList;
}
@end
