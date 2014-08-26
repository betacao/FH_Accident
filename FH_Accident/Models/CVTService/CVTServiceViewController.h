//
//  CVTServiceViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComboBoxView.h"

@class CVTServiceBtnView;
@protocol CVTServiceBtnViewDelegate <NSObject>
@optional
- (void)CVTServiceBtnViewClick:(CVTServiceBtnView *)btnview;

@end
@interface CVTServiceBtnView : UIView
{
    UIImageView *bgImage;
    UILabel *showLab;
}
@property (nonatomic, assign) id <CVTServiceBtnViewDelegate> delegate;
@property (nonatomic, copy) NSString *showTitle;

- (void)setBackgroundImage:(NSString *)imageName;
@end

@interface CVTServiceViewController : BaseViewController<ComboBoxViewDelegate,CVTServiceBtnViewDelegate>
{
    IBOutlet UIScrollView *bgScroll;
    ComboBoxView *combox;
    UIView *comboBgView;
}
@end
