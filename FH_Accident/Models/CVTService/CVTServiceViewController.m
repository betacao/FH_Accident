//
//  CVTServiceViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "CVTServiceViewController.h"
#import "CVTServiceListViewController.h"
#import "SolutionListViewController.h"
#import "ASIHTTPRequest.h"

@interface CVTServiceViewController ()

@end

@implementation CVTServiceBtnView
- (void)dealloc
{
    [bgImage release],bgImage = nil;
    [showLab release],showLab = nil;
    
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        showLab = [[UILabel alloc] initWithFrame:CGRectMake(0, (frame.size.height - 40) / 2.0, frame.size.width, 40)];
        showLab.backgroundColor = [UIColor clearColor];
        showLab.textAlignment = NSTextAlignmentCenter;
        showLab.font = [UIFont systemFontOfSize:14];
        showLab.textColor = [UIColor blackColor];
        
        UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [actionBtn setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [actionBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bgImage];
        [self addSubview:showLab];
        [self addSubview:actionBtn];
    }
    return self;
}
- (void)setShowTitle:(NSString *)showTitle
{
    showLab.text = showTitle;
}

- (void)setBackgroundImage:(NSString *)imageName
{
    bgImage.image = [UIImage imageNamed:imageName];
}
- (void)btnClick
{
    if (_delegate && [_delegate respondsToSelector:@selector(CVTServiceBtnViewClick:)])
    {
        [_delegate CVTServiceBtnViewClick:self];
    }
}
@end


@implementation CVTServiceViewController
- (void)dealloc
{
    [comboBgView release],comboBgView = nil;
    [combox release],combox = nil;
    [bgScroll release],bgScroll = nil;
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"便利服务";
    // Do any additional setup after loading the view from its nib.
    
    [self addCVTServices];
    [self refreshRightBtnView:@"北京"];
    [self addComboBox];

}
- (void)refreshRightBtnView:(NSString *)title
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStyleBordered
                                                            target:self
                                                            action:@selector(rightBtnClick)];
    [self.navigationItem setRightBarButtonItem:item];
}
- (void)rightBtnClick
{
    [combox hitComboBox];
}
- (void)addComboBox
{
    combox = [[ComboBoxView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    combox.delegate = self;
    combox.comboBoxDatasource = @[@"北京",@"上海",@"天津"];
    combox.selectedValue = @"北京";
    [self.view addSubview:combox];
}
- (void)addCVTServices
{
    NSString *url = [kip stringByAppendingString:@"/Api/ServiceCategory"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [request setCompletionBlock:^
     {
         NSError *error;
         NSLog(@"%@",request.responseString);
         NSArray *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:kNilOptions error:&error];
         if(json == nil)
         {
             NSLog(@"json parse failed \r\n");
             return ;
         }
         else
         {
             CGFloat arrow = 12;
             CGRect baseRect = CGRectMake(arrow, 94, 74, 74);
             int baseTag = 100;
             int col = 4;
             int index = 0;
             for(NSDictionary *dic in json)
             {
                 NSString *ID = [dic objectForKey:@"ID"];
                 NSString *Name = [dic objectForKey:@"Name"];
                 NSLog(@"name = %@",Name);
                 CVTServiceBtnView *btnview = [[[CVTServiceBtnView alloc] initWithFrame:baseRect] autorelease];
                 btnview.tag = baseTag;
                 [btnview setBackgroundImage:[NSString stringWithFormat:@"service_item%d",[ID integerValue]]];
                 [btnview setDelegate: self];
                 [bgScroll addSubview:btnview];
                 index++;
                 baseTag++;
                 baseRect.origin.x += baseRect.size.width;
                 if (index % col == 0)
                 {
                     baseRect.origin.x = arrow;
                     baseRect.origin.y += baseRect.size.height;
                 }
             }
             [bgScroll setContentSize:CGSizeMake(bgScroll.frame.size.width, baseRect.origin.y + baseRect.size.height)];
         }
     }];
    [request setFailedBlock:^
     {
         UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                        message:@"网络超时，请重试!"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
         [alert show];
         [alert release];
     }];
    [request startAsynchronous];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark CVTServiceBtnViewDelegate
- (void)CVTServiceBtnViewClick:(CVTServiceBtnView *)btnview
{
    NSLog(@"%d",btnview.tag - 100);
    CVTServiceType type = btnview.tag - 100;
    if (type == kCVTService_QiXiu)
    {
        CVTServiceListViewController *viewctl = [[[CVTServiceListViewController alloc] init] autorelease];
        viewctl.title = @"汽修";
        viewctl.serviceType = type;
        [self.navigationController pushViewController:viewctl animated:YES];
    }
    else
    {
//        SolutionListViewController *viewctl = [[[SolutionListViewController alloc] init] autorelease];
//        [self.navigationController pushViewController:viewctl animated:YES];
    }
}
#pragma mark -
#pragma mark ComboBoxViewDelegate
- (void)comboBoxDidSelect:(NSString *)value
{
    [self refreshRightBtnView:value];
}

- (void)comboBoxDidShow:(ComboBoxView *)boxView
{
    if (!comboBgView)
    {
        comboBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        comboBgView.backgroundColor = [UIColor blackColor];
        comboBgView.alpha = 0.3;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(rightBtnClick)];
        [comboBgView addGestureRecognizer:gesture];
        [gesture release];
    }
    if ([comboBgView superview] == nil)
    {
        [self.view insertSubview:comboBgView belowSubview:combox];
        comboBgView.alpha = 0;

        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration:0.15];
        comboBgView.alpha = 0.3;
        [UIView commitAnimations];
        
    }
}
- (void)comboBoxdidHide:(ComboBoxView *)boxView
{
    [comboBgView removeFromSuperview];
}
@end
