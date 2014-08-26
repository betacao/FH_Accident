//
//  BLActivity.h
//  i部落
//
//  Created by wiscom on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface BLActivity : UIView
+(MBProgressHUD *)sharedActivity;
+(void)show:(BOOL)animated;
+(void)hide:(BOOL)animated;
//+(NSString *)uuid;
@end
