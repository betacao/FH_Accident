//
//  QiXiuTableViewCell.m
//  FH_Accident
//
//  Created by dyf on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "QiXiuTableViewCell.h"

@implementation QiXiuTableViewCell
- (void)dealloc
{
    [nameLab release],nameLab = nil;
    [priceLab release],priceLab = nil;
    [gradinglab release],gradinglab = nil;
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)goHere:(id)sender
{
    if(_delegate && [_delegate respondsToSelector:@selector(cellDidClickGoHere:)])
    {
        [_delegate cellDidClickGoHere:self];
    }
}
- (IBAction)makeCall:(id)sender
{
    if(_delegate && [_delegate respondsToSelector:@selector(cellDidClickMakeCall:)])
    {
        [_delegate cellDidClickMakeCall:self];
    }
}
- (IBAction)makeOrder:(id)sender
{
    if(_delegate && [_delegate respondsToSelector:@selector(cellDidClickMakeOrder:)])
    {
        [_delegate cellDidClickMakeOrder:self];
    }
}

+ (CGFloat)cellHeight
{
    return 100.0f;
}
@end
