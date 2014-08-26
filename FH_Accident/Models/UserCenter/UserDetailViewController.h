//
//  UserDetailViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EditUserInfoViewController.h"

@interface UserDetailViewController : BaseViewController<UITextFieldDelegate,EditUserInfoViewControllerDelegate>
{
    IBOutlet UITableView *table;
    NSMutableArray *dataList;
    
    NSMutableArray *editList;
    
    BOOL isEditing;
}

@end
