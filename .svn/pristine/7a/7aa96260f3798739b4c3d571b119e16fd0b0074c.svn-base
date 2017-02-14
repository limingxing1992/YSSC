//
//  UserChangePhoneNumViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserChangePhoneNumViewController.h"
#import "YSSNavView.h"
#import "JKCountDownButton.h"


@interface UserChangePhoneNumViewController ()

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**确认按钮*/
@property (nonatomic, strong) UIButton *makeSureButton;
/**提示信息*/
@property (nonatomic, strong) UILabel *messageLabel;
/**电话号码*/
@property (nonatomic, strong) UILabel *phoneNumLabel;
/**验证码输入框*/
@property (nonatomic, strong) UITextField *idcodeTF;
/**发送验证码button*/
@property (nonatomic, strong) JKCountDownButton *idcodeButton;
/**新手机号*/
@property (nonatomic, strong) UITextField *newnumTF;

@end

@implementation UserChangePhoneNumViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"修改手机号"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (UILabel *)messageLabel{
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = FONT(12);
        _messageLabel.textColor = LIGHTTEXTCOLOR;
        _messageLabel.text = @"更换手机号前请先完成验证，请发送验证码短信到";
    }
    return _messageLabel;
}
- (UILabel *)phoneNumLabel{
    if (_phoneNumLabel == nil) {
        _phoneNumLabel = [[UILabel alloc] init];
        _phoneNumLabel.font = FONT(24);
        _phoneNumLabel.textColor = SHENTEXTCOLOR;
    }
    return _phoneNumLabel;
}

- (UITextField *)idcodeTF{
    if (_idcodeTF == nil) {
        _idcodeTF = [[UITextField alloc] init];
        _idcodeTF.leftViewMode = UITextFieldViewModeAlways;
        UILabel *leftLabel = [[UILabel alloc] init];
        leftLabel.textColor = SHENTEXTCOLOR;
        leftLabel.font = FONT(12);
        leftLabel.text = @"    验证码";
        _idcodeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        leftLabel.frame = CGRectMake(14, 0, 80, 20);
        _idcodeTF.placeholder = @"请输入验证码";
        _idcodeTF.leftView = leftLabel;
        _idcodeTF.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
        _idcodeTF.layer.borderWidth = 0.5;
        _idcodeTF.layer.cornerRadius = 1.5;
        _idcodeTF.font = FONT(12);
       // _idcodeTF.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _idcodeTF;
}

- (JKCountDownButton *)idcodeButton{
    if (_idcodeButton == nil) {
        _idcodeButton = [[JKCountDownButton alloc] init];
        _idcodeButton.layer.cornerRadius = 1.5;
        _idcodeButton.layer.borderWidth = 0.5;
        _idcodeButton.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
        [_idcodeButton addTarget:self action:@selector(getIDCode:) forControlEvents:UIControlEventTouchUpInside];
        [_idcodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_idcodeButton setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        _idcodeButton.titleLabel.font = FONT(12);
        
    }
    return _idcodeButton;
}

- (UITextField *)newnumTF{
    if (_newnumTF == nil) {
        _newnumTF = [[UITextField alloc] init];
        _newnumTF.layer.cornerRadius = 1.5;
        _newnumTF.layer.borderWidth = 0.5;
        _newnumTF.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
        _newnumTF.leftViewMode = UITextFieldViewModeAlways;
        _newnumTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _newnumTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 14, 30)];
        _newnumTF.placeholder = @"请输入新手机号";
        _newnumTF.font = FONT(12);
    }
    return _newnumTF;
}

-(UIButton *)makeSureButton{
    if (_makeSureButton == nil) {
        _makeSureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _makeSureButton.frame = CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50);
        [_makeSureButton addTarget:self action:@selector(makeSureButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [_makeSureButton setTitle:@"确认提交" forState:UIControlStateNormal];
        _makeSureButton.backgroundColor = MALLColor;
    }
    return _makeSureButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.messageLabel];
    [self.view addSubview:self.phoneNumLabel];
    [self.view addSubview:self.idcodeTF];
    [self.view addSubview:self.idcodeButton];
    [self.view addSubview:self.makeSureButton];
    [self.view addSubview:self.newnumTF];
    
    self.messageLabel.sd_layout
    .topSpaceToView(self.navBar, 41.5)
    .centerXEqualToView(self.view)
    .autoHeightRatio(0);
    [self.messageLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    
    self.phoneNumLabel.sd_layout
    .topSpaceToView(self.messageLabel, 20)
    .centerXEqualToView(self.view)
    .autoHeightRatio(0);
    [self.phoneNumLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    
    self.idcodeTF.sd_layout
    .topSpaceToView(self.phoneNumLabel, 43)
    .leftSpaceToView(self.view, 8.5)
    .rightSpaceToView(self.idcodeButton, 9)
    .heightIs(44);

    self.idcodeButton.sd_layout
    .topEqualToView(self.idcodeTF)
    .widthIs(114)
    .bottomEqualToView(self.idcodeTF)
    .rightSpaceToView(self.view, 8.5);
    
    self.newnumTF.sd_layout
    .topSpaceToView(self.idcodeTF,20)
    .leftSpaceToView(self.view, 8.5)
    .rightSpaceToView(self.view, 8.5)
    .heightIs(44);
    
    self.phoneNumLabel.text = [self setPhoneNum:_phone];
}

- (NSString *)setPhoneNum:(NSString *)phoneNum{
    NSRange range = NSMakeRange(3, 6);
    return [phoneNum stringByReplacingCharactersInRange:range withString:@"******"];
}
#pragma mark --------- 点击事件

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.newnumTF resignFirstResponder];
    [self.idcodeTF resignFirstResponder];
}

- (void)makeSureButtonDidClick{
//    phone：新手机号（修改手机号时必填）
//    email：新邮箱号（修改邮箱时必填）
//    regCode：短信或邮箱验证码
//    regType：绑定类型（0：手机号，1：邮箱）
    
    NSDictionary *dict = @{@"phone":self.newnumTF.text,
                           @"regCode":self.idcodeTF.text,
                           @"regType":@"0"};
    [YSSCShareBusinessManager.userManager editPhoneNumberWithDictionary:dict success:^(id object) {
        if (object) {
            ServerStatusObject *phoneNumObject = object;
            if (phoneNumObject.errorCode.integerValue == SeverStateSuccess) {
                [SVProgressHUD showSuccessWithStatus:phoneNumObject.errorMsg];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                    [self.navigationController popViewControllerAnimated:YES];
                });
            }else{
                [SVProgressHUD showErrorWithStatus:phoneNumObject.errorMsg];
            }
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}
//点击发送验证码按钮
- (void)getIDCode:(JKCountDownButton *)button{
    [button startWithSecond:60];
//    username：手机号
//    regType：0-手机验证码，1-邮箱验证码
//    optType：10-快捷登录，20-注册，30-找回密码
    
 
    
    NSDictionary *dict = @{@"username":self.phone,
                           @"regType":@"0",
                           @"optType":@"30"};
    [YSSCShareBusinessManager.loginManger getSmsVerifyCodeWithDictionary:dict success:^(id object) {
        
        if (object) {
            ServerStatusObject *smsObject = object;
            if (smsObject.errorCode.integerValue == SeverStateSuccess) {
                [SVProgressHUD showSuccessWithStatus:smsObject.errorMsg];
                
            }else{
                [SVProgressHUD showErrorWithStatus:smsObject.errorMsg];
            }
            
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];

}

- (void)callBack:(callBack)block{
    
}

@end
