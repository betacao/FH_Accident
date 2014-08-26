//
//  PublicMethod.h
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicMethod : NSObject

//在document目录下查找文件
+ (NSString *)filePathInDocumentForFileName:(NSString *)name;
//判断
+ (BOOL)isIPhone5;
//判断
+ (BOOL)isIOS7;

+(NSDate *)dateFromString:(NSString *)datestring withFormatString:(NSString *)formatString;
+(NSString *)stringFronDate:(NSDate *)date withFormat:(NSString *)formatString;

+ (void)callPhone:(NSString *)number;
@end
