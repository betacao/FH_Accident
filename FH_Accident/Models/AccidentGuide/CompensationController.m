//
//  CompensationController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "CompensationController.h"
#import "CompensationGuiController.h"

@interface CompensationController ()

@end

@implementation CompensationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [titleArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)]autorelease];
    view.backgroundColor = [UIColor blueColor];
    UILabel *titleLabel = [[[UILabel alloc]initWithFrame:view.frame]autorelease];
    titleLabel.text = [titleArray objectAtIndex:section];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:titleLabel];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell4";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        cell.delegate = self;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [(MyTableViewCell *)cell setCellWithObject:[contentArray objectAtIndex:indexPath.section]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"协商赔偿中";
    titleArray = [[NSArray alloc]initWithObjects:@"人员救护",@"事故报警",@"周边医院",@"报险",nil];
    
    NSDictionary *d1 = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"现场协商结案",@"title",
                        @"一件救护",@"mid",
                        [NSValue valueWithBytes:&@selector(a) objCType:@encode(SEL)],@"midMethod",
                        nil];
    NSDictionary *d2 = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"现场协商结案",@"title",
                        @"费大姐文案秘书",@"mid",
                        [NSValue valueWithBytes:&@selector(b) objCType:@encode(SEL)],@"midMethod",
                        nil];
    NSDictionary *d3 = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"现场协商结案",@"title",
                        @"费大姐文案秘书",@"mid",
                        [NSValue valueWithBytes:&@selector(c) objCType:@encode(SEL)],@"midMethod",
                        nil];
    NSDictionary *d4 = [NSDictionary dictionaryWithObjectsAndKeys:
                        @"48小时内报保险，保险理赔",@"title",
                        @"保险公司",@"mid",
                        [NSValue valueWithBytes:&@selector(d) objCType:@encode(SEL)],@"midMethod",
                        nil];
    contentArray = [[NSMutableArray alloc]initWithObjects:d1,d2,d3,d4,nil];
    [self setFooterView];
    // Do any additional setup after loading the view from its nib.
}

- (void)a
{
    NSLog(@"a");
    CompensationGuiController *controller = [[CompensationGuiController alloc]initWithNibName:@"CompensationGuiController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}
- (void)b
{
    NSLog(@"b");
}
- (void)c
{
    NSLog(@"c");
}
- (void)d
{
    NSLog(@"d");
}


- (void)setFooterView
{
    UIView *view = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)]autorelease];
    view.backgroundColor = [UIColor whiteColor];
    [tableview setTableFooterView:view];
}

- (void)dealloc
{
    [titleArray release];
    titleArray = nil;
    [contentArray release];
    contentArray = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end