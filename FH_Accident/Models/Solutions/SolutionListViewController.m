//
//  SolutionListViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "SolutionListViewController.h"
#import "SolutionDetailViewController.h"

@interface SolutionListViewController ()

@end

@implementation SolutionListViewController
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
    self.title = @"解决方案";
    // Do any additional setup after loading the view from its nib.
    
    [table setTableFooterView:[[[UIView alloc] initWithFrame:CGRectZero] autorelease]];
    [table custom];
    dataList = [[NSMutableArray alloc] init];
    NSMutableArray *tmparr = [NSMutableArray array];
    [tmparr addObject:@"制定解决方案及指导方案实施"];
    [tmparr addObject:@"医疗跟踪服务"];
    [tmparr addObject:@"协商、调解"];
    [tmparr addObject:@"收集完善赔偿材料"];
    [tmparr addObject:@"结案代理"];
    [tmparr addObject:@"诉前指导"];
    [dataList addObject:tmparr];
    
    tmparr = [NSMutableArray array];
    [tmparr addObject:@"制定解决方案及指导方案实施"];
    [tmparr addObject:@"医疗跟踪服务"];
    [tmparr addObject:@"协商、调解"];
    [dataList addObject:tmparr];
    
    tmparr = [NSMutableArray array];
    [tmparr addObject:@"在线顾问"];
    [tmparr addObject:@"外勤顾问"];
    [tmparr addObject:@"方案秘书"];
    [dataList addObject:tmparr];

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
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dataList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    for(id sub in [cell subviews])
    {
       if ([sub isKindOfClass:[UIButton class]])
       {
           [sub removeFromSuperview];
       }
    }
    NSArray *tmparr = [dataList objectAtIndex:indexPath.section];
    CGRect baseRect = CGRectMake(10, 10, 93, 50);
    int index = 0;
    
    for(NSString *title in tmparr)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setFrame:baseRect];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        [btn setTitle:title forState:UIControlStateNormal];
        [btn.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [btn.titleLabel setNumberOfLines:2];
        [cell addSubview:btn];
        
        index++;
        baseRect.origin.x += baseRect.size.width + 10;
        if (index % 3 == 0)
        {
            baseRect.origin.x = 10;
            baseRect.origin.y += baseRect.size.height + 10;
        }
    }
    
    return cell;
}
#pragma mark -
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tmparr = [dataList objectAtIndex:indexPath.section];
    int count = [tmparr count];
    int row = 0;
    if (count % 3 == 0)
    {
        row = count / 3;
    }
    else
    {
        row = count / 3 + 1;
    }
    CGFloat height = (10 + 50) * row + 10;
    return height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *retview = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)] autorelease];
    retview.backgroundColor = [UIColor blueColor];
    UILabel *title = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0,tableView.frame.size.width, 40)] autorelease];
    title.backgroundColor = [UIColor clearColor];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setTextColor:[UIColor whiteColor]];
    [title setFont:[UIFont systemFontOfSize:15]];
    [retview addSubview:title];
    if (section == 0)
    {
        [title setText:@"单项服务"];
    }
    else if(section == 1)
    {
        [title setText:@"全程代理服务"];
    }
    else if(section == 2)
    {
        [title setText:@"费大姐会员"];
    }
    return retview;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)btnClick:(UIButton *)sender
{
    SolutionDetailViewController *viewctl = [[[SolutionDetailViewController alloc] init] autorelease];
    viewctl.title = [sender titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:viewctl animated:YES];
}
@end
