//
//  AccidentListViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "AccidentListViewController.h"
#import "AccidentDetailViewController.h"

@interface AccidentListViewController ()

@end

@implementation AccidentListViewController
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
    self.title = @"历史事故";
    // Do any additional setup after loading the view from its nib.
    [table custom];
    dataList = [[NSMutableArray alloc] init];
    [dataList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"学院路 刮蹭1",@"title",
                         @"2014-05-01",@"time", nil]];
    [dataList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"学院路 刮蹭2",@"title",
                         @"2014-05-01",@"time", nil]];
    [dataList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"学院路 刮蹭3",@"title",
                         @"2014-05-01",@"time", nil]];
    [dataList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"学院路 刮蹭4",@"title",
                         @"2014-05-01",@"time", nil]];
    [dataList addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"学院路 刮蹭5",@"title",
                         @"2014-05-01",@"time", nil]];
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
        
        UILabel *pre = [[[UILabel alloc] initWithFrame:CGRectMake(10, 4, 100, 35)] autorelease];
        pre.tag = 100;
        pre.backgroundColor = [UIColor clearColor];
        [cell addSubview:pre];
        
        UILabel *time = [[[UILabel alloc] initWithFrame:CGRectMake(table.frame.size.width - 200, 4, 160, 35)] autorelease];
        time.tag = 101;
        time.backgroundColor = [UIColor clearColor];
        [cell addSubview:time];
    }
    UILabel *pre = (UILabel *)[cell viewWithTag:100];
    UILabel *time = (UILabel *)[cell viewWithTag:101];
    NSDictionary *dic = [dataList objectAtIndex:indexPath.row];
    pre.text = [dic objectForKey:@"title"];
    time.text = [dic objectForKey:@"time"];
    
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
    AccidentDetailViewController *viewctl = [[[AccidentDetailViewController alloc] init] autorelease];
    viewctl.accident = [dataList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewctl animated:YES];
}
@end
