//
//  AccountDetailListViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/10/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "AccountDetailListViewController.h"
#import "WithdrawDetailTableViewCell.h"//提现cell
@interface AccountDetailListViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic, strong) MallTopView *topView;
/** 提现明细*/
@property (nonatomic, strong) UITableView *listTableView;
/** 数据源*/
@property (nonatomic, strong) NSMutableArray *data;
/** 当前页，默认 1 */
@property (nonatomic, assign) NSInteger page;


@end

@implementation AccountDetailListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BACKGROUNDCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.listTableView];
    _data = [NSMutableArray array];
    [self requestDataWithRet:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    self.topView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(64);
    
    self.listTableView.sd_layout
    .topSpaceToView(_topView, 0)
    .bottomSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0);
    
}


#pragma mark ----------------数据请求
/** YES==下拉刷新*/
- (void)requestDataWithRet:(BOOL)ret{
    if (ret) {
        _page = 1;
    }else{
        _page += 1;
    }
    [SVProgressHUD showWithStatus:nil];
    [YSSCShareBusinessManager.loginManger getWithdrawDetailListWithParameters:@{@"page":[NSNumber numberWithInteger:_page],
                                                                                @"pageSize":PAGESIZE}
                                                                      success:^(id responObject) {
                                                                          NSArray *newData = responObject;
                                                                          if (ret) {
                                                                              [_data removeAllObjects];
                                                                          }
                                                                          [_data addObjectsFromArray:newData];
                                                                          [_listTableView reloadData];
                                                                          [SVProgressHUD dismiss];
                                                                          
                                                                          if (!ret) {
                                                                              if ([newData count] < PAGESIZE.integerValue) {
                                                                                  [_listTableView.mj_footer endRefreshingWithNoMoreData];
                                                                              }else{
                                                                                  [_listTableView.mj_footer endRefreshing];
                                                                              }
                                                                          }else{
                                                                              if (newData.count < PAGESIZE.integerValue) {
                                                                                  _listTableView.mj_footer.hidden = YES;
                                                                              }
                                                                              [_listTableView.mj_header endRefreshing];
                                                                          }
                                                                      } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                          [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                          if (!ret) {
                                                                              [_listTableView.mj_footer endRefreshing];
                                                                          }else{
                                                                              [_listTableView.mj_header endRefreshing];
                                                                          }
                                                                          
                                                                      }];
}


#pragma mark ----------------tableView代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WithdrawDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setModel:_data[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

#pragma mark ----------------实例

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"提现明细" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UITableView *)listTableView{
    if (_listTableView == nil) {
        _listTableView = [[UITableView alloc] init];
        _listTableView.backgroundColor = GRAYCOLOR;
        _listTableView.delegate = self;
        _listTableView.separatorColor = GRAYCOLOR;
        _listTableView.dataSource = self;
        [_listTableView registerClass:[WithdrawDetailTableViewCell class] forCellReuseIdentifier:@"cell"];
        YSSCWeakObj(self);
        _listTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself requestDataWithRet:YES];
        }];
        
        _listTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself requestDataWithRet:NO];
        }];
        _listTableView.mj_footer.automaticallyHidden = YES;
//        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//            [weakself reloadGoodsListIsUp:YES];
//        }];
//        
//        _collectionView.mj_footer.automaticallyHidden = YES;

        
    }
    return _listTableView;
}
@end
