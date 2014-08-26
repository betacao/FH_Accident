//
//  handleAccidentController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "handleAccidentController.h"
#import "carHitController.h"
#import "personalInjuryController.h"
#import "shareViewController.h"

@interface handleAccidentController ()

@end

@implementation handleAccidentController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)rightBtnClick:(id)sender
{
    shareViewController *controller = [[shareViewController alloc]initWithNibName:@"shareViewController" bundle:nil];
    CGRect frame = controller.view.frame;
    frame.origin.y = self.view.bounds.size.height;
    controller.view.frame = frame;
    if(controller)
    {
        [UIView animateWithDuration:0.4
                         animations:^
         {
             CGRect frame = controller.view.frame;
             frame.origin.y = 0;
             controller.view.frame = frame;
         }
                         completion:^(BOOL finished) {
             
         }];

    }
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
//    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

- (void)carHitAccident:(id)sender
{
    carHitController *controller = [[carHitController alloc]initWithNibName:@"carHitController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}

- (void)personalInjury:(id)sender
{
    personalInjuryController *controller = [[personalInjuryController alloc]initWithNibName:@"personalInjuryController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}


- (void)dealloc
{
    [comboBgView release];
    comboBgView = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
