//
//  UserDetailViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "UserDetailViewController.h"
@interface UserDetailViewController ()

@end

@implementation UserDetailViewController

- (void)dealloc
{
    [table release],table = nil;
    [dataList release],dataList = nil;
    [editList release],editList = nil;
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
    self.title = @"我的资料";
    // Do any additional setup after loading the view from its nib.
    
    dataList = [[NSMutableArray alloc] init];
    editList = [[NSMutableArray alloc] init];
    [table custom];
    
    NSMutableArray *tmparr = [NSMutableArray arrayWithCapacity:0];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"更换头像",@"title",
                       @"60",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"会员类型:",@"title",
                       @"个人会员",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"会员编号:",@"title",
                       @"123123123",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"会员缴费金额:",@"title",
                       @"1000",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"会员有效期:",@"title",
                       @"2015-01-01",@"value",
                       @"44",@"cellHeight",nil]];
    [dataList addObject:tmparr];
    
    tmparr = [NSMutableArray arrayWithCapacity:0];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"用户名:",@"title",
                       @"费大姐",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"手机号:",@"title",
                       @"18603133349",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"身份证:",@"title",
                       @"421003198989093287",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"出生日期:",@"title",
                       @"1988-05-01",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"性别:",@"title",
                       @"男",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"血型:",@"title",
                       @"O型",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"紧急联系人:",@"title",
                       @"张三",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"车牌号:",@"title",
                       @"京A55555",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"发动机号:",@"title",
                       @"ZXC20120908CCS",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"保险公司:",@"title",
                       @"平安保险",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"保险有效期:",@"title",
                       @"2015-09-01",@"value",
                       @"44",@"cellHeight",nil]];
    [tmparr addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"商业三险金额:",@"title",
                       @"7000",@"value",
                       @"44",@"cellHeight",nil]];
    [dataList addObject:tmparr];
    
    isEditing = NO;
    [self refreshRightBtn];
    [self addKeyBoardNotification];
}
- (void)addKeyBoardNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)removeKeyBoardNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
- (void)refreshRightBtn
{
    if (isEditing)
    {
        UIBarButtonItem *item = [[[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveUserInfo)] autorelease];
        self.navigationItem.rightBarButtonItem = item;
    }
    else
    {
        UIBarButtonItem *item = [[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editUserInfo)] autorelease];
        self.navigationItem.rightBarButtonItem = item;
    }
}
- (void)saveUserInfo
{
    isEditing = NO;
    [self refreshRightBtn];
    
    [dataList replaceObjectAtIndex:1 withObject:[editList lastObject]];
    [editList removeAllObjects];
    [table reloadData];
}
- (void)editUserInfo
{
    isEditing = YES;
    [self refreshRightBtn];
    [editList removeAllObjects];
    [editList addObject:[dataList objectAtIndex:1]];
    [table reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark UIKeyBoard
- (void)keyboardDidShow:(NSNotification *)noti
{
    CGSize size = [[[noti userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGRect newRrect = table.frame;
    newRrect.size.height = self.view.frame.size.height - size.height;
    table.frame = newRrect;
}
- (void)keyboardWillHide:(NSNotification *)noti
{
    CGRect newRrect = table.frame;
    newRrect.size.height = self.view.frame.size.height;
    table.frame = newRrect;
}
#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isEditing)
    {
        return [[editList objectAtIndex:section] count];
    }
    else
    {
        return [[dataList objectAtIndex:section] count];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (isEditing)
    {
         return [editList count];
    }
    else
    {
         return [dataList count];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *pre = [[[UILabel alloc] initWithFrame:CGRectMake(10,0 , 120, 44)] autorelease];
        pre.tag = 100;
        pre.textAlignment = NSTextAlignmentLeft;
        pre.backgroundColor = [UIColor clearColor];
        [cell addSubview:pre];
        
//        UILabel *desc = [[[UILabel alloc] initWithFrame:CGRectMake(320 - 200,0 , 180, cellH)] autorelease];
//        desc.tag = 101;
//        desc.textAlignment = NSTextAlignmentRight;
//        desc.backgroundColor = [UIColor clearColor];
//        [cell addSubview:desc];
        UITextField *desc = [[[UITextField alloc] initWithFrame:CGRectMake(320 - 200, (44 - 30) / 2.0, 180, 30)] autorelease];
        desc.tag = 101;
        desc.textAlignment = NSTextAlignmentRight;
        desc.borderStyle = UITextBorderStyleNone;
        desc.delegate = self;
        desc.enabled = YES;
        [cell addSubview:desc];
    }
    UILabel *pre = (UILabel *)[cell viewWithTag:100];
    [pre setText:@""];
    UITextField *desc = (UITextField *)[cell viewWithTag:101];
    [desc setText:@""];
    [desc setEnabled:NO];
    UIImageView *head = (UIImageView *)[cell viewWithTag:200];
    [head setHidden:YES];
    
    UILabel *headDesc = (UILabel *)[cell viewWithTag:201];
    [headDesc setText:@""];
    
    NSDictionary *dic = nil;
    if (isEditing)
    {
        
        dic = [[editList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    else
    {
        dic = [[dataList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    if (!isEditing && indexPath.section == 0 && indexPath.row == 0)
    {//头像
        if (!head)
        {
           head = [[[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 50, 50)] autorelease];
            [head setTag:200];
            [cell addSubview:head];
        }
        if (!headDesc)
        {
            headDesc = [[[UILabel alloc] initWithFrame:CGRectMake(320 - 200, (60 - 30) / 2.0, 180, 30)] autorelease];
            headDesc.tag = 201;
            headDesc.textAlignment = NSTextAlignmentRight;
            headDesc.backgroundColor = [UIColor clearColor];
            [cell addSubview:headDesc];
        }
        
        [head setHidden:NO];
        [head setImage:[dic objectForKey:@"value"]];
        [head setBackgroundColor:[UIColor lightGrayColor]];
        [headDesc setText:[dic objectForKey:@"title"]];
    }
    else
    {
        [pre setText:[dic objectForKey:@"title"]];
        [desc setText:[dic objectForKey:@"value"]];
    }
    return cell;
}
#pragma mark -
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = nil;
    if (isEditing)
    {
        dic = [[editList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    else
    {
        dic = [[dataList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    if (dic && [dic objectForKey:@"cellHeight"])
    {
        return [[dic objectForKey:@"cellHeight"] floatValue];
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (!isEditing && indexPath.row == 0 && indexPath.section == 0)
    {//头像
        [[BusinessManager sharedManager].loginMgr getImage:^(UIImage *img){
        
            NSMutableDictionary *dic = [[dataList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            if (img)
            {
                [dic setObject:img forKey:@"value"];
                [tableView reloadData];
            }
        } fromViewController:self];
    }
    else if(isEditing)
    {
        EditUserInfoViewController *viewctl = [[[EditUserInfoViewController alloc] init] autorelease];
        NSMutableDictionary *dic = [[editList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        viewctl.oldValue = [dic objectForKey:@"value"];
        viewctl.type = (EditInfoType)indexPath.row;
        viewctl.delegate = self;
        [self.navigationController pushViewController:viewctl animated:YES];
    }
}
- (void)editUserInfoDidSaveType:(EditInfoType)type value:(NSString *)value
{
    NSMutableDictionary *dic = [[editList objectAtIndex:0] objectAtIndex:type];
    [dic setObject:value forKey:@"value"];
    [table reloadData];
}
@end
