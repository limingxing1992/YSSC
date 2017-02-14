//
//  UserEditAddressViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserEditAddressViewController.h"

#import "YSSNavView.h"
#import "UserAddressView.h"
#import "UserAddressObject.h"
#import "UserAreaPickViewController.h"
#import "UserPresentationViewController.h"

@interface UserEditAddressViewController ()

<
UITextFieldDelegate,
UIViewControllerTransitioningDelegate,
UIViewControllerAnimatedTransitioning,
UserAreaPickViewControllerDelegate
>


/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;

/**底部确认按钮*/
@property (nonatomic, strong) UIButton *makeSureButton;
/**设为默认地址按钮*/
@property (nonatomic, strong) UIButton *defBtn;


/**收货人*/
@property (nonatomic, strong) UserAddressView *nameView;
/**电话号码*/
@property (nonatomic, strong) UserAddressView *phoneView;
/**位置*/
@property (nonatomic, strong) UserAddressView *areaView;
/**详细地址*/
@property (nonatomic, strong) UserAddressView *locationView;


/**UserAreaPickViewController*/
@property (nonatomic, strong) UserAreaPickViewController *areaPickVC;

/**areaId*/
@property (nonatomic, strong) NSString *areaID;


/// 记录是否弹出弹框
@property (nonatomic, assign)BOOL isPresented;
@property(nonatomic, weak)UIView *toView;
@property(nonatomic, weak)UIView *fromView;


@end

@implementation UserEditAddressViewController

#pragma mark --------- 懒加载
- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"编辑地址"];
        [_navBar setRightBtnTitle:@"删除" target:self action:@selector(alertView)];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}


- (UserAddressView *)nameView{
    if (_nameView == nil) {
        _nameView = [[UserAddressView alloc] init];
        _nameView.textField.placeholder = @"请输入姓名";
        _nameView.headLabel.text = @"收货人";
    }
    return _nameView;
}

- (UserAddressView *)phoneView{
    if (_phoneView == nil) {
        _phoneView = [[UserAddressView alloc] init];
        _phoneView.textField.placeholder = @"请输入手机号码";
        _phoneView.headLabel.text = @"手机号码";
    }
    return _phoneView;
}

- (UserAddressView *)areaView{
    if (_areaView == nil) {
        _areaView = [[UserAddressView alloc] init];
        _areaView.textField.placeholder = @"医院/小区/写字楼等111";
        _areaView.headLabel.text = @"位置";
        _areaView.textField.delegate = self;
    }
    return _areaView;
}

- (UserAddressView *)locationView{
    if (_locationView == nil) {
        _locationView = [[UserAddressView alloc] init];
        _locationView.textField.placeholder = @"门牌号/楼层号等详情地址";
        _locationView.headLabel.text = @"详细地址";
    }
    return _locationView;
}


-(UIButton *)makeSureButton{
    if (_makeSureButton == nil) {
        _makeSureButton = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
        [_makeSureButton addTarget:self action:@selector(bottonButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [_makeSureButton setTitle:@"保存" forState:UIControlStateNormal];
        _makeSureButton.backgroundColor = MALLColor;
    }
    return _makeSureButton;
}

- (UIButton *)defBtn{
    if (_defBtn == nil) {
        _defBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 277, SCREEN_WIDTH, 45)];
        _defBtn.titleLabel.font = FONT(15);
        _defBtn.backgroundColor = [UIColor whiteColor];
        _defBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [_defBtn setImage:IMAGE(@"classify106") forState:UIControlStateNormal];
        [_defBtn setImage:IMAGE(@"classify104") forState:UIControlStateSelected];
        [_defBtn setTitle:@"设为默认地址" forState:UIControlStateNormal];
        [_defBtn setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateNormal];
        [_defBtn addTarget:self action:@selector(defBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _defBtn;
}




#pragma mark --------- 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void) setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    
    [self.view addSubview:self.makeSureButton];
    [self.view addSubview:self.defBtn];
    [self.view addSubview:self.nameView];
    [self.view addSubview:self.phoneView];
    [self.view addSubview:self.areaView];
    [self.view addSubview:self.locationView];
    
    self.nameView.sd_layout
    .topSpaceToView(self.navBar, 20)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(47);
    
    self.phoneView.sd_layout
    .topSpaceToView(self.nameView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(45);
    
    self.areaView.sd_layout
    .topSpaceToView(self.phoneView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(47);
    
    self.locationView.sd_layout
    .topSpaceToView(self.areaView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(47);
    
}

- (void)setAddressModel:(UserAddressDataObject *)addressModel{
    _addressModel = addressModel;
    self.nameView.textField.text = _addressModel.name;
    self.phoneView.textField.text = _addressModel.cellphone;
    self.locationView.textField.text = _addressModel.address;
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:[_addressModel.address componentsSeparatedByString:@","]];
    NSString *detailAddress = array.lastObject;
    self.locationView.textField.text = detailAddress;
    [array removeLastObject];
    
    NSString *areaAddress = [array componentsJoinedByString:@"/"];
    self.areaView.textField.text = areaAddress;
    
}

#pragma mark --------- 点击默认按钮

- (void)defBtnClicked:(UIButton *)button{
    button.selected = !button.selected;
    
    if (button.selected) {
        //addressId：地址id
        NSDictionary *dict = @{@"addressId":self.addressModel.ID};
        
        [YSSCShareBusinessManager.userManager setDefAddressWithDictionary:dict success:^(id object) {
            ServerStatusObject *severStatus = object;
            if (severStatus.errorCode.integerValue == SeverStateSuccess) {
                [SVProgressHUD showSuccessWithStatus:severStatus.errorMsg];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                    
                });
            }else{
                [SVProgressHUD showErrorWithStatus:severStatus.errorMsg];
            }
            
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            
        }];
    }
}




#pragma mark --------- 提交修改用户名请求

- (void)bottonButtonDidClick{
    
    //    id：收货地址id, 不传则表示添加地址，否则为修改地址
    //    name：收货人姓名
    //    cellphone：收货人手机号码
    //    areaId：所在地区id
    //    address：街道地址(不含省市区)
    //    postcode：邮政编码
    //    isDefault：是否默认地址(1默认地址，0非默认地址)
    
    
    if (self.nameView.textField.text.length < 1 ||self.phoneView.textField.text.length < 1 ||self.areaView.textField.text.length < 1 || self.locationView.textField.text.length < 1) {
        [SVProgressHUD showErrorWithStatus:@"请输入完整地址信息"];
    }
    
    
    NSString *isSelect = @"0";
    if (self.defBtn.selected) {
        isSelect = @"1";
    }
    
    
    NSDictionary *dict = @{@"id":self.addressModel.ID,
                           @"name":self.nameView.textField.text,
                           @"cellphone":self.phoneView.textField.text,
                           @"areaId":self.addressModel.area,
                           @"address":self.locationView.textField.text,
                           @"isDefault":isSelect,
                           @"postcode":@"310000"};//设计图里没有邮编，统一默认传310000
    
    [YSSCShareBusinessManager.userManager saveUserAddressWithDictionary:dict success:^(id object) {
        
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


- (void)deleteAddress{
//    addressId：地址id

    NSDictionary *dict = @{@"addressId":self.addressModel.ID};
    [YSSCShareBusinessManager.userManager removeUserAddressWithDictionary:dict success:^(id object) {
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



- (void)alertView{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提醒" message:@"确定要删除地址吗" preferredStyle:UIAlertControllerStyleActionSheet];
    

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *actiondel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
        [self deleteAddress];
        
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        [action setValue:MALLColor forKey:@"_titleTextColor"];
    }

    [alertVc addAction:action];
    [alertVc addAction:actiondel];
    [self presentViewController:alertVc animated:YES completion:nil];
    
    
    
}


#pragma mark --------- 选择区域的textField代理

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    UserAreaPickViewController *areaVC = [[UserAreaPickViewController alloc] init];
    areaVC.transitioningDelegate = self;
    areaVC.modalPresentationStyle = UIModalPresentationCustom;
    areaVC.delegate = self;
    self.areaPickVC = areaVC;
    
    [self presentViewController:areaVC animated:YES completion:nil];
    return NO;
}

#pragma mark - UIViewControllerTransitioningDelegate
/// 该代理方法用于返回负责转场的控制器对象
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    
    return [[UserPresentationViewController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}


/// 该代理方法用于告诉系统谁来负责控制器如何弹出
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    // 弹出弹框
    self.isPresented = YES;
    return self;
}


/// 该代理方法用于告诉系统谁来负责控制器如何消失
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    // 弹框消失
    self.isPresented = NO;
    return  self;
}



#pragma mark - UIViewControllerAnimatedTransitioning

// 转场动画时间(待确认)
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // 1.判断当前是弹出还是消失
    if (self.isPresented) {
        // 弹出
        [self animatePresentedController:transitionContext];
    }else {
        // 消失
        [self animateDismissedController:transitionContext];
    }
}


/// 弹出菜单
- (void)animatePresentedController:(id <UIViewControllerContextTransitioning>)transitionContext {

    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    _toView = toView;
    [[transitionContext containerView] addSubview:toView];
    toView.transform = CGAffineTransformMakeScale(1.0, 0.0);
    toView.layer.anchorPoint = CGPointMake(0.5, 1);
    
    [UIView animateWithDuration:0.25 animations:^{
       
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    
        [transitionContext completeTransition:YES];
        
        
    }];
    
    
}

// 关闭菜单
- (void)animateDismissedController:(id <UIViewControllerContextTransitioning>)transitionContext {

    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    _toView = toView;
    
    [[transitionContext containerView] addSubview:toView];
    toView.layer.anchorPoint = CGPointMake(0.5, 0);
    
    [UIView animateWithDuration:1 animations:^{
        toView.transform = CGAffineTransformMakeScale(1.0, 0.0);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        
    }];
    
    
}

- (void)userAreaPickViewControllerSelectAddress:(NSString *)address ID:(NSString *)ID{
    self.areaView.textField.text = address;
    [self.areaView.textField resignFirstResponder];
    self.addressModel.area = ID;
}



@end
