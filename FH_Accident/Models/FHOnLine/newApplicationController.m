//
//  newApplicationController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "newApplicationController.h"

@interface newApplicationController ()

@end

@implementation newApplicationController

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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section)
        return 44;
    else
        return 0;
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

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section == 1)
    {
        UIView *view = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)]autorelease];
        view.backgroundColor = [UIColor whiteColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(60, 10, 200, 24);
        [button setTitle:@"提交信息" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(upLoadData) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor redColor]];
            [view addSubview:button];
        return view;
    }
    else
    {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]autorelease];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        switch (indexPath.section)
        {
            case 0:
            {
                [cell.contentView addSubview:[self sectionOneView]];
            }
                break;
                
            default:
            {
                [cell.contentView addSubview:[self sectionTwoView]];
            }
                break;
        }
    }
    return cell;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"信息填写";
    titleArray = [[NSArray alloc]initWithObjects:@"填写开店信息",@"提交营业执照", nil];
    userInfo = [[NSMutableDictionary alloc]initWithCapacity:0];
    [self setFooterView];
    // Do any additional setup after loading the view from its nib.
}

- (UIView *)sectionOneView
{
    UIView *view = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 170)]autorelease];
    UILabel *nameLabel = [[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)]autorelease];
    nameLabel.text = @"店名";
    nameLabel.backgroundColor = [UIColor clearColor];
    UITextField *nameField =[[[UITextField alloc]initWithFrame:CGRectMake(100, 10, 200, 30)]autorelease];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    nameField.tag = 100;
    nameField.delegate = self;
    
    UILabel *businessLabel = [[[UILabel alloc]initWithFrame:CGRectMake(10, 50, 80, 30)]autorelease];
    businessLabel.text = @"主营业务";
    businessLabel.backgroundColor = [UIColor clearColor];
    UITextField *businessField =[[[UITextField alloc]initWithFrame:CGRectMake(100, 50, 200, 30)]autorelease];
    businessField.borderStyle = UITextBorderStyleRoundedRect;
    businessField.tag = 101;
    businessField.delegate = self;
    
    UILabel *addressLabel = [[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 80, 30)]autorelease];
    addressLabel.text = @"地址";
    addressLabel.backgroundColor = [UIColor clearColor];
    UITextField *addressField =[[[UITextField alloc]initWithFrame:CGRectMake(100, 90, 200, 30)]autorelease];
    addressField.borderStyle = UITextBorderStyleRoundedRect;
    addressField.tag = 102;
    addressField.delegate = self;
    
    UILabel *phoneLabel = [[[UILabel alloc]initWithFrame:CGRectMake(10, 130, 80, 30)]autorelease];
    phoneLabel.text = @"电话";
    phoneLabel.backgroundColor = [UIColor clearColor];
    UITextField *phoneField =[[[UITextField alloc]initWithFrame:CGRectMake(100, 130, 200, 30)]autorelease];
    phoneField.borderStyle = UITextBorderStyleRoundedRect;
    phoneField.tag = 103;
    phoneField.delegate = self;
    
    [view addSubview:nameLabel];
    [view addSubview:nameField];
    [view addSubview:businessLabel];
    [view addSubview:businessField];
    [view addSubview:addressLabel];
    [view addSubview:addressField];
    [view addSubview:phoneField];
    [view addSubview:phoneLabel];
    
    return view;
}

- (UIView *)sectionTwoView
{
    UIView *view = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 170)]autorelease];
    UILabel *nameLabel = [[[UILabel alloc]initWithFrame:CGRectMake(60, 10, 200, 30)]autorelease];
    nameLabel.text = @"还未提交营业执照照片";
    nameLabel.textAlignment = UITextAlignmentCenter;
    nameLabel.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80, 50, 160, 30);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(pickImage) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"拍照上传" forState:UIControlStateNormal];
    
    [view addSubview:nameLabel];
    [view addSubview:button];
    return view;
}

- (void)pickImage
{
    [[BusinessManager sharedManager].loginMgr getImage:^(UIImage *img)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:@"获取图片成功"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }fromViewController:self];
}


- (void)upLoadData
{
    NSString *str = @"";
    for (NSString *key in userInfo)
    {
        NSLog(@"key: %@ value: %@", key, userInfo[key]);
        str = [str stringByAppendingString:userInfo[key]];
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                   message:str
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

- (void)setFooterView
{
    UIView *view = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)]autorelease];
    view.backgroundColor = [UIColor whiteColor];
    [tableview setTableFooterView:view];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag -100)
    {
        case 0:
        {
            [userInfo setObject:textField.text forKey:@"name"];
        }
            break;
        case 1:
        {
            [userInfo setObject:textField.text forKey:@"business"];
        }
            break;
        case 2:
        {
            [userInfo setObject:textField.text forKey:@"address"];
        }
            break;
        case 3:
        {
            [userInfo setObject:textField.text forKey:@"phone"];
        }
            break;
            
        default:
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)dealloc
{
    [titleArray release];
    titleArray = nil;
    [userInfo release];
    userInfo = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end