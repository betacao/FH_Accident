//
//  MyTableViewCell.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "MyTableViewCell.h"
@implementation MyTableViewCell

@synthesize delegate;

- (void)awakeFromNib
{
    // Initialization code
    NSLog(@"awakeFronNib");
}

- (void)setCellWithObject:(NSDictionary *)dictory
{
    if([dictory objectForKey:@"title"])
    {
        titleLabel.text = [dictory objectForKey:@"title"];
        [titleLabel sizeToFit];
    }
    else
    {
        titleLabel.hidden = YES;
    }
    if([dictory objectForKey:@"left"])
    {
        leftBtn.hidden = NO;
        [leftBtn setTitle:[dictory objectForKey:@"left"] forState:UIControlStateNormal];
        SEL leftMethod;
        [(NSValue *)[dictory objectForKey:@"leftMethod"]getValue:&leftMethod];
        [leftBtn removeTarget:delegate action:leftMethod forControlEvents:UIControlEventTouchUpInside];
        [leftBtn addTarget:delegate action:leftMethod forControlEvents:UIControlEventTouchUpInside];
        
    }
    else
    {
        leftBtn.hidden = YES;
    }
    if([dictory objectForKey:@"mid"])
    {
        midBtn.hidden = NO;
        [midBtn setTitle:[dictory objectForKey:@"mid"] forState:UIControlStateNormal];
        SEL midMethod;
        [(NSValue *)[dictory objectForKey:@"midMethod"]getValue:&midMethod];
        [midBtn removeTarget:delegate action:midMethod forControlEvents:UIControlEventTouchUpInside];
        [midBtn addTarget:delegate action:midMethod forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        midBtn.hidden = YES;
    }
    if([dictory objectForKey:@"right"])
    {
        rightBtn.hidden = NO;
        [rightBtn setTitle:[dictory objectForKey:@"right"] forState:UIControlStateNormal];
        SEL rightMethod;
        [(NSValue *)[dictory objectForKey:@"rightMethod"]getValue:&rightMethod];
        [rightBtn removeTarget:delegate action:rightMethod forControlEvents:UIControlEventTouchUpInside];
        [rightBtn addTarget:delegate action:rightMethod forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        rightBtn.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
