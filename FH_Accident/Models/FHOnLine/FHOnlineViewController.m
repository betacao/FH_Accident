//
//  FHOnlineViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "FHOnlineViewController.h"

@interface FHOnlineViewController ()

@end

@implementation FHOnlineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)goSolutionController:(id)sender
{
    SolutionListViewController *controller = [[SolutionListViewController alloc]initWithNibName:@"SolutionListViewController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}

- (void)goSolutionDetailController:(id)sender
{
    SolutionDetailViewController *controller = [[SolutionDetailViewController alloc]initWithNibName:@"SolutionDetailViewController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}

- (void)goRadioController:(id)sender
{
    radioController *controller = [[radioController alloc]initWithNibName:@"radioController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}

- (void)goCommercialFranchiseController:(id)sender
{
    joinServiceController *controller = [[joinServiceController alloc]initWithNibName:@"joinServiceController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"费大姐在线";
    [self addCVTServices];
    // Do any additional setup after loading the view from its nib.
}
- (void)addCVTServices
{
    NSArray *tmparr = @[@"解决方案",@"医疗跟踪",@"调解协商",@"结案代理",@"个人会员",@"企业会员",@"事故全程代理",@""];
    
    CGFloat arrow = 12;
    CGRect baseRect = CGRectMake(arrow, 94, 74, 74);
    int baseTag = 100;
    int col = 4;
    
    int index = 0;
    for(NSString *title in tmparr)
    {
        NSLog(@"title:%@",title);
        CVTServiceBtnView *btnview = [[[CVTServiceBtnView alloc] initWithFrame:baseRect] autorelease];
        btnview.tag = baseTag;
        [btnview setBackgroundImage:[NSString stringWithFormat:@"online_item%d",baseTag-99]];
        [btnview setDelegate: self];
        [bgView addSubview:btnview];
        index++;
        baseTag++;
        baseRect.origin.x += baseRect.size.width;
        if (index % col == 0)
        {
            baseRect.origin.x = arrow;
            baseRect.origin.y += baseRect.size.height;
        }
    }
}



#pragma mark -
#pragma mark CVTServiceBtnViewDelegate
- (void)CVTServiceBtnViewClick:(CVTServiceBtnView *)btnview
{
    NSLog(@"%d",btnview.tag - 100);
    CVTServiceType type = btnview.tag - 100;
    if (type == kCVTService_QiXiu)
    {
//        CVTServiceListViewController *viewctl = [[[CVTServiceListViewController alloc] init] autorelease];
//        viewctl.title = @"汽修";
//        viewctl.serviceType = type;
//        [self.navigationController pushViewController:viewctl animated:YES];
    }
    else
    {
        //        SolutionListViewController *viewctl = [[[SolutionListViewController alloc] init] autorelease];
        //        [self.navigationController pushViewController:viewctl animated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
