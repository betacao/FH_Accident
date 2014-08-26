//
//  OrderDetailViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"

@interface OrderDetailViewController : BaseViewController
{
    IBOutlet UILabel *desc;
}
@property (nonatomic, copy) NSString *myOrder;
@end
