//
//  MyTableViewCell.h
//  FH_Accident
//
//  Created by changxi cao on 14-5-26.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyTableViewCellDelegate <NSObject>
@end
@interface MyTableViewCell : UITableViewCell
{
    IBOutlet UILabel *titleLabel;
    IBOutlet UIButton *leftBtn;
    IBOutlet UIButton *midBtn;
    IBOutlet UIButton *rightBtn;
}

@property (nonatomic,assign)id<MyTableViewCellDelegate>delegate;

- (void)setCellWithObject:(NSDictionary *)dictory;
@end
