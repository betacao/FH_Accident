//
//  LoginManager.h
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum
{
    kMember_Personal = 1,
    kMember_Company
}MemberType;

@interface User : NSObject

@property (nonatomic, assign) MemberType type;//会员类型
@property (nonatomic, copy) NSString *phoneNumber;//手机号
@property (nonatomic, copy) NSString *carNumber;//车牌号
@property (nonatomic, copy) NSString *idCardNumber;//身份证号
@property (nonatomic, copy) NSString *realName;//姓名
@property (nonatomic, copy) NSString *serialNumber;//会员编号
@property (nonatomic, copy) NSString *memberAmount;//会员缴费金额
@property (nonatomic, retain) NSDate *memberValidTime;//会员有效期
@property (nonatomic, retain) NSDate *birthday;//出生日期
@property (nonatomic, assign) int sex;//性别
@property (nonatomic, assign) int bloodType;//血型
@property (nonatomic, copy) NSString *urgentPerson;//紧急联系人
@property (nonatomic, copy) NSString *engineNumber;//发动机号
@property (nonatomic, copy) NSString *insuranceCompany;//保险公司
@property (nonatomic, retain) NSDate *insuranceValidTime;//保险有效期
@property (nonatomic, copy) NSString *insuranceAmount;//商业三险金额


@end

typedef void(^GetImageBlock)(UIImage *img);

@interface LoginManager : NSObject
{
    GetImageBlock getImgBlock;
    UIViewController *parentViewCtl;
}

-(void)getImage:(GetImageBlock)block fromViewController:(UIViewController *)viewctl;

- (BOOL)isLogin;
- (void)login:(NSString *)username password:(NSString *)pwd complete:(void(^)(BOOL flag,NSString *retDes))block;
- (void)logout:(void(^)(BOOL flag,NSString *retDes))block;

@end
