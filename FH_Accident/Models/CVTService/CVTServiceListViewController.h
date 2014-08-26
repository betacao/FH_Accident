//
//  CVTServiceListViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"
#import "QiXiuTableViewCell.h"

@interface CVTServiceListViewController : BaseViewController<QiXiuTableViewCellDelegate>
{
    IBOutlet UITableView *table;
    NSMutableArray *dataList;
}
@property (nonatomic, assign) CVTServiceType serviceType;
@end
