//
//  YSSCConstant.h
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#ifndef YSSCConstant_h
#define YSSCConstant_h

#define VERSION_ENVIRONMENT         1        // 0:外网正式环境   1:测试环境
#define LOG_SWITCH                  1        // 0:关闭日志      1:打开日志

/*
 iOS端SECRET_KEY
 */
#define ACMIOS_SECRET_KEY  @""

/*
 日志打印
 */
#if LOG_SWITCH
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(...)
#endif

/*
 版本环境
 */

#define RealHome @"http://115.236.69.110:8460/mountainVillage/"//正式服务器
#define HOSTNAME_YX @"http://115.236.69.110:8458//mountainVillage/"//杨新服务器
#define HOSTNAME @"http://115.236.69.110:8505/mountainVillage/"//吴德友服务器

/*
 获取屏幕宽度与高度
 */
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

/*
 获取通知中心
 */
#define YSSCNotificationCenter [NSNotificationCenter defaultCenter]
/*
 获取缓存
 */

#define YSSUserDefault [NSUserDefaults standardUserDefaults]

/*
 设置RGB颜色/设置RGBA颜色/clear背景颜色/16进制色转换宏
 */
#define YSSCRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define YSSCRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define YSSCClearColor [UIColor clearColor]

/*
 内部版本号
 */
#define YSSC_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/*
 发布版本号
 */
#define YSSC_VERSIONString  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/*APPID
 */
#define APPLICATION_ID @"1166424293"

/*
 宏定义单例化BusinessManager
 */
#define YSSCShareBusinessManager [BusinessManager shareBusinessManager]

/*
 弱引用
 */
#define YSSCWeakObj(type) __weak typeof(type) weak##type = type;

/*
 读取图片
 */
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
#define IMAGE(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

#define PlaceholderImage IMAGE(@"placeholderImage")
#define SmallPlaceholderImage IMAGE(@"SmallPlaceholder")

#define PlaceholderHeadImage IMAGE(@"placeholder_head")

/*
登录超时时间
 */
#define LoginTimeOverride 86400 //一天86400秒
#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

/*
 屏幕比相对于iPhone6
 */
#define KWidth_Scale    [UIScreen mainScreen].bounds.size.width/375.0f
#define KHeight_Scale [UIScreen mainScreen].bounds.size.height/667.0f
/*
 系统字体
 */
#define FONT(F) [UIFont systemFontOfSize:F]
/*
 cell宽高
 */
#define WIDTH_CELL self.frame.size.width
#define HEIGHT_CELL self.frame.size.height
#define STL_ORIGIN_X        self.frame.origin.x                             //坐标X
#define STL_ORIGIN_Y        self.frame.origin.y                             //坐标Y
#define PAGESIZE @10        //每页获取数据数量宏
/*
 常用色
 */
#define MALLColor YSSCRGBColor(77, 190, 165)// -- 绿色
#define BACKGROUNDCOLOR YSSCRGBColor(240, 240, 240)//背景色 f0f0f0
#define GRAYCOLOR YSSCRGBColor(230, 230, 230)//---浅色//e6e6e6、/切割线色
#define WHITECOLOR [UIColor whiteColor]//-- 白色  
#define BLACKTEXTCOLOR YSSCRGBColor(51, 51, 51)//-黑色///33333
#define LIGHTTEXTCOLOR YSSCRGBColor(153, 153, 153)//灰色///999999
#define SHENTEXTCOLOR YSSCRGBColor(102, 102, 102)//深色/666666

#define TAGBUTTON_BG YSSCRGBColor(236, 88, 78)//tag按钮背景红
#define SHADOW_COLOR YSSCRGBColor(235, 235, 235)//控件影子颜色 #ebebeb
#define ORANGE_COLOR YSSCRGBColor(253, 128, 35)//橘黄色
#define STL_SVProgessHUD(status)      [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@",status]];


/// 个推开发者网站中申请App时，注册的AppId、AppKey、AppSecret
#define kGtAppId           @"przXSoMAdf8rK9uOMXxUA4"
#define kGtAppKey          @"r9MJnPkcto5eL5ih9o4BF"
#define kGtAppSecret       @"wcC6v9jlS67v32iNuwT0s9"

/*
 QQ分享秘钥
 */
#define QQKEY @"1105689881"
#define QQSercret @"PMHKZJYg3FuGC55i"

/*
 新浪
 */
#define SINAKEY @"4213135696"
#define SINASercret @"19a43a38d9b7b8b1bf2ac36066029c5b"
/**
 友盟  
 */
#define UMKey @"57fb117d67e58ebb330008dd"

/*
 baidu地图
 */
#define BAIDUKEY @"RCGUC1qGB66tKptycCEgUElv72eo3IjZ"//百度秘
/*
 微信支付
 */
/**
 *  微信开放平台申请得到的 appid, 需要同时添加在 URL schema
 */
#define WXAppID @"wx4bdeb11b1339f074"
//#define WXAppID @"wx1a4a9ddd53f79edb"//知足乐

/**
 * 微信开放平台和商户约定的密钥
 *
 * 注意：不能hardcode在客户端，建议genSign这个过程由服务器端完成
 */
#define WXAppSecret @"e4ec5a00c84417b89a2bcc9250d2e935"
/**
 * 微信开放平台和商户约定的支付密钥
 *
 * 注意：不能hardcode在客户端，建议genSign这个过程由服务器端完成
 */
#define WXPartnerKey @"WebzhizuleWebzhizhule9876543210O"
/**
 *  微信公众平台商户模块生成的ID
 */
#define WXPartnerId @"1276703701"

/*
 支付宝支付
 */
#define AliPayPartner @"2088021177506090"
#define AliPaySeller @"zhizuleo2o@163.com"
#define AliPayPrivateKey @"MIICXAIBAAKBgQDWGKsNr6VTRnL/Nwj7jqMRUrmgsZmlFyzHsIDqIsMCIfxayuGTs0pTeEzwEZxkbMFcIhIPwX3BZkB/m+vvqXCPX/z4BZI5aINEauvZPpPOG+GsP8zba5pZef3eQOFYWlwJfLwQ/tt6ZAz+pJk066zf48gekLbqYVlebfh7ZAgIYQIDAQABAoGAK6oASNxHxYIatf5NcLCYhVHv1dwiz864LUnMIPRR/T9dLk8uTmdEg12Ho3aUBM9BaD7ynBAES8tE4EG2jrxp3hRQRrc/tAHAHzNtgudnbikkbgBRA8kgVs38qJ0O0yhINkgZ/Jk77pK26zfO1JO+jd5bRstX9nNi7OmSq8PSECECQQDy9OG6YDOMCkqKlV+SnmwI341OyhuZ+QfRrJCaWv5eQS3gq+Q+H9uwUZYltuppX1ey6CjSJknSQ96lUYyEfBU9AkEA4ZckDgMwUJ1Fp43vrOjnVJO9K3wZ6YfikDu5t7JcdBeDsOWG01bqsGi+q6m0myRSbhDudFApcHN1Wt/oMtPZ9QJAL5e02DOcJWSmsXsNW8VY2GwiXDrPKVxVIceyE+qbRY9zEz3Y2iqXeHSi+wRX6whYP52m0XPapivRY4UUB6fe6QJAQdJJsNT5WewpkLP3RKpIJQNeZLu3C86cKp1imNiv5SefQxQVfMCVhZdqWsgPbFzyuC60hLeG/8qQaU1/gKUTqQJBAJZvkEp8UGzkQsBtDSzaQlqEVgxRZkC6k7++42dUnf8r6FqQQmISZHvp8lL9HDf+aag77UOAq0Ub7dIEUtaU+14="


#endif /* YSSCConstant_h */
