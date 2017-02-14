//
//  RegisterViewController.m
//  YSSCIOS
//
//  Created by TSApple on 38/1/1.
//  Copyright © 2038年 zzz. All rights reserved.
//

#import "RegisterViewController.h"
#import "HomeAdWebViewController.h"

@interface RegisterViewController ()
<
    UITextFieldDelegate
>

@property (nonatomic, strong) MallTopView *topView;//顶图

@property (nonatomic, strong) UIImageView *headIv;//头像

@property (nonatomic, strong) UIView *singleView;//切割线

@property (nonatomic, strong) YSSTextFied *iniviteNumTf;//邀请码
@property (nonatomic, strong) YSSTextFied *phoneTf;//电话号码
@property (nonatomic, strong) YSSTextFied *testWordTf;//验证码
@property (nonatomic, strong) YSSTextFied *passWordTf;//密码
@property (nonatomic, strong) JKCountDownButton *testWordBtn;//获取验证码按钮

@property (nonatomic, strong) UILabel *hadObserLb;//我已经统一

@property (nonatomic, strong) UILabel *ruleLb;//协议内容
@property (nonatomic, strong) UIButton *observeRuleBtn;//遵守协议按钮


@property (nonatomic, strong) UIButton *beginBtn;//提交按钮
@property (nonatomic, strong) UIButton *loginBtn;//跳转登录界面

@property (nonatomic, assign) NSInteger isObserveRule;// 0==还没有遵守规则 1===同意协议



@end

@implementation RegisterViewController

#pragma mark ---------生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.headIv];
    [self.view addSubview:self.singleView];
    [self.view addSubview:self.iniviteNumTf];
    [self.view addSubview:self.phoneTf];
    [self.view addSubview:self.passWordTf];
    [self.view addSubview:self.testWordTf];
    [self.view addSubview:self.testWordBtn];
    [self.view addSubview:self.observeRuleBtn];
    [self.view addSubview:self.beginBtn];
    [self.view addSubview:self.hadObserLb];
    [self.view addSubview:self.ruleLb];
    [self.view addSubview:self.loginBtn];

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
    
    self.singleView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(0.5);
    
    self.headIv.sd_layout
    .topSpaceToView(self.topView, 21)
    .centerXEqualToView(self.view)
    .widthIs(75)
    .heightEqualToWidth();
    
    self.singleView.sd_layout
    .topSpaceToView(self.headIv, 26)
    .leftSpaceToView(self.view, 45)
    .rightSpaceToView(self.view, 45)
    .heightIs(0.5);
    
    self.iniviteNumTf.sd_layout
    .topSpaceToView(self.singleView, 0)
    .leftEqualToView(self.singleView)
    .rightEqualToView(self.singleView)
    .heightIs(49);
    
    self.phoneTf.sd_layout
    .topSpaceToView(self.iniviteNumTf, 0)
    .leftEqualToView(self.singleView)
    .rightEqualToView(self.singleView)
    .heightRatioToView(self.iniviteNumTf, 1);
    
    self.testWordBtn.sd_layout
    .rightEqualToView(self.phoneTf)
    .topSpaceToView(self.phoneTf, 15)
    .heightIs(15);
    [self.testWordBtn setupAutoSizeWithHorizontalPadding:0 buttonHeight:15];
    
    
    self.testWordTf.sd_layout
    .topSpaceToView(self.phoneTf, 0)
    .leftEqualToView(self.singleView)
    .rightEqualToView(self.singleView)
    .heightRatioToView(self.iniviteNumTf, 1);

    self.passWordTf.sd_layout
    .topSpaceToView(self.testWordTf, 0)
    .leftEqualToView(self.singleView)
    .rightEqualToView(self.singleView)
    .heightRatioToView(self.iniviteNumTf, 1);
    
    self.observeRuleBtn.sd_layout
    .topSpaceToView(self.passWordTf, 13)
    .leftEqualToView(self.passWordTf)
    .heightIs(15)
    .widthEqualToHeight();
    
    self.hadObserLb.sd_layout
    .topSpaceToView(self.passWordTf, 15)
    .leftSpaceToView(self.observeRuleBtn, 3)
    .autoHeightRatio(0);
    [self.hadObserLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.ruleLb.sd_layout
    .topSpaceToView(self.passWordTf, 15)
    .leftSpaceToView(self.hadObserLb, 2)
    .autoHeightRatio(0);
    [self.ruleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.beginBtn.sd_layout
    .topSpaceToView(self.ruleLb, 30)
    .centerXEqualToView(self.view)
    .widthIs(244)
    .heightIs(44);
    [self.beginBtn setSd_cornerRadiusFromHeightRatio:@0.5];
    
    self.loginBtn.sd_layout
    .topSpaceToView(self.beginBtn, 20)
    .centerXEqualToView(self.view)
    .widthIs(100)
    .heightIs(14);
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


#pragma mark ---------点击事件

//获取验证码
- (void)getTestWordAction{
    
    if ([_phoneTf.text isEqualToString:@""] || ![_phoneTf.text validateMobile]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机格式"];
        return;
    }
    
    //成功获取验证码后
    _testWordBtn.enabled = NO;
    [_testWordBtn startWithSecond:60];
    [SVProgressHUD showWithStatus:@"发送中"];
    
        [YSSCShareBusinessManager.loginManger getSmsVerifyCodeWithDictionary:@{@"username":_phoneTf.text,
                                                                               @"regType":@0,
                                                                               @"optType":@20
                                                                               }
                                                                     success:^(id object) {
                                                                         [SVProgressHUD showSuccessWithStatus:@"已成功发送"];
                                                                     }
                                                                     failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                         [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                     }];

}


//注册
- (void)beginAction{
    
    if (!_isObserveRule) {
        [self alertViewWithTitle:@"未同意相关协议，无法注册"];
        return;
    }
    [SVProgressHUD showWithStatus:@"注册中"];
    //注册
    
   // YSSCWeakObj(self);
    [YSSCShareBusinessManager.loginManger registerInfoWithDictionary:@{
                                                                       @"username": _phoneTf.text,
                                                                       @"password": _passWordTf.text,
                                                                       @"regCode": _testWordTf.text,
                                                                       @"inviteCode": _iniviteNumTf.text,
                                                                       @"regType": @0,
                                                                       @"userType": @2
                                                                       }
                                                             success:^(id responObject) {
                                                                 ServerStatusObject *replaceObject = responObject;
                                                                 if (replaceObject.errorCode.integerValue == SeverStateSuccess) {
                                                                     [SVProgressHUD dismiss];
                                                                     [SVProgressHUD showSuccessWithStatus:replaceObject.errorMsg];
                                                                     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                                         [self dismissViewControllerAnimated:YES completion:nil];
                                                                     });

                                                                 }else{
                                                                     [SVProgressHUD showErrorWithStatus:replaceObject.errorMsg];
                                                                 }
                                                             }
                                                              faiure:^(NSInteger errCode, NSString *errorMsg) {
                                                                  [SVProgressHUD showErrorWithStatus:errorMsg];
                                                              }];

}

- (void)observeRuleAction{
    //遵守协议
    if (self.observeRuleBtn.isSelected) {
        self.observeRuleBtn.selected = NO;
        self.hadObserLb.textColor = LIGHTTEXTCOLOR;
    }else{
        self.observeRuleBtn.selected = YES;
        self.hadObserLb.textColor = MALLColor;
    }
    
    _isObserveRule = !_isObserveRule;
}

- (void)backLoginAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)readRuleAction{
    HomeAdWebViewController *ruleVC = [[HomeAdWebViewController alloc] init];
    
    ruleVC.url = [NSURL URLWithString:[NSString stringWithFormat:@"%@view/sys/user_protocol.html",RealHome]];
    
    [self presentViewController:ruleVC animated:YES completion:nil];
}

- (void)selectHeadImageAction{
    NSLog(@"选取头像");
   
}

/***********************************************
 函数名称 : alertViewWithTitle:
 函数秒数 ：弹窗提醒
 输入参数 : str
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)alertViewWithTitle:(NSString *)str{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提醒" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        [action setValue:MALLColor forKey:@"_titleTextColor"];
    }
    [alertVc addAction:action];
    [self presentViewController:alertVc animated:YES completion:nil];

}


#pragma mark ----------------textFieldDelegate

#define COLORBLUE YSSCRGBColor(206, 221, 238)//文字背景色

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
        if (textField.text.length == 0) {
            textField.attributedText = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSBackgroundColorAttributeName: COLORBLUE}];
            //终止文本修改
            return NO;
        }else{
            textField.attributedText = [[NSMutableAttributedString alloc] initWithString:textField.text attributes:@{NSBackgroundColorAttributeName: COLORBLUE}];
        }
        return YES;

}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    textField.attributedText = [[NSMutableAttributedString alloc] initWithString:textField.text attributes:@{NSBackgroundColorAttributeName: WHITECOLOR}];
    return YES;
}

#pragma mark ---------实例化

- (YSSTextFied *)phoneTf{
    if (_phoneTf == nil) {
        _phoneTf = [[YSSTextFied alloc] init];
        _phoneTf.placeholder = @"请输入手机号码";
        _phoneTf.delegate = self;
        _phoneTf.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneTf;


}

- (YSSTextFied *)passWordTf{
    if (_passWordTf == nil) {
        _passWordTf = [[YSSTextFied alloc] init];
        _passWordTf.placeholder = @"设置密码";
        _passWordTf.secureTextEntry = YES;
    }
    return _passWordTf;
    

}

- (YSSTextFied *)testWordTf{
    if (_testWordTf == nil) {
        _testWordTf = [[YSSTextFied alloc] init];
        _testWordTf.placeholder = @"验证码";
        _testWordTf.clearButtonMode = UITextFieldViewModeNever;
        _testWordTf.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _testWordTf;


}

- (UIButton *)testWordBtn{
    if (_testWordBtn == nil) {
        _testWordBtn = [[JKCountDownButton alloc] init];
        _testWordBtn.backgroundColor = WHITECOLOR;
        _testWordBtn.titleLabel.font = FONT(12);
        [_testWordBtn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [_testWordBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        YSSCWeakObj(self);
        [_testWordBtn addToucheHandler:^(JKCountDownButton *countDownButton, NSInteger tag) {
            [weakself getTestWordAction];
        }];
        
        [_testWordBtn didChange:^NSString *(JKCountDownButton *countDownButton, int second) {
            NSString *title = [NSString stringWithFormat:@"%ds后重新发送", second];
            return title;
        }];

        [_testWordBtn didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
            countDownButton.enabled = YES;
            return @"重新获取";
        }];
    }
    return _testWordBtn;


}

- (UIButton *)beginBtn{
    if (_beginBtn == nil) {
        _beginBtn = [[UIButton alloc] init];
        _beginBtn.titleLabel.font = FONT(14);
        _beginBtn.backgroundColor = MALLColor;
        [_beginBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_beginBtn setTitle:@"提交注册" forState:UIControlStateNormal];
        [_beginBtn addTarget:self action:@selector(beginAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _beginBtn;
}

- (UIButton *)observeRuleBtn{
    if (_observeRuleBtn == nil) {
        _observeRuleBtn = [[UIButton alloc] init];
        [_observeRuleBtn setBackgroundImage:IMAGE(@"classify17") forState:UIControlStateSelected];
        [_observeRuleBtn setBackgroundImage:IMAGE(@"classify16") forState:UIControlStateNormal];
        _observeRuleBtn.selected = NO;
        [_observeRuleBtn addTarget:self action:@selector(observeRuleAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _observeRuleBtn;

}

- (UILabel *)ruleLb{
    if (_ruleLb == nil) {
        _ruleLb = [[UILabel alloc] init];
        _ruleLb.font = FONT(10);
        _ruleLb.userInteractionEnabled = YES;
        _ruleLb.text = @"乡宿在线用户注册协议";
        _ruleLb.textColor = MALLColor;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(readRuleAction)];
        [_ruleLb addGestureRecognizer:tap];
    }
    return _ruleLb;
}

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"注册" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself dismissViewControllerAnimated:YES completion:nil];
        };
    }
    return _topView;


}

- (UIImageView *)headIv{
    if (_headIv == nil) {
        _headIv = [[UIImageView alloc] initWithImage:IMAGE(@"head1")];
        _headIv.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectHeadImageAction)];
        [_headIv addGestureRecognizer:tap];
    }
    return _headIv;
}

- (UIView *)singleView{
    if (_singleView == nil) {
        _singleView = [[UIView alloc] init];
        _singleView.backgroundColor = GRAYCOLOR;
    }
    return _singleView;
}

- (YSSTextFied *)iniviteNumTf{
    if (_iniviteNumTf == nil) {
        _iniviteNumTf = [[YSSTextFied alloc] init];
        _iniviteNumTf.placeholder = @"邀请码";
    }
    return _iniviteNumTf;

}

- (UIButton *)loginBtn{
    if (_loginBtn == nil) {
        _loginBtn = [[UIButton alloc] init];
        _loginBtn.backgroundColor = WHITECOLOR;
        _loginBtn.titleLabel.font = FONT(14);
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:MALLColor forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(backLoginAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UILabel *)hadObserLb{
    if (_hadObserLb == nil) {
        _hadObserLb = [[UILabel alloc] init];
        _hadObserLb.font = FONT(10);
        _hadObserLb.textColor = LIGHTTEXTCOLOR;
        _hadObserLb.text = @"我已阅读并同意";
    }
    return _hadObserLb;

}


@end
