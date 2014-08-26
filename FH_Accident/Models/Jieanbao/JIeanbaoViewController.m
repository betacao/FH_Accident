//
//  JIeanbaoViewController.m
//  FH_Accident
//
//  Created by cchx on 14-8-17.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "JIeanbaoViewController.h"
#import "ASIHTTPRequest.h"

@interface JIeanbaoViewController ()

@end

@implementation JIeanbaoViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)jieanbaoDownLoad:(id)sender
{
    NSString *url = [kip stringByAppendingString:@"/Api/Download"];
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
             for(NSDictionary *dic in json)
             {
                 NSString *title = [dic objectForKey:@"Title"];
                 NSString *link = [dic objectForKey:@"Link"];
                 
                 UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title
                                                                message:link
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil, nil];
                 [alert show];
                 [alert release];
             }
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

- (IBAction)jieanbaoOnline:(id)sender
{
    
}

- (IBAction)jieanbaoPreClaims:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
