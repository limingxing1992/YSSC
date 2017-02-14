//
//  ReplaceTestWordViewController.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "ReplaceTestWordViewController.h"

@interface ReplaceTestWordViewController ()
<
    UITextFieldDelegate
>

@property (nonatomic, strong) MallTopView *topView;

@property (nonatomic, strong) UIView *singleLineView;//切割线

@property (nonatomic, strong) YSSTextFied *phoneTf;//手机

@property (nonatomic, strong) YSSTextFied *testWordTf;//验证码

@property (nonatomic, strong) JKCountDownButton *countBtn;//验证码按钮

@property (nonatomic, strong) YSSTextFied *firstPassWordTf;//重置

@property (nonatomic, strong) YSSTextFied *secondPassWordTf;//确认

@property (nonatomic, strong) UIButton *loginBtn;//登录




@end

@implementation ReplaceTestWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.singleLineView];
    [self.view addSubview:self.phoneTf];
    [self.view addSubview:self.testWordTf];
    [self.view addSubview:self.countBtn];
    [self.view addSubview:self.firstPassWordTf];
    [self.view addSubview:self.secondPassWordTf];
    [self.view addSubview:self.loginBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;

    self.topView.sd_layout
    .topSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .heightIs(64);
    
    self.singleLineView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(0.5);
    
    self.phoneTf.sd_layout
    .topSpaceToView(self.singleLineView, 25)
    .leftSpaceToView(self.view, 45)
    .rightSpaceToView(self.view , 45)
    .heightIs(50);
    
    self.countBtn.sd_layout
    .topSpaceToView(self.phoneTf, 15)
    .rightEqualToView(self.phoneTf)
    .heightIs(15);
    [self.countBtn setupAutoSizeWithHorizontalPadding:0 buttonHeight:15];

    self.testWordTf.sd_layout
    .topSpaceToView(self.phoneTf, 0)
    .leftEqualToView(self.phoneTf)
    .rightEqualToView(self.phoneTf)
    .heightRatioToView(self.phoneTf, 1);
    
    
    self.firstPassWordTf.sd_layout
    .topSpaceToView(self.testWordTf, 0)
    .rightEqualToView(self.testWordTf)
    .leftEqualToView(self.testWordTf)
    .heightRatioToView(self.testWordTf, 1);
    
    self.secondPassWordTf.sd_layout
    .topSpaceToView(self.firstPassWordTf, 0)
    .rightEqualToView(self.firstPassWordTf)
    .leftEqualToView(self.firstPassWordTf)
    .heightRatioToView(self.firstPassWordTf, 1);
    
    self.loginBtn.sd_layout
    .topSpaceToView(self.secondPassWordTf, 55)
    .centerXEqualToView(self.view)
    .widthIs(244)
    .heightIs(44);
    [self.loginBtn setSd_cornerRadiusFromHeightRatio:@0.5];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


#pragma mark ----------------点击事件

- (void)replaceLoginAction{
    
    if ([_firstPassWordTf.text isEqualToString:_secondPassWordTf.text]) {
        NSDictionary *dict = @{@"username":_phoneTf.text,
                               @"password":[_firstPassWordTf.text MD5Hash],
                               @"regCode":_testWordTf.text};
        [YSSCShareBusinessManager.loginManger retrievePasswordWithDictionary:dict success:^(id responObject) {
            if (responObject) {
                ServerStatusObject *replaceObject = responObject;
                if (replaceObject.errorCode.integerValue == SeverStateSuccess) {
                    [SVProgressHUD showSuccessWithStatus:replaceObject.errorMsg];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [self dismissViewControllerAnimated:YES completion:nil];
                    });
                    
                }else{
                    [SVProgressHUD showErrorWithStatus:replaceObject.errorMsg];
                }
                
            }
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            
        }];
    
    }else{
        [SVProgressHUD showErrorWithStatus:@"两次输入密码不一致，请重新输入"];
    }

}

- (void)replaceGetTestWordAction{
    
    if ([_phoneTf.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    _countBtn.enabled = NO;
    [_countBtn startWithSecond:60];
    [SVProgressHUD showWithStatus:@"发送中"];
    //获取验证码
    
    
    NSDictionary *dict = @{@"username":_phoneTf.text,
                           @"regType":@0,
                           @"optType":@30};
    [YSSCShareBusinessManager.loginManger getSmsVerifyCodeWithDictionary:dict success:^(id object) {
        
        ServerStatusObject *obj = object;
        [SVProgressHUD showSuccessWithStatus:obj.errorMsg];
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
        [SVProgressHUD showErrorWithStatus:errorMsg];
        [_countBtn stop];
        _countBtn.enabled = YES;
    }];
    
    
}




#pragma mark ----------------textDelegate

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



#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"重置密码" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself dismissViewControllerAnimated:YES completion:nil];
        };
    }
    return _topView;
}

- (UIView *)singleLineView{
    if (_singleLineView == nil) {
        _singleLineView = [[UIView alloc] init];
        _singleLineView.backgroundColor = GRAYCOLOR;
    }
    return _singleLineView;
}

- (YSSTextFied *)phoneTf{
    if (_phoneTf == nil) {
        _phoneTf = [[YSSTextFied alloc] init];
        _phoneTf.delegate  = self;
        _phoneTf.placeholder = @"输入注册手机号";
        _phoneTf.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneTf;
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

- (JKCountDownButton *)countBtn{
    if (_countBtn == nil) {
        _countBtn = [[JKCountDownButton alloc] init];
        _countBtn.backgroundColor = WHITECOLOR;
        _countBtn.titleLabel.font = FONT(12);
        [_countBtn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [_countBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        YSSCWeakObj(self);
        [_countBtn addToucheHandler:^(JKCountDownButton *countDownButton, NSInteger tag) {
            [weakself replaceGetTestWordAction];
        }];
        
        [_countBtn didChange:^NSString *(JKCountDownButton *countDownButton, int second) {
            NSString *title = [NSString stringWithFormat:@"%ds后重新发送", second];
            return title;
        }];
        
        [_countBtn didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
            countDownButton.enabled = YES;
            return @"重新获取";
        }];
    }
    return _countBtn;
}

- (YSSTextFied *)firstPassWordTf{
    if (_firstPassWordTf == nil) {
        _firstPassWordTf = [[YSSTextFied alloc] init];
        _firstPassWordTf.secureTextEntry = YES;
        _firstPassWordTf.placeholder = @"重置密码";
    }
    return _firstPassWordTf;
}

- (YSSTextFied *)secondPassWordTf{
    if (_secondPassWordTf == nil) {
        _secondPassWordTf = [[YSSTextFied alloc] init];
        _secondPassWordTf.secureTextEntry = YES;
        _secondPassWordTf.placeholder = @"确认密码";
    }
    return _secondPassWordTf;
}

- (UIButton *)loginBtn{
    if (_loginBtn == nil) {
        _loginBtn = [[UIButton alloc] init];
        _loginBtn.backgroundColor = MALLColor;
        [_loginBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_loginBtn setTitle:@"完成" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = FONT(14);
        [_loginBtn addTarget:self action:@selector(replaceLoginAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

@end
