//
//  AppView.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AppViewDelegate <NSObject>
- (void)didClickButton:(UIButton *)sender;
@end
@interface AppView : UIView
{
    UILabel *titleLabel;
    UIButton *backButton;
}
@property (nonatomic,assign) id<AppViewDelegate> delegate;
- (void)setAppViewWithString:(NSString *)title normalImage:(UIImage *)nimg hightlightedImage:(UIImage *)himg;
@end
