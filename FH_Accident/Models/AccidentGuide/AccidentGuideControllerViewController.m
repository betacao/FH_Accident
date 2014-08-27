//
//  AccidentGuideControllerViewController.m
//  FH_Accident
//
//  Created by dyf on 14-5-19.
//  Copyright (c) 2014年 wisedu. All rights reserved.
//

#import "AccidentGuideControllerViewController.h"
#import "CalculatorController.h"
#import "handleAccidentController.h"
#import "JIeanbaoViewController.h"

#import "PartnerConfig.h"
#import "DataSigner.h"
#import "AlixPayResult.h"
#import "DataVerifier.h"
#import "AlixPayOrder.h"

@implementation Product
@synthesize price = _price;
@synthesize subject = _subject;
@synthesize body = _body;
@synthesize orderId = _orderId;

@end

@interface AccidentGuideControllerViewController ()
{
    NSMutableArray *_products;

}
@end

@implementation AccidentGuideControllerViewController


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
    self.title = @"首页";
    // Do any additional setup after loading the view from its nib.
    [self refreshRightBtnView:@"北京"];
    [self addComboBox];
    
    
    
}

//wap回调函数
-(void)paymentResult:(NSString *)resultd
{
    //结果处理
#if ! __has_feature(objc_arc)
    AlixPayResult* result = [[[AlixPayResult alloc] initWithString:resultd] autorelease];
#else
    AlixPayResult* result = [[AlixPayResult alloc] initWithString:resultd];
#endif
	if (result)
    {
		
		if (result.statusCode == 9000)
        {
			/*
			 *用公钥验证签名 严格验证请使用result.resultString与result.signString验签
			 */
            
            //交易成功
            NSString* key = AlipayPubKey;//签约帐户后获取到的支付宝公钥
			id<DataVerifier> verifier;
            verifier = CreateRSADataVerifier(key);
            
			if ([verifier verifyString:result.resultString withSign:result.signString])
            {
                //验证签名成功，交易结果无篡改
                NSLog(@"眼前成功");
			}
        }
        else
        {
            //交易失败
        }
    }
    else
    {
        //失败
    }
    
}

-(NSString*)getOrderInfo:(NSInteger)index
{
    /*
	 *点击获取prodcut实例并初始化订单信息
	 */
	Product *product = [_products objectAtIndex:index];
    AlixPayOrder *order = [[AlixPayOrder alloc] init];
    order.partner = PartnerID;
    order.seller = SellerID;
    
    order.tradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
	order.productName = @"测试支付宝功能";//product.subject; //商品标题
	order.productDescription = @"支付宝支付宝支付宝支付宝支付宝支付宝";//product.body; //商品描述
	order.amount = [NSString stringWithFormat:@"%.2f",product.price]; //商品价格
	order.notifyURL =  @"http%3A%2F%2Fwwww.xxx.com"; //回调URL
	
	return [order description];
}

- (NSString *)generateTradeNO
{
	const int N = 15;
	
	NSString *sourceString = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	NSMutableString *result = [[NSMutableString alloc] init] ;
	srand(time(0));
	for (int i = 0; i < N; i++)
	{
		unsigned index = rand() % [sourceString length];
		NSString *s = [sourceString substringWithRange:NSMakeRange(index, 1)];
		[result appendString:s];
	}
	return result;
}

-(NSString*)doRsa:(NSString*)orderInfo
{
    id<DataSigner> signer;
    signer = CreateRSADataSigner(PartnerPrivKey);
    NSString *signedString = [signer signString:orderInfo];
    return signedString;
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
    [bgView addSubview:combox];
}
- (void)doAccidentGuide:(id)sender
{
    handleAccidentController *controller = [[handleAccidentController alloc]initWithNibName:@"handleAccidentController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
}

- (void)compensationCalculator:(id)sender
{
    /*
	 *生成订单信息及签名
	 *由于demo的局限性，采用了将私钥放在本地签名的方法，商户可以根据自身情况选择签名方法(为安全起见，在条件允许的前提下，我们推荐从商户服务器获取完整的订单信息)
	 */
    NSArray *subjects = [[NSArray alloc] initWithObjects:@"话费充值",
						 @"魅力香水",@"珍珠项链",@"三星 原装移动硬盘",
						 @"发箍发带",@"台版N97I",@"苹果手机",
						 @"蝴蝶结",@"韩版雪纺",@"五皇纸箱",nil];
	NSArray *body = [[NSArray alloc] initWithObjects:@"[四钻信誉]北京移动30元 电脑全自动充值 1到10分钟内到账",
					 @"新年特惠 adidas 阿迪达斯走珠 香体止汗走珠 多种香型可选",
					 @"[2元包邮]韩版 韩国 流行饰品太阳花小巧雏菊 珍珠项链2M15",
					 @"三星 原装移动硬盘 S2 320G 带加密 三星S2 韩国原装 全国联保",
					 @"[肉来来]超热卖 百变小领巾 兔耳朵布艺发箍发带",
					 @"台版N97I 有迷你版 双卡双待手机 挂QQ JAVA 炒股 来电归属地 同款比价",
					 @"山寨国产红苹果手机 Hiphone I9 JAVA QQ后台 飞信 炒股 UC",
					 @"[饰品实物拍摄]满30包邮 三层绸缎粉色 蝴蝶结公主发箍多色入",
					 @"饰品批发价 韩版雪纺纱圆点布花朵 山茶玫瑰花 发圈胸针两用 6002",
					 @"加固纸箱 会员包快递拍好去运费冲纸箱首个五皇",nil];
	
	_products = [[NSMutableArray alloc] init];
    
	for (int i = 0; i < [subjects count]; ++i) {
		Product *product = [[Product alloc] init];
		product.subject = [subjects objectAtIndex:i];
		product.body = [body objectAtIndex:i];
		if (1==i) {
			product.price = 0.01;
		}
		else if(2==i)
		{
            product.price = 0.01;
            //			product.price = 10;
		}
		else if(3==i)
		{
            product.price = 0.01;
            //			product.price = 100;
		}
		else if(4==i)
		{
            product.price = 0.01;
            //			product.price = 1000;
		}
		else if(5==i)
		{
            product.price = 0.01;
            //			product.price = 2000;
		}
		else if(6==i)
		{
            product.price = 0.01;
            //			product.price = 6000;
		}
		else {
            product.price = 0.01;
            //			product.price = 0.01;
		}
		
		[_products addObject:product];
    }
    
    NSString *appScheme = @"com.alix.fdj2014";
    NSString* orderInfo = [self getOrderInfo:0];
    NSString* signedStr = [self doRsa:orderInfo];
    
    NSLog(@"%@",signedStr);
    
    NSString *orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                             orderInfo, signedStr, @"RSA"];
	
    [AlixLibService payOrder:orderString AndScheme:appScheme seletor:@selector(paymentResult:) target:self];
    
    
    
//    CalculatorController *controller = [[CalculatorController alloc]initWithNibName:@"CalculatorController" bundle:nil];
//    if(controller)
//    {
//        [self.navigationController pushViewController:controller animated:YES];
//    }
//    [controller release];
}

- (void)Secretary:(id)sender
{
    JIeanbaoViewController *controller = [[JIeanbaoViewController alloc]initWithNibName:@"JIeanbaoViewController" bundle:nil];
    if(controller)
    {
        [self.navigationController pushViewController:controller animated:YES];
    }
    [controller release];
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
        [bgView insertSubview:comboBgView belowSubview:combox];
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
- (void)dealloc
{
    [combox release];
    combox = nil;
    [comboBgView release],comboBgView = nil;
    [super dealloc];
}
//

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
