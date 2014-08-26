//
//  personalInjuryController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "personalInjuryController.h"
#import "accidentSceneController.h"
#import "underTreatementController.h"
#import "CompensationController.h"
#import "claimController.h"

//static int itemNum = 4;
@interface personalInjuryController ()

@end

@implementation personalInjuryController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"人伤事故";
    // Do any additional setup after loading the view from its nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
