//
//  HotelSubmitOrderViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelSubmitOrderViewController.h"
#import "HotelSubmitOrderCell.h"

#import "RoomTypeObject.h"
#import "HotelOrderObject.h"

#import "HotelPayViewController.h"
#import "HotelOrderObject.h"
#import "UIImage+Image.h"

#import "HotelSubmitOrderEditCell.h"
#import "UIButton+touch.h"

@interface HotelSubmitOrderViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**订单金额*/
@property (nonatomic, strong) UIView *moneyView;
/**订单金额Title*/
@property (nonatomic, strong) UILabel *moneyTitleLabel;
/**订单金额money*/
@property (nonatomic, strong) UILabel *moneyLabel;
/**去支付*/
@property (nonatomic, strong) UIButton *payButton;
/**订单模型*/
@property (nonatomic, strong) HotelOrderObject *orderModel;

/**入住人*/
@property (nonatomic, strong) NSString *userName;
/**电话号码*/
@property (nonatomic, strong) NSString *phoneNmu;

@end

@implementation HotelSubmitOrderViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"username"] isEqualToString:[[NSUserDefaults standardUserDefaults] valueForKey:@"phone"]]) {
        self.userName = nil;
    }else{
        self.userName = [[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
    }
    
    self.phoneNmu = [[NSUserDefaults standardUserDefaults] valueForKey:@"phone"];
    [self setupUI];
    
    self.moneyLabel.text = [NSString stringWithFormat:@"¥：%.2f",self.money.floatValue];
}

- (void)setupUI{
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.moneyView];
    [self.moneyView addSubview:self.moneyTitleLabel];
    [self.moneyView addSubview:self.moneyLabel];
    [self.view addSubview:self.payButton];
    
    self.moneyView.sd_layout
    .leftSpaceToView(self.view, 0)
    .bottomEqualToView(self.view)
    .widthRatioToView(self.view, 0.62)
    .heightIs(50);
    
    self.moneyTitleLabel.sd_layout
    .leftSpaceToView(self.moneyView, 15)
    .centerYEqualToView(self.moneyView)
    .autoHeightRatio(0);
    [self.moneyTitleLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.moneyLabel.sd_layout
    .leftSpaceToView(self.moneyTitleLabel, 15)
    .centerYEqualToView(self.moneyView)
    .autoHeightRatio(0);
    [self.moneyLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.payButton.sd_layout
    .leftSpaceToView(self.moneyView, 0)
    .bottomSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(50);
    
}

#pragma mark - tableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YSSCWeakObj(self);
    if (indexPath.section == 0 ) {
        HotelSubmitOrderCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"hotelSubmitOrderCell"];
        [cell setHotelName:self.hotelName icon:self.roomTypeModel.thumb_pic type:self.roomTypeModel.room_name setDateArray:self.dateArray];
        return cell;
    }else if (indexPath.row == 0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell"];
        cell.textLabel.text = [NSString stringWithFormat:@"房间数： %@",@1];
        cell.textLabel.font = FONT(14);
        cell.textLabel.textColor = LIGHTTEXTCOLOR;
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = GRAYCOLOR;
        [cell addSubview:lineView];
        lineView.frame = CGRectMake(0, 43.5, SCREEN_WIDTH, 0.5);
        UIView *lineViewTop = [[UIView alloc] init];
        lineViewTop.backgroundColor = GRAYCOLOR;
        [cell addSubview:lineViewTop];
        lineViewTop.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
        return cell;
    }else if (indexPath.row == 1){
        
        HotelSubmitOrderEditCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotelSubmitOrderEditCell"];
        [cell setTitle:@"入住人" content:weakself.userName];
        [cell callBack:^(NSString *contentString) {
            
            if ([contentString validateMobile]) {
                weakself.userName = @"";
            }else{
                weakself.userName = contentString;
            }
            
        }];
        return cell;
    }else {
        HotelSubmitOrderEditCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotelSubmitOrderEditCell"];
        [cell setTitle:@"电话号" content:self.phoneNmu];
        [cell callBack:^(NSString *contentString) {
            weakself.phoneNmu = contentString;
        }];
        return cell;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 3;
    }else{
        return 1;//测试
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 45;
    }else{
        return 90;
    }
}

#pragma mark - 跳转到支付页面
- (void)payOrder{
    
    if (self.userName == nil) {
        self.userName = @"";
    }
    if (self.phoneNmu == nil) {
        self.phoneNmu = @"";
    }
    NSDictionary *parma = @{@"roomId":self.roomTypeModel.ID,
                            @"roomNum":@"1",//测试
                            @"comeTime":self.dateArray.firstObject,
                            @"leaveTime":self.dateArray.lastObject,
                            @"bookPerson":self.userName,
                            @"telphone":self.phoneNmu
                            };
    //发送下订单请求
    [[BusinessManager shareBusinessManager].hotelManger getHotelOrderWithDictionary:parma success:^(id object) {
        HotelOrderObject *obj = object;
        if (obj.errorCode.integerValue == SeverStateSuccess) {//订单请求成功
            self.orderModel = object;
            if ([obj.errorMsg isEqualToString:@"操作成功"]) {
                [SVProgressHUD showSuccessWithStatus:@"预定成功"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.moneyLabel.text = [NSString stringWithFormat:@"¥ %@",obj.data.totalMoney];
                    HotelPayViewController *payVC = [[HotelPayViewController alloc] init];
                    payVC.hotelName = self.hotelName;
                    payVC.orderModel = self.orderModel;
            
                    [self.navigationController pushViewController:payVC animated:YES];
                });
               
            }else{
                 [SVProgressHUD showErrorWithStatus:obj.errorMsg];
            }
        }else {
            [SVProgressHUD showErrorWithStatus:obj.errorMsg];
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showWithStatus:@"网络不给力，请检查网络状态"];
    }];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (void)alertViewWithTitle:(NSString *)str{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提醒" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
        ///modal出登录界面
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [self presentViewController:loginVC animated:YES completion:nil];
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        [action setValue:MALLColor forKey:@"_titleTextColor"];
    }
    [alertVc addAction:action];
    [self presentViewController:alertVc animated:YES completion:nil];
    
}
#pragma mark - 懒加载
- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"提交订单"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = BACKGROUNDCOLOR;
        _tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 50);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[HotelSubmitOrderCell class] forCellReuseIdentifier:@"hotelSubmitOrderCell"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normalCell"];
        [_tableView registerClass:[HotelSubmitOrderEditCell class] forCellReuseIdentifier:@"hotelSubmitOrderEditCell"];
    }
    return _tableView;
}

- (UIView *)moneyView{
    if (_moneyView == nil) {
        _moneyView = [[UIView alloc] init];
        _moneyView.backgroundColor = [UIColor whiteColor];
    }
    return _moneyView;
}

- (UILabel *)moneyTitleLabel{
    if (_moneyTitleLabel == nil) {
        _moneyTitleLabel = [[UILabel alloc] init];
        _moneyTitleLabel.font = FONT(14);
        _moneyTitleLabel.textColor = SHENTEXTCOLOR;
        _moneyTitleLabel.text = @"订单金额";
    }
    return _moneyTitleLabel;
}

- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = MALLColor;
        _moneyLabel.font = FONT(14);
    }
    return _moneyLabel;
}

- (UIButton *)payButton{
    if (_payButton == nil) {
        _payButton = [[UIButton alloc] init];
        _payButton.timeInterval = 1;
        [_payButton setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
        [_payButton setTitle:@"去支付" forState:UIControlStateNormal];
        [_payButton addTarget:self action:@selector(payOrder) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payButton;
}
@end
