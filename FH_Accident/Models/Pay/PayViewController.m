//
//  PayViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "PayViewController.h"

@interface PayViewController ()

@end

@implementation PayViewController
- (void)dealloc
{
    [serviceName release],serviceName = nil;
    [priceLab release],priceLab = nil;
    [descriptionView release],descriptionView = nil;
    [combox release],combox = nil;
    [_serviceNameStr release],_serviceNameStr = nil;
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
    
    self.title = @"支付定单";
    
    descriptionView.layer.borderColor = [UIColor grayColor].CGColor;
    descriptionView.layer.borderWidth = 0.5;
    CGRect dRect = descriptionView.frame;
    
    combox = [[ComboBoxView alloc] initWithFrame:CGRectMake(dRect.origin.x, dRect.origin.y + dRect.size.height + 20, dRect.size.width, 80)];
    combox.delegate = self;
    combox.comboBoxDatasource = @[@"支付宝支付",@"微信支付"];
    combox.selectedValue = @"支付宝支付";
    combox.hideAfterSelect = NO;
    
    [self.view addSubview:combox];
    [combox hitComboBox];
    
    serviceName.text = [NSString stringWithFormat:@"服务 %@ * 1",_serviceNameStr];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark ComboBoxViewDelegate
- (void)comboBoxDidSelect:(NSString *)value
{
    NSLog(@"%@",value);
}

- (IBAction)sureToPay:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"付款结果"
                                                    message:@"付款成功"
                                                   delegate:nil
                                          cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
    [alert show];
    [alert release];
}
@end
