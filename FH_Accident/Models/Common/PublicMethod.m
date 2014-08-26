//
//  PublicMethod.m
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "PublicMethod.h"

@implementation PublicMethod
+ (NSString *)documentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths objectAtIndex:0];
    return documentPath;
}
+ (NSString *)filePathInDocumentForFileName:(NSString *)name
{
    return [[PublicMethod documentPath] stringByAppendingPathComponent:name];
}

+ (BOOL)isIPhone5
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    CGFloat maxW = MAX(frame.size.width,frame.size.height);
    if (maxW == 568.0f)
    {
        return YES;
    }
    return NO;
}
+ (BOOL)isIOS7
{
    return [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0;
}

+(NSDate *)dateFromString:(NSString *)datestring withFormatString:(NSString *)formatString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [formatter setCalendar:[NSCalendar currentCalendar]];
    [formatter setDateFormat:formatString];
    NSDate *date = [formatter dateFromString:datestring];
    [formatter release];
    return date;
}
+(NSString *)stringFronDate:(NSDate *)date withFormat:(NSString *)formatString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:formatString];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    [dateFormatter release];
    return destDateString;
}
+ (void)callPhone:(NSString *)number
{
    
    if ([number length] > 0)
    {
        NSString *action = [NSString stringWithFormat:@"telprompt://%@",number];
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:action]])
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:action]];
        }
        else
        {
            [BLTipView showWithTitle:@"该设备无法打电话"];
        }
    }
}
@end
