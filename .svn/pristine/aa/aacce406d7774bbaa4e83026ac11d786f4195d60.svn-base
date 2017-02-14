//
//  UserChangePassWordViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserChangePassWordViewController.h"

#import "UserAccontTextField.h"
#import "YSSNavView.h"
#import "YSSTextFied.h"

@interface UserChangePassWordViewController ()<UITextFieldDelegate>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**当前密码*/
@property (nonatomic, strong) UserAccontTextField *currentPassWordTF;
/**新密码*/
@property (nonatomic, strong) UserAccontTextField *newPassWordTF;
/**确认新密码*/
@property (nonatomic, strong) UserAccontTextField *makeSurePassWordTF;
/**确认按钮*/
@property (nonatomic, strong) UIButton *makeSureButton;


@end

@implementation UserChangePassWordViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"重置密码"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (UserAccontTextField *)currentPassWordTF{
    if (_currentPassWordTF == nil) {
        _currentPassWordTF = [[UserAccontTextField alloc] init];
        _currentPassWordTF.secureTextEntry = YES;
        _currentPassWordTF.placeholder = @"当前密码";
        _currentPassWordTF.delegate = self;
    }
    return _currentPassWordTF;
}

- (UserAccontTextField *)newPassWordTF{
    if (_newPassWordTF == nil) {
        _newPassWordTF = [[UserAccontTextField alloc] init];
        _newPassWordTF.secureTextEntry = YES;
        _newPassWordTF.placeholder = @"新密码";
        _newPassWordTF.delegate = self;
    }
    return _newPassWordTF;
}

- (UserAccontTextField *)makeSurePassWordTF{
    if (_makeSurePassWordTF == nil) {
        _makeSurePassWordTF = [[UserAccontTextField alloc] init];
        _makeSurePassWordTF.secureTextEntry = YES;
        _makeSurePassWordTF.placeholder = @"确认新密码";
        _makeSurePassWordTF.delegate = self;
    }
    return _makeSurePassWordTF;
}

-(UIButton *)makeSureButton{
    if (_makeSureButton == nil) {
        _makeSureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _makeSureButton.frame = CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50);
        [_makeSureButton addTarget:self action:@selector(bottonButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [_makeSureButton setTitle:@"确认提交" forState:UIControlStateNormal];
        _makeSureButton.backgroundColor = MALLColor;
    }
    return _makeSureButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.currentPassWordTF];
    [self.view addSubview:self.newPassWordTF];
    [self.view addSubview:self.makeSurePassWordTF];
    [self.view addSubview:self.makeSureButton];
    
    self.currentPassWordTF.sd_layout
    .topSpaceToView(self.view, 74)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(48);
    
    self.newPassWordTF.sd_layout
    .topSpaceToView(self.currentPassWordTF, 10)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(48);
    
    self.makeSurePassWordTF.sd_layout
    .topSpaceToView(self.newPassWordTF, 10)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(48);
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark --------- 确认提交
- (void)bottonButtonDidClick{
    [YSSCShareBusinessManager.userManager editPasswordWithOldPassWord:self.currentPassWordTF.text
                                                          newPassWord:self.newPassWordTF.text
                                                      confirmPassword:self.makeSurePassWordTF.text success:^(id object) {
                                                          ServerStatusObject *severStatus = object;
                                                          if (severStatus.errorCode.integerValue == SeverStateSuccess) {
                                                              [SVProgressHUD showSuccessWithStatus:severStatus.errorMsg];
                                                              dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                                  [SVProgressHUD dismiss];
                                                                  [self.navigationController popViewControllerAnimated:YES];
                                                              });
                                                          }else{
                                                              [SVProgressHUD showErrorWithStatus:severStatus.errorMsg];
                                                          }
                                                          
                                                      } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                          
                                                      }];
    
}

@end
