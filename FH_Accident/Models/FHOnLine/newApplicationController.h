//
//  newApplicationController.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"

@interface newApplicationController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    IBOutlet UITableView *tableview;
    NSArray *titleArray;
    NSMutableDictionary *userInfo;
}
@end
