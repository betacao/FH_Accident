//
//  RegisterViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComboBoxView.h"

@interface RegisterViewController : BaseViewController<ComboBoxViewDelegate>
{
    ComboBoxView *combox;
    IBOutlet UIButton *comboxBtn;
    IBOutlet UITextField *nameTextField;
    IBOutlet UITextField *pswTextField;
}
@end
