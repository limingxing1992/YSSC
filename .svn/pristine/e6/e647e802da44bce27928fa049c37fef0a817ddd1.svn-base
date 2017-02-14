//
//  UserShopCarViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserShopCarViewController.h"
#import "UserShopCarCell.h"
#import "UserShopCarHeadCell.h"


@interface UserShopCarViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>


/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**table*/
@property (nonatomic, strong) UITableView *tableView;
/**底部结算视图*/
@property (nonatomic, strong) UIView *bottomView;
///**全选按钮*/
//@property (nonatomic, strong) UIButton *allSelectButton;
/**合计*/
@property (nonatomic, strong) UILabel *moneyTitleLabel;
/**合计金额*/
@property (nonatomic, strong) UILabel *moneyLabel;
/**结算按钮*/
@property (nonatomic, strong) UIButton *payButton;
/**订单店铺数组*/
@property (nonatomic, strong) NSMutableArray *orderShopArray;
/**被选中准备付款的商品*/
@property (nonatomic, strong) NSMutableArray *readyToPay;
/**总价格*/
@property (nonatomic, assign) float totalPrice;



@end

@implementation UserShopCarViewController


- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitleText:@"购物车" imageArrays:@[IMAGE(@"classify102")] selecterArys:@[@"alertView"] target:self isShowLeftBtn:YES];
        
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = GRAYCOLOR;
        
        [_tableView registerClass:[UserShopCarCell class] forCellReuseIdentifier:@"userShopCarCell"];
        [_tableView registerClass:[UserShopCarHeadCell class] forCellReuseIdentifier:@"userShopCarHeadCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

//- (UIButton *)allSelectButton{
//    if (_allSelectButton == nil) {
//        _allSelectButton = [[UIButton alloc] init];
//        [_allSelectButton setImage:IMAGE(@"classify106") forState:UIControlStateNormal];
//        [_allSelectButton setImage:IMAGE(@"classify104") forState:UIControlStateSelected];
//        [_allSelectButton setTitle:@"全选" forState:UIControlStateNormal];
//        [_allSelectButton setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
//        [_allSelectButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 15)];
//        _allSelectButton.titleLabel.font = FONT(14);
//        [_allSelectButton addTarget:self action:@selector(allSelectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _allSelectButton;
//}

- (UILabel *)moneyTitleLabel{
    if (_moneyTitleLabel == nil) {
        _moneyTitleLabel = [[UILabel alloc] init];
        _moneyTitleLabel.font = FONT(14);
        _moneyTitleLabel.textColor = SHENTEXTCOLOR;
        _moneyTitleLabel.text = @"合计：";
    }
    return _moneyTitleLabel;
}

- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = FONT(19);
        _moneyLabel.textColor = MALLColor;
    }
    return _moneyLabel;
}


- (UIButton *)payButton{
    if (_payButton == nil) {
        _payButton = [[UIButton alloc] init];
        [_payButton setTitle:@"结算" forState:UIControlStateNormal];
        [_payButton setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
        [_payButton addTarget:self action:@selector(payOrder) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _payButton;
}

- (NSMutableArray *)readyToPay{
    if (_readyToPay == nil) {
        _readyToPay = [NSMutableArray array];
        
    }
    return _readyToPay;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [self requestShopCarData];
}

- (void)setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    //    [self.bottomView addSubview:self.allSelectButton];
    [self.bottomView addSubview:self.moneyTitleLabel];
    [self.bottomView addSubview:self.moneyLabel];
    [self.bottomView addSubview:self.payButton];
    
    
    self.bottomView.sd_layout
    .bottomEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(49);
    
    //    self.allSelectButton.sd_layout
    //    .leftSpaceToView(self.bottomView, 15)
    //    .centerYEqualToView(self.bottomView)
    //    .widthIs(62)
    //    .heightIs(20);
    
    self.moneyTitleLabel.sd_layout
    .leftSpaceToView(self.bottomView, 20)
    .centerYEqualToView(self.bottomView)
    .autoHeightRatio(0);
    [self.moneyTitleLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.moneyLabel.sd_layout
    .leftSpaceToView(self.moneyTitleLabel, 5)
    .centerYEqualToView(self.bottomView)
    .autoHeightRatio(0);
    [self.moneyLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.payButton.sd_layout
    .rightEqualToView(self.bottomView)
    .topEqualToView(self.bottomView)
    .widthIs(129)
    .heightIs(49);
    
    //测试
    self.moneyLabel.text = @"00.00";
}

#pragma mark --------- 请求数据
- (void)requestShopCarData{
    
    NSDictionary *dict = @{};
    [YSSCShareBusinessManager.userManager getShopCarListWithParameters:dict success:^(id responObject) {
        self.orderShopArray = responObject;
        if (self.orderShopArray.count == 0) {
            [_navBar setTitleText:@"购物车" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        }else{
            [_navBar setTitleText:@"购物车" imageArrays:@[IMAGE(@"classify102")] selecterArys:@[@"alertView"] target:self isShowLeftBtn:YES];
        }
        [self.tableView reloadData];
        [self calculateGoodsTotalPrice];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

#pragma mark --------- tableView代理



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.orderShopArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSDictionary *goodsDict = self.orderShopArray[section];
    NSMutableArray *goodsArray = [goodsDict objectForKey:@"goodsList"];
    
    
    return goodsArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        UserShopCarHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userShopCarHeadCell"];
        cell.allSelectButton.tag = indexPath.section;
        
        NSDictionary *shopDict = self.orderShopArray[indexPath.section];
        cell.shopNameLabel.text = [shopDict objectForKey:@"shopName"];
        
        //每次reload检查店铺中是否有没选中的商品 如果有 取消全选按钮的选中状态
        NSMutableArray *goodsArray = [shopDict objectForKey:@"goodsList"];
        for (STL_GoodsDetailBaseSubItemModel *goods in goodsArray) {
            if (!goods.isSelected) {
                cell.allSelectButton.selected = NO;
            }
        }
        
        [cell.allSelectButton addTarget:self action:@selector(shopGoodsAllSelect:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        UserShopCarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userShopCarCell"];
        YSSCWeakObj(self);
        [cell buttonDidClick:^(UIButton *button) {//选中当前商品 遍历其他商店是否有选中 如果有选中 取消其他店铺的选中
            [weakself calculateGoodsTotalPrice];
            if (![button isSelected]) {
                [weakself.tableView reloadData];
                [weakself calculateGoodsTotalPrice];
            }else{
                NSDictionary *shopDict = self.orderShopArray[indexPath.section];
                for (NSDictionary *shop in self.orderShopArray) {
                    if ([shop[@"shopName"] isEqualToString:shopDict[@"shopName"]]) {
                    }else{
                        
                        NSMutableArray *goodsArray = [shop objectForKey:@"goodsList"];
                        for (STL_GoodsDetailBaseSubItemModel *goods in goodsArray) {
                            goods.isSelected = NO;
                            
                        }
                        [weakself.tableView reloadData];
                        [weakself calculateGoodsTotalPrice];
                    }
                }
            }
            
            
        }];
        NSDictionary *shopDict = self.orderShopArray[indexPath.section];
        NSMutableArray *goodsArray = [shopDict objectForKey:@"goodsList"];
        STL_GoodsDetailBaseSubItemModel * model = goodsArray[indexPath.row - 1];
        cell.model = model;
        return cell;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 45;
    }else{
        return 99;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}


#pragma mark --------- 点击事件处理
////底部购物车全选
//- (void)allSelectButtonClick:(UIButton *)button{
//    button.selected = !button.selected;
//
//    for (NSDictionary *shopDict in self.orderShopArray) {
//        NSMutableArray *goodsArray = [shopDict objectForKey:@"goodsList"];
//        for (STL_GoodsDetailBaseSubItemModel *goods in goodsArray) {
//            if (button.selected == YES) {
//                goods.isSelected = YES;
//            }else{
//                goods.isSelected = NO;
//            }
//
//        }
//    }
//
//    [self calculateGoodsTotalPrice];
//    [self.tableView reloadData];
//
//}
//删除货物
- (void)delectGoods{
    
    NSMutableArray *goodsCartIdStringArr = [NSMutableArray array];
    
    for (NSDictionary *shopDict in self.orderShopArray) {
        NSMutableArray *goodsArray = [shopDict objectForKey:@"goodsList"];
        for (STL_GoodsDetailBaseSubItemModel *goods in goodsArray) {
            if (goods.isSelected) {
                [goodsCartIdStringArr addObject:goods.cartId];
            }
        }
        NSString *goodsCartIdString = @"";
        if (goodsCartIdStringArr.count > 0) {
            goodsCartIdString = [goodsCartIdStringArr componentsJoinedByString:@","];
        }
        
        NSDictionary *dict = @{@"cartId":goodsCartIdString};
        [YSSCShareBusinessManager.userManager removeShopCarGoodsWithDictionary:dict success:^(id object) {
            ServerStatusObject *statusObject = object;
            if (statusObject.errorCode.integerValue == SeverStateSuccess) {
                STL_SVProgessHUD(@"商品已删除");
                [self requestShopCarData];
            }
            
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            
        }];
        
    }
    [self.tableView reloadData];
}

//提示删除货物
- (void)alertView{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提醒" message:@"确定要删除商品吗" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *actiondel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
        [self delectGoods];
        
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        [action setValue:MALLColor forKey:@"_titleTextColor"];
    }
    
    [alertVc addAction:action];
    [alertVc addAction:actiondel];
    [self presentViewController:alertVc animated:YES completion:nil];
    
}



//商铺 商品 全选
- (void)shopGoodsAllSelect:(UIButton *)button{
    
    button.selected = !button.selected;
    
    
    NSDictionary *shopDict = self.orderShopArray[button.tag];
    for (NSDictionary *shop in self.orderShopArray) {
        if ([shop[@"shopName"] isEqualToString:shopDict[@"shopName"]]) {//如果是选中的店铺,全选所有商品
            NSMutableArray *goodsArray = [shop objectForKey:@"goodsList"];
            for (STL_GoodsDetailBaseSubItemModel *goods in goodsArray) {
                if (button.selected == YES) {
                    goods.isSelected = YES;
                }else{
                    goods.isSelected = NO;
                }
            }
        }else{
            
            NSMutableArray *goodsArray = [shop objectForKey:@"goodsList"];
            for (STL_GoodsDetailBaseSubItemModel *goods in goodsArray) {
                goods.isSelected = NO;
            }
        }
    }
    
    
    
    
    [self calculateGoodsTotalPrice];
    [self.tableView reloadData];
    
}

//计算商品总价
- (void)calculateGoodsTotalPrice{
    _totalPrice = 0;
    for (NSDictionary *shopDict in self.orderShopArray) {
        NSMutableArray *goodsArray = [shopDict objectForKey:@"goodsList"];
        for (STL_GoodsDetailBaseSubItemModel *goods in goodsArray) {
            if (goods.isSelected) {
                _totalPrice = goods.quantity.integerValue * goods.promotion_price.floatValue + _totalPrice ;
            }
        }
    }
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f",_totalPrice];
    
}

#pragma mark --------- 付款
- (void)payOrder{
    
    [self.readyToPay removeAllObjects];
    for (NSDictionary *shopDict in self.orderShopArray) {
        NSMutableArray *goodsArray = [shopDict objectForKey:@"goodsList"];
        for (STL_GoodsDetailBaseSubItemModel *goods in goodsArray) {
            
            if (goods.isSelected == YES) {
                [self.readyToPay addObject:goods];
            }
        }
    }
    NSLog(@"选中的商品数量%zd",self.readyToPay.count);
    //跳转页面 传入self.readyToPay
    MallSumbitOrderViewController *payVC = [[MallSumbitOrderViewController alloc] init];
    payVC.data = self.readyToPay;
    [self.navigationController pushViewController:payVC animated:YES];
}


@end
