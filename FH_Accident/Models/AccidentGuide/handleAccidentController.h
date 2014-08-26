//
//  handleAccidentController.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.

//事故处理

#import "BaseViewController.h"
#import "ComboBoxView.h"

@interface handleAccidentController : BaseViewController
{
    UIView *comboBgView;
}

//车碰车事故
- (IBAction)carHitAccident:(id)sender;

//人伤事故

- (IBAction)personalInjury:(id)sender;

- (IBAction)rightBtnClick:(id)sender;

@end
