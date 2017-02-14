//
//  MallPayFinishedViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallPayFinishedViewController.h"
#import "UserOrderViewController.h"
@interface MallPayFinishedViewController ()

@property (nonatomic, strong) MallTopView *topView;
@property (nonatomic, strong) UIImageView *payFinIv;//支付完成图标
@property (nonatomic, strong) UILabel *congratitudeLb;//恭喜
@property (nonatomic, strong) UIView *payInfoView;
@property (nonatomic, strong) UILabel *payTitleLb;//支付金额标题
@property (nonatomic, strong) UILabel *payMoneyLb;//支付金额
@property (nonatomic, strong) UIButton *myOrderBtn;//查看我的订单
@property (nonatomic, strong) UIButton *doneBtn;//完成



@end

@implementation MallPayFinishedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.payFinIv];
    [self.view addSubview:self.congratitudeLb];
    [self.view addSubview:self.payInfoView];
    [self.view addSubview:self.myOrderBtn];
    [self.view addSubview:self.doneBtn];
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
    
    self.payFinIv.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.topView, 54)
    .widthIs(164)
    .heightIs(125);
    
    self.congratitudeLb.sd_layout
    .topSpaceToView(self.payFinIv, 18)
    .centerXEqualToView(self.payFinIv)
    .autoHeightRatio(0);
    [self.congratitudeLb setSingleLineAutoResizeWithMaxWidth:400];
    
    self.payTitleLb.sd_layout
    .topSpaceToView(self.payInfoView, 0)
    .leftSpaceToView(self.payInfoView, 0)
    .autoHeightRatio(0);
    [self.payTitleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.payMoneyLb.sd_layout
    .topEqualToView(self.payTitleLb)
    .leftSpaceToView(self.payTitleLb, 5)
    .autoHeightRatio(0);
    [self.payMoneyLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.payInfoView.sd_layout
    .topSpaceToView(self.congratitudeLb, 13)
    .centerXEqualToView(self.congratitudeLb)
    .autoHeightRatio(0);
    [self.payInfoView setupAutoWidthWithRightView:_payMoneyLb rightMargin:0];
    
    self.myOrderBtn.sd_layout
    .topSpaceToView(self.payInfoView, 45)
    .centerXEqualToView(self.view)
    .widthIs(274)
    .heightIs(50);
    
    [self.myOrderBtn setSd_cornerRadiusFromHeightRatio:@0.5];
    
    self.doneBtn.sd_layout
    .topSpaceToView(self.myOrderBtn, 13)
    .centerXEqualToView(self.myOrderBtn)
    .widthRatioToView(self.myOrderBtn, 1)
    .heightRatioToView(self.myOrderBtn, 1);
    [self.doneBtn setSd_cornerRadiusFromHeightRatio:@0.5];
    
}


#pragma mark ----------------点击事件

- (void)mallLookForMyOrderAction{
    //进入我的订单
    if (_isHotel) {
        //进入民宿订单列表页
        NSLog(@"进入民宿订单列表");
        UserOrderViewController * hotelOrderVC = [[UserOrderViewController alloc] init];
        [self.navigationController pushViewController:hotelOrderVC animated:YES];
        
    }else{
        UserOrderViewController * goodsOrderVC = [[UserOrderViewController alloc] init];
        goodsOrderVC.isGoodsOrder = YES;
        [self.navigationController pushViewController:goodsOrderVC animated:YES];
    }
}

- (void)mallDonePayAction{
    //进入完成。返回上级页面
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"支付完成" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popToRootViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UILabel *)congratitudeLb{
    if (_congratitudeLb == nil) {
        _congratitudeLb = [[UILabel alloc] init];
        _congratitudeLb.font = FONT(21);
        _congratitudeLb.textColor = SHENTEXTCOLOR;
        _congratitudeLb.text = @"恭喜您， 支付成功";
    }
    return _congratitudeLb;
}

- (UIImageView *)payFinIv{
    if (_payFinIv == nil) {
        _payFinIv = [[UIImageView alloc] init];
        _payFinIv.image = IMAGE(@"classify60");
    }
    return _payFinIv;
}

- (UILabel *)payMoneyLb{
    if (_payMoneyLb == nil) {
        _payMoneyLb = [[UILabel alloc] init];
        _payMoneyLb.font = FONT(15);
        _payMoneyLb.textColor = MALLColor;
        _payMoneyLb.text = [NSString stringWithFormat:@"¥ %@",_orderPrice];
    }
    return _payMoneyLb;
}

- (UILabel *)payTitleLb{
    if (_payTitleLb == nil) {
        _payTitleLb = [[UILabel alloc] init];
        _payTitleLb.font = FONT(15);
        _payTitleLb.textColor = LIGHTTEXTCOLOR;
        _payTitleLb.text = @"订单金额: ";
    }
    return _payTitleLb;
}

- (UIButton *)myOrderBtn{
    if (_myOrderBtn == nil) {
        _myOrderBtn = [[UIButton alloc] init];
        _myOrderBtn.backgroundColor = MALLColor;
        [_myOrderBtn setTitle:@"我的订单" forState:UIControlStateNormal];
        [_myOrderBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        _myOrderBtn.titleLabel.font = FONT(19);
        [_myOrderBtn addTarget:self action:@selector(mallLookForMyOrderAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myOrderBtn;
}

- (UIButton *)doneBtn{
    if (_doneBtn == nil) {
        _doneBtn = [[UIButton alloc] init];
        _doneBtn.backgroundColor = WHITECOLOR;
        _doneBtn.layer.borderWidth = 1;
        _doneBtn.layer.borderColor = GRAYCOLOR.CGColor;
        _doneBtn.titleLabel.font = FONT(19);
        [_doneBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_doneBtn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [_doneBtn addTarget:self action:@selector(mallDonePayAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneBtn;
}

- (UIView *)payInfoView{
    if (_payInfoView == nil) {
        _payInfoView = [[UIView alloc] init];
        _payInfoView.backgroundColor = WHITECOLOR;
        [_payInfoView addSubview:self.payTitleLb];
        [_payInfoView addSubview:self.payMoneyLb];
    }
    return _payInfoView;
}
@end
