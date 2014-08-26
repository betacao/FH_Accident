//
//  SolutionDetailViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "SolutionDetailViewController.h"
#import "PayViewController.h"

@interface SolutionDetailViewController ()

@end

@implementation SolutionDetailViewController
- (void)dealloc
{
    [detailDescription release],detailDescription = nil;
    [priceLabel release],priceLabel = nil;
    [super dealloc];
}
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
    detailDescription.layer.borderWidth = 0.5;
    detailDescription.layer.borderColor = [UIColor grayColor].CGColor;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)orderService:(id)sender
{
    NSString *msg = [NSString stringWithFormat:@"你想以%@购买此服务吗?",priceLabel.text];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请确认购买"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:nil otherButtonTitles:@"取消",@"购买", nil];
    [alert show];
    [alert release];
}
#pragma mark -
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        PayViewController *viewctl = [[[PayViewController alloc] init] autorelease];
        viewctl.serviceNameStr = self.title;
        [self.navigationController pushViewController:viewctl animated:YES];
    }
}
@end
