//
//  UserApplayServiceViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserApplayServiceViewController.h"
#import "UserGoodsOrderDetailObject.h"

@interface UserApplayServiceViewController ()<UITextViewDelegate>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**退款金额view*/
@property (nonatomic, strong) UIView *moneyView;

/**退款原因VIew*/
@property (nonatomic, strong) UIView *reasonView;

/**退款原因*/
@property (nonatomic, strong) UITextView *reasonTextView;
/**退款原因label*/
@property (nonatomic, strong) UILabel *reasonLabel;
/**lineVIew*/
@property (nonatomic, strong) UIView *lineView;
/**moneyTitle*/
@property (nonatomic, strong) UILabel *moneyTitleLabel;
/**moneyLabel*/
@property (nonatomic, strong) UILabel *moneyLabel;
/**提交申请*/
@property (nonatomic, strong) UIButton *makeSureButton;

@end

@implementation UserApplayServiceViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"申请售后"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (UIView *)moneyView{
    if (_moneyView == nil) {
        _moneyView = [[UIView alloc] init];
        _moneyView.backgroundColor = [UIColor whiteColor];
        _moneyView.frame = CGRectMake(0, 74, SCREEN_WIDTH, 45);
        
    }
    return _moneyView;
}
- (UILabel *)moneyTitleLabel{
    if (_moneyTitleLabel == nil) {
        _moneyTitleLabel = [[UILabel alloc] init];
        _moneyTitleLabel.font = FONT(14);
        _moneyTitleLabel.textColor = SHENTEXTCOLOR;
        _moneyTitleLabel.text = @"退款金额：¥";
        
    }
    return _moneyTitleLabel;
}

- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = FONT(14);
        _moneyLabel.textColor = MALLColor;
    }
    return _moneyLabel;
}


- (UIView *)reasonView{
    if (_reasonView == nil) {
        _reasonView = [[UIView alloc] init];
        _reasonView.backgroundColor = [UIColor whiteColor];
    }
    return _reasonView;
}

- (UILabel *)reasonLabel{
    if (_reasonLabel == nil) {
        _reasonLabel = [[UILabel alloc] init];
        _reasonLabel.font = FONT(14);
        _reasonLabel.textColor = SHENTEXTCOLOR;
        _reasonLabel.text = @"退货说明:";
    }
    return _reasonLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
        
    }
    return _lineView;
}

- (UITextView *)reasonTextView{
    if (_reasonTextView == nil) {
        _reasonTextView = [[UITextView alloc] init];
        _reasonTextView.font = FONT(14);
        _reasonTextView.backgroundColor = [UIColor whiteColor];
        _reasonTextView.textColor = SHENTEXTCOLOR;
        _reasonTextView.text = @"请输入退款原因";
        _reasonTextView.delegate = self;
    }
    return _reasonTextView;
}

- (UIButton *)makeSureButton{
    if (_makeSureButton == nil) {
        _makeSureButton = [[UIButton alloc] init];
        _makeSureButton.frame = CGRectMake(0, SCREEN_HEIGHT - 45, SCREEN_WIDTH, 45);
        [_makeSureButton setTitle:@"申请退款" forState:UIControlStateNormal];
        [_makeSureButton addTarget:self action:@selector(applyMoneyBack) forControlEvents:UIControlEventTouchUpInside];
        [_makeSureButton setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)setupUI{
    self.view.backgroundColor = BACKGROUNDCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.makeSureButton];
    [self.view addSubview:self.moneyView];
    [self.view addSubview:self.reasonView];
    [self.moneyView addSubview:self.moneyLabel];
    [self.moneyView addSubview:self.moneyTitleLabel];
    [self.reasonView addSubview:self.lineView];
    [self.reasonView addSubview:self.reasonTextView];
    [self.reasonView addSubview:self.reasonLabel];
    
    self.moneyTitleLabel.sd_layout
    .leftSpaceToView(self.moneyView, 15)
    .centerYEqualToView(self.moneyView)
    .autoHeightRatio(0);
    [self.moneyTitleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.moneyLabel.sd_layout
    .leftSpaceToView(self.moneyTitleLabel, 10)
    .centerYEqualToView(self.moneyView)
    .autoHeightRatio(0);
    [self.moneyLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.reasonView.sd_layout
    .topSpaceToView(self.moneyView, 10)
    .leftEqualToView(self.view)
    .heightIs(125)
    .rightEqualToView(self.view);
    
    self.reasonLabel.sd_layout
    .topSpaceToView(self.reasonView, 15)
    .leftSpaceToView(self.reasonView, 15)
    .autoHeightRatio(0);
    [self.reasonLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.lineView.sd_layout
    .topSpaceToView(self.reasonLabel, 15)
    .leftEqualToView(self.reasonView)
    .heightIs(0.5)
    .rightEqualToView(self.reasonView);
    
    self.reasonTextView.sd_layout
    .topSpaceToView(self.lineView, 15)
    .leftSpaceToView(self.reasonView, 15)
    .bottomEqualToView(self.reasonView)
    .rightSpaceToView(self.reasonView, 15);
    
    self.moneyLabel.text = self.totalMoney;
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 申请退款
- (void)applyMoneyBack{
    
    if (_reasonTextView.text.length < 1) {
        [SVProgressHUD showErrorWithStatus:@"请输入退货说明"];
    }else{
        NSDictionary *dict = @{@"mainOrderMdf":self.mdfStr,
                               @"reason":_reasonTextView.text};
        
        [YSSCShareBusinessManager.userManager applyRefundWithDictionary:dict success:^(id object) {
            ServerStatusObject *severStatusObject = object;
            if (severStatusObject.errorCode.integerValue == SeverStateSuccess) {
                [SVProgressHUD showSuccessWithStatus:severStatusObject.errorMsg];
            }else{
                [SVProgressHUD showErrorWithStatus:severStatusObject.errorMsg];
            }
            
            
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            
        }];
    }
    
}

#pragma mark - textView代理

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"请输入退款原因"]) {
        textView.text = @"";
    }
}


@end
