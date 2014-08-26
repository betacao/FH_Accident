//
//  ThemeManager.h
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomTabBar.h"
@interface ThemeManager : NSObject
<UINavigationControllerDelegate,CustomTabBarDelegate>
{
    CustomTabBar *tabBar;
}
@property (nonatomic, retain) UINavigationController *navCtl;

- (UIViewController *)rootViewController;

- (void)showLoginViewController;
@end
