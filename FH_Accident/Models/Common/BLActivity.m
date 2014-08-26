//
//  BLActivity.m
//  i部落
//
//  Created by wiscom on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BLActivity.h"

static MBProgressHUD *shareActivity = nil;

@implementation BLActivity

+(MBProgressHUD *)sharedActivity
{
	if (shareActivity == nil) 
	{
		UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
		shareActivity = [[MBProgressHUD alloc] initWithView:window];
		shareActivity.minShowTime	= 0.3;
	//	shareActivity.labelText		= conTitle;
		[window addSubview:shareActivity];
	}
	return shareActivity;
}

+(void)show:(BOOL)animated
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    [window bringSubviewToFront:[BLActivity sharedActivity]];
	[[BLActivity sharedActivity] show:animated];
}
+(void)hide:(BOOL)animated
{
	[[BLActivity sharedActivity] hide:animated];
}

//+(NSString *)uuid
//{
//	CFUUIDRef theUUID = CFUUIDCreate(NULL);
//	CFStringRef string = CFUUIDCreateString(NULL, theUUID);
//	CFRelease(theUUID);
//	return [(NSString *)string autorelease];
//}
- (void)dealloc
{
    [super dealloc];
}

@end