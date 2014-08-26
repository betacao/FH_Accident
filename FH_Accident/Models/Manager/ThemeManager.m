//
//  ThemeManager.m
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "ThemeManager.h"
#import "AccidentGuideControllerViewController.h"
#import "CVTServiceViewController.h"
#import "FHOnlineViewController.h"
#import "UserCenterViewController.h"
#import "LoginViewController.h"
#import "MLNavigationController.h"
@implementation ThemeManager
- (id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(loginSuccess:)
                                                     name:kLoginSuccessNotification
                                                   object:nil];
    }
    return self;
}
- (void)dealloc
{
    [super dealloc];
}
- (UIViewController *)rootViewController
{
    UIViewController *viewctl = [[[AccidentGuideControllerViewController alloc] init] autorelease];
    
    MLNavigationController *nav = [[[MLNavigationController alloc] initWithRootViewController:viewctl] autorelease];
    nav.navigationBarHidden = YES;
    
    if ([PublicMethod isIOS7])
    {//关闭滑动返回上级
        nav.interactivePopGestureRecognizer.enabled = NO;
    }
    nav.delegate = self;
    self.navCtl = nav;
    if (!tabBar)
    {
        CGRect viewBounds = [[UIScreen mainScreen] bounds];
        tabBar = [[CustomTabBar alloc] initWithFrame:CGRectMake(0, viewBounds.size.height - 92, 320, 45)];
        tabBar.delegate = self;
        //事故导航
        [tabBar addViewCtl:viewctl];
        
        //费大姐在线
        viewctl = [[[FHOnlineViewController alloc] init] autorelease];
        [tabBar addViewCtl:viewctl];
        
        //便利服务
        viewctl = [[[CVTServiceViewController alloc] init] autorelease];
        [tabBar addViewCtl:viewctl];
        
        //个人中心
        viewctl = [[[UserCenterViewController alloc] init] autorelease];
        [tabBar addViewCtl:viewctl];
    }
    
    return nav;
}

- (void)showTabBarAnimated:(BOOL)animated
{
    CGRect rect = tabBar.frame;
    rect.origin.x = 0;
    tabBar.hidden = NO;
    if (animated)
    {
//        [UIView animateWithDuration:0.3
//                         animations:^{
//                             tabBar.frame = rect;
//                         }completion:^(BOOL finished){
//                             
//                         }];
        tabBar.frame = rect;
    }
    else
    {
        tabBar.frame = rect;
        tabBar.hidden = NO;
    }
}
- (void)hideTabBarAnimated:(BOOL)animated
{
    CGRect rect = tabBar.frame;
    rect.origin.x = -320;
    if (animated)
    {
        [UIView animateWithDuration:0.3
                         animations:^{
                             tabBar.frame = rect;
                         }
                         completion:^(BOOL finished){
                             tabBar.hidden = YES;
                         }];
    }
    else
    {
        tabBar.frame = rect;
    }
}
- (void)initTabBar
{
    if ([tabBar superview] == nil)
    {
        [self.navCtl.view addSubview:tabBar];
    }
}
- (void)showLoginViewController
{
    LoginViewController *viewctl = [[[LoginViewController alloc] init] autorelease];
    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:viewctl] autorelease];
    NSArray *tmparr = [self.navCtl viewControllers];
    UIViewController *lastviewctl = [tmparr lastObject];
    [lastviewctl presentModalViewController:nav animated:YES];
}
#pragma mark -
#pragma mark CustomTabBarDelegate
- (void)touchDownAtIndex:(NSInteger)index
{
    [self.navCtl setViewControllers:[NSArray arrayWithObject:[tabBar viewCtlAtIndex:index]]];
    
    if (index == 3 && ![[BusinessManager sharedManager].loginMgr isLogin])
    {
        [self showLoginViewController];
    }
}

#pragma mark -
#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewCtl animated:(BOOL)animated
{
    if ([navigationController.viewControllers count] == 1)
    {
        
        [self initTabBar];
        [self showTabBarAnimated:YES];
    }
    else if(![self isKindOfClass:NSClassFromString(@"")])
    {
        [self hideTabBarAnimated:YES];
    }
}
#pragma mark -
#pragma mark 登录通知
- (void)loginSuccess:(NSNotification *)noti
{
}
@end
