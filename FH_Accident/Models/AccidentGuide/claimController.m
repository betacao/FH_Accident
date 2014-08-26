//
//  claimController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "claimController.h"
#import "claimDetailController.h"
#import "Com_InsuranceController.h"
#import "AdvanceController.h"
#import "ThreeInsuranceController.h"
#import "claimProceController.h"

@interface claimController ()

@end

@implementation claimController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)]autorelease];
    view.backgroundColor = [UIColor blueColor];
    UILabel *titleLabel = [[[UILabel alloc]initWithFrame:view.frame]autorelease];
    titleLabel.text = self.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:titleLabel];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titleArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0:
        {
            claimDetailController *controller = [[claimDetailController alloc]initWithNibName:@"claimDetailController" bundle:nil];
            if(controller)
            {
                [self.navigationController pushViewController:controller animated:YES];
            }
            [controller release];
        }
            break;
        case 1:
        {
            Com_InsuranceController *controller = [[Com_InsuranceController alloc]initWithNibName:@"Com_InsuranceController" bundle:nil];
            if(controller)
            {
                [self.navigationController pushViewController:controller animated:YES];
            }
            [controller release];
        }
            break;
        case 2:
        {
            AdvanceController *controller = [[AdvanceController alloc]initWithNibName:@"AdvanceController" bundle:nil];
            if(controller)
            {
                [self.navigationController pushViewController:controller animated:YES];
            }
            [controller release];
        }
            break;
        case 3:
        {
            ThreeInsuranceController *controller = [[ThreeInsuranceController alloc]initWithNibName:@"ThreeInsuranceController" bundle:nil];
            if(controller)
            {
                [self.navigationController pushViewController:controller animated:YES];
            }
            [controller release];
        }
            break;
        case 4:
        {
            claimProceController *controller = [[claimProceController alloc]initWithNibName:@"claimProceController" bundle:nil];
            if(controller)
            {
                [self.navigationController pushViewController:controller animated:YES];
            }
            [controller release];
        }
            break;
            
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]autorelease];
        cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"保险理赔";
    titleArray = [[NSArray alloc]initWithObjects:@"保险公司理赔项目",@"交强险的理赔范围",@"如何通过保险公司垫付医疗费",@"商业三者险的理赔范围",@"理赔手续", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)dealloc
{
    [titleArray release];
    titleArray = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
