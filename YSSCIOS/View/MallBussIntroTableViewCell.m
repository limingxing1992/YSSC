//
//  MallBussIntroTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussIntroTableViewCell.h"

@interface MallBussIntroTableViewCell ()
<
    UIWebViewDelegate
>

@property (nonatomic, strong) UIWebView *webView;


@end


@implementation MallBussIntroTableViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WHITECOLOR;
        [self addSubview:self.titleLb];
        [self addSubview:self.webView];
        self.titleLb.sd_layout
        .topSpaceToView(self, 10)
        .leftSpaceToView(self, 15)
        .rightSpaceToView(self, 15)
        .autoHeightRatio(0);
        
        
        self.webView.sd_layout
        .topSpaceToView(self.titleLb, 10)
        .leftSpaceToView(self, 10)
        .rightSpaceToView(self, 13);

        [self setupAutoHeightWithBottomView:_webView bottomMargin:10];
    }
    return self;
}
#pragma mark ----------------数据刷新

- (void)updateInfoWith:(NSDictionary *)dict{
    NSString *str = dict[@"description"];
    [self.webView loadHTMLString:str baseURL:nil];
}

#pragma mark ----------------web代理

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    CGFloat scrollHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];//获取html高度
    [self.webView setHeight_sd:scrollHeight];//修改高度
    [self updateLayout];//立马布局
}

//停止加载
- (void)dealloc{
    _webView.delegate = nil;
    [_webView stopLoading];
}
#pragma mark ----------------实例化

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        _webView.backgroundColor = WHITECOLOR;
        _webView.opaque = NO;
        _webView.scrollView.scrollEnabled = NO;
    }
    return _webView;
}

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.text = @"店铺简介";
        _titleLb.font = FONT(14);
        _titleLb.textColor = BLACKTEXTCOLOR;
    }
    return _titleLb;
}

@end
