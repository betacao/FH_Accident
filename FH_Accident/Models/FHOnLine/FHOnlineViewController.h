//
//  FHOnlineViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SolutionDetailViewController.h"
#import "SolutionListViewController.h"
#import "radioController.h"
#import "joinServiceController.h"
#import "CVTServiceViewController.h"

@interface FHOnlineViewController : BaseViewController<CVTServiceBtnViewDelegate>
{
    IBOutlet UIView *bgView;
}
- (IBAction)goSolutionController:(id)sender;

- (IBAction)goSolutionDetailController:(id)sender;

- (IBAction)goRadioController:(id)sender;

- (IBAction)goCommercialFranchiseController:(id)sender;

@end
