//
//  MallGoodsDetailImageViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallGoodsDetailImageViewController.h"

@interface MallGoodsDetailImageViewController ()
@property (nonatomic, strong) MallTopView *topView;//
@property (nonatomic, strong) UIButton *backBtn;//返回顶部
@property (nonatomic, strong) UIWebView *webView;//图文详情

@end

@implementation MallGoodsDetailImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.backBtn];

    [self loadInfo];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.topView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(64);
    
    self.backBtn.sd_layout
    .centerYEqualToView(self.view)
    .rightSpaceToView(self.view, 15)
    .widthIs(40)
    .heightEqualToWidth(40);
    [self.backBtn setSd_cornerRadiusFromHeightRatio:@0.5];
    
    self.webView.sd_layout
    .topSpaceToView(self.topView, 0)
    .bottomSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0);

}


#pragma mark ----------------load

- (void)loadInfo{
    YSSCWeakObj(self);
    [SVProgressHUD showWithStatus:@"正在加载图文详情"];
    [YSSCShareBusinessManager.mallManager getGoodsDetailInfoWithMainMdf:@{@"mainGoodsMdf": _mdf} success:^(id responObject) {
        [SVProgressHUD dismiss];
        [weakself.webView loadHTMLString:responObject baseURL:nil];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];

}


#pragma mark ----------------点击事件

- (void)backToGoodsDetailAction{
    [self.navigationController popViewControllerAnimated:YES];

}


#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"图文详情" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UIButton *)backBtn{
    if (_backBtn == nil) {
        _backBtn = [[UIButton alloc] init];
        _backBtn.alpha = 0.8;
        [_backBtn setBackgroundImage:IMAGE(@"classify69") forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backToGoodsDetailAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

-(UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] init];
    }
    return _webView;
}
@end
