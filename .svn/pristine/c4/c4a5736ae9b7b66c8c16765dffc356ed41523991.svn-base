//
//  UserChangeNameViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserChangeNameViewController.h"
#import "YSSNavView.h"
#import "UserAccontTextField.h"



@interface UserChangeNameViewController ()
/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**确认按钮*/
@property (nonatomic, strong) UIButton *makeSureButton;
/**更改用户名*/
@property (nonatomic, strong) UserAccontTextField *nameTF;



@end

@implementation UserChangeNameViewController

- (void)setName:(NSString *)name{
    _name = name;
    self.nameTF.text = name;
}

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"修改用户名"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
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

- (UserAccontTextField *)nameTF{
    if (_nameTF == nil) {
        _nameTF = [[UserAccontTextField alloc] init];
    }
    return _nameTF;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.nameTF resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.makeSureButton];
    [self.view addSubview:self.nameTF];
    
    self.nameTF.sd_layout
    .topSpaceToView(self.navBar, 10)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(44);
    
}



- (void)bottonButtonDidClick{
    
//    if (_callBack) {
//        _callBack(self.nameTF.text);
//    }
    
    //    name：真实姓名 // 可选
    //    nickname：昵称 // 可选
    //    birthday：生日 // 可选，格式：yyyy-MM-dd
    //    email：邮箱 // 可选
    //    sex：性别 // 可选，0-保密，1-男，2-女
    
    NSDictionary *dict = @{@"nickname":self.nameTF.text};
    [YSSCShareBusinessManager.userManager editUserInfoWithDictionary:dict success:^(id object) {
        if (object) {
            ServerStatusObject *editObject = object;
            if (editObject.errorCode.integerValue == SeverStateSuccess) {
                if (_callBack) {
                    _callBack(self.nameTF.text);
                }
                STL_SVProgessHUD(editObject.errorMsg);
            }else{
                
            }
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
    
    
}

- (void)callBack:(callBack)block{
    _callBack = block;
    
}

@end
