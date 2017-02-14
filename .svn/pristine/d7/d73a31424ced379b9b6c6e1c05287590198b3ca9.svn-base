//
//  MallBussViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussViewController.h"

#import "MallBussHeadSectionView.h"//三个按钮图
#import "MallBussTopTableViewCell.h"//头部
#import "MallBussHomeTableViewCell.h"//首页
#import "MallBussMessTableViewCell.h"//动态
#import "MallBussAllGoodsTableViewCell.h"//全部
#import "HotelDetailViewController.h"//乡宿


@interface MallBussViewController ()
<
    MallBussTopViewDelegate,
    UITableViewDelegate,
    UITableViewDataSource,
    MallBussAllGoodsTableViewCellDelegate,
    MallBussHomeTableViewCellDelegate
>

@property (nonatomic, strong) MallBussTopView *topView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *bottomView;//底部视图//只有在商家首页展示
@property (nonatomic, strong) UIView *lineView;//底部视图切割线
@property (nonatomic, strong) UIButton *goodsClassifyBtn;//产品分类
@property (nonatomic, strong) UIView *oneSingleView;//第一个切割
@property (nonatomic, strong) UIView *secondSingleView;//第二个切割
@property (nonatomic, strong) UIButton *bussIntroduceBtn;//商家简介
@property (nonatomic, strong) UIButton *connectBussBtn;//联系商家





@property (nonatomic, strong) MallTabButton *bussHomeBtn;//商家首页

@property (nonatomic, strong) MallTabButton *allGoodsBtn;//全部宝贝

@property (nonatomic, strong) MallTabButton *bussMessBtn;//商家动态

@property (nonatomic, assign) NSInteger currentIndex;//标注当前选中坐标

@property (nonatomic, assign) NSInteger page;//刷新页数

@property (nonatomic, assign) BOOL isDown;//是否为上拉加载


@property (nonatomic, strong) NSMutableArray *homeData;//首页数据源
@property (nonatomic, strong) NSMutableArray *allGoodsData;
@property (nonatomic, strong) NSMutableArray *newsData;
@property (nonatomic, strong) NSMutableDictionary *headInfo;//头部简介

@property (nonatomic, assign) NSInteger allGoodsIndex;




@end

@implementation MallBussViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];//添加底部视图
    [self initData];
    _isDown = YES;
    [SVProgressHUD showWithStatus:@"加载中"];
    [self loadShopDetailInfo];//初始请求头部信息
    [self loadInfoWith:YES];;
    [YSSCNotificationCenter addObserver:self selector:@selector(loadShopDetailInfo) name:@"upFavorite" object:nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    
    self.bottomView.sd_layout
    .bottomSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .heightIs(45);

    self.tableView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    [self bottmViewLayoutSubViews];//布局底部视图
    
    
}
//布局bottomView
- (void)bottmViewLayoutSubViews{
    
    self.lineView.sd_layout
    .topSpaceToView(self.bottomView, 0)
    .leftSpaceToView(self.bottomView, 0)
    .rightSpaceToView(self.bottomView, 0)
    .heightIs(0.5);
    
    self.goodsClassifyBtn.sd_layout
    .topSpaceToView(self.bottomView, 0.5)
    .leftSpaceToView(self.bottomView, 0)
    .heightRatioToView(self.bottomView, 1)
    .widthRatioToView(self.bottomView, 1.00/3.00);
    
    self.bussIntroduceBtn.sd_layout
    .topSpaceToView(self.bottomView, 0.5)
    .leftSpaceToView(self.goodsClassifyBtn, 0)
    .heightRatioToView(self.bottomView, 1)
    .widthRatioToView(self.bottomView, 1.00/3.00);

    self.connectBussBtn.sd_layout
    .topSpaceToView(self.bottomView, 0.5)
    .leftSpaceToView(self.bussIntroduceBtn, 0)
    .heightRatioToView(self.bottomView, 1)
    .widthRatioToView(self.bottomView, 1.00/3.00);
    
    self.oneSingleView.sd_layout
    .topSpaceToView(self.bottomView, 15)
    .leftSpaceToView(self.goodsClassifyBtn, 0)
    .bottomSpaceToView(self.bottomView, 15)
    .widthIs(0.5);
    
    self.secondSingleView.sd_layout
    .topEqualToView(self.oneSingleView)
    .bottomEqualToView(self.oneSingleView)
    .leftSpaceToView(self.bussIntroduceBtn, 0)
    .widthIs(0.5);
    
}
//注销通知
- (void)dealloc{
    [YSSCNotificationCenter removeObserver:self];
}
#pragma mark ----------------初始化数据源

- (void)initData{
    _homeData = [NSMutableArray array];
    _newsData = [NSMutableArray array];
    _allGoodsData = [NSMutableArray array];
    _headInfo = [NSMutableDictionary dictionary];
}

#pragma mark ----------------数据请求

- (void)loadShopDetailInfo{
    NSDictionary *dic = @{@"shopId":_Id};
    [YSSCShareBusinessManager.mallManager getShopDetailsWithParameters:dic
                                                               success:^(id responObject) {
                                                                   [_headInfo setDictionary:responObject];
                                                                   [_tableView reloadData];
                                                               } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                   [SVProgressHUD showErrorWithStatus:errorMsg];
                                                               }];//获取商家简介

}

- (void)loadInfoWith:(BOOL)ret{
    _isDown = ret;
    if (ret) {
        
        _page = 1;
        
        
        
        if (_currentIndex == 0) {
            //下拉刷新首页
            [YSSCShareBusinessManager.mallManager getGoodsListWithParameters:@{@"shopId":_Id, @"page":[NSString stringWithFormat:@"%ld",_page], @"pageSize":@10} success:^(id responObject) {
                [SVProgressHUD dismiss];
                [_homeData removeAllObjects];
                [_homeData addObjectsFromArray:responObject];
                [_tableView reloadData];
                
                if (!_homeData.count) {
                    _tableView.mj_footer.hidden = YES;
                    [SVProgressHUD showErrorWithStatus:@"暂无商品"];
                }else{
                    _tableView.mj_footer.hidden = NO;
                    [_tableView.mj_footer setState:MJRefreshStateIdle];
                }
                [_tableView.mj_header endRefreshing];
            } failure:^(NSInteger errCode, NSString *errorMsg) {
                //请求失败错误
                [_tableView.mj_header endRefreshing];
            }];
            

        }else if (_currentIndex == 1){
            //下拉刷新全部宝贝
            //当前选择排序 0 - 4 分别对应综合 ，销量 新品， 价格升序 ，价格降许
            NSMutableDictionary *muDict = [NSMutableDictionary dictionary];
            [muDict setDictionary:@{@"shopId":_Id, @"page":[NSString stringWithFormat:@"%ld",_page], @"pageSize":@10}];
            
            switch (_allGoodsIndex) {
                case 0:{
                    [muDict setValue:@"3_1" forKey:@"sort"];
                }
                    break;
                case 1:{
                    [muDict setValue:@"1_1" forKey:@"sort"];
                }
                    break;
                case 2:{
                    [muDict setValue:@"0_0" forKey:@"sort"];
                }
                    break;
                case 3:{
                    [muDict setValue:@"2_0" forKey:@"sort"];
                }
                    break;
                case 4:{
                    [muDict setValue:@"2_1" forKey:@"sort"];
                }
                    break;
                default:
                    break;
            }
            
            [YSSCShareBusinessManager.mallManager getGoodsListWithParameters:muDict success:^(id responObject) {
                
                [_allGoodsData removeAllObjects];
                [_allGoodsData addObjectsFromArray:responObject];
                [_tableView reloadData];
                if (!_allGoodsData.count) {
                    _tableView.mj_footer.hidden = YES;
                    [SVProgressHUD showErrorWithStatus:@"暂无商品"];
                }else{
                    _tableView.mj_footer.hidden = NO;
                    [_tableView.mj_footer setState:MJRefreshStateIdle];
                }
                [_tableView.mj_header endRefreshing];
            } failure:^(NSInteger errCode, NSString *errorMsg) {
                //请求失败错误
                [_tableView.mj_header endRefreshing];
            }];

            
        }else{
            //下拉刷新商家动态
            [YSSCShareBusinessManager.mallManager getShopnewsWithParameters:@{@"shopId":_Id, @"page":[NSString stringWithFormat:@"%ld",_page], @"pageSize":@10} success:^(id responObject) {
                [_newsData removeAllObjects];
                [_newsData addObjectsFromArray:responObject];
                [_tableView reloadData];
                
                if (!_newsData.count) {
                    _tableView.mj_footer.hidden = YES;
                    [SVProgressHUD showErrorWithStatus:@"暂无动态"];
                }else{
                    _tableView.mj_footer.hidden = NO;
                }
                
                [_tableView.mj_header endRefreshing];
            } failure:^(NSInteger errCode, NSString *errorMsg) {
                [_tableView.mj_header endRefreshing];

            }];//商家动态消息
        }
    }else{
        _page +=1;
        //上拉加载
        if (_currentIndex == 0) {
            [YSSCShareBusinessManager.mallManager getGoodsListWithParameters:@{@"shopId":_Id, @"page":[NSString stringWithFormat:@"%ld",_page], @"pageSize":@10} success:^(id responObject) {
                if (responObject) {
                    [_homeData addObjectsFromArray:responObject];
                    [_tableView reloadData];
                }
                NSArray *data= responObject;
                if (data.count < 10) {
                    [_tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [_tableView.mj_footer endRefreshing];
                }
            } failure:^(NSInteger errCode, NSString *errorMsg) {
                [_tableView.mj_footer endRefreshingWithNoMoreData];
            }];
            //上拉加载首页
        }else if (_currentIndex == 1){
            //上拉加载全部宝贝
            NSMutableDictionary *muDict = [NSMutableDictionary dictionary];
            [muDict setDictionary:@{@"shopId":_Id, @"page":[NSString stringWithFormat:@"%ld",_page], @"pageSize":@10}];
            
            switch (_allGoodsIndex) {
                case 0:{
                    [muDict setValue:@"3_1" forKey:@"sort"];
                }
                    break;
                case 1:{
                    [muDict setValue:@"1_1" forKey:@"sort"];
                }
                    break;
                case 2:{
                    [muDict setValue:@"0_0" forKey:@"sort"];
                }
                    break;
                case 3:{
                    [muDict setValue:@"2_0" forKey:@"sort"];
                }
                    break;
                case 4:{
                    [muDict setValue:@"2_1" forKey:@"sort"];
                }
                    break;
                default:
                    break;
            }
            
            [YSSCShareBusinessManager.mallManager getGoodsListWithParameters:muDict success:^(id responObject) {
                
                [_allGoodsData addObjectsFromArray:responObject];
                [_tableView reloadData];
                NSArray *data= responObject;
                if (data.count < 10) {
                    [_tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [_tableView.mj_footer endRefreshing];
                }

            } failure:^(NSInteger errCode, NSString *errorMsg) {
                //请求失败错误
                [_tableView.mj_footer endRefreshingWithNoMoreData];
            }];

        }else{
            //上拉加载商家动态
            [YSSCShareBusinessManager.mallManager getShopnewsWithParameters:@{@"shopId":_Id, @"page":[NSString stringWithFormat:@"%ld",_page], @"pageSize":@10} success:^(id responObject) {
                NSArray *data= responObject;
                if (data.count < 10) {
                    [_tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [_tableView.mj_footer endRefreshing];
                }
                [_newsData addObjectsFromArray:responObject];
                [_tableView reloadData];
                
            } failure:^(NSInteger errCode, NSString *errorMsg) {
                [_tableView.mj_footer endRefreshingWithNoMoreData];
                
            }];//商家动态消息
        }
        
    }







}
#pragma mark ----------------首页cell代理

- (void)selectGoodsInHomeShop:(NSString *)mdf{
    GoodsDetailViewController *goodsDetailVc = [[GoodsDetailViewController alloc] init];
    goodsDetailVc.mdf = mdf;
    [self.navigationController pushViewController:goodsDetailVc animated:YES];

}

- (void)intoGoodsDetailWithID:(NSString *)Id{
    GoodsDetailViewController *goodsDetailVc = [[GoodsDetailViewController alloc] init];
    goodsDetailVc.GoodsID = Id;
    [self.navigationController pushViewController:goodsDetailVc animated:YES];
}

#pragma mark ----------------全部宝贝cell代理

- (void)reloadDataWithIndex:(NSInteger)index{
    
    _allGoodsIndex = index;
    [self loadInfoWith:YES];
}

- (void)selectGoodsInShopWith:(NSString *)mdf{
    GoodsDetailViewController *goodsDetailVc = [[GoodsDetailViewController alloc] init];
    goodsDetailVc.mdf = mdf;
    [self.navigationController pushViewController:goodsDetailVc animated:YES];

}

#pragma mark ----------------点击事件

- (void)selectHomeAction:(MallTabButton *)btn{
    if (_currentIndex == 0) {
        return;
    }else{
        _currentIndex = 0;
    }
    [self updateBtn];
    [self loadInfoWith:YES];
}

- (void)selectGoodsAction:(MallTabButton *)btn{
    if (_currentIndex == 1) {
        return;
    }else{
        _currentIndex = 1;
    }
    [self updateBtn];


    [self loadInfoWith:YES];

}

- (void)selectMessAction:(MallTabButton *)btn{
    if (_currentIndex == 2) {
        return;
    }else{
        _currentIndex = 2;
    }
    [self updateBtn];

    [self loadInfoWith:YES];

}

- (void)updateBtn{
    
    
    [_bussHomeBtn setTitleText:@"商家首页" image:IMAGE(@"classify73")];
    [_allGoodsBtn setTitleText:@"全部宝贝" image:IMAGE(@"classify72")];
    [_bussMessBtn setTitleText:@"商家动态" image:IMAGE(@"classify84")];

    switch (_currentIndex) {
        case 0:
            _bussHomeBtn.tabIv.image = IMAGE(@"classify83");
            _bussHomeBtn.tabLb.textColor = MALLColor;
//            [self.view addSubview:self.bottomView];
            break;
        case 1:
            _allGoodsBtn.tabIv.image = IMAGE(@"classify82");
            _allGoodsBtn.tabLb.textColor = MALLColor;
//            [self.bottomView removeFromSuperview];
            
            break;
        case 2:
            _bussMessBtn.tabIv.image = IMAGE(@"classify75");
            _bussMessBtn.tabLb.textColor = MALLColor;
//            [self.bottomView removeFromSuperview];
            break;
        default:
            break;
    }
    
}


#pragma mark ----------------Bottom事件

- (void)enterGoodsClassifyAction{
    MallBussRankViewController *rankVc = [[MallBussRankViewController alloc] init];
    rankVc.shopId = _Id;
    [self.navigationController pushViewController:rankVc animated:YES];

}

- (void)enterBussIntroduceAction{
    MallBussIntroViewController *introVc = [[MallBussIntroViewController alloc] init];
    introVc.info = _headInfo;
    introVc.shopID  = _Id;
    [self.navigationController pushViewController:introVc animated:YES];
}

- (void)enterConnectBussAction{
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",_phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}


#pragma mark ----------------MallBussTopDelegate

- (void)backToLast{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)searchWithText:(NSString *)text{
    MallShopGoodsListViewController *shopList = [[MallShopGoodsListViewController alloc] init];
    shopList.shopId = _Id;
    shopList.keyWord = text;
    [self.navigationController pushViewController:shopList animated:YES];
}

- (void)enterPeopleHome{
    NSString *hoteId = [_headInfo[@"hotel_id"] stringValue];
    //hotel——id为0，则表示未开通乡宿
    if (![hoteId isEqualToString:@"0"]) {
        HotelDetailViewController *hotelVc = [[HotelDetailViewController alloc] init];
        hotelVc.hotelID = hoteId;
        [self.navigationController pushViewController:hotelVc animated:YES];
    }else{
        [SVProgressHUD showErrorWithStatus:@"暂未开通乡宿"];
    }
}


#pragma mark ----------------tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        MallBussHeadSectionView *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headView"];
        [sectionView addAction:@[@"selectHomeAction:", @"selectGoodsAction:", @"selectMessAction:"] target:self];
        self.bussHomeBtn = sectionView.bussHomeBtn;
        self.allGoodsBtn = sectionView.allGoodsBtn;
        self.bussMessBtn = sectionView.bussMessBtn;
        [self updateBtn];
        return sectionView;
    }
    return nil;



}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;


}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 50;
    }
    return 0.01;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 220;
    }else if (indexPath.section == 1){
        if (_currentIndex == 0) {
            //首页
            NSInteger flag = _homeData.count /2;
            if (_homeData.count %2) {
                flag += 1;
            }
            return 250 * flag + 240;
        }else if(_currentIndex == 1){
            //全部
            NSInteger flag = _allGoodsData.count /2;
            if (_allGoodsData.count %2) {
                flag += 1;
            }
            return 250 * flag + 75;
        }else{
            //动态
            return [tableView cellHeightForIndexPath:indexPath model:_newsData keyPath:@"data" cellClass:[MallBussMessTableViewCell class] contentViewWidth:SCREEN_WIDTH];
        }
    }
    return 44;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MallBussTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topCell"];
        [cell updateInfoWith:_headInfo];
        return cell;
    }else if(indexPath.section == 1){
        switch (_currentIndex) {
            case 0:
            {
                MallBussHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
                cell.shopId = _Id;
                cell.delegate = self;
                [cell updateWith:_homeData ret:_isDown];
                return cell;
            }
                break;
            case 1:
            {
                MallBussAllGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllGoodsCell"];
                cell.delegate = self;
                [cell updateInfoWithAry:_allGoodsData];
                return cell;
            }
                break;
            case 2:
            {
                MallBussMessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messCell"];
                cell.data = _newsData;
                return cell;
            }
                break;
            default:
            {
                return nil;
            }
                break;
        }
    }
    return nil;

}


#pragma mark ----------------实例化

- (MallBussTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallBussTopView alloc] init];
        _topView.delegate = self;
    }
    return _topView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MallBussHomeTableViewCell class] forCellReuseIdentifier:@"HomeCell"];
        [_tableView registerClass:[MallBussAllGoodsTableViewCell class] forCellReuseIdentifier:@"AllGoodsCell"];
        [_tableView registerClass:[MallBussMessTableViewCell class] forCellReuseIdentifier:@"messCell"];
        [_tableView registerClass:[MallBussTopTableViewCell class] forCellReuseIdentifier:@"topCell"];
        [_tableView registerClass:[MallBussHeadSectionView class] forHeaderFooterViewReuseIdentifier:@"headView"];
        YSSCWeakObj(self);
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself loadInfoWith:YES];
        }];
        
//        _tableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
//            [weakself loadInfoWith:NO];
//        }];
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself loadInfoWith:NO];
        }];
        footer.triggerAutomaticallyRefreshPercent = 200;
//        [footer setTitle:@"加载更多" forState:MJRefreshStateIdle];
//        [footer setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
//        [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
        footer.automaticallyHidden = YES;
        _tableView.mj_footer = footer;
//        _tableView.mj_footer.automaticallyHidden = YES;
    }
    return _tableView;
}

- (UIView *)bottomView{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = WHITECOLOR;
        [_bottomView addSubview:self.lineView];
        [_bottomView addSubview:self.goodsClassifyBtn];
        [_bottomView addSubview:self.bussIntroduceBtn];
        [_bottomView addSubview:self.connectBussBtn];
        [_bottomView addSubview:self.oneSingleView];
        [_bottomView addSubview:self.secondSingleView];
    }
    return _bottomView;


}

- (UIView *)oneSingleView{
    if (_oneSingleView == nil) {
        _oneSingleView = [[UIView alloc] init];
        _oneSingleView.backgroundColor = GRAYCOLOR;
    }
    return _oneSingleView;
}

- (UIView *)secondSingleView{
    if (_secondSingleView == nil) {
        _secondSingleView = [[UIView alloc] init];
        _secondSingleView.backgroundColor = GRAYCOLOR;
    }
    return _secondSingleView;
}

- (UIButton *)goodsClassifyBtn{
    if (_goodsClassifyBtn == nil) {
        _goodsClassifyBtn = [[UIButton alloc] init];
        [_goodsClassifyBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_goodsClassifyBtn setTitle:@"产品分类" forState:UIControlStateNormal];
        _goodsClassifyBtn.titleLabel.font = FONT(14);
        [_goodsClassifyBtn addTarget:self action:@selector(enterGoodsClassifyAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goodsClassifyBtn;

    }

- (UIButton *)bussIntroduceBtn{
    if (_bussIntroduceBtn == nil) {
        _bussIntroduceBtn = [[UIButton alloc] init];
        [_bussIntroduceBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_bussIntroduceBtn setTitle:@"商家简介" forState:UIControlStateNormal];
        _bussIntroduceBtn.titleLabel.font = FONT(14);
        [_bussIntroduceBtn addTarget:self action:@selector(enterBussIntroduceAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bussIntroduceBtn;

}

- (UIButton *)connectBussBtn{
    if (_connectBussBtn == nil) {
        _connectBussBtn = [[UIButton alloc] init];
        [_connectBussBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_connectBussBtn setTitle:@"联系商家" forState:UIControlStateNormal];
        _connectBussBtn.titleLabel.font = FONT(14);
        [_connectBussBtn addTarget:self action:@selector(enterConnectBussAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _connectBussBtn;

}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

@end
