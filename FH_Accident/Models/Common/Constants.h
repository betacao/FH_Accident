//
//  Constants.h
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#ifndef FH_Accident_Constants_h
#define FH_Accident_Constants_h

#define kLoginSuccessNotification @"kLoginSuccessNotification"
#define kLogoutSuccessNotification @"kLogoutSuccessNotification"
#define kIsLogin @"kisLogin"
#define kip @"http://insurance.july-it.com:8080"
#define kUserName @"userName"
#define kUserPwd  @"userPwd"

typedef enum
{
    kCVTService_QiXiu = 0,
    kCVTService_QiCheJiuYuan,
    kCVTService_4SDian,
    kCVTService_YiYuan,
    kCVTService_JiaoCheFuWu,
    kCVTService_BaoXianGongSi,
    kCVTService_JinRongFuWu,
    kCVTService_ShangCanJianDing,
    kCVTService_LvShi

}CVTServiceType;
#endif
