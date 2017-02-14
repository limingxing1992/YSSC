//
//  UserOrderViewController.m
//  YSSCIOS
//
//  Created by Rock on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//  乡宿订单

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

#import "UserOrderSubViewController.h"
#import "UserHotelOrderDetailViewController.h"
#import "UserGoodsOrderObject.h"



@interface UserOrderViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
YSSButtonListViewDelegate
>


/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**顶部选择列表*/
@property (nonatomic, strong) YSSButtonListView *topButtonListView;

/**titleBtn*/
@property (nonatomic, strong) UserTitleButton *titleButton;

/**tableView*/
@property (nonatomic, strong) UITableView *tableView;

/**popView当前选中的title*/
@property (nonatomic, strong) NSString *selTitle;
/**chilidVC*/
@property (nonatomic, strong) UserOrderSubViewController *subVC;
/**乡宿订单网络请求参数字典*/
@property (nonatomic, strong) NSMutableDictionary *hotelParameterDict;
/**乡宿订单模型*/
@property (nonatomic, strong) UserHotelOrderObject *hotelOrderObject;
/**订单状态字典*/
@property (nonatomic, strong) NSDictionary *userHotelOrderStatusDict;
/**商品订单网络请求*/
@property (nonatomic, strong) NSMutableDictionary *goodsParameterDict;
/**商品订单模型*/
@property (nonatomic, strong) UserGoodsOrderObject *goodsOrderObject;
/**订单状态字典*/
@property (nonatomic, strong) NSDictionary *goodsOrderStatusDict;
/**page*/
@property (nonatomic, assign) NSInteger page;
/**请求到的数据*/
@property (nonatomic, strong) NSMutableArray *hotelOrderList;



@end

@implementation UserOrderViewController

#pragma mark --------懒加载

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        //        [_navBar setTitletext:@"我的收藏"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navBar;
}

- (UserTitleButton *)titleButton{
    if (_titleButton == nil) {
        _titleButton = [[UserTitleButton alloc] init];
        [_titleButton setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        //    [_titleButton setTitle:@"乡宿订单" forState:UIControlStateNormal];
        [_titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleButton;
}

- (YSSButtonListView *)topButtonListView{
    if (_topButtonListView == nil) {
        _topButtonListView = [[YSSButtonListView alloc] init];
        _topButtonListView.delegate = self;
        
    }
    return _topButtonListView;
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
        [_tableView registerClass:[UserOrderHotelCell class] forCellReuseIdentifier:@"userOrderHotelCell"];
        [_tableView registerClass:[UserOrderBottomCell class] forCellReuseIdentifier:@"userOrderBottomCell"];
        [_tableView registerClass:[UserOrderGoodsCell class] forCellReuseIdentifier:@"userOrderGoodsCell"];
        
        YSSCWeakObj(self);
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{

            [weakself requestUserHotelOrder];
            [_tableView.mj_footer endRefreshing];
        }];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakself.page = 1;
            
            
            [SVProgressHUD showWithStatus:@"正在加载..."];
            [weakself requestUserHotelOrder];
            [_tableView.mj_header endRefreshing];
        }];
        
        
    }
    return _tableView;
}

- (UserOrderSubViewController *)subVC{
    if (_subVC == nil) {
        _subVC = [[UserOrderSubViewController alloc] init];
        _subVC.view.frame = CGRectMake(0, 64 , SCREEN_WIDTH, SCREEN_HEIGHT - 64);
        
    }
    return _subVC;
}

- (NSMutableDictionary *)hotelParameterDict{
    if (_hotelParameterDict == nil) {
        _hotelParameterDict = [[NSMutableDictionary alloc] init];
    }
    return _hotelParameterDict;
}
- (NSMutableDictionary *)goodsParameterDict{
    if (_goodsParameterDict == nil) {
        _goodsParameterDict = [[NSMutableDictionary alloc] init];
    }
    return _goodsParameterDict;
}

- (NSDictionary *)userHotelOrderStatusDict{
    if (_userHotelOrderStatusDict == nil) {
        _userHotelOrderStatusDict = @{@"10":@"去付款",
                                      @"20":@"待入住",
                                      @"30":@"待退房",
                                      @"40":@"去评价",
                                      @"50":@"已完成",
                                      @"400":@"已取消",
                                      @"200":@"待退款",
                                      @"230":@"已退款",
                                      @"600":@"已删除"};
    }
    return _userHotelOrderStatusDict;
}

- (NSMutableArray *)hotelOrderList{
    if (_hotelOrderList == nil) {
        _hotelOrderList = [[NSMutableArray alloc] init];
    }
    return _hotelOrderList;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    if (self.isGoodsOrder) {
        [self.titleButton setTitle:@"商品订单" forState:UIControlStateNormal];
    }else{
        [self.titleButton setTitle:@"乡宿订单" forState:UIControlStateNormal];
    }
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (self.isGoodsOrder) {
        [self.view addSubview:self.subVC.view];
    }else{
        self.page = 1;
        [self.hotelOrderList removeAllObjects];
        [self.tableView.mj_header beginRefreshing];

    }
    
}



#pragma mark --------- 获取乡宿订单
- (void)requestUserHotelOrder{
    
    //    page 页码
    //    pageSize 页容量
    //    status 订单状态 // 可选 空查询全部 10：待付款，20：待入住 30：待退房 40：待评价 50:已完结
    [self.hotelParameterDict setObject:[NSString stringWithFormat:@"%zd",_page] forKey:@"page"];
    [self.hotelParameterDict setObject:@"5" forKey:@"pageSize"];
    
    [YSSCShareBusinessManager.userManager getUserHotelOrderWithDictionary:_hotelParameterDict success:^(id object) {
        
        UserHotelOrderObject *hotelOrderObject = object;
        if (hotelOrderObject.errorCode.integerValue == SeverStateSuccess) {
            
            if (self.page == 1) {
                [self.hotelOrderList removeAllObjects];
            }
            
            if (hotelOrderObject.data.count > 0) {
                
                [self.hotelOrderList addObjectsFromArray:hotelOrderObject.data];
                self.page += 1;
            }
            
            
            NSInteger totalcell = (SCREEN_HEIGHT - 64)/200;
            
            if (self.hotelOrderList.count <=  totalcell) {
                
                self.tableView.mj_footer.hidden = YES;
            }else{
                self.tableView.mj_footer.hidden = NO;
                [_tableView.mj_footer setState:MJRefreshStateIdle];
            }
            
            if (hotelOrderObject.data.count < 5) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [self.tableView.mj_footer endRefreshing];
            }
            
            
            [SVProgressHUD dismiss];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            
        }else{
            [SVProgressHUD showErrorWithStatus:hotelOrderObject.errorMsg];
             [self.tableView.mj_header endRefreshing];
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
         [self.tableView.mj_header endRefreshing];
    }];
}

#pragma mark --------- 获取商品订单

- (void)requestGoodsOrder{
    [self.goodsParameterDict setObject:@"1" forKey:@"page"];
    [self.goodsParameterDict setObject:@"15" forKey:@"pageSize"];
    
    [YSSCShareBusinessManager.userManager getUserGoodsOrderWithDictionary:self.goodsParameterDict success:^(id object) {
        if (object) {
            UserGoodsOrderObject *goodsOrderObject = object;
            if (goodsOrderObject.errorCode.integerValue == SeverStateSuccess) {
                self.goodsOrderObject = goodsOrderObject;
                
                [self.tableView reloadData];
            }
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

#pragma mark --------- 布局UI
- (void)setupUI{
    self.view.backgroundColor = BACKGROUNDCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.topButtonListView];
    [self.view addSubview:self.titleButton];
    [self.view addSubview:self.tableView];
    
    
    [self addChildViewController:self.subVC];
    
    self.topButtonListView.sd_layout
    .topSpaceToView(self.navBar, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(45);
    
    self.titleButton.sd_layout
    .topSpaceToView(self.view, 20)
    .centerXEqualToView(self.view)
    .heightIs(44)
    .widthIs(92);
    
    self.tableView.sd_layout
    .topSpaceToView(self.topButtonListView, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
    
    [self.topButtonListView setButtonTitleArray:@[@"全部",@"待付款",@"待入住",@"待评价",@"已完成"]];
    
    self.selTitle = @"乡宿订单";
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UserHotelOrderDataObject *dataObject = self.hotelOrderList[indexPath.section];
    NSString *status = dataObject.status;
    if ([status isEqualToString:@"10"]) {
        UserHotelOrderDetailViewController *orderDetailVC = [[UserHotelOrderDetailViewController alloc] init];
    
        orderDetailVC.orderMdfString = dataObject.mdf;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    NSLog(@"****%zd",self.hotelOrderList.count);
    return self.hotelOrderList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;// 1+1+1+1
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UserHotelOrderDataObject *dataObject;
    if (self.hotelOrderList.count > 0) {
        dataObject = self.hotelOrderList[indexPath.section];
    }else{
        dataObject = [UserHotelOrderDataObject new];
    }

    if (indexPath.row == 0){
        UserOrderTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderTopCell"];
        [cell setTitle:dataObject.order_number status:[self.userHotelOrderStatusDict objectForKey:dataObject.status]];
        return cell;
    }else if (indexPath.row == 1){
        UserOrderHotelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderHotelCell"];
        cell.model = dataObject;
        return cell;
    }else if (indexPath.row == 2){
        UserOrderMoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderMoneyCell"];
        [cell setMoney:dataObject.total_money.stringValue];
        return cell;
    }else{
        UserOrderBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderBottomCell"];
        cell.model = dataObject;
        [cell.cancelBtn addTarget:self action:@selector(alertView:) forControlEvents:UIControlEventTouchUpInside];
        cell.cancelBtn.tag = indexPath.section;
        [cell.nextBtn addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.nextBtn.tag = indexPath.section;
        cell.serviceBtn.tag = indexPath.section;
        [cell.serviceBtn addTarget:self action:@selector(severceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {//测试
        return 100;
    }else{
        return 35;
    }
}


#pragma mark --------点击事件处理

- (void)yssButtonListView:(UIView *)view buttonDidSelect:(UIButton *)button{
    [SVProgressHUD showWithStatus:@"正在载入..."];
    self.page = 1;
    if ([button.currentTitle isEqualToString:@"全部"]) {
        [self.hotelParameterDict setObject:@"" forKey:@"status"];
    }
    if ([button.currentTitle isEqualToString:@"待付款"]) {
        [self.hotelParameterDict setObject:@"10" forKey:@"status"];
    }
    if ([button.currentTitle isEqualToString:@"待入住"]) {
        [self.hotelParameterDict setObject:@"20" forKey:@"status"];
    }
    if ([button.currentTitle isEqualToString:@"待评价"]) {
        [self.hotelParameterDict setObject:@"40" forKey:@"status"];
    }
    if ([button.currentTitle isEqualToString:@"已完成"]) {//已完成 待退款 已退款
        [self.hotelParameterDict setObject:@"50,200,230" forKey:@"status"];
    }
    
    [self.tableView.mj_header beginRefreshing];
}

//- (void)reloadTableView:(UIButton *)button{
//    
//    
//    self.selBtn.selected = NO;
//    self.selBtn = button;
//    self.selBtn.selected = YES;
//    [SVProgressHUD showWithStatus:@"正在载入..."];
//    self.page = 1;
//    if ([button.currentTitle isEqualToString:@"全部"]) {
//        [self.hotelParameterDict setObject:@"" forKey:@"status"];
//    }
//    if ([button.currentTitle isEqualToString:@"待付款"]) {
//        [self.hotelParameterDict setObject:@"10" forKey:@"status"];
//    }
//    if ([button.currentTitle isEqualToString:@"待入住"]) {
//        [self.hotelParameterDict setObject:@"20" forKey:@"status"];
//    }
//    if ([button.currentTitle isEqualToString:@"待评价"]) {
//        [self.hotelParameterDict setObject:@"40" forKey:@"status"];
//    }
//    if ([button.currentTitle isEqualToString:@"已完成"]) {
//        [self.hotelParameterDict setObject:@"50" forKey:@"status"];
//    }
//    
//    [self.tableView.mj_footer beginRefreshing];
//    
//}


#pragma mark - 取消订单
- (void)cancelOrder:(UIButton *)button{
    UserHotelOrderDataObject *userOrderDataObject = self.hotelOrderList[button.tag];
    
    [YSSCShareBusinessManager.userManager cancelHotelOrderWithDictionary:@{@"orderMdf":userOrderDataObject.mdf} success:^(id object) {
        ServerStatusObject *severStatus = object;
        if (severStatus.errorCode.integerValue == SeverStateSuccess) {
            [SVProgressHUD showSuccessWithStatus:severStatus.errorMsg];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                [self.tableView.mj_header beginRefreshing];
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

#pragma mark - 待入住申请退款
- (void)severceBtnClick:(UIButton *)button{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提醒" message:@"确定要申请退款吗" preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *actiondel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
        [self requestHotelRefund:button];
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 9.0) {
        [action setValue:MALLColor forKey:@"_titleTextColor"];
    }
    
    [alertVc addAction:action];
    [alertVc addAction:actiondel];
    [self presentViewController:alertVc animated:YES completion:nil];
}

#pragma mark - 申请退款（取消订房）
- (void)requestHotelRefund:(UIButton *)button{
    UserHotelOrderDataObject *userOrderDataObject = self.hotelOrderList[button.tag];
    [YSSCShareBusinessManager.userManager applyHotelRefundWithDictionary:@{@"orderMdf":userOrderDataObject.mdf} success:^(id object) {
        
        ServerStatusObject *severStatus = object;
        if (severStatus.errorCode.integerValue == SeverStateSuccess) {
            [SVProgressHUD showSuccessWithStatus:severStatus.errorMsg];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
               
                
                [self.tableView.mj_header beginRefreshing];
            });
        }else{
            [SVProgressHUD showErrorWithStatus:severStatus.errorMsg];
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}


#pragma mark - 乡宿下一步按钮
- (void)nextButtonClick:(UIButton *)button{
    
    UserHotelOrderDetailViewController *orderDetailVC = [[UserHotelOrderDetailViewController alloc] init];
    UserHotelOrderDataObject *userOrderDataObject = self.hotelOrderList[button.tag];
    orderDetailVC.orderMdfString = userOrderDataObject.mdf;
    [self.navigationController pushViewController:orderDetailVC animated:YES];
    
    
}

- (void)titleClick:(UIButton *)btn{
    
    // 切换按钮的状态
    btn.selected = !btn.selected;
    // 显示菜单控制器
    UserMenuVC *tb = [[UserMenuVC alloc] init];
    tb.currentString = btn.currentTitle;
    tb.view.backgroundColor = [UIColor whiteColor];
    
    YSSCWeakObj(self);
    [tb cellDidClick:^(NSString *title) {
        [btn setTitle:title forState:UIControlStateNormal];
        [UserPOPMenu coverClick:nil];
        if ([title isEqualToString:@"乡宿订单"]) {//如果切换到乡宿订单
            [self.topButtonListView setButtonTitleArray:@[@"全部",@"待付款",@"待入住",@"待评价",@"已完成"]];
            self.selTitle = title;
            [self.subVC.view removeFromSuperview];
        }else{//如果切换到商品订单
            //[self.topButtonListView setButtonTitleArray:@[@"全部",@"待付款",@"待发货",@"待收货",@"待评价"] target:self action:@selector(reloadTableViewWithGoodsOrder:)];
            self.selTitle = title;
            [self.view addSubview:self.subVC.view];
        }
        
        [weakself.tableView reloadData];
    }];
    
    [UserPOPMenu popFrom:btn contentVC:tb dismiss:^{
        // 切换按钮的状态
        btn.selected = !btn.selected;
    }];
    
}




@end
