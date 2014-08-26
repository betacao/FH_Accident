//
//  RegisterViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "RegisterViewController.h"
#import "ASIFormDataRequest.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
- (void)dealloc
{
    [combox release],combox = nil;
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
    self.title = @"注册";
    // Do any additional setup after loading the view from its nib.
    
    combox = [[ComboBoxView alloc] initWithFrame:CGRectMake(37, 80, 246, 80)];
    combox.delegate = self;
    combox.comboBoxDatasource = @[@"个人会员",@"企业会员"];
    combox.selectedValue = @"个人会员";
    [self.view addSubview:combox];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)comBoxBtnClick:(id)sender
{
    [combox hitComboBox];
}

- (IBAction)didClickLoginButton:(id)sender
{
    NSString *url = [kip stringByAppendingFormat:@"/Api/User/Register"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    [request addPostValue:nameTextField.text forKey:@"UserName"];
    [request addPostValue:pswTextField.text forKey:@"UserPassword"];
    [request setCompletionBlock:^{
        NSError *error;
        NSLog(@"%@",request.responseString);
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:kNilOptions error:&error];
        if(json == nil)
        {
            NSLog(@"json parse failed \r\n");
            return ;
        }
        else
        {
            BOOL result = [[json objectForKey:@"Result"] boolValue];
            NSString *Msg = [json objectForKey:@"Msg"];
            if(!result)
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                               message:Msg
                                                              delegate:self
                                                     cancelButtonTitle:@"确定"
                                                     otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                               message:Msg
                                                              delegate:self
                                                     cancelButtonTitle:@"确定"
                                                     otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            }
        }
    }];
    [request setFailedBlock:^
     {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:@"网络超时，请重试!"
                                                      delegate:self
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
     }];
    [request startAsynchronous];

}
#pragma mark -
#pragma mark ComboBoxViewDelegate
- (void)comboBoxDidSelect:(NSString *)value
{
    [comboxBtn setTitle:value forState:UIControlStateNormal];
}
@end
