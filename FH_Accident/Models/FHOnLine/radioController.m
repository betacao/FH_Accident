//
//  radioController.m
//  FH_Accident
//
//  Created by changxi cao on 14-5-28.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "radioController.h"
#import "radioDetailController.h"
#import "ASIHTTPRequest.h"

@interface radioController ()

@end

@implementation radioController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titleArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    radioDetailController *controller = [[radioDetailController alloc]initWithNibName:@"radioDetailController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]autorelease];
        cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"广播";
    titleArray = [[NSArray alloc]initWithObjects:@"出行新闻",@"原创",@"媒体联合制作栏目", nil];
    [self loadFromServer];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadFromServer
{
    NSString *url = [kip stringByAppendingString:@"/Api/Article"];
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
                 NSString *ID = [dic objectForKey:@"ID"];
                 NSString *title = [dic objectForKey:@"Title"];
                 NSString *summary = [dic objectForKey:@"Summary"];
                 NSString *logTime = [dic objectForKey:@"LogTime"];
                 NSString *coverUrl = [dic objectForKey:@"CoverURL"];
                 NSString *linkUrl = [dic objectForKey:@"LinkURL"];
                 NSString *msg = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n",ID,title,summary,logTime,coverUrl,linkUrl];
                 UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                                message:msg
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

- (void)dealloc
{
    [titleArray release];
    titleArray = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end