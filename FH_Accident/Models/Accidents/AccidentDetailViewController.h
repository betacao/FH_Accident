//
//  AccidentDetailViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"

@interface AccidentDetailViewController : BaseViewController
{
    IBOutlet UILabel *time;
    IBOutlet UILabel *desc;
}
@property (nonatomic, retain) NSDictionary *accident;
@end
