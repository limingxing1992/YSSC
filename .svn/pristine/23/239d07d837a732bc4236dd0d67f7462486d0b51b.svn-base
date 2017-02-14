//
//  UserFavoriteViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserFavoriteViewController.h"
#import "YSSButtonListView.h"
#import "UserFavoriteGoodsCell.h"
#import "UserFavoriteShopCell.h"
#import "UserFavoriteObject.h"
#import "UserFavoriteTravelDiaryCell.h"
#import "GoodsDetailViewController.h"
#import "MallBussViewController.h"

@interface UserFavoriteViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    YSSButtonListViewDelegate
>
/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**选择按钮列*/
@property (nonatomic, strong) YSSButtonListView *buttonListView;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**网络请求字典*/
@property (nonatomic, strong) NSMutableDictionary *parametersDict;
/**请求到的模型*/
@property (nonatomic, strong) NSMutableArray *favoriteObjectArray;
/**请求页数*/
@property (nonatomic, assign) NSInteger page;

/**flag判断是商品0 店铺1 还是游记2*/
@property (nonatomic, assign) NSInteger flag;

@end

@implementation UserFavoriteViewController

#pragma mark --------- 懒加载

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"我的收藏"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (YSSButtonListView *)buttonListView{
    if (_buttonListView == nil) {
        _buttonListView = [[YSSButtonListView alloc] init];
        _buttonListView.delegate = self;

    }
    return _buttonListView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = GRAYCOLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UserFavoriteGoodsCell class] forCellReuseIdentifier:@"userFavoriteGoodsCell"];
        [_tableView registerClass:[UserFavoriteShopCell class] forCellReuseIdentifier:@"userFavoriteShopCell"];
        [_tableView registerClass:[UserFavoriteTravelDiaryCell class] forCellReuseIdentifier:@"userFavoriteTravelDiaryCell"];
        
        YSSCWeakObj(self);
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself requestMyFavoriteList];
        }];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakself.page = 1;
            [weakself requestMyFavoriteList];
        }];
    }
    return _tableView;
}
- (NSMutableDictionary *)parametersDict{
    if (_parametersDict == nil) {
        _parametersDict = [[NSMutableDictionary alloc] init];
        
    }
    return _parametersDict;
}

- (NSMutableArray *)favoriteObjectArray{
    if (_favoriteObjectArray == nil) {
        _favoriteObjectArray = [[NSMutableArray alloc] init];
        
    }
    return _favoriteObjectArray;
}

#pragma mark --------- 生命周期

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.parametersDict setObject:@"20" forKey:@"collectType"];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.page = 1;
    
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark --------- 请求数据
- (void)requestMyFavoriteList{
    
    
    if (_page == 1) {
        [self.favoriteObjectArray removeAllObjects];
    }
    [self.parametersDict setObject:[NSString stringWithFormat:@"%zd",self.page] forKey:@"page"];
    [self.parametersDict setObject:@"10" forKey:@"pageSize"];
    
    [YSSCShareBusinessManager.userManager getMyFavoriteWithDictionary:self.parametersDict success:^(id object) {
        if (object) {
            UserFavoriteObject *favoriteObject = object;
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
            if (favoriteObject.errorCode.integerValue == SeverStateSuccess) {
                
                if (favoriteObject.data > 0) {
                    
                    [self.favoriteObjectArray addObjectsFromArray:favoriteObject.data];
                    [self.tableView reloadData];
                    _page ++;
                }
                
                NSInteger totalcell = (SCREEN_HEIGHT - 64)/100;
                if (self.favoriteObjectArray.count <=  totalcell) {
                    
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.mj_footer.hidden = NO;
                    [_tableView.mj_footer setState:MJRefreshStateIdle];
                }
                
                if (favoriteObject.data.count < 5) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
                
            }
            
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)setupUI{
    
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.buttonListView];
    [self.view addSubview:self.tableView];

    self.buttonListView.sd_layout
    .topSpaceToView(self.navBar, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(45);
    
    self.tableView.sd_layout
    .topSpaceToView(self.buttonListView, 0.5)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
    
    [_buttonListView setButtonTitleArray:@[@"商品",@"店铺",@"游记",] ];
}


#pragma mark --------- tableView代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.favoriteObjectArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.flag == 0) {
        UserFavoriteGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userFavoriteGoodsCell"];
        UserFavoriteDataObject *favoriteDataObject = self.favoriteObjectArray[indexPath.row];
        cell.model = favoriteDataObject;
        return cell;
    }else if (self.flag == 1){
        UserFavoriteShopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userFavoriteShopCell"];
        UserFavoriteDataObject *favoriteDataObject = self.favoriteObjectArray[indexPath.row];
        cell.model = favoriteDataObject;
        return cell;
    }else{
        UserFavoriteTravelDiaryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userFavoriteTravelDiaryCell"];
        UserFavoriteDataObject *favoriteDataObject = self.favoriteObjectArray[indexPath.row];
        cell.model = favoriteDataObject;
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YSSCWeakObj(self);
    UserFavoriteDataObject *favoriteDataObject = self.favoriteObjectArray[indexPath.row];
    
    if (self.flag == 0) {//商品
        GoodsDetailViewController *goodVC = [[GoodsDetailViewController alloc] init];
        goodVC.mdf = favoriteDataObject.keyWord;
        goodVC.GoodsID = favoriteDataObject.link_id;
        goodVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:goodVC animated:YES];
    }
    if (self.flag == 1) {//店铺
        MallBussViewController *mallVC = [[MallBussViewController alloc] init];
        mallVC.Id = favoriteDataObject.link_id;
        mallVC.phone = favoriteDataObject.phone;
        mallVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mallVC animated:YES];
    }
    if (self.flag == 2) {//游记
        [SVProgressHUD showWithStatus:@"正在加载"];
        [YSSCShareBusinessManager.travelManager getTravelDetailInfoWithParameters:@{@"record_id": favoriteDataObject.link_id} success:^(id responObject) {
            [SVProgressHUD dismiss];
            TravelItemModel *model = responObject;
            TravelDetailViewController *detailVc = [[TravelDetailViewController alloc] init];
            detailVc.model = model;
            [weakself.navigationController pushViewController:detailVc animated:YES];
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            [SVProgressHUD showErrorWithStatus:errorMsg];
        }];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
    return height + 0.5;
    
}

- (void)yssButtonListView:(UIView *)view buttonDidSelect:(UIButton *)button{
    NSLog(@"%@",button.currentTitle);
    [self.favoriteObjectArray removeAllObjects];
    self.page = 1;
    if ([button.currentTitle isEqualToString:@"商品"]) {
        self.flag = 0;
        [self.parametersDict setObject:@"20" forKey:@"collectType"];
    }
    if ([button.currentTitle isEqualToString:@"店铺"]) {
        self.flag = 1;
        [self.parametersDict setObject:@"60" forKey:@"collectType"];
    }
    if ([button.currentTitle isEqualToString:@"游记"]) {
        self.flag = 2;
        [self.parametersDict setObject:@"70" forKey:@"collectType"];
    }
    [self requestMyFavoriteList];
}



@end
