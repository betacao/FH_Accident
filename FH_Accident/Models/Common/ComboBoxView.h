//
//  ComboBoxView.h
//  comboBox
//
//  Created by duansong on 10-7-28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ComboBoxView;
@protocol ComboBoxViewDelegate <NSObject>

@optional
- (void)comboBoxDidSelect:(NSString *)value;
- (void)comboBoxDidShow:(ComboBoxView *)boxView;
- (void)comboBoxdidHide:(ComboBoxView *)boxView;
@end

@interface ComboBoxView : UIView < UITableViewDelegate, UITableViewDataSource >
{
	UITableView		*_comboBoxTableView;
	NSArray			*_comboBoxDatasource;
	BOOL			_showComboBox;
    CGRect          initFrame;
}
@property (nonatomic, assign) id <ComboBoxViewDelegate> delegate;
@property (nonatomic, retain) NSArray *comboBoxDatasource;
@property (nonatomic, copy) NSString *selectedValue;
@property (nonatomic, assign) BOOL hideAfterSelect;

- (void)hitComboBox;

- (BOOL)isShow;

@end
