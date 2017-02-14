//
//  UserGoodsOrderDetailViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserGoodsOrderDetailViewController.h"
#import "UserOrderDetailAddressCell.h"
#import "UserOrderDetailMailCell.h"
#import "UserOrderDetailMoneyCell.h"
#import "UserOrderTopCell.h"
#import "UserOrderGoodsCell.h"
#import "UserOrderMoneyCell.h"
#import "UserOrderBottomCell.h"
#import "UserGoodsOrderObject.h"
#import "UserGoodsOrderDetailObject.h"
#import "UserOrderGoodsDetailCell.h"
#import "MallPayViewController.h"
#import "UserOrderCommentViewController.h"
#import "UserHotelOrderObject.h"
#import "UserApplayServiceViewController.h"


@interface UserGoodsOrderDetailViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**顶部视图 待付款 待收货 待评价*/
@property (nonatomic, strong) UIImageView *topView;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;

/**等待付款状态 底部按钮*/
@property (nonatomic, strong) UIView *payMoneyBtnView;
/**取消订单按钮*/
@property (nonatomic, strong) UIButton *cancelOrderBtn;
/**立即支付按钮*/
@property (nonatomic, strong) UIButton *payNowBtn;

/**确认收货*/
@property (nonatomic, strong) UIButton *makeSureReceiveBtn;
/**立即评价*/
@property (nonatomic, strong) UIButton *judgeBtn;



///**订单请求参数*/
//@property (nonatomic, strong) NSMutableDictionary *parameterDict;
/**请求后得到的模型*/
@property (nonatomic, strong) UserGoodsOrderDetailObject *goodsOrderDetailObject;


@end

@implementation UserGoodsOrderDetailViewController

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

- (UIImageView *)topView{
    if (_topView == nil) {
        _topView = [[UIImageView alloc] init];
        _topView.backgroundColor= MALLColor;
    }
    return _topView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = BACKGROUNDCOLOR;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[UserOrderTopCell class] forCellReuseIdentifier:@"userOrderTopCell"];
        [_tableView registerClass:[UserOrderMoneyCell class] forCellReuseIdentifier:@"userOrderMoneyCell"];
        [_tableView registerClass:[UserOrderGoodsDetailCell class] forCellReuseIdentifier:@"userOrderGoodsDetailCell"];
        [_tableView registerClass:[UserOrderDetailAddressCell class] forCellReuseIdentifier:@"userOrderDetailAddressCell"];
        [_tableView registerClass:[UserOrderDetailMailCell class] forCellReuseIdentifier:@"userOrderDetailMailCell"];
        [_tableView registerClass:[UserOrderDetailMoneyCell class] forCellReuseIdentifier:@"userOrderDetailMoneyCell"];
        [_tableView registerClass:[UserOrderBottomCell class] forCellReuseIdentifier:@"userOrderBottomCell"];

    }
    return _tableView;
}

- (UIView *)payMoneyBtnView{
    if (_payMoneyBtnView == nil) {
        _payMoneyBtnView = [[UIView alloc] init];
        _payMoneyBtnView.hidden = YES;
    }
    return _payMoneyBtnView;
    
}
- (UIButton *)cancelOrderBtn{
    if (_cancelOrderBtn == nil) {
        _cancelOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelOrderBtn setTitle:@"取消订单" forState:UIControlStateNormal];
        [_cancelOrderBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
//        _cancelOrderBtn.backgroundColor = GRAYCOLOR;
        [_cancelOrderBtn setBackgroundImage:[UIImage imageWithColor:GRAYCOLOR] forState:UIControlStateNormal];
        [_cancelOrderBtn addTarget:self action:@selector(alertView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelOrderBtn;
}
- (UIButton *)payNowBtn{
    if (_payNowBtn == nil) {
        _payNowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payNowBtn.backgroundColor = MALLColor;
        [_payNowBtn setTitle:@"立即支付" forState:UIControlStateNormal];
        [_payNowBtn addTarget:self action:@selector(payMoney) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payNowBtn;
}

- (UIButton *)makeSureReceiveBtn{
    if (_makeSureReceiveBtn == nil) {
        _makeSureReceiveBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
        
        [_makeSureReceiveBtn setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
        [_makeSureReceiveBtn setTitle:@"确认收货" forState:UIControlStateNormal];
        _makeSureReceiveBtn.hidden = YES;
        [_makeSureReceiveBtn addTarget:self action:@selector(receiveGoods) forControlEvents:UIControlEventTouchUpInside];
    }
    return _makeSureReceiveBtn;
}

- (UIButton *)judgeBtn{
    if (_judgeBtn == nil) {
        _judgeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
        [_judgeBtn setBackgroundColor:MALLColor];
        [_judgeBtn setTitle:@"立即评价" forState:UIControlStateNormal];
        _judgeBtn.hidden = YES;
        [_judgeBtn addTarget:self action:@selector(judge) forControlEvents:UIControlEventTouchUpInside];
    }
    return _judgeBtn;
}



#pragma mark --------- 生命周期

- (instancetype)initWithStatus:(PayStatus)status{
    if (self = [super init]) {
        switch (status) {
            case PayStatusWaitMoney:
                self.topView.image = IMAGE(@"classify157");
                self.payMoneyBtnView.hidden = NO;
                break;
            case PayStatusWaitDelivery:
                self.topView.image = IMAGE(@"classify158");
                break;
            case PayStatusWaitReceive:
                self.topView.image = IMAGE(@"classify154");
                self.makeSureReceiveBtn.hidden = NO;
                break;
            case PayStatusWaitJudge:
                self.topView.image = IMAGE(@"classify153");
                self.judgeBtn.hidden = NO;
                break;
            case PayStatusFinish:
                self.topView.image = IMAGE(@"classify159");
                break;
            default:
                break;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = BACKGROUNDCOLOR;
    self.tabBarController.tabBar.hidden = YES;
    [self requestOrderDetail];
    
}

#pragma mark --------- 请求网络数据
- (void)requestOrderDetail{
    [YSSCShareBusinessManager.userManager getUserGoodsOrderDetailWithDictionary:@{@"orderMdf":self.orderMdfString} success:^(id object) {
        if (object) {
            self.goodsOrderDetailObject = object;
            if (self.goodsOrderDetailObject.errorCode.integerValue == SeverStateSuccess) {
                
                [self.tableView reloadData];
            }
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

- (void)setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.payMoneyBtnView];
    [self.payMoneyBtnView addSubview:self.cancelOrderBtn];
    [self.payMoneyBtnView addSubview:self.payNowBtn];
    [self.view addSubview:self.makeSureReceiveBtn];
    [self.view addSubview:self.judgeBtn];
    
    self.topView.sd_layout
    .topSpaceToView(self.navBar, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(67.5);
    
    self.tableView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomSpaceToView(self.view, 48);
    
    self.payMoneyBtnView.sd_layout
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(49);
    
    self.cancelOrderBtn.sd_layout
    .leftEqualToView(self.payMoneyBtnView)
    .topEqualToView(self.payMoneyBtnView)
    .bottomEqualToView(self.payMoneyBtnView)
    .widthRatioToView(self.payMoneyBtnView, 0.5);
    
    self.payNowBtn.sd_layout
    .topEqualToView(self.payMoneyBtnView)
    .rightEqualToView(self.payMoneyBtnView)
    .bottomEqualToView(self.payMoneyBtnView)
    .widthRatioToView(self.payMoneyBtnView, 0.5);
    
}

#pragma mark --------- tableView代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        if (self.goodsOrderDetailObject.data.status.integerValue == 30) {
            return self.goodsOrderDetailObject.data.goods.count + 4;//如果是待收货状态 需要加一行售后
        }
        return self.goodsOrderDetailObject.data.goods.count + 3; //3是头部底部和显示金额
    }else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0){
        UserOrderDetailAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderDetailAddressCell"];
        cell.model = self.goodsOrderDetailObject;
        return cell;
    }else if (indexPath.section == 1){
        UserOrderDetailMailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderDetailMailCell"];
        cell.model = self.goodsOrderDetailObject;
        return cell;
    }else if (indexPath.section == 2 && indexPath.row == 0){
        UserOrderTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderTopCell"];
        [cell setTitle:self.goodsOrderDetailObject.data.shopname status:nil];
        return cell;
    }else if (indexPath.section == 2 && indexPath.row > 0 && indexPath.row < self.goodsOrderDetailObject.data.goods.count + 1){
        UserGoodsDetailObject *goodsObject = self.goodsOrderDetailObject.data.goods[indexPath.row - 1];
        
        UserOrderGoodsDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderGoodsDetailCell"];
        cell.model = goodsObject;
        return cell;
    }else if (indexPath.section == 2 && indexPath.row == 1 + self.goodsOrderDetailObject.data.goods.count){
        
        UserOrderDetailMoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderDetailMoneyCell"];
        
        [cell setMoney:self.goodsOrderDetailObject.data.total_money mailMoney:self.goodsOrderDetailObject.data.express_money];
        return cell;
    }else if (indexPath.section == 2 && indexPath.row == 2 + self.goodsOrderDetailObject.data.goods.count){
        UserOrderMoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderMoneyCell"];
        [cell setMoney:self.goodsOrderDetailObject.data.total_money];
        return cell;
    }else{
        UserOrderBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderBottomCell"];
        UserGoodsOrderDataObject *cellModel = [[UserGoodsOrderDataObject alloc] init];
        cellModel.status = self.goodsOrderDetailObject.data.status;
        [cell.serviceBtn addTarget:self action:@selector(applyService) forControlEvents:UIControlEventTouchUpInside];
        cell.goodsModel = cellModel;
        return cell;
    }
        
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
    return height + 0.5;
}

#pragma mark --------- 点击事件处理


- (void)goodsCancel:(UIButton *)button{
    
    
    
    [YSSCShareBusinessManager.userManager cancelUserGoodsOrderDetailWithDictionary:nil success:^(id object) {
        if (object) {
            ServerStatusObject *severStatusObject = object;
            if (severStatusObject.errorCode.integerValue == SeverStateSuccess) {
                [SVProgressHUD showSuccessWithStatus:severStatusObject.errorMsg];
            }else{
                [SVProgressHUD showErrorWithStatus:severStatusObject.errorMsg];
            }
            
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
        [self goodsCancel:button];
        
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        [action setValue:MALLColor forKey:@"_titleTextColor"];
    }
    
    [alertVc addAction:action];
    [alertVc addAction:actiondel];
    [self presentViewController:alertVc animated:YES completion:nil];
    
}
#pragma mark - 收货
- (void)receiveGoods{
    
    NSDictionary *dict = @{@"mainOrderMdf":self.orderMdfString};
    
    [YSSCShareBusinessManager.userManager confirmReceiveGoodWithDictionary:dict success:^(id object) {
        ServerStatusObject *severStatusObject = object;
        if (severStatusObject.errorCode.integerValue == SeverStateSuccess) {
            [SVProgressHUD showSuccessWithStatus:severStatusObject.errorMsg];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }else{
            [SVProgressHUD showErrorWithStatus:severStatusObject.errorMsg];
        }
        
    
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        NSLog(@"%@",errorMsg);
    }];
}


//评论
- (void)judge{
    
    UserOrderCommentViewController *commetnVC = [[UserOrderCommentViewController alloc] init];
    commetnVC.model = self.goodsOrderDetailObject;
    [self.navigationController pushViewController:commetnVC animated:YES];
}

- (void)payMoney{
    
    MallPayViewController *payVC = [[MallPayViewController alloc] init];
    payVC.orderNum = self.goodsOrderDetailObject.data.order_number;
    payVC.totalPrice = self.goodsOrderDetailObject.data.total_money;
    payVC.blancePrice = self.goodsOrderDetailObject.data.balance;
    payVC.orderCreateTime = self.goodsOrderDetailObject.data.order_time;
    [self.navigationController  pushViewController:payVC animated:YES];
    
    
}

#pragma mark - 申请售后 退款
- (void)applyService{
    UserApplayServiceViewController *applyServiceVC = [[UserApplayServiceViewController alloc] init];
    applyServiceVC.mdfStr = self.goodsOrderDetailObject.data.ordermdf;
    applyServiceVC.totalMoney = self.goodsOrderDetailObject.data.total_money;
    [self.navigationController pushViewController:applyServiceVC animated:YES];
}
@end
