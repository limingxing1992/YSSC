//
//  MallShopGoodsListViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallShopGoodsListViewController.h"

@interface MallShopGoodsListViewController ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource
>
@property (nonatomic, strong) MallTopView *topView;//头部视图

@property (nonatomic, strong) UICollectionView *collectionView;//主列表视图
@property (nonatomic, strong) NSMutableArray *goodsData;//商品信息数据
@property (nonatomic, assign) NSInteger currentPage;//当前加载页数

@end
static NSString *const mallCell = @"mallCell";

@implementation MallShopGoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.collectionView];
    _goodsData = [NSMutableArray array];
    [self reloadGoodsListIsUp:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
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
    NSMutableDictionary *muDic = [[NSMutableDictionary alloc] initWithDictionary:@{@"page":[NSNumber numberWithInteger:_currentPage],
                                                                                   @"pageSize":PAGESIZE
                                                                                   }];
    if (_shopId) {
        [muDic setValue:_shopId forKey:@"shopId"];
    }
    if (_classId) {
        [muDic setValue:_classId forKey:@"classifyId"];
    }
    
    if (_keyWord) {
        [muDic setValue:_keyWord forKey:@"keywords"];
    }
    
    [YSSCShareBusinessManager.mallManager getGoodsListWithParameters:muDic success:^(id responObject) {
        NSArray *data = (NSArray *)responObject;
        if (ret) {
            [_goodsData addObjectsFromArray:data];
        }else{
            [_goodsData removeAllObjects];
            _goodsData = [data mutableCopy];
        }
        [_collectionView reloadData];
        
        if (ret) {
            if (data.count < 10) {
                [_collectionView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [_collectionView.mj_footer endRefreshing];
            }
        }else{
            if (_goodsData.count < 10) {
                _collectionView.mj_footer.hidden = YES;
            }else{
                _collectionView.mj_footer.hidden = NO;
                [_collectionView.mj_footer setState:MJRefreshStateIdle];

            }
            
            if (!_goodsData.count) {
                [SVProgressHUD showErrorWithStatus:@"暂无相关商品"];
            }
            
            
            [_collectionView.mj_header endRefreshing];
        }
        
        
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

#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        [_topView setTitleText:@"商品" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
        layOut.itemSize = CGSizeMake(SCREEN_WIDTH/2 - 27.5, 237);
        layOut.minimumLineSpacing = 12;
        layOut.minimumInteritemSpacing = 25;
        layOut.sectionInset = UIEdgeInsetsMake(12, 15, 10, 15);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,
                                                                             64,
                                                                             SCREEN_WIDTH,
                                                                             SCREEN_HEIGHT - 64)
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


@end
