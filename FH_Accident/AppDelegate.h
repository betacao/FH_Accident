//
//  AppDelegate.h
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//  this is delegate

#import <UIKit/UIKit.h>
#import "EAIntroView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,EAIntroDelegate>
{
    UIViewController *viewctl;
}
@property (strong, nonatomic) UIWindow *window;

@end
