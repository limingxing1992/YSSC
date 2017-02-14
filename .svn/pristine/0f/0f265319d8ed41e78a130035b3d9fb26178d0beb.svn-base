//
//  LoginViewController.m
//  YSSCIOS
//
//  Created by TSApple on 38/1/1.
//  Copyright © 2038年 zzz. All rights reserved.
//

#import "LoginViewController.h"
#import "UserInfoObject.h"

@interface LoginViewController ()
<
    UITextFieldDelegate
>
@property (nonatomic, strong) UIImageView *headIv;//头像Logo
@property (nonatomic, strong) UIView *firstSingleLineView;//切割线
@property (nonatomic, strong) YSSTextFied *phoneTf;//手机号输入框
@property (nonatomic, strong) YSSTextFied *passWordTf;//密码输入框
@property (nonatomic, strong) UIButton *loginBtn;//登录按钮
@property (nonatomic, strong) UIButton *registerBtn;//注册按钮
@property (nonatomic, strong) UIButton *lookForBtn;//忘记密码按钮

@end

@implementation LoginViewController

static NSString *const kLoginTime = @"kLoginTime";
#pragma mark ---------生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.backBtn];
    [self.view addSubview:self.headIv];
    [self.view addSubview:self.firstSingleLineView];
    [self.view addSubview:self.phoneTf];
    [self.view addSubview:self.passWordTf];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.registerBtn];
    [self.view addSubview:self.lookForBtn];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    self.backBtn.sd_layout
    .centerYIs(42)
    .leftSpaceToView(self.view, 15)
    .heightIs(18)
    .widthIs(10);
    
    self.headIv.sd_layout
    .topSpaceToView(self.view, 85)
    .centerXEqualToView(self.view)
    .widthIs(75)
    .heightEqualToWidth();
    [self.headIv setSd_cornerRadiusFromHeightRatio:@0.5];
    
    self.firstSingleLineView.sd_layout
    .topSpaceToView(self.headIv, 26)
    .leftSpaceToView(self.view, 45)
    .rightSpaceToView(self.view, 45)
    .heightIs(0.5);
    
    
    self.phoneTf.sd_layout
    .topSpaceToView(self.firstSingleLineView, 0)
    .leftEqualToView(self.firstSingleLineView)
    .widthRatioToView(self.firstSingleLineView, 1)
    .heightIs(49);
    
    self.passWordTf.sd_layout
    .topSpaceToView(self.phoneTf, 0)
    .leftEqualToView(self.phoneTf)
    .widthRatioToView(self.phoneTf, 1)
    .heightRatioToView(self.phoneTf, 1);
    
    self.lookForBtn.sd_layout
    .topSpaceToView(self.passWordTf, 13)
    .rightEqualToView(self.passWordTf)
    .heightIs(10);
    [self.lookForBtn setupAutoSizeWithHorizontalPadding:0 buttonHeight:10];
    
    self.loginBtn.sd_layout
    .topSpaceToView(self.lookForBtn, 66)
    .centerXEqualToView(self.view)
    .widthIs(244)
    .heightIs(44);
    [self.loginBtn setSd_cornerRadiusFromHeightRatio:@0.5];
    
    self.registerBtn.sd_layout
    .topSpaceToView(self.loginBtn, 20)
    .centerXEqualToView(self.view)
    .heightIs(14);
    [self.registerBtn setupAutoSizeWithHorizontalPadding:0 buttonHeight:14];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


#pragma mark ---------登录---注册---找回密码--返回上级页面

- (void)backLastVcAction{
    [self dismissViewControllerAnimated:YES completion:nil];
    [SVProgressHUD dismiss];
}
-(void)dissmiss{
    [self dismissViewControllerAnimated:YES completion:nil];
    [SVProgressHUD dismiss];
    
}

- (void)loginAction{

    YSSCWeakObj(self);
    [YSSCShareBusinessManager.loginManger loginWithDictionary:@{@"username": _phoneTf.text,
                                                                @"password": [_passWordTf.text MD5Hash]
                                                                }
                                                      success:^(id responObject) {
                                                          LoginObject *obj = (LoginObject *)responObject;
                                                          
                                                          if (obj.errorCode.integerValue == SeverStateSuccess) {
                                                              [self dismissViewControllerAnimated:YES completion:nil];
                                                              
                                                              //存入登录时间
                                                              [self saveLoginTime];
                                                              //获取用户信息并存入 UserDefaults
                                                              [YSSCShareBusinessManager.userManager saveUserInfoToUserDefaults];
                                                              
                                                              [SVProgressHUD setStatus:@"登录成功"];
                                                              [self dissmiss];
                                                              //登录返回block
                                                              if (self.BackBlock) {
                                                                  self.BackBlock(YES);
                                                              }
                                                        
                                                          }
                                                          if ([obj.errorCode isEqualToNumber:@0]) {
                                                              [weakself alertViewWithTitle:obj.errorMsg];
                                                          }
                                                      }
                                                      failure:^(NSInteger errCode, NSString *errorMsg) {
                                                          [SVProgressHUD showErrorWithStatus:@"请检查网络连接"];
                                                      }];


    
}

- (void)registerAciton{
    RegisterViewController *registerVc = [[RegisterViewController alloc] init];
    [self presentViewController:registerVc animated:YES completion:nil];
//    [self.navigationController pushViewController:registerVc animated:YES];
}

- (void)lookForBackAciton{
    ReplaceTestWordViewController *replaceVc = [[ReplaceTestWordViewController alloc] init];
    [self presentViewController:replaceVc animated:YES completion:nil];
}

- (void)saveLoginTime{
    
    NSInteger time = [NSDate date].timeIntervalSince1970;
    NSString *timeStr = [NSString stringWithFormat:@"%zd",time];
    
    [[NSUserDefaults standardUserDefaults] setObject:timeStr forKey:kLoginTime];
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


#pragma mark ----------------文本输入代理
#define COLORBLUE YSSCRGBColor(206, 221, 238)//文字背景色 （淡蓝色）

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField == self.phoneTf) {
        if (textField.text.length == 0) {
            _phoneTf.attributedText = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSBackgroundColorAttributeName: COLORBLUE}];
            //终止文本修改
            return NO;
        }else{
            _phoneTf.attributedText = [[NSMutableAttributedString alloc] initWithString:textField.text attributes:@{NSBackgroundColorAttributeName: COLORBLUE}];
        }
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (textField == self.phoneTf) {
        _phoneTf.attributedText = [[NSMutableAttributedString alloc] initWithString:textField.text attributes:@{NSBackgroundColorAttributeName: WHITECOLOR}];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == self.phoneTf) {
        _phoneTf.attributedText = [[NSMutableAttributedString alloc] initWithString:textField.text attributes:@{NSBackgroundColorAttributeName: COLORBLUE}];
    }
    return YES;
}

#pragma mark ---------实例化

- (UIView *)firstSingleLineView{
    if (_firstSingleLineView == nil) {
        _firstSingleLineView = [[UIView alloc] init];
        _firstSingleLineView.backgroundColor = GRAYCOLOR;
    }
    return _firstSingleLineView;
}

- (YSSTextFied *)phoneTf{
    if (_phoneTf == nil) {
        _phoneTf = [[YSSTextFied alloc] init];
        _phoneTf.placeholder = @"手机号";
        _phoneTf.delegate = self;
        _phoneTf.keyboardType = UIKeyboardTypeNumberPad;
        
    }
    return _phoneTf;
}

- (YSSTextFied *)passWordTf{
    if (_passWordTf == nil) {
        _passWordTf = [[YSSTextFied alloc] init];
        _passWordTf.placeholder = @"输入密码";
        _passWordTf.delegate = self;
        _passWordTf.secureTextEntry = YES;
        
    }
    return _passWordTf;

}

- (UIButton *)loginBtn{
    if (_loginBtn == nil) {
        _loginBtn = [[UIButton alloc] init];
        _loginBtn.backgroundColor = MALLColor;
        _loginBtn.titleLabel.font = FONT(14);
        [_loginBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;

}

- (UIButton *)registerBtn{
    if (_registerBtn == nil) {
        _registerBtn = [[UIButton alloc] init];
        _registerBtn.backgroundColor = YSSCClearColor;
        _registerBtn.titleLabel.font = FONT(14);
        [_registerBtn setTitleColor:MALLColor forState:UIControlStateNormal];
        [_registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerAciton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

- (UIButton *)lookForBtn{
    if (_lookForBtn == nil) {
        _lookForBtn = [[UIButton alloc] init];
        _lookForBtn.titleLabel.font = FONT(10);
        [_lookForBtn setTitleColor:MALLColor forState:UIControlStateNormal];
        [_lookForBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [_lookForBtn addTarget:self action:@selector(lookForBackAciton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lookForBtn;
}

- (UIImageView *)headIv{
    if (_headIv == nil) {
        _headIv = [[UIImageView alloc] initWithImage:IMAGE(@"classify13")];
        if ([YSSUserDefault objectForKey:@"head_img"]) {
            NSString *headUrl = [YSSUserDefault objectForKey:@"head_img"];
            [_headIv sd_setImageWithURL:[NSURL URLWithString:headUrl] placeholderImage:IMAGE(@"head1")];
        }else{
            [_headIv setImage:IMAGE(@"head1")];
        }
    }
    return _headIv;
}

- (UIButton *)backBtn{
    if (_backBtn == nil) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_backBtn setBackgroundImage:IMAGE(@"classify15") forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backLastVcAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
@end
