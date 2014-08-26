//
//  companyServiceController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "companyServiceController.h"
#import "newApplicationController.h"

@interface companyServiceController ()

@end

@implementation companyServiceController

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
    return 3;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"serviceCell";
    
    serviceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[[serviceViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]autorelease];
        [cell setCellWithName:@"店名AAA" condition:@"审核中"];
    }
    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"企业服务";
    // Do any additional setup after loading the view from its nib.
    [self refreshRightBtnView:@"新申请"];
    [self setFooterView];
    
}
- (void)refreshRightBtnView:(NSString *)title
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStyleBordered
                                                            target:self
                                                            action:@selector(rightBtnClick)];
    [self.navigationItem setRightBarButtonItem:item];
}

- (void)setFooterView
{
    UIView *view = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)]autorelease];
    view.backgroundColor = [UIColor whiteColor];
    [tableview setTableFooterView:view];
}

- (void)rightBtnClick
{
    newApplicationController *controller = [[newApplicationController alloc]initWithNibName:@"newApplicationController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@interface serviceViewCell()

@end

@implementation serviceViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 44)];
        conditionLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 0, 100, 44)];
        nameLabel.backgroundColor = [UIColor clearColor];
        conditionLabel.backgroundColor = [UIColor clearColor];
        nameLabel.font = [UIFont systemFontOfSize:15];
        conditionLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:nameLabel];
        [self.contentView addSubview:conditionLabel];
    }
    return self;
}

- (void)setCellWithName:(NSString *)name condition:(NSString *)condition
{
    nameLabel.text = name;
    conditionLabel.text = condition;
}

- (void)dealloc
{
    [nameLabel release];
    nameLabel = nil;
    [conditionLabel release];
    conditionLabel = nil;
    [super dealloc];
}

@end