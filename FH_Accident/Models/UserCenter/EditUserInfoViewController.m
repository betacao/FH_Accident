//
//  EditUserInfoViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "EditUserInfoViewController.h"

@interface EditUserInfoViewController ()

@end

@implementation EditUserInfoViewController

- (void)dealloc
{
    [table release],table = nil;
    [dataList release],dataList = nil;
    [textField release],textField = nil;
    [datePicker release],datePicker = nil;
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
    self.title = @"编辑资料";
    // Do any additional setup after loading the view.
    [table custom];
    [textField setHidden:YES];
    [datePicker setHidden:YES];
    [table setHidden:YES];
    if (_type == kEditName ||
        _type == kEditPhone ||
        _type == kEditIDCard ||
        _type == kEditUrgent ||
        _type == kEditCarNum ||
        _type == kEditEngineNum ||
        _type == kEditInsuranceCompany ||
        _type == kEditInsuranceAmount)
    {
        [textField setHidden:NO];
        textField.text = self.oldValue;
    }
    else if(_type == kEditBirthday ||
            _type == kEditInsuranceValidTime)
    {
        [datePicker setHidden:NO];
        if (self.oldValue)
        {
            NSDate *oldDate = [PublicMethod dateFromString:self.oldValue withFormatString:@"yyyy-MM-dd"];
            datePicker.date = oldDate;
        }
    }
    else if(_type == kEditSex ||
            _type == kEditBloodType)
    {
        [table setHidden:NO];
        if (_type == kEditSex)
        {
            dataList = [[NSMutableArray alloc] init];
            [dataList addObject:@"男"];
            [dataList addObject:@"女"];
        }
        else if(_type == kEditBloodType)
        {
            dataList = [[NSMutableArray alloc] init];
            [dataList addObject:@"A型"];
            [dataList addObject:@"B型"];
            [dataList addObject:@"AB型"];
            [dataList addObject:@"O型"];
        }
    }
    
    UIBarButtonItem *item = [[[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveUserInfo)] autorelease];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)saveUserInfo
{
    if (_delegate && [_delegate respondsToSelector:@selector(editUserInfoDidSaveType:value:)])
    {
        NSString *newValue = @"";
        if (_type == kEditName ||
            _type == kEditPhone ||
            _type == kEditIDCard ||
            _type == kEditUrgent ||
            _type == kEditCarNum ||
            _type == kEditEngineNum ||
            _type == kEditInsuranceCompany ||
            _type == kEditInsuranceAmount)
        {
            newValue = [NSString stringWithFormat:@"%@",textField.text ? textField.text : @""];
        }
        else if(_type == kEditBirthday ||
                _type == kEditInsuranceValidTime)
        {
            newValue = [PublicMethod stringFronDate:datePicker.date withFormat:@"yyyy-MM-dd"];
        }
        else if(_type == kEditSex ||
                _type == kEditBloodType)
        {
            newValue = self.oldValue;
        }
        [_delegate editUserInfoDidSaveType:_type value:newValue];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    }
    NSString *showDes = [dataList objectAtIndex:indexPath.row];
    if ([showDes isEqualToString:self.oldValue])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = showDes;
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
    NSString *showDes = [dataList objectAtIndex:indexPath.row];
    self.oldValue = showDes;
    [tableView reloadData];
}
@end
