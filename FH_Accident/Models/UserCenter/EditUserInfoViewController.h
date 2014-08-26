//
//  EditUserInfoViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "BaseViewController.h"

typedef enum
{
    kEditName,//名字
    kEditPhone,//手机号
    kEditIDCard,//身份证
    kEditBirthday,//生日
    kEditSex,//性别
    kEditBloodType,//血型
    kEditUrgent,//紧急联系人
    kEditCarNum,//车牌号
    kEditEngineNum,//发动机号
    kEditInsuranceCompany,//保险公司
    kEditInsuranceValidTime,//保险有效期
    kEditInsuranceAmount//保险金额
}EditInfoType;

@protocol EditUserInfoViewControllerDelegate  <NSObject>

@optional
- (void)editUserInfoDidSaveType:(EditInfoType)type value:(NSString *)value;

@end

@interface EditUserInfoViewController : BaseViewController
{
    IBOutlet UITableView *table;
    NSMutableArray *dataList;
    
    
    IBOutlet UITextField *textField;
    
   IBOutlet UIDatePicker *datePicker;
}
@property (nonatomic, assign) id <EditUserInfoViewControllerDelegate> delegate;
@property (nonatomic, assign) EditInfoType type;
@property (nonatomic, copy) NSString *oldValue;
@end
