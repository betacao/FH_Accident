//
//  companyServiceController.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"

@interface companyServiceController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tableview;
}

@end

@interface serviceViewCell : UITableViewCell
{
    UILabel *nameLabel;
    UILabel *conditionLabel;
}
- (void)setCellWithName:(NSString *)name condition:(NSString *)condition;
@end