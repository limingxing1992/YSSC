//
//  UserOrderSubViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/19.
//  Copyright © 2016年 zzz. All rights reserved.
//  商品订单

#import "UserOrderSubViewController.h"
#import "UserOrderViewController.h"
#import "YSSButtonListView.h"
#import "UserMenuVC.h"
#import "UserTitleButton.h"
#import "UserPOPMenu.h"
#import "UserOrderTopCell.h"
#import "UserOrderHotelCell.h"
#import "UserOrderMoneyCell.h"
#import "UserOrderGoodsCell.h"
#import "UserOrderBottomCell.h"
#import "UserOrderGoodsCell.h"
#import "UserHotelOrderObject.h"

#import "UserHotelOrderDetailViewController.h"
#import "UserGoodsOrderDetailViewController.h"

#import "UserGoodsOrderObject.h"

#import "UserApplayServiceViewController.h"




@interface UserOrderSubViewController ()

<
    UITableViewDelegate,
    UITableViewDataSource,
    YSSButtonListViewDelegate
>


/**顶部选择列表*/
@property (nonatomic, strong) YSSButtonListView *topButtonListView;
/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**商品订单模型*/
@property (nonatomic, strong) UserGoodsOrderObject *goodsOrderObject;
/**订单状态字典*/
@property (nonatomic, strong) NSDictionary *goodsOrderStatusDict;
/**page*/
@property (nonatomic, assign) NSInteger page;
/**商品订数组*/
@property (nonatomic, strong) NSMutableArray *goodsOrderList;


@end

@implementation UserOrderSubViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] init];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"订单详情"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navBar;
}

- (YSSButtonListView *)topButtonListView{
    if (_topButtonListView == nil) {
        _topButtonListView = [[YSSButtonListView alloc] init];
        _topButtonListView.delegate = self;
        _topButtonListView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 45);
        [_topButtonListView setButtonTitleArray:@[@"全部",@"待付款",@"待发货",@"待收货",@"待评价",@"已完成"]];
    }
    return _topButtonListView;
}

- (NSMutableArray *)goodsOrderList{
    if (_goodsOrderList == nil) {
        _goodsOrderList = [[NSMutableArray alloc] init];
    }
    return _goodsOrderList;
}
- (NSDictionary *)goodsOrderStatusDict{
    if (_goodsOrderStatusDict == nil) {
        _goodsOrderStatusDict = @{@"10":@"待付款",
                                  @"20":@"待发货",
                                  @"30":@"待收货",
                                  @"40":@"待评价",
                                  @"50":@"已完结",
                                  @"200":@"待退款",
                                  @"210":@"买家填单",
                                  @"220":@"卖家收货",
                                  @"230":@"已退款",
                                  @"400":@"已取消",
                                  @"404":@"超时取消",
                                  @"600":@"买家删除"};
    }
    return _goodsOrderStatusDict;
}

- (NSMutableDictionary *)goodsParameterDict{
    if (_goodsParameterDict == nil) {
        _goodsParameterDict = [[NSMutableDictionary alloc] init];
    }
    return _goodsParameterDict;
}


- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
        _tableView.backgroundColor = GRAYCOLOR;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[UserOrderTopCell class] forCellReuseIdentifier:@"userOrderTopCell"];
        [_tableView registerClass:[UserOrderMoneyCell class] forCellReuseIdentifier:@"userOrderMoneyCell"];
        [_tableView registerClass:[UserOrderHotelCell class] forCellReuseIdentifier:@"userOrderHotelCell"];
        [_tableView registerClass:[UserOrderBottomCell class] forCellReuseIdentifier:@"userOrderBottomCell"];
        [_tableView registerClass:[UserOrderGoodsCell class] forCellReuseIdentifier:@"userOrderGoodsCell"];
        YSSCWeakObj(self);
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           
            [weakself requestGoodsOrder];
            [_tableView.mj_footer endRefreshing];
        }];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakself.page = 1;
            [weakself requestGoodsOrder];
            [SVProgressHUD showWithStatus:@"正在加载..."];
        }];
        
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.page = 1;
    self.tabBarController.tabBar.hidden = YES;
    [self.tableView.mj_header beginRefreshing];
    
    if ([_goodsParameterDict[@"status"] isEqualToString:@"10"]) {
       [self.topButtonListView selectBtnAtIndex:1];
    }
    if ([_goodsParameterDict[@"status"] isEqualToString:@"20"]) {
       [self.topButtonListView selectBtnAtIndex:2];
    }
    if ([_goodsParameterDict[@"status"] isEqualToString:@"30"]) {
       [self.topButtonListView selectBtnAtIndex:3];
    }
    if ([_goodsParameterDict[@"status"] isEqualToString:@"40"]) {
       [self.topButtonListView selectBtnAtIndex:4];
    }
    
}

- (instancetype)initWithNav{
    self = [super init];
    [self.view addSubview:self.navBar];
    self.navBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    self.topButtonListView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 45);
    self.tableView.frame = CGRectMake(0, 64 + 45, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 45);
    self.automaticallyAdjustsScrollViewInsets = NO;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}



- (void)setupUI{
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.topButtonListView];
    self.tableView.sd_layout
    .topSpaceToView(self.topButtonListView, 0)
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .rightEqualToView(self.view);
}

#pragma mark --------- 获取商品订单

- (void)requestGoodsOrder{
    [self.goodsParameterDict setObject:[NSString stringWithFormat:@"%zd",self.page] forKey:@"page"];
    [self.goodsParameterDict setObject:@"5" forKey:@"pageSize"];
    
    
    [YSSCShareBusinessManager.userManager getUserGoodsOrderWithDictionary:self.goodsParameterDict success:^(id object) {
        if (object) {
            UserGoodsOrderObject *goodsOrderObject = object;
            if (goodsOrderObject.errorCode.integerValue == SeverStateSuccess) {
                
                if (self.page == 1) {
                    [self.goodsOrderList removeAllObjects];
                }
                
                if (goodsOrderObject.data.count > 0) {
                    self.goodsOrderObject = goodsOrderObject;
                    [self.goodsOrderList addObjectsFromArray:goodsOrderObject.data];
                    self.page += 1;
                }
                
                NSInteger goodsCount = 0;//计算一共有多少件货
                for (UserGoodsOrderDataObject *goodsOrder in goodsOrderObject.data) {
                    goodsCount = goodsCount + goodsOrder.goods.count;
                }
                NSInteger totalcell = (SCREEN_HEIGHT - 64)/200;
                
                if (goodsCount <=  totalcell) {
                    
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.mj_footer.hidden = NO;
                    [_tableView.mj_footer setState:MJRefreshStateIdle];
                }
                
                if (goodsOrderObject.data.count < 5) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
                
                [SVProgressHUD dismiss];
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
            }else{
                [SVProgressHUD showErrorWithStatus:goodsOrderObject.errorMsg];
                [self.tableView.mj_header endRefreshing];
            }
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:@"网络请求失败"];
        [self.tableView.mj_header endRefreshing];
    }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UserGoodsOrderDataObject *userOrderDataObject = self.goodsOrderList[indexPath.section];
    if (userOrderDataObject.status.integerValue == 10) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusWaitMoney];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
        
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
    if (userOrderDataObject.status.integerValue == 20) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusWaitDelivery];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
    if (userOrderDataObject.status.integerValue == 30) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusWaitReceive];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
    if (userOrderDataObject.status.integerValue == 40) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusWaitJudge];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
    if (userOrderDataObject.status.integerValue == 50) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusFinish];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserGoodsOrderDataObject * goodsDataObject = self.goodsOrderList[indexPath.section];
    if (indexPath.row >= 1 && indexPath.row <= goodsDataObject.goods.count) {
        return 100;
    }else{
        return 35;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.goodsOrderList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    UserGoodsOrderDataObject * goodsDataObject = self.goodsOrderList[section];
    return goodsDataObject.goods.count + 3;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserGoodsOrderDataObject *goodsDataObject;
    if (self.goodsOrderList.count > 0) {
        goodsDataObject = self.goodsOrderList[indexPath.section];
    }else{
        goodsDataObject = [UserGoodsOrderDataObject new];
    }
    

    if (indexPath.row == 0) {
        UserOrderTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderTopCell"];
        [cell setTitle:goodsDataObject.order_number status:[self.goodsOrderStatusDict objectForKey:goodsDataObject.status]];
        return cell;
    }else if (indexPath.row > 0 && indexPath.row <= goodsDataObject.goods.count){
        UserOrderGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderGoodsCell" forIndexPath:indexPath];
       
        UserGoodsObject *goodsObject = goodsDataObject.goods[indexPath.row - 1];
        cell.model = goodsObject;
        
        // [cell setName:@"月饼" goodsType:@"300g" goodsMoney:31.4 count:1];
        return cell;
    }else if (indexPath.row == goodsDataObject.goods.count + 1){
        
        UserOrderMoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderMoneyCell"];
        [cell setMoney:goodsDataObject.totalprice];
        return cell;
    }else{
        
        UserOrderBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderBottomCell"];
        
        cell.goodsModel = goodsDataObject;
        [cell.cancelBtn addTarget:self action:@selector(alertView:) forControlEvents:UIControlEventTouchUpInside];
        cell.cancelBtn.tag = indexPath.section;
        [cell.nextBtn addTarget:self action:@selector(goodsNext:) forControlEvents:UIControlEventTouchUpInside];
        cell.nextBtn.tag = indexPath.section;
        cell.serviceBtn.tag = indexPath.section;
        [cell.serviceBtn addTarget:self action:@selector(serviceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

    }

}

- (void)yssButtonListView:(UIView *)view buttonDidSelect:(UIButton *)button{
    [SVProgressHUD showWithStatus:@"正在加载..."];
    if ([button.currentTitle isEqualToString:@"全部"]) {
        [self.goodsParameterDict setObject:@"" forKey:@"status"];
    }
    if ([button.currentTitle isEqualToString:@"待付款"]) {
        [self.goodsParameterDict setObject:@"10" forKey:@"status"];
    }
    if ([button.currentTitle isEqualToString:@"待发货"]) {
        [self.goodsParameterDict setObject:@"20" forKey:@"status"];
    }
    if ([button.currentTitle isEqualToString:@"待收货"]) {
        [self.goodsParameterDict setObject:@"30" forKey:@"status"];
    }
    if ([button.currentTitle isEqualToString:@"待评价"]) {
        [self.goodsParameterDict setObject:@"40" forKey:@"status"];
    }
    if ([button.currentTitle isEqualToString:@"已完成"]) {
        [self.goodsParameterDict setObject:@"00" forKey:@"status"];
    }
    
    self.page = 1;
    [self.tableView.mj_header beginRefreshing];
}



#pragma mark - 点击了取消商品按钮

- (void)goodsCancel:(UIButton *)button{
    
    UserGoodsOrderDataObject *dataObject =  self.goodsOrderList[button.tag];
    [YSSCShareBusinessManager.userManager cancelUserGoodsOrderDetailWithDictionary:@{@"mainOrderMdf":dataObject.mdf} success:^(id object) {
        if (object) {
            ServerStatusObject *severStatusObject = object;
            if (severStatusObject.errorCode.integerValue == SeverStateSuccess) {
                [SVProgressHUD showSuccessWithStatus:severStatusObject.errorMsg];
                [self.tableView.mj_header beginRefreshing];
            }else{
                [SVProgressHUD showErrorWithStatus:severStatusObject.errorMsg];
            }
            
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:@"取消失败，请检查网络"];
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

#pragma mark - 点击了申请售后

- (void)serviceBtnClick:(UIButton *)button{
    UserGoodsOrderDataObject *userOrderDataObject = self.goodsOrderList[button.tag];
    UserApplayServiceViewController *applyServiceVC = [[UserApplayServiceViewController alloc] init];
    applyServiceVC.mdfStr = userOrderDataObject.mdf;
    applyServiceVC.totalMoney = userOrderDataObject.totalprice;
    [self.navigationController pushViewController:applyServiceVC animated:YES];
    
}

#pragma mark - 点击了商品下一步按钮

- (void)goodsNext:(UIButton *)button{
    
//    typedef NS_ENUM(NSUInteger, PayStatus) {
//        PayStatusWaitMoney = 0,// 待付款
//        PayStatusWaitDelivery,// 待发货
//        PayStatusWaitReceive,// 待收货
//        PayStatusWaitJudge,// 待评价
//        PayStatusFinish// 已完成
//    };
    UserGoodsOrderDataObject *userOrderDataObject = self.goodsOrderList[button.tag];
    if (userOrderDataObject.status.integerValue == 10) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusWaitMoney];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
       
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
    if (userOrderDataObject.status.integerValue == 20) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusWaitDelivery];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
    if (userOrderDataObject.status.integerValue == 30) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusWaitReceive];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
    if (userOrderDataObject.status.integerValue == 40) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusWaitJudge];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
    if (userOrderDataObject.status.integerValue == 50) {
        UserGoodsOrderDetailViewController *orderDetailVC = [[UserGoodsOrderDetailViewController alloc] initWithStatus:PayStatusFinish];
        orderDetailVC.orderMdfString = userOrderDataObject.mdf;
        [self.navigationController pushViewController:orderDetailVC animated:YES];
    }
    
    
}
//#pragma mark - 申请已完成 退款
//- (void)applyService{
//    UserApplayServiceViewController *applyServiceVC = [[UserApplayServiceViewController alloc] init];
////    applyServiceVC.model = self.goodsOrderDetailObject;
//    [self.navigationController pushViewController:applyServiceVC animated:YES];
//}

@end
