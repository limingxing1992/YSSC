//
//  AppDelegate.m
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"//引导页
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>
#import <UMSocialCore/UMSocialCore.h>
#import <AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>
@interface AppDelegate ()<WXApiDelegate, GeTuiSdkDelegate>

@end

@implementation AppDelegate


#pragma mark - UI

- (void)creatUIFrame{
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:homeVc];
    [homeNavi.tabBarItem setTitle:@"首页"];
    [homeNavi.tabBarItem setImage:IMAGE(@"bt_home")];
    [homeNavi.tabBarItem setSelectedImage:IMAGE(@"bt_home2")];

    
    MallViewController *mallVc = [[MallViewController alloc] init];
    UINavigationController *mallNavi = [[UINavigationController alloc] initWithRootViewController:mallVc];
    [mallNavi.tabBarItem setTitle:@"商城"];
    [mallNavi.tabBarItem setImage:IMAGE(@"bt_shopping")];
    [mallNavi.tabBarItem setSelectedImage:IMAGE(@"bt_shopping2")];
    
    SurroundingAreaViewController *surroundingAreaVc = [[SurroundingAreaViewController alloc] init];
    UINavigationController *surroundingAreaNavi = [[UINavigationController alloc] initWithRootViewController:surroundingAreaVc];
    [surroundingAreaNavi.tabBarItem setTitle:@"玩周边"];
    [surroundingAreaNavi.tabBarItem setImage:IMAGE(@"bt_map")];
    [surroundingAreaNavi.tabBarItem setSelectedImage:IMAGE(@"bt_map2")];

    
    TravelDiaryViewController *travelDiaryVc = [[TravelDiaryViewController alloc] init];
    UINavigationController *travelDiaryNavi = [[UINavigationController alloc] initWithRootViewController:travelDiaryVc];
    [travelDiaryNavi.tabBarItem setTitle:@"游记"];
    [travelDiaryNavi.tabBarItem setImage:IMAGE(@"bt_diary")];
    [travelDiaryNavi.tabBarItem setSelectedImage:IMAGE(@"bt_diary2")];

    UserViewController *userVc = [[UserViewController alloc] init];
    UINavigationController *userNavi = [[UINavigationController alloc] initWithRootViewController:userVc];
    [userNavi.tabBarItem setTitle:@"我的"];
    [userNavi.tabBarItem setImage:IMAGE(@"bt_person")];
    [userNavi.tabBarItem setSelectedImage:IMAGE(@"bt_person2")];
    
    UITabBarController *mainTab = [[UITabBarController alloc] init];
    mainTab.tabBar.tintColor = BLACKTEXTCOLOR;
    mainTab.viewControllers = @[homeNavi, mallNavi, surroundingAreaNavi, travelDiaryNavi, userNavi];
    _window.rootViewController = mainTab;


}


- (void)appVersionSelect{
    
    
    NSString *appVersion = [YSSUserDefault valueForKey:@"appVersion"];
    
    if (appVersion == nil || ![appVersion isEqualToString:YSSC_VERSIONString]) {
        NSLog(@"第一次启动或者版本更新");
        [YSSUserDefault setValue:YSSC_VERSIONString forKey:@"appVersion"];
        GuideViewController *guidevc = [[GuideViewController alloc] init];
        YSSCWeakObj(self);
        guidevc.block = ^(){
            [weakself creatUIFrame];
        };
        self.window.rootViewController = guidevc;
    }else{
        [self creatUIFrame];
    }
}

- (void)setupBMKMap{
    BMKMapManager *manger = [[BMKMapManager alloc] init];
    [manger start:BAIDUKEY  generalDelegate:nil];
}

- (void)setUMShareSDK{
    
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMKey];
    //设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WXAppID appSecret:WXAppSecret redirectURL:@"http://mobile.umeng.com/social"];
    
    
    //设置分享到QQ互联的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQKEY  appSecret:QQSercret redirectURL:@"http://mobile.umeng.com/social"];
    
//    //设置新浪的appKey和appSecret
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:SINAKEY appSecret:SINASercret redirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    //移除微信收藏
//    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformType:UMSocialPlatformType_WechatFavorite];
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformType:UMSocialPlatformType_Sina];
}

- (void)setHUD{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.000 green:0.020 blue:0.059 alpha:0.85]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

- (void)setNetWork{
    //网络
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
//配置个推
- (void)setPush{
    // [ GTSdk ]：使用APPID/APPKEY/APPSECRENT启动个推
    [GeTuiSdk startSdkWithAppId:kGtAppId appKey:kGtAppKey appSecret:kGtAppSecret delegate:self];
    
    // 注册APNs - custom method - 开发者自定义的方法
    [self registerRemoteNotification];
    

}
#pragma mark - background fetch  唤醒
- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // [ GTSdk ]：Background Fetch 恢复SDK 运行
    [GeTuiSdk resume];
    
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark - 用户通知(推送) _自定义方法

/** 注册远程通知 */
- (void)registerRemoteNotification {
    
#ifdef __IPHONE_8_0
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        
        UIUserNotificationType types = (UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
    } else {
        UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert |
                                                                       UIRemoteNotificationTypeSound |
                                                                       UIRemoteNotificationTypeBadge);
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
    }
#else
    UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert |
                                                                   UIRemoteNotificationTypeSound |
                                                                   UIRemoteNotificationTypeBadge);
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
#endif
}

#pragma mark - 远程通知(推送)回调

/** 远程通知注册成功委托 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"\n>>>[DeviceToken Success]:%@\n\n", token);
    
    // [ GTSdk ]：向个推服务器注册deviceToken
    [GeTuiSdk registerDeviceToken:token];
}

/** 远程通知注册失败委托 */
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
}

#pragma mark - APP运行中接收到通知(推送)处理

/** APP已经接收到“远程”通知(推送) - (App运行在后台/App运行在前台)  */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    
    // [ GTSdk ]：将收到的APNs信息传给个推统计
    [GeTuiSdk handleRemoteNotification:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark - GeTuiSdkDelegate

/** SDK启动成功返回cid */
- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId {
    // [ GTSdk ]：个推SDK已注册，返回clientId
    NSLog(@">>[GTSdk RegisterClient]:%@", clientId);
}

/** SDK收到透传消息回调 */
- (void)GeTuiSdkDidReceivePayloadData:(NSData *)payloadData andTaskId:(NSString *)taskId andMsgId:(NSString *)msgId andOffLine:(BOOL)offLine fromGtAppId:(NSString *)appId {
    // [ GTSdk ]：汇报个推自定义事件(反馈透传消息)
    [GeTuiSdk sendFeedbackMessage:90001 andTaskId:taskId andMsgId:msgId];
    
}

/** SDK收到sendMessage消息回调 */
- (void)GeTuiSdkDidSendMessage:(NSString *)messageId result:(int)result {
}

/** SDK遇到错误回调 */
- (void)GeTuiSdkDidOccurError:(NSError *)error {
}

/** SDK运行状态通知 */
- (void)GeTuiSDkDidNotifySdkState:(SdkStatus)aStatus {
}

/** SDK设置推送模式回调  */
- (void)GeTuiSdkDidSetPushMode:(BOOL)isModeOff error:(NSError *)error {
}

#pragma mark - 主程序

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    [NSThread sleepForTimeInterval:2];
    
    //初始化服务器，默认为正式服务器
    if (![YSSUserDefault objectForKey:@"currentAPI"]) {
        [YSSUserDefault setObject:RealHome forKey:@"currentAPI"];
    }
//    NSLog(@"当前选择服务器:------- %@", [YSSUserDefault objectForKey:@"currentAPI"]);

    
    
    [self appVersionSelect];                                       //进行版本判断。是否初次启动或更新版本
    [self setupBMKMap];                                            //初始化百度地图
    [self setHUD];                                                 //配置HUD
    [WXApi registerApp:WXAppID withDescription:@"YSS"];            //注册微信支付
    [self setUMShareSDK];                                          //初始化友盟
    [self setNetWork];                                             //初始化网络
    [self setPush];                                                //初始化个推
    
    return YES;
}

#pragma mark --------- 支付回调

//9.0前的方法，为了适配低版本 保留
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    [WXApi handleOpenURL:url delegate:self];
    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
            [YSSCNotificationCenter postNotificationName:@"payResult" object:nil userInfo:@{@"code":resultDic[@"resultStatus"]}];
        }];
    }
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回authCode
        
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
        }];
    }

   return YES;

}

//9.0后的方法
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{

    
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            [YSSCNotificationCenter postNotificationName:@"payResult" object:nil userInfo:@{@"code":resultDic[@"resultStatus"]}];
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }
    
    [WXApi handleOpenURL:url delegate:self];
    return  YES;
}

-(void) onResp:(BaseResp*)resp
{
    //启动微信支付的response
    NSString *payResoult = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        switch (resp.errCode) {
            case 0:
                payResoult = @"支付结果：成功！";
                break;
            case -1:
                payResoult = @"支付结果：失败！";
                break;
            case -2:
                payResoult = @"用户已经退出支付！";
                break;
            default:
                payResoult = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr];
                break;
        }
        [YSSCNotificationCenter postNotificationName:@"payResult" object:nil userInfo:@{@"code":[NSNumber numberWithInt:resp.errCode]}];
    }
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
