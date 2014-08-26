//
//  AccidentGuideControllerViewController.h
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.

//事故导航首页

#import <UIKit/UIKit.h>
#import "ComboBoxView.h"

#import "AlixLibService.h"

@interface Product : NSObject{
@private
	float _price;
	NSString *_subject;
	NSString *_body;
	NSString *_orderId;
}

@property (nonatomic, assign) float price;
@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *body;
@property (nonatomic, retain) NSString *orderId;

@end

@interface AccidentGuideControllerViewController : BaseViewController<ComboBoxViewDelegate>
{
    IBOutlet UIView *bgView;
    ComboBoxView *combox;
    UIView *comboBgView;
}

- (IBAction)doAccidentGuide:(id)sender;
- (IBAction)compensationCalculator:(id)sender;
- (IBAction)Secretary:(id)sender;
@end
