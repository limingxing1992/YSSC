//
//  HomeAdWebViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//  临时支付页面

#import "HomeAdWebViewController.h"

@interface HomeAdWebViewController ()<UIWebViewDelegate>

/**webView*/
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) YSSNavView *navBar;

@end

@implementation HomeAdWebViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"协议"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself dismissViewControllerAnimated:YES completion:nil];
        };
        
    }
    return _navBar;
}

- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] init];
        _webView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);
        _webView.delegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.webView];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *allHTML = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
//    NSLog(@"html = %@",allHTML);
    if ([allHTML containsString:@"支付成功"]) {
        [SVProgressHUD showSuccessWithStatus:@"支付成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    }
    
    if ([allHTML containsString:@"交易已经支付"]) {
        [SVProgressHUD showErrorWithStatus:@"交易已经支付"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    }
}



@end
