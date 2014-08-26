//
//  PartnerConfig.h
//  AlipaySdkDemo
//
//  Created by ChaoGanYing on 13-5-3.
//  Copyright (c) 2013年 RenFei. All rights reserved.
//
//  提示：如何获取安全校验码和合作身份者id
//  1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
//  2.点击“商家服务”(https://b.alipay.com/order/myorder.htm)
//  3.点击“查询合作者身份(pid)”、“查询安全校验码(key)”
//

#ifndef MQPDemo_PartnerConfig_h
#define MQPDemo_PartnerConfig_h

//合作身份者id，以2088开头的16位纯数字
#define PartnerID @"2088801453626661"
//收款支付宝账号
#define SellerID  @"ssky365@163.com"

//安全校验码（MD5）密钥，以数字和字母组成的32位字符
#define MD5_KEY @"wtqsa4tnijgyvzsjquto4iyo3t5felzj"

//商户私钥，自助生成
#define PartnerPrivKey @"MIICeQIBADANBgkqhkiG9w0BAQEFAASCAmMwggJfAgEAAoGBAKi1qO+yTVnXPcV0RlWH9qs+abniiCOKjFuyqdL9lLtsE0vdixNIY9JzelfnJ2wtEfVL67qxgGeI2cm9q4FW6CttytxtaHsPlhlmJzC0PlWA3Ordjw3c58vgoPIkpy6y2bSZKevruLdwaAC49hCR4DvuJ0JoMfJhEtP0Kz5OD4WdAgMBAAECgYEAlPum7dVU/WtYP1BI9CsXJ238S4zCkDA/dpK16X7JoyDzgWFo+WRJ0oTrm0ijxaGfZDDhQIKTU9rECKWYGKW4a4KCqkM6YzK1O8t5d6ZBCAC5vv4IRvmdkpmWEet+Yo3z+u56DU1xTBwWj1xXW13CNXXRwEeY2MJfUnJbfXCfVTkCQQDQRIhptw4DsQ5MZLiKV7GUB1jhaau7GQxFptQn0+Vu7rY1QT019nsmuC8N3gkknr28FJ/Q1gOK2DRD+9+8Ii6fAkEAz2AtZgpFxUlUGfCZusy8WixL9qWEGG11jXA96usFnwLZgYPLYn1tUc4hb50WFLyQdtDinlNORVFmkx1d98tuQwJBAMbvL34LJI/SJ95AtyUt7ql++x8VWLw2iMpfOHdyp8z2p4Tm9Bj/f1LUy91rIUChgIqPCLjqNCgDrKjjhiqmW/ECQQCuQJXFQWqBLW3C4j57DaBTcRdfqJMH56o4cBFHPbcad02HG9Sh7N0YOUo1PF0ajZwiisFx4nRJoO29PpcAKet7AkEAs6LSU6VtZgvrC/XRMiNhE9LW/2bpXe13mTfDhmcdxG5DxHmLNkiY87Jofc90byvESExO5rEY6TbP2b5W7pS0/A=="


//支付宝公钥
#define AlipayPubKey   @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB"

#endif
