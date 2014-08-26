//
//  LoginManager.m
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "LoginManager.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "ASIFormDataRequest.h"
@implementation User

- (void)dealloc
{
    self.phoneNumber = nil;
    self.carNumber = nil;
    self.idCardNumber = nil;
    self.realName = nil;
    self.serialNumber = nil;
    self.memberAmount = nil;
    self.memberValidTime = nil;
    self.birthday = nil;
    self.urgentPerson = nil;
    self.engineNumber = nil;
    self.insuranceCompany = nil;
    self.insuranceValidTime = nil;
    self.insuranceAmount = nil;
    [super dealloc];
}

@end

@implementation LoginManager
- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
- (void)dealloc
{
    [super dealloc];
}

#pragma mark -
#pragma mark 获取图片
-(void)getImage:(GetImageBlock)block fromViewController:(UIViewController *)viewctl
{
    //现在有头像的也能更改头像
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"更改头像"
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册选取", nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    [actionSheet release];
    parentViewCtl = viewctl;
    
    [getImgBlock release];
    getImgBlock = [block copy];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0) {
		[self cameraButtonClicked:nil];
	} else if (buttonIndex == 1) {
		[self libraryButtonClicked:nil];
	}
    else
    {
        [getImgBlock release];
        getImgBlock = nil;
    }
}
-(void)cameraButtonClicked:(id)sender
{
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		UIImagePickerController *picker = [[[UIImagePickerController alloc] init] autorelease];
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		picker.delegate = self;
		picker.allowsEditing = YES;
		[parentViewCtl presentModalViewController:picker animated:YES];
	}
}
-(void)libraryButtonClicked:(id)sender
{
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
		UIImagePickerController *picker=[[[UIImagePickerController alloc] init] autorelease];
		picker.delegate = self;
		picker.allowsEditing = YES;
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		[parentViewCtl presentModalViewController:picker animated:YES];
	}
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	NSString *key = picker.allowsEditing ? UIImagePickerControllerEditedImage : UIImagePickerControllerOriginalImage;
    UIImage *img = [info objectForKey:key];
	
	NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
	
	ALAssetsLibraryAssetForURLResultBlock resultBlock=^(ALAsset *asset) {
		ALAssetRepresentation *representation=[asset defaultRepresentation];
		
		UIImage *timg = [UIImage scaledImageWisorg:img originFileSize:[representation size]];
		getImgBlock(timg);
        [getImgBlock release];
        getImgBlock = nil;
	};
	ALAssetsLibraryAccessFailureBlock failureBlock=^(NSError *error) {
		UIImage *timg = [UIImage scaledImageWisorg:img originFileSize:0];
        getImgBlock(timg);
        [getImgBlock release];
        getImgBlock = nil;
	};
	if(imageURL) {
		ALAssetsLibrary *assetsLibrary = [[[ALAssetsLibrary alloc] init] autorelease];
		[assetsLibrary assetForURL:imageURL resultBlock:resultBlock failureBlock:failureBlock];
	} else {
		UIImage *timg = [UIImage scaledImageWisorg:img originFileSize:0];
		getImgBlock(timg);
        [getImgBlock release];
        getImgBlock = nil;
	}
	
	picker.delegate = nil;
	[picker dismissModalViewControllerAnimated:YES];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	picker.delegate = nil;
	[picker dismissModalViewControllerAnimated:YES];
    
    [getImgBlock release];
    getImgBlock = nil;
}
- (BOOL)isLogin
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kIsLogin];
}
#pragma mark -
#pragma mark 登录
- (void)login:(NSString *)username password:(NSString *)pwd complete:(void(^)(BOOL flag,NSString *retDes))block
{
    NSString *url = [kip stringByAppendingString:@"/Api/User/Login"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    [request addPostValue:username forKey:@"UserName"];
    [request addPostValue:pwd forKey:@"UserPassword"];
    [request setCompletionBlock:^
     {
         NSError *error;
         NSLog(@"%@",request.responseString);
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[request responseData] options:kNilOptions error:&error];
         if(json == nil)
         {
             NSLog(@"json parse failed \r\n");
             return ;
         }
         else
         {
             BOOL result = [[json objectForKey:@"Result"] boolValue];
             NSString *Msg = [json objectForKey:@"Msg"];
             if(!result)
             {
                 UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                                message:Msg
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil, nil];
                 [alert show];
                 [alert release];
             }
             else
             {
                 UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                                message:Msg
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil, nil];
                 [alert show];
                 [alert release];
                 
                 block(YES,nil);
                 [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kIsLogin];
                 [[NSUserDefaults standardUserDefaults] setObject:username forKey:kUserName];
                 [[NSUserDefaults standardUserDefaults] setObject:pwd forKey:kUserPwd];
                 [[NSUserDefaults standardUserDefaults] synchronize];
                 [[NSNotificationCenter defaultCenter] postNotificationName:kLoginSuccessNotification object:nil];
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
- (void)logout:(void(^)(BOOL flag,NSString *retDes))block
{
    block(YES,nil);
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kIsLogin];
    [[NSNotificationCenter defaultCenter] postNotificationName:kLogoutSuccessNotification object:nil];
}
@end
