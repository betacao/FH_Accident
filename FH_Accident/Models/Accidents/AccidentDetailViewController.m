//
//  AccidentDetailViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "AccidentDetailViewController.h"

@interface AccidentDetailViewController ()

@end

@implementation AccidentDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)dealloc
{
    [time release],time = nil;
    [desc release],desc = nil;
    self.accident = nil;
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"事故详情";
    time.text = [_accident objectForKey:@"time"];
    desc.text = [_accident objectForKey:@"title"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
