//
//  UITableView+Extension.m
//  FH_Accident
//
//  Created by dyf on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)
- (void)custom
{
    if ([self respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
}
@end
