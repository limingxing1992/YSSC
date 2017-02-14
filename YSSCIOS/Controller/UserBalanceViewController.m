//
//  UserBalanceViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//用户余额

#import "UserBalanceViewController.h"
#import "UserBalanceTopView.h"
#import "YSSNavView.h"
#import "YSSSliderButtonView.h"
#import "UserBalanceRecordCell.h"
#import "UserBalanceObject.h"


@interface UserBalanceViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
YSSSliderButtonViewDelegate
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**topView*/
@property (nonatomic, strong) UserBalanceTopView *topView;
/**滑动按钮*/
@property (nonatomic, strong) YSSSliderButtonView *btnView;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**网络请求参数字典*/
@property (nonatomic, strong) NSMutableDictionary *parameterDict;
/**模型数组*/
@property (nonatomic, strong) NSMutableArray *balanceObjectArr;
/**提现按钮*/
@property (nonatomic, strong) UIButton *withdrawBtn;
/**page*/
@property (nonatomic, assign) NSInteger page;

@end

@implementation UserBalanceViewController

#pragma mark - 懒加载

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"五云铢"];
        [_navBar addSubview:self.withdrawBtn];
        self.withdrawBtn.sd_layout
        .centerYIs(42)
        .rightSpaceToView(_navBar, 0)
        .heightIs(40);
        [self.withdrawBtn setupAutoSizeWithHorizontalPadding:12 buttonHeight:40];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (UserBalanceTopView *)topView{
    if (_topView == nil) {
        _topView = [[UserBalanceTopView alloc] init];
    }
    return _topView;
}

- (YSSSliderButtonView *)btnView{
    if (_btnView == nil) {
        _btnView = [[YSSSliderButtonView alloc] init];
        _btnView.delegate = self;
    }
    return _btnView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = GRAYCOLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UserBalanceRecordCell class] forCellReuseIdentifier:@"userBalanceRecordCell"];
        YSSCWeakObj(self);
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself requestUserBalance];
        }];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.page = 1;
            [weakself requestUserBalance];
            [weakself.tableView.mj_header endRefreshing];
        }];
    }
    return _tableView;
}

- (NSMutableDictionary *)parameterDict{
    if (_parameterDict == nil) {
        _parameterDict = [[NSMutableDictionary alloc] init];
    }
    return _parameterDict;
}

- (NSMutableArray *)balanceObjectArr{
    if (_balanceObjectArr == nil) {
        _balanceObjectArr = [[NSMutableArray alloc] init];
    }
    return _balanceObjectArr;
}

- (UIButton *)withdrawBtn{
    if (_withdrawBtn == nil) {
        _withdrawBtn = [[UIButton alloc] init];
        [_withdrawBtn setTitle:@"提现" forState:UIControlStateNormal];
        [_withdrawBtn setTitleColor:MALLColor forState:UIControlStateNormal];
        _withdrawBtn.titleLabel.font = FONT(14);
        [_withdrawBtn addTarget:self action:@selector(withdrawAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _withdrawBtn;
}

#pragma mark ----------------提现功能

- (void)withdrawAction{
    WithdrawViewController *withdrawVc = [[WithdrawViewController alloc] init];
    [self.navigationController pushViewController:withdrawVc animated:YES];
}


#pragma mark --------- 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    [self setupUI];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

- (void)setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.btnView];
    [self.view addSubview:self.tableView];
    
    self.topView.sd_layout
    .topSpaceToView(self.navBar, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(100);
    
    self.btnView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(48);
    
    self.tableView.sd_layout
    .topSpaceToView(self.btnView, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
    
    [_btnView setButtonTitleArray:@[@"全部",@"充值",@"消费"]];
    
}


- (void)requestUserBalance{
    [self.parameterDict setValue:[NSString stringWithFormat:@"%zd",self.page]forKey:@"page"];
    [self.parameterDict setValue:@"5" forKey:@"pageSize"];
    if (self.page == 1) {
        [self.balanceObjectArr removeAllObjects];
    }
    [YSSCShareBusinessManager.userManager getUserBalanceWithDictionary:self.parameterDict success:^(id object) {
        if (object) {
            UserBalanceObject *userBalanceObject = object;
            if (userBalanceObject.errorCode.integerValue == SeverStateSuccess) {
                [self.topView setbalance:userBalanceObject.data.balacne];
                //   self.balanceObjectArr = userBalanceObject.data.detail;
                if (userBalanceObject.data.detail.count > 0) {
                    [self.balanceObjectArr addObjectsFromArray:userBalanceObject.data.detail];
                    self.page = self.page +1;
                }
                
                NSInteger totalcell = (SCREEN_HEIGHT - 210)/70;
                
                if (self.balanceObjectArr.count <=  totalcell) {
                    
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.mj_footer.hidden = NO;
                    [_tableView.mj_footer setState:MJRefreshStateIdle];
                }
                
                if (userBalanceObject.data.detail.count < 5) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
                
                
                [_tableView.mj_footer endRefreshing];
                [self.tableView reloadData];
            }else{
                [_tableView.mj_footer endRefreshing];
            }
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [_tableView.mj_footer endRefreshing];
        
    }];
}

#pragma mark - YSSSliderButtonViewDelegate

-(void)ySSSliderButtonView:(YSSSliderButtonView *)view buttonDidClick:(UIButton *)button{
    self.page = 1;
    
    
    if ([button.currentTitle isEqualToString:@"全部"]) {
        [self.parameterDict removeAllObjects];
        
        
    }
    if ([button.currentTitle isEqualToString:@"充值"]) {
        [self.parameterDict setValue:@"10" forKey:@"type"];
        
    }
    if ([button.currentTitle isEqualToString:@"消费"]) {
        [self.parameterDict setValue:@"30,40" forKey:@"type"];
        
    }
    [self.balanceObjectArr removeAllObjects];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark --------- tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.balanceObjectArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserBalanceRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userBalanceRecordCell"];
    UserBalanceDataDetailObject *object = [self.balanceObjectArr objectAtIndex:indexPath.row];
    
    cell.model = object;
    //    if (object.room_name == nil) {
    //        NSLog(@"%@",object.amount);
    //        [cell setTitle:object.good_name time:object.create_time money:object.amount.floatValue];
    //    }else{
    //        [cell setTitle:object.room_name time:object.create_time money:object.amount.floatValue];
    //    }
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 76.5;
}



@end
