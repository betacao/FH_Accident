//
//  QiXiuTableViewCell.h
//  FH_Accident
//
//  Created by dyf on 14-5-27.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QiXiuTableViewCell;
@protocol QiXiuTableViewCellDelegate <NSObject>

@optional
- (void)cellDidClickGoHere:(QiXiuTableViewCell *)cell;
- (void)cellDidClickMakeCall:(QiXiuTableViewCell *)cell;
- (void)cellDidClickMakeOrder:(QiXiuTableViewCell *)cell;
@end
@interface QiXiuTableViewCell : UITableViewCell
{
    IBOutlet UILabel *nameLab;
    IBOutlet UILabel *gradinglab;
    IBOutlet UILabel *priceLab;
}
@property (nonatomic, assign) id <QiXiuTableViewCellDelegate> delegate;
+ (CGFloat)cellHeight;
@end
