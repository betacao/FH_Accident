//
//  MyOrderListViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "MyOrderListViewController.h"
#import "AccidentListViewController.h"
#import "OrderDetailViewController.h"
#import "UITableView+Extension.h"

@interface MyOrderListViewController ()

@end

@implementation MyOrderListViewController
- (void)dealloc
{
    [table release],table = nil;
    [dataList release],dataList = nil;
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
    self.title = @"我的服务";
    // Do any additional setup after loading the view from its nib.
    
    dataList = [[NSMutableArray alloc] init];
    [dataList addObject:@"服务AAA"];
    [dataList addObject:@"服务BBB"];
    [dataList addObject:@"服务CCC"];
    [dataList addObject:@"服务DDD"];
    
    [table custom];
    [table setTableHeaderView:[self createHeadView]];
    
//    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"历史事故" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)] autorelease];
}
- (void)rightBtnClick
{
    AccidentListViewController *viewctl = [[[AccidentListViewController alloc] init] autorelease];
    [self.navigationController pushViewController:viewctl animated:YES];
}


- (UIView *)createHeadView
{
    UIView *retview = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)] autorelease];
    retview.backgroundColor = [UIColor clearColor];
    UILabel *lab = [[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 30)] autorelease];
    lab.backgroundColor = [UIColor clearColor];
    lab.text = @"我购买的服务";
    [retview addSubview:lab];
    return retview;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataList count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [dataList objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark -
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OrderDetailViewController *viewctl = [[[OrderDetailViewController alloc] init] autorelease];
    viewctl.myOrder = [dataList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewctl animated:YES];
}
@end
