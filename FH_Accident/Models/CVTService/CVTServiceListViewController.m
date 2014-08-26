//
//  CVTServiceListViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "CVTServiceListViewController.h"

@interface CVTServiceListViewController ()

@end

@implementation CVTServiceListViewController
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
    
    // Do any additional setup after loading the view from its nib.
    [table custom];
    dataList = [[NSMutableArray alloc] init];
    [dataList addObject:@"1"];
    [dataList addObject:@"1"];
    [dataList addObject:@"1"];
    [dataList addObject:@"1"];
    [dataList addObject:@"1"];
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
    if (_serviceType == kCVTService_QiXiu)
    {
        static NSString *identifier = @"QiXiuIdentifier";
        QiXiuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"QiXiuTableViewCell" owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
        }
    
        return cell;
    }
    return nil;
}
#pragma mark -
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_serviceType == kCVTService_QiXiu)
    {
        return [QiXiuTableViewCell cellHeight];
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark -
#pragma mark QiXiuTableViewCellDelegate

- (void)cellDidClickGoHere:(QiXiuTableViewCell *)cell
{
}
- (void)cellDidClickMakeCall:(QiXiuTableViewCell *)cell
{
    [PublicMethod callPhone:@"10010"];
}
- (void)cellDidClickMakeOrder:(QiXiuTableViewCell *)cell
{

}

@end
