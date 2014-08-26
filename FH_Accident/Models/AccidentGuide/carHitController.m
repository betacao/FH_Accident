//
//  carHitController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "carHitController.h"
#import "quickHandleController.h"

@interface carHitController ()

@end

@implementation carHitController

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
    self.title = @"车碰车事故";
    
    // Do any additional setup after loading the view from its nib.
}


- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
