//
//  LoginViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-24.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.title = @"登录";
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClick)] autorelease];
}
- (void)leftBtnClick
{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginBtnClick:(id)sender
{
    [[BusinessManager sharedManager].loginMgr login:userName.text
                                           password:psw.text
                                           complete:^(BOOL flag,NSString *retDes){
                                               [self leftBtnClick];
                                           }];
}
- (IBAction)registerBtnClick:(id)sender
{
    RegisterViewController *viewctl = [[[RegisterViewController alloc] init] autorelease];
    [self.navigationController pushViewController:viewctl animated:YES];
}
@end
