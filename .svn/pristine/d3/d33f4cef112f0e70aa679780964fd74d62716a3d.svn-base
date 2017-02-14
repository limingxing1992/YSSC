//
//  TravelDiaryViewController.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelDiaryViewController.h"
@interface TravelDiaryViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) MallTopView *topView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *data;


@property (nonatomic, assign) NSInteger page;//默认1
@property (nonatomic, strong) UIView *editView;//触控区域

@property (nonatomic, strong) UIButton *editBtn;

@property (nonatomic, strong) UIButton *searchBtn;



@end

static NSString *const travelCell = @"travelCell";

@implementation TravelDiaryViewController


#pragma mark ----------------生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =WHITECOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    _data = [[NSMutableArray alloc] init];
    [self.tableView.mj_header beginRefreshing];
    [YSSCNotificationCenter addObserver:self selector:@selector(updateTravelList) name:@"updateTravelList" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = _isUserList;
    
    self.topView.sd_layout
    .widthRatioToView(self.view,1)
    .heightIs(64)
    .leftSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0);
    
    self.editView.sd_layout
    .centerYIs(42)
    .rightSpaceToView(self.topView, 0)
    .heightIs(40)
    .widthIs(40);
    
    self.editBtn.sd_layout
    .centerYEqualToView(self.editView)
    .centerXEqualToView(self.editView)
    .heightIs(20)
    .widthIs(22.5);
    
    self.tableView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftSpaceToView(self.view, 0)
    .widthRatioToView(self.view, 1);
    
    if (_isUserList) {
        self.tableView.sd_layout
        .bottomSpaceToView(self.view, 0);
    }else{
        self.tableView.sd_layout
        .bottomSpaceToView(self.view, 49);
    }


}

- (void)dealloc{
    [YSSCNotificationCenter removeObserver:self];
}

#pragma mark ----------------通知刷新

- (void)updateTravelList{
    [self loadInfoWithRet:YES];
}

#pragma mark ----------------数据请求

- (void)loadInfoWithRet:(BOOL)ret{
    YSSCWeakObj(self);
    if (ret) {
        //下拉刷新
        _page = 1;
    }else{
        //上拉架子
        _page +=1;
    }
    
    
    NSDictionary *dic = @{@"page":[NSString stringWithFormat:@"%ld",_page], @"pageSize":@5};
    
    if (_isUserList) {
        //请求个人游记
        [YSSCShareBusinessManager.travelManager getUserTravelListWithParameters:dic
                                                                        success:^(id responObject) {

                                                                            NSArray *ary = (NSArray *)responObject;
                                                                            if (ret) {//下拉
                                                                                [weakself.data removeAllObjects];
                                                                            }
                                                                            [weakself.data addObjectsFromArray:ary];
                                                                            if (!weakself.data.count) {
                                                                                [SVProgressHUD showErrorWithStatus:@"暂无游记"];
                                                                            }
                                                                            [weakself.tableView reloadData];
                                                                            
                                                                            NSInteger tag = (SCREEN_HEIGHT - 113) / 396;
                                                                            
                                                                            if (ret) {
                                                                                if (ary.count <=  tag) {
                                                                                    //下拉刷新游记不足撑满屏幕。隐藏上拉加载
                                                                                    weakself.tableView.mj_footer.hidden = YES;
                                                                                }else{
                                                                                    weakself.tableView.mj_footer.hidden = NO;
                                                                                    [_tableView.mj_footer setState:MJRefreshStateIdle];

                                                                                }
                                                                                [weakself.tableView.mj_header endRefreshing];
                                                                            }else{
                                                                                if (ary.count < 5) {
                                                                                    [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
                                                                                }else{
                                                                                    [weakself.tableView.mj_footer endRefreshing];
                                                                                }
                                                                            }
                                                                            
                                                                        } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                            [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                            if (ret) {
                                                                                [weakself.tableView.mj_header endRefreshing];
                                                                            }else{
                                                                                [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
                                                                            }

                                                                        }];
        return;
    }

    [YSSCShareBusinessManager.travelManager getTravelListWithParameters:dic success:^(id responObject) {
        NSArray *ary = (NSArray *)responObject;
        if (ret) {//下拉
            [weakself.data removeAllObjects];
        }
        [weakself.data addObjectsFromArray:ary];
        if (!weakself.data.count) {
            [SVProgressHUD showErrorWithStatus:@"暂无游记"];
        }
        [weakself.tableView reloadData];
        
        NSInteger tag = (SCREEN_HEIGHT - 113) / 396;
        
        if (ret) {
            if (ary.count <=  tag) {
                //下拉刷新游记不足撑满屏幕。隐藏上拉加载
                weakself.tableView.mj_footer.hidden = YES;
            }else{
                weakself.tableView.mj_footer.hidden = NO;
            }
            [weakself.tableView.mj_header endRefreshing];
        }else{
            if (ary.count < 5) {
                [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [weakself.tableView.mj_footer endRefreshing];
            }
        }

    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
        [SVProgressHUD showErrorWithStatus:errorMsg];
        if (ret) {
            [weakself.tableView.mj_header endRefreshing];
        }else{
            [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    }];

}



#pragma mark ----------------点击事件


- (void)travelHomeNewEditAction{
    [self changeToSumbitTravel];
}

- (void)changeToSumbitTravel{
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        //请先去登录
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [self presentViewController:loginVC animated:YES completion:nil];
        return;
    }
    
    
    TravelDiaryEditViewController *vc = [[TravelDiaryEditViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ----------------tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TravelDiaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:travelCell];
    TravelItemModel *model = _data[indexPath.row];
    [cell updateInfoWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 396;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelItemModel *model = _data[indexPath.row];
    
    TravelDetailViewController *travelDetailVc = [[TravelDetailViewController alloc] init];
    travelDetailVc.isUser = _isUserList;
    travelDetailVc.model = model;
    [self.navigationController pushViewController:travelDetailVc animated:YES];
}

#pragma mark ----------------实例化


- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        NSString *str;
        if (_isUserList) {
            str = @"我的游记";
            [_topView setTitleText:str imageArrays:nil selecterArys:nil target:self isShowLeftBtn:YES];
            YSSCWeakObj(self);
            _topView.block = ^(){
                [weakself.navigationController popViewControllerAnimated:YES];
            };
        }else{
            str = @"游记";
            [_topView setTitleText:str imageArrays:nil selecterArys:nil target:self isShowLeftBtn:NO];
        }
        
        if (!_isUserList) {
            [_topView addSubview:self.editView];
        }
    }
    return _topView;

}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = WHITECOLOR;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[TravelDiaryTableViewCell class] forCellReuseIdentifier:travelCell];
        YSSCWeakObj(self);
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself loadInfoWithRet:YES];
        }];
        
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself loadInfoWithRet:NO];
        }];
        _tableView.mj_footer.automaticallyHidden = YES;
    }
    return _tableView;

}

- (UIView *)editView{
    if (_editView == nil) {
        _editView = [[UIView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(travelHomeNewEditAction)];
        [_editView addGestureRecognizer:tap];
        [_editView addSubview:self.editBtn];
    }
    return _editView;
}
- (UIButton *)editBtn{
    if (_editBtn == nil) {
        _editBtn = [[UIButton alloc] init];
        [_editBtn setBackgroundImage:IMAGE(@"classify97") forState:UIControlStateNormal];
        [_editBtn addTarget:self action:@selector(travelHomeNewEditAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBtn;
}
@end
