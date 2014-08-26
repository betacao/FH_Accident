//
//  PayViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"
#import "ComboBoxView.h"

@interface PayViewController : BaseViewController
{
    IBOutlet UIView *descriptionView;
    IBOutlet UILabel *serviceName;
    IBOutlet UILabel *priceLab;
    ComboBoxView *combox;
}
@property (nonatomic, copy) NSString *serviceNameStr;
@end
