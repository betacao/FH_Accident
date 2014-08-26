//
//  UserCenterViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "UserCenterViewController.h"
#import "SettingViewController.h"
#import "UserDetailViewController.h"
#import "MyOrderListViewController.h"
#import "AccidentListViewController.h"
#import "LXActivity.h"
#import <MessageUI/MessageUI.h>
@interface UserCenterViewController ()

@end

@implementation UserCenterViewController
- (void)dealloc
{
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
    self.title = @"个人中心";
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)] autorelease];
}
- (void)rightBtnClick
{
    SettingViewController *viewctl = [[[SettingViewController alloc] init] autorelease];
    [self.navigationController pushViewController:viewctl animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logoutClick:(id)sender
{
    [[BusinessManager sharedManager].loginMgr logout:^(BOOL flag,NSString *retDes){
    
        [[BusinessManager sharedManager].themeMgr showLoginViewController];
    }];
}
- (IBAction)shareBtnClick:(id)sender
{
    NSArray *shareButtonTitleArray = [[[NSArray alloc] init] autorelease];
    NSArray *shareButtonImageNameArray = [[[NSArray alloc] init] autorelease];
    shareButtonTitleArray = @[@"短信",@"邮件",@"新浪微博",@"微信",@"微信朋友圈",@"Twitter"];
    shareButtonImageNameArray = @[@"sns_icon_19",@"sns_icon_18",@"sns_icon_1",@"sns_icon_22",@"sns_icon_23",@"sns_icon_11"];
    LXActivity *lxActivity = [[LXActivity alloc] initWithTitle:@"分享到社交平台"
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                             ShareButtonTitles:shareButtonTitleArray
                                     withShareButtonImagesName:shareButtonImageNameArray];
    [lxActivity showInView:self.view];
}
- (IBAction)userDetail:(id)sender
{
    UserDetailViewController *viewctl = [[[UserDetailViewController alloc] init] autorelease];
    [self.navigationController pushViewController:viewctl animated:YES];
}
- (IBAction)myOrder:(id)sender
{
    MyOrderListViewController *viewctl = [[[MyOrderListViewController alloc] init] autorelease];
    [self.navigationController pushViewController:viewctl animated:YES];
}
- (IBAction)historyAccident:(id)sender
{
    AccidentListViewController *viewctl = [[[AccidentListViewController alloc] init] autorelease];
    [self.navigationController pushViewController:viewctl animated:YES];
}

- (IBAction)keFuDianHua:(id)sender
{
    [PublicMethod callPhone:@"10086"];
}
- (IBAction)waiQinFuWu:(id)sender
{
    [PublicMethod callPhone:@"10010"];
}
- (IBAction)wenAnMiShu:(id)sender
{
    [PublicMethod callPhone:@"95555"];
}
#pragma mark - LXActivityDelegate

- (void)didClickOnImageIndex:(NSInteger)imageIndex
{
    int index = (int)imageIndex;
    if (index == 0)
    {
        [self sendSMS];
    }
    else if(index == 1)
    {
        [self sendMail];
    }
}
- (void)sendSMS
{
    MFMessageComposeViewController *controller =
    [[[MFMessageComposeViewController alloc] init] autorelease];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = @"快来使用费大姐吧";
        controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
    }
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissModalViewControllerAnimated:YES];
}
- (void)sendMail
{
    MFMailComposeViewController *controller = [[[MFMailComposeViewController alloc] init] autorelease];
    if ([MFMailComposeViewController canSendMail])
    {
        [controller setSubject:@"快来使用费大姐吧"];
        [controller setMessageBody:@"快来使用费大姐吧" isHTML:NO];
        controller.mailComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
    }
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissModalViewControllerAnimated:YES];
}
@end
