//
//  WithdrawViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/10/11.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "WithdrawViewController.h"

@interface WithdrawViewController ()
<
    UITextFieldDelegate
>

@property (nonatomic, strong) MallTopView *topView;
/** 提现明细*/
@property (nonatomic, strong) UIButton *withdrawBtn;
/** 立即提现*/
@property (nonatomic, strong) UIButton *nowCarshBtn;
/** 背景画布*/
@property (nonatomic, strong) UIScrollView *contentView;
/** 余额画布*/
@property (nonatomic, strong) UIView *balanceView;
/** 余额*/
@property (nonatomic, strong) UILabel *balanceLb;
/** 余额标题*/
@property (nonatomic, strong) UILabel *balanceTitleLb;
/** 余额图标*/
@property (nonatomic, strong) UIImageView *balanceIv;
/**提现画布*/
@property (nonatomic, strong) UIView *withdrawView;
/** 提现标题*/
@property (nonatomic, strong) UILabel *withdrawTitleLb;
/** 提现图标*/
@property (nonatomic, strong) UIImageView *withdrawIv;
/** 提现金额输入框*/
@property (nonatomic, strong) UITextField *withdrawTf;
/** 下划线1*/
@property (nonatomic, strong) UIView *withLineView;

@property (nonatomic, strong) UIView *withLineview_1;

/** 可提现余额*/
@property (nonatomic, strong) UILabel *withValutedLb;
/** 提示*/
@property (nonatomic, strong) UILabel *withNoticeLb;


/** 到账画布*/
@property (nonatomic, strong) UIView *accountView;
/** 切割线——1*/
@property (nonatomic, strong) UIView *lineView_1;
/** 切割线——2*/
@property (nonatomic, strong) UIView *lineView_2;
/** 切割线——3*/
@property (nonatomic, strong) UIView *lineView_3;
/** 切割线——4*/
@property (nonatomic, strong) UIView *lineView_4;
/** 切割线——5*/
@property (nonatomic, strong) UIView *lineView_5;
/** 切割线——6*/
@property (nonatomic, strong) UIView *lineView_6;
/** 到账时间*/
@property (nonatomic, strong) UILabel *timeTitleLb;
/** 3天内到账*/
@property (nonatomic, strong) UILabel *timeLb;
/** 提现账号*/
@property (nonatomic, strong) UILabel *withdrawStyleLb;
/** 支付宝方式选择*/
@property (nonatomic, strong) UIView *alipayView;
/** 支付宝图标*/
@property (nonatomic, strong) UIImageView *alipayIv;
/** 支付宝标题*/
@property (nonatomic, strong) UILabel *alipayLb;
/** 银行卡方式选择*/
@property (nonatomic, strong) UIView *bankView;
/** 银行卡图标*/
@property (nonatomic, strong) UIImageView *bankIv;
/** 银行卡标题*/
@property (nonatomic, strong) UILabel *bankLb;
/** 账户名称*/
@property (nonatomic, strong) UILabel *nameTitleLb;
/** 账户名称输入*/
@property (nonatomic, strong) UITextField *nameTf;
/** 账户账号*/
@property (nonatomic, strong) UILabel *accountTitleLb;
/** 账号输入*/
@property (nonatomic, strong) UITextField *accountTf;
/** 银行名称*/
@property (nonatomic, strong) UILabel *bankTitleLb;
/** 银行选择*/
@property (nonatomic, strong) UITextField *bankTf;




/** 当前选择提现方式 0== 支付宝 1==银行。默认银行*/
@property (nonatomic, assign) NSInteger styleFlag;
/** 可提现金额*/
@property (nonatomic, assign) float withdrawNum;

@end

@implementation WithdrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BACKGROUNDCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.nowCarshBtn];

    _styleFlag = 1;
    [YSSCNotificationCenter addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [YSSCNotificationCenter addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self requestData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/** 注释*/
- (void)dealloc{
    [YSSCNotificationCenter removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    self.topView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(64);
    
    self.withdrawBtn.sd_layout
    .centerYIs(42)
    .rightSpaceToView(self.topView, 0)
    .heightIs(24);
    [self.withdrawBtn setupAutoSizeWithHorizontalPadding:12 buttonHeight:24];
    
    self.nowCarshBtn.sd_layout
    .bottomSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(50);

    self.contentView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .bottomSpaceToView(self.nowCarshBtn, 0);

    [self setContentSubViews];

}

- (void)viewDidAppear:(BOOL)animated{
    [self.withdrawTf becomeFirstResponder];
}

/** 布局ContentView*/
- (void)setContentSubViews{
    self.balanceView.sd_layout
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(100);
    [self setBalanceViewSubViews];//布局余额视图
    
    self.withdrawView.sd_layout
    .topSpaceToView(self.balanceView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(115);
    [self setWithdrawViewSubViews];//布局提现视图
    
    self.withLineView.sd_layout
    .topSpaceToView(_withdrawView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(0.5);
    
    self.withValutedLb.sd_layout
    .centerYIs(230)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.withValutedLb setSingleLineAutoResizeWithMaxWidth:500];
    
    self.withNoticeLb.sd_layout
    .centerYEqualToView(_withValutedLb)
    .leftSpaceToView(_withValutedLb, 3)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    
    self.withLineview_1.sd_layout
    .topSpaceToView(_withdrawView, 29.5)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(0.5);
    
    self.accountView.sd_layout
    .topSpaceToView(self.withdrawView, 30)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(300);
    [self setAccountViewSubViews];//布局账户选择视图
    
    [self.contentView setupAutoContentSizeWithBottomView:_accountView bottomMargin:20];
    

}
/** 布局余额视图*/
- (void)setBalanceViewSubViews{
    self.balanceIv.sd_layout
    .topSpaceToView(self.balanceView, 12)
    .leftSpaceToView(self.balanceView, 15)
    .heightIs(14)
    .widthIs(14);
    
    self.balanceTitleLb.sd_layout
    .centerYEqualToView(self.balanceIv)
    .leftSpaceToView(self.balanceIv, 5)
    .rightSpaceToView(self.balanceView, 15)
    .autoHeightRatio(0);
    
    self.balanceLb.sd_layout
    .centerXEqualToView(self.balanceView)
    .centerYIs(60)
    .autoHeightRatio(0);
    [self.balanceLb setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
}
/** 布局提现视图*/
- (void)setWithdrawViewSubViews{
    self.withdrawTitleLb.isAttributedContent = YES;
    self.withdrawTitleLb.sd_layout
    .topSpaceToView(self.withdrawView, 22)
    .leftSpaceToView(self.withdrawView, 15)
    .rightSpaceToView(self.withdrawView, 15)
    .autoHeightRatio(0);
    
    self.withdrawIv.sd_layout
    .centerYIs(70)
    .leftEqualToView(self.withdrawTitleLb)
    .heightIs(20)
    .widthEqualToHeight();
    
    self.withdrawTf.sd_layout
    .centerYEqualToView(self.withdrawIv)
    .leftSpaceToView(self.withdrawIv, 10)
    .rightSpaceToView(self.withdrawView, 0)
    .heightIs(25);
    
//    self.withValutedLb.sd_layout
//    .topSpaceToView(_withLineView, 5)
//    .leftEqualToView(_withdrawIv)
//    .autoHeightRatio(0);
//    [_withValutedLb setSingleLineAutoResizeWithMaxWidth:450];
//    
//    self.withNoticeLb.sd_layout
//    .topEqualToView(_withValutedLb)
//    .leftSpaceToView(_withValutedLb, 10)
//    .rightSpaceToView(_withdrawView, 15)
//    .autoHeightRatio(0);
//

}
/** 布局账户选择视图*/
- (void)setAccountViewSubViews{
    self.lineView_1.sd_layout
    .topSpaceToView(self.accountView, 49.5)
    .leftSpaceToView(self.accountView, 0)
    .rightSpaceToView(self.accountView, 0)
    .heightIs(0.5);
    self.lineView_2.sd_layout
    .topSpaceToView(self.lineView_1, 49.5)
    .leftSpaceToView(self.accountView, 0)
    .rightSpaceToView(self.accountView, 0)
    .heightIs(0.5);
    self.lineView_3.sd_layout
    .topSpaceToView(self.lineView_2, 49.5)
    .leftSpaceToView(self.accountView, 0)
    .rightSpaceToView(self.accountView, 0)
    .heightIs(0.5);
    self.lineView_4.sd_layout
    .topSpaceToView(self.lineView_3, 49.5)
    .leftSpaceToView(self.accountView, 0)
    .rightSpaceToView(self.accountView, 0)
    .heightIs(0.5);
    self.lineView_5.sd_layout
    .topSpaceToView(self.lineView_4, 49.5)
    .leftSpaceToView(self.accountView, 0)
    .rightSpaceToView(self.accountView, 0)
    .heightIs(0.5);
    self.lineView_6.sd_layout
    .centerYIs(112.5)
    .centerXEqualToView(_accountView)
    .widthIs(0.5)
    .heightIs(35);
    
    self.timeTitleLb.sd_layout
    .centerYIs(24.5)
    .leftSpaceToView(self.accountView, 15)
    .autoHeightRatio(0);
    [self.timeTitleLb setSingleLineAutoResizeWithMaxWidth:400];
    
    _timeLb.sd_layout
    .centerYEqualToView(_timeTitleLb)
    .rightSpaceToView(_accountView, 15)
    .autoHeightRatio(0);
    [_timeLb setSingleLineAutoResizeWithMaxWidth:400];
    
    _withdrawStyleLb.sd_layout
    .centerYIs(74.5)
    .leftEqualToView(_timeTitleLb)
    .rightSpaceToView(_accountView, 15)
    .autoHeightRatio(0);

    _alipayView.sd_layout
    .topSpaceToView(self.lineView_2, 0)
    .leftSpaceToView(_accountView, 0)
    .widthRatioToView(_accountView, 0.5)
    .heightIs(49);
    
    _bankView.sd_layout
    .topSpaceToView(_lineView_2, 0)
    .rightSpaceToView(_accountView, 0)
    .widthRatioToView(_accountView, 0.5)
    .heightIs(49);
    
    _alipayLb.sd_layout
    .centerXIs(SCREEN_WIDTH/ 4 + 13)
    .centerYEqualToView(_alipayView)
    .autoHeightRatio(0);
    [_alipayLb setSingleLineAutoResizeWithMaxWidth:400];
    
    _alipayIv.sd_layout
    .centerYEqualToView(_alipayLb)
    .rightSpaceToView(_alipayLb, 5)
    .heightIs(21)
    .widthEqualToHeight();
    
    _bankLb.sd_layout
    .centerXIs(SCREEN_WIDTH / 4 + 13)
    .centerYEqualToView(_bankView)
    .autoHeightRatio(0);
    [_bankLb setSingleLineAutoResizeWithMaxWidth:400];
    
    _bankIv.sd_layout
    .centerYEqualToView(_bankView)
    .rightSpaceToView(_bankLb, 5)
    .heightIs(22)
    .widthEqualToHeight();
    
    
    _accountTitleLb.sd_layout
    .centerYIs(224.5)
    .leftSpaceToView(_accountView, 15)
    .autoHeightRatio(0);
    [_accountTitleLb setSingleLineAutoResizeWithMaxWidth:400];
    
    _accountTf.sd_layout
    .centerYEqualToView(_accountTitleLb)
    .leftSpaceToView(_accountTitleLb, 10)
    .rightSpaceToView(_accountView, 15)
    .heightIs(49.5);

    
    _nameTitleLb.sd_layout
    .centerYIs(174.5)
    .leftSpaceToView(_accountView, 15)
    .autoHeightRatio(0);
    [_nameTitleLb setSingleLineAutoResizeWithMaxWidth:400];
    
    _nameTf.sd_layout
    .centerYEqualToView(_nameTitleLb)
    .leftEqualToView(_accountTf)
    .rightSpaceToView(_accountView, 15)
    .heightIs(49.5);
    
    _bankTitleLb.sd_layout
    .centerYIs(274.5)
    .leftEqualToView(_nameTitleLb)
    .autoHeightRatio(0);
    [_bankTitleLb setSingleLineAutoResizeWithMaxWidth:400];
    
    _bankTf.sd_layout
    .centerYEqualToView(_bankTitleLb)
    .leftEqualToView(_accountTf)
    .rightSpaceToView(_accountView, 15)
    .heightIs(49.5);
}


#pragma mark ----------------请求数据

- (void)requestData{
    YSSCWeakObj(self);
    [SVProgressHUD showWithStatus:@""];
    [YSSCShareBusinessManager.loginManger getWithdrawMoneyWithSuccess:^(id responObject) {
        NSDictionary *data = responObject;
        NSNumber *balance = data[@"balance"];
        NSNumber *withdraw = data[@"amount"];
        float  ba = [balance floatValue];
        float wi = [withdraw floatValue];
        _withdrawNum = wi;
        _balanceLb.text = [NSString stringWithFormat:@"%.2f", ba];
        _withValutedLb.text = [NSString stringWithFormat:@"可提现余额 %.2f元", wi];
        [SVProgressHUD dismiss];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:errorMsg];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        });
    }];

}


#pragma mark ----------------文本输入代理
/** 提现金额只能输入数字或  .  */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == _withdrawTf) {
        if ([string validateNumber] || [string isEqualToString:@"."]) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return YES;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _withdrawTf) {
        [_nameTf becomeFirstResponder];
    }else if (textField == _nameTf){
        [_accountTf becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    return YES;
}


#pragma mark ----------------键盘通知
//根据屏幕高度不同适配
- (void)keyboardDidShow:(NSNotification *)notification{
    
    if (_withdrawTf.isFirstResponder) {
        return;
    }
    
    BOOL ret = SCREEN_HEIGHT - 64 - 50 > self.contentView.contentSize.height;
    CGFloat h;
    if (ret) {
        h = SCREEN_HEIGHT - 64 - 50 - self.contentView.contentSize.height;
    }else{
        h = self.contentView.contentSize.height - SCREEN_HEIGHT + 64 + 50;
    }
    

    
    NSDictionary *info = [notification userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    
    if (ret) {
        _contentView.contentOffset = CGPointMake(0, keyboardSize.height - h);
    }else{
        _contentView.contentOffset = CGPointMake(0, keyboardSize.height + h);
    }
}

- (void)keyboardDidHide:(NSNotification *)notification{
    if (_withdrawTf.isFirstResponder) {
        return;
    }

    _contentView.contentOffset = CGPointZero;
}

/***********************************************
 函数名称 : alertViewWithTitle:
 函数秒数 ：弹窗提醒
 输入参数 : str
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)alertViewWithTitle:(NSString *)title message:(NSString *)message{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 9.0) {
        [action setValue:MALLColor forKey:@"_titleTextColor"];
    }
    [alertVc addAction:action];
    [self presentViewController:alertVc animated:YES completion:nil];
    
}


#pragma mark ----------------提现
/** 查看提现明细*/
- (void)withdrawAction{
    //查看提现明细
    AccountDetailListViewController *detailList = [[AccountDetailListViewController alloc] init];
    [self.navigationController pushViewController:detailList animated:YES];
}
/** 立即提现*/
- (void)withdrawNowAction{
//    //判断是否有可提现余额
    if (!_withdrawTf.text.floatValue) {
        [SVProgressHUD showErrorWithStatus:@"暂无可提现余额"];
        return;
    }
    if (_withdrawTf.text.floatValue < 1000.f) {
        [self alertViewWithTitle:@"提醒" message:@"单次提现金额不得低于1000元"];
        return;
    }
    
    if (_withdrawTf.text.floatValue > _withdrawNum) {
        [self alertViewWithTitle:@"提醒" message:@"账户可提现余额不足"];
        return;
    }
    
    
    //判断输入框内容是否完善
    if (!_nameTf.text.length || !_accountTf.text.length) {
        [self alertViewWithTitle:@"提醒" message:@"请输入账户完整信息"];
        return;
    }
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setValue:_nameTf.text forKey:@"name"];//支付名称
    [parameters setValue:_accountTf.text forKey:@"account"];//账号
    [parameters setValue:_withdrawTf.text forKey:@"amount"];//金额
    NSNumber *type;//支付方式
    switch (_styleFlag) {
        case 0:
        {
            type = @10;
        }
            break;
        case 1:
        {
            if (!_bankTf.text.length) {
                [self alertViewWithTitle:@"提醒" message:@"请输入正确银行名称"];
                return;
            }
            type = @20;
            [parameters setValue:_bankTf.text forKey:@"bank_name"];
        }
            break;
        default:
            break;
    }
    [parameters setValue:type forKey:@"type"];//支付方式
    [SVProgressHUD showWithStatus:@"提交申请中"];
    
    YSSCWeakObj(self);
    [YSSCShareBusinessManager.loginManger postSumbitWithdrawApplyWithParameters:parameters
                                                                        success:^(id responObject) {
                                                                            [weakself alertViewWithTitle:@"申请成功" message:@"已成功提交申请，请耐心等待"];
                                                                            [SVProgressHUD dismiss];
                                                                            [weakself requestData];//提交申请成功后。刷新界面
                                                                        }
                                                                        failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                            [weakself alertViewWithTitle:@"申请失败" message:errorMsg];
                                                                            [SVProgressHUD dismiss];
                                                                        }];
    
}
/** 点击支付宝选择*/
- (void)apliayStyleAction{
    if (_styleFlag == 0) {
        return;
    }
    _styleFlag = 0;
    [self updateStyleUI];
}
/** 点击银行卡账户*/
- (void)bankStyleAction{
    if (_styleFlag == 1) {
        return;
    }
    _styleFlag = 1;
    [self updateStyleUI];
}
/** 根据当前选择支付方式刷新界面*/
- (void)updateStyleUI{
    //清空输入框
    _nameTf.text = nil;
    _accountTf.text = nil;
    _bankTf.text = nil;
    _alipayIv.image = IMAGE(@"alipay");
    _alipayLb.textColor = SHENTEXTCOLOR;
    _bankIv.image = IMAGE(@"bank");
    _bankLb.textColor = SHENTEXTCOLOR;
    switch (_styleFlag) {
        case 0:
        {
            _alipayIv.image = IMAGE(@"alipaySelected");
            _alipayLb.textColor = MALLColor;
            _accountTitleLb.text = @"支付宝账户";
            _accountView.sd_layout
            .heightIs(225);
            [_bankTitleLb removeFromSuperview];
            [_bankTf removeFromSuperview];
        }
            break;
        case 1:
        {
            _bankIv.image = IMAGE(@"bankSelected");
            _bankLb.textColor = MALLColor;
            _accountTitleLb.text = @"银行账号  ";
            _accountView.sd_layout
            .heightIs(270);
            [_accountView addSubview:_bankTf];
            [_accountView addSubview:_bankTitleLb];
        }
            break;
        default:
            break;
    }
}
/** 放弃输入*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [_accountTf resignFirstResponder];
    [_nameTf resignFirstResponder];
    [_bankTf resignFirstResponder];
    [_withdrawTf resignFirstResponder];
}


#pragma mark ----------------实例

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"提现" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
        [_topView addSubview:self.withdrawBtn];
    }
    return _topView;
}

- (UIButton *)withdrawBtn{
    if (_withdrawBtn == nil) {
        _withdrawBtn = [[UIButton alloc] init];
        [_withdrawBtn setTitle:@"提现明细" forState:UIControlStateNormal];
        [_withdrawBtn setTitleColor:MALLColor forState:UIControlStateNormal];
        _withdrawBtn.titleLabel.font = FONT(14);
        [_withdrawBtn addTarget:self action:@selector(withdrawAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _withdrawBtn;
}

- (UIButton *)nowCarshBtn{
    if (_nowCarshBtn == nil) {
        _nowCarshBtn = [[UIButton alloc] init];
        _nowCarshBtn.titleLabel.font = FONT(15);
        _nowCarshBtn.backgroundColor = MALLColor;
        [_nowCarshBtn setTitle:@"申请提现" forState:UIControlStateNormal];
        [_nowCarshBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_nowCarshBtn addTarget:self action:@selector(withdrawNowAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nowCarshBtn;
}

- (UIScrollView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIScrollView alloc] init];
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.backgroundColor = BACKGROUNDCOLOR;
        [_contentView addSubview:self.balanceView];
        [_contentView addSubview:self.withdrawView];
        [_contentView addSubview:self.withLineView];
        [_contentView addSubview:self.withValutedLb];
        [_contentView addSubview:self.withNoticeLb];
        [_contentView addSubview:self.withLineview_1];
        [_contentView addSubview:self.accountView];
    }
    return _contentView;
}

- (UIView *)balanceView{
    if (_balanceView == nil) {
        _balanceView = [[UIView alloc] init];
        _balanceView.backgroundColor = MALLColor;
        [_balanceView addSubview:self.balanceIv];
        [_balanceView addSubview:self.balanceTitleLb];
        [_balanceView addSubview:self.balanceLb];
    }
    return _balanceView;
}

- (UIImageView *)balanceIv{
    if (_balanceIv == nil) {
        _balanceIv = [[UIImageView alloc] init];
        _balanceIv.image = IMAGE(@"classify99");
    }
    return _balanceIv;
}

- (UILabel *)balanceTitleLb{
    if (_balanceTitleLb == nil) {
        _balanceTitleLb = [[UILabel alloc] init];
        _balanceTitleLb.text = @"五云铢余额：";
        _balanceTitleLb.font = FONT(14);
        _balanceTitleLb.textColor = WHITECOLOR;
    }
    return _balanceTitleLb;

}

- (UILabel *)balanceLb{
    if (_balanceLb == nil) {
        _balanceLb = [[UILabel alloc] init];
        _balanceLb.font = FONT(33);
        _balanceLb.textColor = WHITECOLOR;
        _balanceLb.text = @"0.00";
    }
    return _balanceLb;
}

- (UIView *)withdrawView{
    if (_withdrawView == nil) {
        _withdrawView = [[UIView alloc] init];
        _withdrawView.backgroundColor = WHITECOLOR;
        [_withdrawView addSubview:self.withdrawTitleLb];
        [_withdrawView addSubview:self.withdrawIv];
        [_withdrawView addSubview:self.withdrawTf];
//        [_withdrawView addSubview:self.withLineView];
//        [_withdrawView addSubview:self.withValutedLb];
//        [_withdrawView addSubview:self.withNoticeLb];
    }
    return _withdrawView;
}

- (UILabel *)withdrawTitleLb{
    if (_withdrawTitleLb == nil) {
        _withdrawTitleLb = [[UILabel alloc] init];
        _withdrawTitleLb.font = FONT(14);
        _withdrawTitleLb.textColor = SHENTEXTCOLOR;
        NSString *str = @"提现金额(60%)";
        _withdrawTitleLb.attributedText = [str attributeStrWithAttributes:@{NSForegroundColorAttributeName : MALLColor} range:NSMakeRange(5, 3)];
    }
    return _withdrawTitleLb;

}

- (UIImageView *)withdrawIv{
    if (_withdrawIv == nil) {
        _withdrawIv = [[UIImageView alloc] init];
        _withdrawIv.image = IMAGE(@"withdrawIv");
    }
    return _withdrawIv;
}

- (UITextField *)withdrawTf{
    if (_withdrawTf == nil) {
        _withdrawTf = [[UITextField alloc] init];
        _withdrawTf.font = FONT(25);
        _withdrawTf.textColor = BLACKTEXTCOLOR;
        _withdrawTf.delegate = self;
        _withdrawTf.clearButtonMode = UITextFieldViewModeWhileEditing;
        _withdrawTf.returnKeyType = UIReturnKeyNext;
    }
    return _withdrawTf;

}

- (UIView *)withLineView{
    if (_withLineView == nil) {
        _withLineView = [[UIView alloc] init];
        _withLineView.backgroundColor = GRAYCOLOR;
    }
    return _withLineView;
}

- (UIView *)withLineview_1{
    if (!_withLineview_1) {
        _withLineview_1 = [[UIView alloc] init];
        _withLineview_1 .backgroundColor = GRAYCOLOR;
    }
    return _withLineview_1;
}

- (UILabel *)withValutedLb{
    if (_withValutedLb == nil) {
        _withValutedLb = [[UILabel alloc] init];
        _withValutedLb.font = FONT(12);
        _withValutedLb.textColor = ORANGE_COLOR;
        _withValutedLb.text = @"可提现余额 0.00元";
    }
    return _withValutedLb;
}

- (UILabel *)withNoticeLb{
    if (_withNoticeLb == nil) {
        _withNoticeLb = [[UILabel alloc] init];
        _withNoticeLb.font = FONT(12);
        _withNoticeLb.textColor = ORANGE_COLOR;
        _withNoticeLb.text = @"(提现金额不得低于 1000元)";
    }
    return _withNoticeLb;
}

- (UIView *)accountView{
    if (_accountView == nil) {
        _accountView = [[UIView alloc] init];
        _accountView.backgroundColor = WHITECOLOR;
        [_accountView sd_addSubviews:@[self.lineView_1,
                                       self.lineView_2,
                                       self.lineView_3,
                                       self.lineView_4,
                                       self.lineView_5,
                                       self.lineView_6]];
        [_accountView addSubview:self.timeTitleLb];
        [_accountView addSubview:self.timeLb];
        [_accountView addSubview:self.withdrawStyleLb];
        [_accountView addSubview:self.alipayView];
        [_accountView addSubview:self.bankView];
        [_accountView addSubview:self.nameTitleLb];
        [_accountView addSubview:self.nameTf];
        [_accountView addSubview:self.accountTitleLb];
        [_accountView addSubview:self.accountTf];
        [_accountView addSubview:self.bankTitleLb];
        [_accountView addSubview:self.bankTf];
    }
    return _accountView;


}

- (UIView *)lineView_1{
    if (_lineView_1 == nil) {
        _lineView_1 = [[UIView alloc] init];
        _lineView_1.backgroundColor = GRAYCOLOR;
    }
    return _lineView_1;
}

- (UIView *)lineView_2{
    if (_lineView_2 == nil) {
        _lineView_2 = [[UIView alloc] init];
        _lineView_2.backgroundColor = GRAYCOLOR;
    }
    return _lineView_2;
}

- (UIView *)lineView_3{
    if (_lineView_3 == nil) {
        _lineView_3 = [[UIView alloc] init];
        _lineView_3.backgroundColor = GRAYCOLOR;
    }
    return _lineView_3;
}

- (UIView *)lineView_4{
    if (_lineView_4 == nil) {
        _lineView_4 = [[UIView alloc] init];
        _lineView_4.backgroundColor = GRAYCOLOR;
    }
    return _lineView_4;
}

- (UIView *)lineView_5{
    if (_lineView_5 == nil) {
        _lineView_5 = [[UIView alloc] init];
        _lineView_5.backgroundColor = GRAYCOLOR;
    }
    return _lineView_5;
}

- (UIView *)lineView_6{
    if (_lineView_6 == nil) {
        _lineView_6 = [[UIView alloc] init];
        _lineView_6.backgroundColor = GRAYCOLOR;
    }
    return _lineView_6;
}

- (UILabel *)timeTitleLb{
    if (_timeTitleLb == nil) {
        _timeTitleLb = [[UILabel alloc] init];
        _timeTitleLb.font = FONT(14);
        _timeTitleLb.text = @"到账时间";
        _timeTitleLb.textColor = SHENTEXTCOLOR;
    }
    return _timeTitleLb;
}

- (UILabel *)timeLb{
    if (_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT(14);
        _timeLb.text = @"3天之内到账";
        _timeLb.textColor = SHENTEXTCOLOR;
    }
    return _timeLb;
}

- (UILabel *)withdrawStyleLb{
    if (_withdrawStyleLb == nil) {
        _withdrawStyleLb = [[UILabel alloc] init];
        _withdrawStyleLb.font = FONT(14);
        _withdrawStyleLb.textColor = SHENTEXTCOLOR;
        _withdrawStyleLb.text = @"提现账号";
    }
    return _withdrawStyleLb;
}

- (UIView *)alipayView{
    if (_alipayView == nil) {
        _alipayView = [[UIView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(apliayStyleAction)];
        [_alipayView addGestureRecognizer:tap];
        [_alipayView addSubview:self.alipayIv];
        [_alipayView addSubview:self.alipayLb];
    }
    return _alipayView;
}

- (UIView *)bankView{
    if (_bankView == nil) {
        _bankView = [[UIView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bankStyleAction)];
        [_bankView addGestureRecognizer:tap];
        [_bankView addSubview:self.bankIv];
        [_bankView addSubview:self.bankLb];
    }
    return _bankView;
}

- (UIImageView *)alipayIv{
    if (_alipayIv == nil) {
        _alipayIv = [[UIImageView alloc] init];
        _alipayIv.image = IMAGE(@"alipay");
    }
    return _alipayIv;


}

- (UILabel *)alipayLb{
    if (_alipayLb == nil) {
        _alipayLb = [[UILabel alloc] init];
        _alipayLb.font = FONT(14);
        _alipayLb.textColor = SHENTEXTCOLOR;
        _alipayLb.text = @"支付宝账户";
    }
    return _alipayLb;


}

- (UIImageView *)bankIv{
    if (_bankIv == nil) {
        _bankIv = [[UIImageView alloc] init];
        _bankIv.image = IMAGE(@"bankSelected");
    }
    return _bankIv;

}

- (UILabel *)bankLb{
    if (_bankLb == nil) {
        _bankLb = [[UILabel alloc] init];
        _bankLb.font = FONT(14);
        _bankLb.textColor = MALLColor;
        _bankLb.text = @"银行卡账户";
    }
    return _bankLb;

}

- (UILabel *)nameTitleLb{
    if (_nameTitleLb == nil) {
        _nameTitleLb = [[UILabel alloc] init];
        _nameTitleLb.text = @"账户名称";
        _nameTitleLb.font = FONT(14);
        _nameTitleLb.textColor = SHENTEXTCOLOR;
    }
    return _nameTitleLb;

}

- (UITextField *)nameTf{
    if (_nameTf == nil) {
        _nameTf = [[UITextField alloc] init];
        _nameTf.placeholder = @"请输入真实姓名";
        _nameTf.font = FONT(14);
        _nameTf.textColor = BLACKTEXTCOLOR;
        _nameTf.returnKeyType = UIReturnKeyNext;
        _nameTf.delegate = self;
    }
    return _nameTf;

}

- (UILabel *)accountTitleLb{
    if (_accountTitleLb == nil) {
        _accountTitleLb = [[UILabel alloc] init];
        _accountTitleLb.font = FONT(14);
        _accountTitleLb.textColor = SHENTEXTCOLOR;
        _accountTitleLb.text = @"银行账号";
    }
    return _accountTitleLb;

}

- (UITextField *)accountTf{
    if (_accountTf == nil) {
        _accountTf = [[UITextField alloc] init];
        _accountTf.placeholder = @"请输入账户";
        _accountTf.textColor = BLACKTEXTCOLOR;
        _accountTf.font = FONT(14);
        _accountTf.returnKeyType = UIReturnKeyDone;
        _accountTf.delegate = self;
    }
    return _accountTf;

}

- (UILabel *)bankTitleLb{
    if (_bankTitleLb == nil) {
        _bankTitleLb = [[UILabel alloc] init];
        _bankTitleLb.font = FONT(14);
        _bankTitleLb.textColor = SHENTEXTCOLOR;
        _bankTitleLb.text = @"银行名称";
    }
    return _bankTitleLb;
}

- (UITextField *)bankTf{
    if (_bankTf == nil) {
        _bankTf = [[UITextField alloc] init];
        _bankTf.placeholder = @"请输入银行名称";
        _bankTf.font = FONT(14);
        _bankTf.textColor = BLACKTEXTCOLOR;
        _bankTf.returnKeyType = UIReturnKeyDone;
        _bankTf.delegate = self;
    }
    return _bankTf;
}
@end
