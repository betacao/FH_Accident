//
//  CalculatorController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "CalculatorController.h"

@interface CalculatorController ()

@end

@implementation CalculatorController

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
    self.title = @"赔偿计算器";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
