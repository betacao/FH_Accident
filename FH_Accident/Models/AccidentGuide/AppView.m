//
//  AppView.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "AppView.h"

@implementation AppView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = frame.size.height/2;
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, (frame.size.height-20)/2, frame.size.width-20, 20)];
        [titleLabel setAdjustsFontSizeToFitWidth:YES];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = self.bounds;
        backButton.layer.masksToBounds = YES;
        backButton.layer.cornerRadius = frame.size.height/2;
        [backButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:titleLabel];
        [self addSubview:backButton];
    }
    return self;
}

- (void)click:(UIButton *)btn
{
    if(delegate && [delegate respondsToSelector:@selector(didClickButton:)])
    {
        [delegate didClickButton:btn];
    }
}

- (void)setAppViewWithString:(NSString *)title normalImage:(UIImage *)nimg hightlightedImage:(UIImage *)himg
{
    titleLabel.text = title;
    [backButton setBackgroundImage:nimg forState:UIControlStateNormal];
    [backButton setBackgroundImage:himg forState:UIControlStateHighlighted];
    backButton.tag = self.tag+100;
}

- (void)dealloc
{
    [titleLabel release];
    titleLabel= nil;
    backButton = nil;
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
