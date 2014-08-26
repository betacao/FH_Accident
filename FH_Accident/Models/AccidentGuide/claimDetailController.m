//
//  claimDetailController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "claimDetailController.h"

@interface claimDetailController ()

@end

@implementation claimDetailController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
            
        }
            break;
        case 1:
        {
        }
            break;
        case 2:
        {
        }
            break;
        case 3:
        {
        }
            break;
        case 4:
        {
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
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier]autorelease];
        cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [detailArray objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"车碰车事故";
    titleArray = [[NSArray alloc]initWithObjects:@"车身划痕损失险",@"玻璃单独破碎险",@"自燃损失险",@"车上人员损失险",@"全车盗抢险", nil];
    detailArray = [[NSArray alloc]initWithObjects:@"保护车辆被恶意划伤的损失",@"保障玻璃破损损失",@"保障车辆自燃损失",@"保障自身车上人员的损失",@"保障全车被盗抢的损失", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)dealloc
{
    [titleArray release];
    titleArray = nil;
    [detailArray release];
    detailArray = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
