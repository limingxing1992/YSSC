//
//  UserHotelOrderDetailViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//乡宿订单详情

#import "UserHotelOrderDetailViewController.h"
#import "UserHotleOrderDetailTopCell.h"
#import "UserHotelOrderDetailCell.h"
#import "UserHotelOrderGuestInfoCell.h"
#import "UserHotelOrderDetailObject.h"
#import "HotelPayViewController.h"
#import "HotelOrderObject.h"
#import "UserOrderCommentViewController.h"

@interface UserHotelOrderDetailViewController ()

<
UITableViewDelegate,
UITableViewDataSource
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**model*/
@property (nonatomic, strong) UserHotelOrderDetailObject *hotelOrderDetailObject;
/**取消订单*/
@property (nonatomic, strong) UIButton *cancelOrderButton;
/**立即支付*/
@property (nonatomic, strong) UIButton *payButton;
/**立即评价*/
@property (nonatomic, strong) UIButton *commentButton;
/**orderObject传给支付页面*/
@property (nonatomic, strong) HotelOrderObject *orderObject;

@end

@implementation UserHotelOrderDetailViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"订单详情"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        _tableView.backgroundColor = BACKGROUNDCOLOR;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[UserHotleOrderDetailTopCell class] forCellReuseIdentifier:@"userHotleOrderDetailTopCell"];
        [_tableView registerClass:[UserHotelOrderDetailCell class] forCellReuseIdentifier:@"userHotelOrderDetailCell"];
        [_tableView registerClass:[UserHotelOrderGuestInfoCell class] forCellReuseIdentifier:@"userHotelOrderGuestInfoCell"];
    }
    return _tableView;
}

- (UIButton *)cancelOrderButton{
    if (_cancelOrderButton == nil) {
        _cancelOrderButton = [[UIButton alloc] init];
        [_cancelOrderButton setTitle:@"取消订单" forState:UIControlStateNormal];
        [_cancelOrderButton setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [_cancelOrderButton setBackgroundImage:[UIImage imageWithColor:GRAYCOLOR] forState:UIControlStateNormal];
        _cancelOrderButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH * 0.5, 49);
        [_cancelOrderButton addTarget:self action:@selector(alertView:) forControlEvents:UIControlEventTouchUpInside];
        _cancelOrderButton.hidden = YES;
        
    }
    return _cancelOrderButton;
}

- (UIButton *)payButton{
    if (_payButton == nil) {
        _payButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT - 49, SCREEN_WIDTH * 0.5, 49)];
        [_payButton setTitle:@"立即支付" forState:UIControlStateNormal];
        [_payButton setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_payButton setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
        [_payButton addTarget:self action:@selector(payButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _payButton.hidden = YES;
    }
    return _payButton;
}

- (UIButton *)commentButton{
    if (_commentButton == nil) {
        _commentButton = [[UIButton alloc] init];
        [_commentButton setTitle:@"立即评价" forState:UIControlStateNormal];
        [_commentButton setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
        [_commentButton setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        _commentButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
        _commentButton.hidden = YES;
        [_commentButton addTarget:self action:@selector(commentButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentButton;
}


#pragma mark --------- 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [self requestHotelOrder];
}

- (void)setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.cancelOrderButton];
    [self.view addSubview:self.payButton];
    [self.view addSubview:self.commentButton];
    
    self.tableView.sd_layout
    .topSpaceToView(self.navBar, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomSpaceToView(self.payButton, 0);
    
    
    
}
- (void)requestHotelOrder{
    [YSSCShareBusinessManager.userManager getUserHotelOrderDetailWithDictionary:@{@"orderMdf":self.orderMdfString} success:^(id object) {
        if (object) {
            UserHotelOrderDetailObject *hotelOrderDetailObject = object;
            if (hotelOrderDetailObject.errorCode.integerValue == SeverStateSuccess) {
                self.hotelOrderDetailObject = hotelOrderDetailObject;
                [self.tableView reloadData];
                //    status 订单状态 // 可选 空查询全部 10：待付款，20：待入住 30：待退房 40：待评价 50:已完结
                if (self.hotelOrderDetailObject.data.status.integerValue == UserHotelOrderStateReadyToPay) {
                    self.payButton.hidden = NO;
                    self.cancelOrderButton.hidden = NO;
                }else{
                    self.payButton.hidden = YES;
                    self.cancelOrderButton.hidden = YES;
                }
                
                if (self.hotelOrderDetailObject.data.status.integerValue == UserHotelOrderStateReadyToComment) {
                    self.commentButton.hidden = NO;
                }else{
                    self.commentButton.hidden = YES;
                }
            }
        }
        
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

#pragma mark --------- 代理


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 1;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UserHotleOrderDetailTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userHotleOrderDetailTopCell"];
        cell.model = self.hotelOrderDetailObject;
        return cell;
    }else if (indexPath.section == 1){
        UserHotelOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userHotelOrderDetailCell"];
        cell.model = self.hotelOrderDetailObject;
        return cell;
    }else{
        UserHotelOrderGuestInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userHotelOrderGuestInfoCell"];
        [cell setName:self.hotelOrderDetailObject.data.book_person
             phoneNum:self.hotelOrderDetailObject.data.book_telephone];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
    return height;
}

#pragma mark --------- 点击事件处理
//立即支付
- (void)payButtonClick:(UIButton *)button{
    
    self.orderObject = [[HotelOrderObject alloc] init];
    HotelOrderDataObject *data = [[HotelOrderDataObject alloc] init];
    data.roomName = self.hotelOrderDetailObject.data.room_name;
    data.ordernumber = self.hotelOrderDetailObject.data.order_number;
    data.totalMoney = self.hotelOrderDetailObject.data.total_money;
    data.balance = self.hotelOrderDetailObject.data.balance;
    data.comeTime = self.hotelOrderDetailObject.data.come_time;
    data.leaveTime = self.hotelOrderDetailObject.data.leave_time;
    data.pic = self.hotelOrderDetailObject.data.pic;
    _orderObject.data = data;
    HotelPayViewController *payVC = [[HotelPayViewController alloc] init];
    payVC.orderModel = _orderObject;
    payVC.hotelName = self.hotelOrderDetailObject.data.hotel_name;
    [self.navigationController pushViewController:payVC animated:YES];
    
}
//立即评价
- (void)commentButtonClick{
    UserOrderCommentViewController *hotelCommentVC = [[UserOrderCommentViewController alloc] init];
    hotelCommentVC.isHotelOrder = YES;
    hotelCommentVC.hotelModel = self.hotelOrderDetailObject;
    [self.navigationController pushViewController:hotelCommentVC animated:YES];
}


- (void)cancelOrder:(UIButton *)button{
   
    
    [YSSCShareBusinessManager.userManager cancelHotelOrderWithDictionary:@{@"orderMdf":_orderMdfString} success:^(id object) {
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

- (void)alertView:(UIButton *)button{
    
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提醒" message:@"确定要取消订单吗" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *actiondel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
        [self cancelOrder:button];
        
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        [action setValue:MALLColor forKey:@"_titleTextColor"];
    }
    
    [alertVc addAction:action];
    [alertVc addAction:actiondel];
    [self presentViewController:alertVc animated:YES completion:nil];
    
}



@end
