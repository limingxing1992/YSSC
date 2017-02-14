//
//  MallViewController.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallViewController.h"

@interface MallViewController ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    STL_DropDownMenuDelegate
>{
    NSMutableArray *_data1;
    NSMutableArray *_data2;
    NSMutableArray *_data3;
    
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;

}
@property (nonatomic, strong) MallTopView *topView;//商城顶部师徒

@property (nonatomic, strong) STL_DropDownMenu *menu;//自定义菜单栏

@property (nonatomic, copy) NSString *firID;//当前选择一级分类
@property (nonatomic, copy) NSString *secID;//当前选择二级分类
@property (nonatomic, copy) NSString *sortID;//当前选择排序方式
@property (nonatomic, strong) NSMutableArray *limitIdData;//筛选条件
@property (nonatomic, copy) NSString *keyword;//关键词

@property (nonatomic, strong) UICollectionView *collectionView;//主列表视图
@property (nonatomic, strong) NSMutableArray *goodsData;//商品信息数据
@property (nonatomic, assign) NSInteger currentPage;//当前加载页数


@end

static NSString *const mallCell = @"mallCell";

@implementation MallViewController

#pragma mark ---------生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.menu];
    [self.view addSubview:self.topView];
    
    _firID = @"";
    _secID = @"";
    _sortID = @"4_1";
    _keyword = @"";
    _limitIdData = [[NSMutableArray alloc] init];
    [SVProgressHUD showWithStatus:@"加载中"];
    [YSSCShareBusinessManager.mallManager getBaseMallClassSuccess:^(id responObject) {
        NSArray *data = (NSArray *)responObject;
        NSMutableArray *dataMu = [[NSMutableArray alloc] initWithArray:data];
        STL_ClassifyItemModel *model = [[STL_ClassifyItemModel alloc] init];
        model.cname =@"全部";
        model.ID = @"";
        [dataMu insertObject:model atIndex:0];
        [_menu updateFisrtDataWithAry:dataMu];
        STL_ClassifyItemModel *modelNull = [[STL_ClassifyItemModel alloc] init];
        modelNull.cname = @"全部";
        modelNull.ID = @"";
        [_menu updateSecDataWithAry:@[modelNull]];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
    [_collectionView.mj_header beginRefreshing];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ----------------数据请求
- (void)reloadGoodsListIsUp:(BOOL)ret{
    if (!ret) {
        //下拉刷新
        _currentPage = 1;
    }else{
        //上拉刷新
        _currentPage += 1;
    }
    
    NSMutableString *limitStr = [NSMutableString string];
    for (NSString *ID in _limitIdData) {
        [limitStr appendFormat:@"%@,",ID];
    }
    NSDictionary *dict = @{@"classifyId": _secID,
                           @"sort":_sortID,
                           @"page":[NSNumber numberWithInteger:_currentPage],
                           @"pageSize":PAGESIZE,
                           @"key":_keyword,
                           @"attrId":limitStr
                           };
    
    [YSSCShareBusinessManager.mallManager getGoodsListWithParameters:dict success:^(id responObject) {
        NSArray *data = (NSArray *)responObject;
        if (ret) {
            [_goodsData addObjectsFromArray:data];
        }else{
            [_goodsData removeAllObjects];
            _goodsData = [data mutableCopy];
        }
        [_collectionView reloadData];
        
        if (!_goodsData.count) {
            [SVProgressHUD showErrorWithStatus:@"暂无商品"];
        }
        
        if (ret) {
            if (data.count < 10) {
                [_collectionView.mj_footer endRefreshingWithNoMoreData];//提示暂无更多数据
            }else{
                [_collectionView.mj_footer endRefreshing];
            }
        }else{
            if (data.count < 5) {
                _collectionView.mj_footer.hidden = YES;
            }else{
                _collectionView.mj_footer.hidden = NO;
                [_collectionView.mj_footer setState:MJRefreshStateIdle];

            }
            [_collectionView.mj_header endRefreshing];
        }
        
        [SVProgressHUD dismiss];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:errorMsg];
        if (ret) {
            [_collectionView.mj_footer endRefreshing];
        }else{
            [_collectionView.mj_header endRefreshing];
        }
        
    }];
    



}



#pragma mark ---------CollectionViewDeleage

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _goodsData.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mallCell forIndexPath:indexPath];
    STL_GoodsItemModel *model = _goodsData[indexPath.row];
    [cell updateInfoWith:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetailViewController *goodsDetailVc = [[GoodsDetailViewController alloc] init];
    STL_GoodsItemModel *model = _goodsData[indexPath.row];
    goodsDetailVc.mdf = model.mainGoodsMdf;
    [self.navigationController pushViewController:goodsDetailVc animated:YES];
}


#pragma mark ----------------STLDropMenuDelegate

- (void)getClassLimit{
    if (!_secID) {
        [_menu updateLimitWithAry:@[]];
        return;
    }
    [YSSCShareBusinessManager.mallManager getClassifyAttributeWithDictonary:@{@"classifyId": _secID} success:^(id responObject) {
        NSArray *data = (NSArray *)responObject;
        [_menu updateLimitWithAry:data];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

- (void)sumbitClassLimitAry:(NSArray *)data{
    [_limitIdData removeAllObjects];
    _limitIdData = [data mutableCopy];
    [_collectionView.mj_header beginRefreshing];
}

- (void)didSelectIndex:(NSInteger)index firstId:(NSString *)firstId secId:(NSString *)secId leftOrRight:(BOOL)ret{
    if (index == 0) {
        if (!ret) {
            //选择左边一级分类
            if (firstId && ![firstId isEqualToString:@""]) {
                [YSSCShareBusinessManager.mallManager getMallSecondClassWithDictonary:@{@"firstClaId": firstId} success:^(id responObject) {
                    NSArray *dataSec = (NSArray *)responObject;
                    [_menu updateSecDataWithAry:dataSec];
                } failure:^(NSInteger errCode, NSString *errorMsg) {
                    
                }];
            }else{
                //当前选择----全部
                STL_ClassifyItemModel *model = [[STL_ClassifyItemModel alloc] init];
                model.cname = @"全部";
                model.ID = @"";
                NSArray *dataSec = @[model];
                [_menu updateSecDataWithAry:dataSec];
                [_menu updateSecDataWithAry:@[model]];
            }
            _firID = firstId;
            return;
        }else{
            _secID = secId;
            [_limitIdData removeAllObjects];//重新选择了二级分类，重置筛选项
        }
    }else if(index == 1){
        _sortID = firstId;
    }
    [_collectionView.mj_header beginRefreshing];

}
#pragma mark ----------------MallTopViewDelegate

- (void)mallSearchRightAction{
    MallSearchListViewController *searchVc = [[MallSearchListViewController alloc] init];
    [self.navigationController pushViewController:searchVc animated:YES];
}

#pragma mark ---------实例化

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
        layOut.itemSize = CGSizeMake(SCREEN_WIDTH/2 - 27.5, 237);
        layOut.minimumLineSpacing = 12;
        layOut.minimumInteritemSpacing = 25;
        layOut.sectionInset = UIEdgeInsetsMake(12, 15, 10, 15);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,
                                                                             110,
                                                                             SCREEN_WIDTH,
                                                                             SCREEN_HEIGHT - 110 - 49)
                                             collectionViewLayout:layOut];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[MallCollectionViewCell class] forCellWithReuseIdentifier:mallCell];
        YSSCWeakObj(self);
        //下拉刷新
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself reloadGoodsListIsUp:NO];
        }];;
        //上拉加载
        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself reloadGoodsListIsUp:YES];
        }];
        
        _collectionView.mj_footer.automaticallyHidden = YES;
    }
    return _collectionView;






}

- (STL_DropDownMenu *)menu{
    if (_menu == nil) {
        _menu = [[STL_DropDownMenu alloc] initWithTitleAry:@[@"全部", @"综合排序", @"筛选"]
                                                      fram:CGRectMake(0,
                                                                      64,
                                                                      SCREEN_WIDTH,
                                                                      46)];
        _menu.delegate = self;
        
    }
    return _menu;
    
    


}

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        
        [_topView setTitleText:@"商城" imageArrays:@[IMAGE(@"classify1")] selecterArys:@[@"mallSearchRightAction"] target:self isShowLeftBtn:NO];
    }
    return _topView;
}

@end
