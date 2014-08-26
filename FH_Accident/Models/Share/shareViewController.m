//
//  shareViewController.m
//  FH_Accident
//
//  Created by cchx on 14-8-11.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "shareViewController.h"

@interface shareViewController ()

@end

@implementation shareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (IBAction)weixinClick:(id)sender
{
    
}
- (IBAction)pengyouClick:(id)sender
{
    
}
- (IBAction)qqzoneClick:(id)sender
{
    
}
- (IBAction)weiboClick:(id)sender
{
    
}
- (IBAction)closeClick:(id)sender
{
//    [uian]
    [self.view removeFromSuperview];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
