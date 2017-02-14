//
//  GoodsDetailViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/11.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "GoodsDetailViewController.h"
#import "UserShopCarViewController.h"
@interface GoodsDetailViewController ()
<
    MallTabViewDelegate,
    SDCycleScrollViewDelegate,
    UITableViewDelegate,
    UITableViewDataSource,
    MallGoodsDetailRankViewDelegate
>

@property (nonatomic, strong) MallTopView *topView;//顶部视图

@property (nonatomic, strong) UIView *favoView;//收藏背景触控区域

@property (nonatomic, strong) UIButton *favoriteBtn;//收藏按钮


@property (nonatomic, strong) MallTabView *tabView;//底部视图

@property (nonatomic, strong) UIScrollView *contentView;//

@property (nonatomic, strong) SDCycleScrollView *bannerScr;//商品轮播图

@property (nonatomic, strong) UIView *firstView;//

@property (nonatomic, strong) UIView *secondView;

@property (nonatomic, strong) UIView *thridView;

@property (nonatomic, strong) UITableView *jugeTableView;//评论

@property (nonatomic, strong) NSMutableArray *jugeData;//评论数据

@property (nonatomic, strong) MallGoodsDetailBussHeadView *bussHeadView;//商铺名片

@property (nonatomic, strong) UILabel *nameLb;//商品名称

@property (nonatomic, strong) UILabel *priceLb;//商品单价

@property (nonatomic, strong) UILabel *paramerTitleLb;//产品参数

@property (nonatomic, strong) UIImageView *parameRightActionIv;//

@property (nonatomic, strong) UILabel *rankLb;//规格

@property (nonatomic, strong) UIImageView *rankRightActionIv;//

@property (nonatomic, strong) MallGoodsDetailParameView *parameView;//产品参数视图

@property (nonatomic, strong) MallGoodsDetailRankView *rankView;//选择规格视图

@property (nonatomic, strong) STL_GoodsDetailBaseInfoModel *shopModel;//商品信息

@property (nonatomic, strong) STL_GoodsDetailBaseSubItemModel *itemModel;//当前选择子商品。默认为选择第一个



@end

@implementation GoodsDetailViewController


#pragma mark ----------------生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tabView];
    [self.view addSubview:self.contentView];
    
    [self initData];//初始化所有必须数据
    [self loadInfo];//请求数
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    
    self.tabView.sd_layout
    .widthRatioToView(self.view, 1)
    .heightIs(49)
    .leftSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    

    self.contentView.sd_layout
    .widthRatioToView(self.view, 1)
    .topSpaceToView(self.topView, 0)
    .leftSpaceToView(self.view, 0)
    .bottomSpaceToView(self.tabView, 0);
    

    self.bannerScr.sd_layout
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, 0)
    .widthRatioToView(self.contentView, 1)
    .heightIs(200);

    self.firstView.sd_layout
    .topSpaceToView(self.bannerScr, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0);
    
    
    self.secondView.sd_layout
    .topSpaceToView(self.firstView, 10)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(45);
    
    self.thridView.sd_layout
    .topSpaceToView(self.secondView, 0.5)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(45);
    
    self.jugeTableView.sd_layout
    .topSpaceToView(self.thridView, 10)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0);
    
    self.bussHeadView.sd_layout
    .topSpaceToView(self.jugeTableView, 10)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(88);
    
    
    [self.contentView setupAutoContentSizeWithBottomView:_bussHeadView bottomMargin:0];

    self.nameLb.sd_layout
    .topSpaceToView(self.firstView, 10)
    .leftSpaceToView(self.firstView, 15)
    .rightSpaceToView(self.firstView, 15)
    .autoHeightRatio(0);
    [self.nameLb setMaxNumberOfLinesToShow:0];
    
    self.priceLb.sd_layout
    .topSpaceToView(self.nameLb, 15)
    .leftEqualToView(self.nameLb)
    .rightSpaceToView(self.firstView, 15)
    .autoHeightRatio(0);
    
    [self.firstView setupAutoHeightWithBottomView:_priceLb bottomMargin:10];
    
    

    self.paramerTitleLb.sd_layout
    .centerYEqualToView(self.secondView)
    .leftSpaceToView(self.secondView, 15)
    .autoHeightRatio(0);
    [self.paramerTitleLb setSingleLineAutoResizeWithMaxWidth:400];
    
    self.parameRightActionIv.sd_layout
    .centerYEqualToView(self.secondView)
    .rightSpaceToView(self.secondView, 15)
    .widthIs(8)
    .heightIs(12.5);
    
    self.rankLb.sd_layout
    .centerYEqualToView(self.thridView)
    .leftSpaceToView(self.thridView, 15)
    .autoHeightRatio(0);
    [self.rankLb setSingleLineAutoResizeWithMaxWidth:400];
    
    self.rankRightActionIv.sd_layout
    .centerYEqualToView(self.thridView)
    .rightSpaceToView(self.thridView, 15)
    .widthIs(8)
    .heightIs(12.5);
    
    
    self.favoView.sd_layout
    .centerYIs(42)
    .rightSpaceToView(self.topView, 40)
    .heightIs(40)
    .widthIs(40);
    
    self.favoriteBtn.sd_layout
    .centerYEqualToView(self.favoView)
    .centerXEqualToView(self.favoView)
    .heightIs(18)
    .widthIs(20);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark ----------------数据请求

- (void)initData{
    self.jugeData = [NSMutableArray array];//初始化评论数据;
}

- (void)loadInfo{
    YSSCWeakObj(self);

    [SVProgressHUD showWithStatus:@"加载中"];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    if (_mdf) {
        [parameters setValue:_mdf forKey:@"mainGoodsMdf"];
    }else if (_GoodsID){
        [parameters setValue:_GoodsID forKey:@"goodsId"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"信息错误"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        });
        return;
    }
    
    [YSSCShareBusinessManager.mallManager getGoodsDetailWithMainMdf:parameters success:^(id responObject) {
        [SVProgressHUD dismiss];
        [weakself updateInfoWith:responObject];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:errorMsg];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        });
    }];//获取商品信息
    /*
     mainGoodsMdf:主商品md5值
     grade:评价类型(0全部，1差评，3中评，5好评)
     page:当前页
     pageSize:每页记录数
     */
//    [parameters setDictionary:@{@"grade":@"0",@"page":@"1",@"pageSize":@"2"}];
    [parameters setValue:@"0" forKey:@"grade"];
    [parameters setValue:@1 forKey:@"page"];
    [parameters setValue:@2 forKey:@"pageSize"];
    [YSSCShareBusinessManager.mallManager getGoodsCommentWithParameters:parameters success:^(id responObject) {
        MallJugeInfoModel *model = (MallJugeInfoModel *)responObject;
        [weakself.jugeData removeAllObjects];
        [weakself.jugeData addObjectsFromArray:model.comments];
        [weakself.jugeTableView reloadData];
        weakself.jugeTableView.sd_layout
        .heightIs(90+ [weakself.jugeTableView cellsTotalHeight]);
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:errorMsg];
    }];//获取商品评价信息
}

- (void)updateInfoWith:(STL_GoodsDetailBaseInfoModel *)model{
    self.shopModel = model;//保存商品数据信息
    if (self.shopModel.subList.count) {
        self.itemModel = self.shopModel.subList.firstObject;//初始化默认选择子商品数据
    }
    
    _nameLb.text = model.goodsName;
    _priceLb.text = [NSString stringWithFormat:@"¥ %@",model.price];
    if (_itemModel) {
        _rankLb.text = [NSString stringWithFormat:@"已选择: %@", _itemModel.avalue];
    }
    NSArray *imgAry = [model.roundPic componentsSeparatedByString:@","];
    [self.bannerScr setImageURLStringsGroup:imgAry];//轮播图更新
    [self.bussHeadView updateInfoWith:model.logo_pic title:model.shopName];//更新商店卡片视图
    [_favoriteBtn setSelected:_shopModel.flag];

}

#pragma mark ----------------导航栏按钮事件

//收藏
- (void)mallRightFavoriteAciton{
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return;
    }
    _favoriteBtn.selected = !_favoriteBtn.isSelected;
    [SVProgressHUD showWithStatus:@"发送中"];
    [YSSCShareBusinessManager.travelManager getFavoriteTravelWithParameters:@{@"linkId":_shopModel.Id, @"collectType":@20}
                                                                    success:^(id responObject) {
                                                                        [SVProgressHUD showSuccessWithStatus:responObject];
                                                                    } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                        [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                    }];
}
//分享
- (void)mallRightEditAction{
    [YSSCShareBusinessManager.travelManager shareWithParameters:nil target:self];
}

#pragma mark ----------------展现产品参数和选择规格

- (void)parameterShowAction{
    [self.view addSubview:self.parameView];
    YSSCWeakObj(self);
    [UIView animateWithDuration:0.35 animations:^{
        weakself.parameView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }];
    
    if (_shopModel.attrValue.count) {
        [_parameView updateInfoWithAry:_shopModel.attrValue];
    }
    
}

- (void)rankShowAction{
    [self.view addSubview:self.rankView];

    YSSCWeakObj(self);
    [UIView animateWithDuration:0.35 animations:^{
        weakself.rankView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }];

    //更新规格选择视图
    if (_shopModel.subList.count) {
        _rankView.currentValue = _itemModel.attr_id;
        [_rankView updateInfoWith:_shopModel];
    }
}

#pragma mark ----------------底部标签栏事件

//进入商铺页
- (void)enterBussHome{
    MallBussViewController *mallBussVc = [[MallBussViewController alloc] init];
    mallBussVc.Id = _shopModel.shopId;
    mallBussVc.phone = _shopModel.phone;
    [self.navigationController pushViewController:mallBussVc animated:YES];

}
//联系客服
- (void)callBussPhone{
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",_shopModel.phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

}
//进入购物车
- (void)enterShoppingCar{
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        YSSCWeakObj(self);
        LoginViewController *loginVc = [[LoginViewController alloc] init];
        loginVc.BackBlock = ^(BOOL isLogin){
            if (isLogin) {
                [weakself loadInfo];
            }
        };
        [self presentViewController:loginVc animated:YES completion:nil];
        return;
    }
    UserShopCarViewController *shopCarVc = [[UserShopCarViewController alloc] init];
    [self.navigationController pushViewController:shopCarVc animated:YES];
}

- (void)addToShoppingCar{
    [self rankShowAction];
}
- (void)buyNow{
    [self rankShowAction];
}

#pragma mark ----------------规格选择视图代理

- (void)selectItemWith:(STL_GoodsDetailBaseSubItemModel *)model{
    _itemModel = model;
    _rankLb.text = [NSString stringWithFormat:@"已选择: %@", model.avalue];
}

//立即下单
- (void)buyNowWithCurrentRank{
    YSSCWeakObj(self);
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        LoginViewController *loginVc = [[LoginViewController alloc] init];
        loginVc.BackBlock = ^(BOOL isLogin){
            if (isLogin) {
                [weakself loadInfo];
            }
        };
        [self presentViewController:loginVc animated:YES completion:nil];
    }else{ 
        //跳转下单页面
        MallSumbitOrderViewController *sumVc = [[MallSumbitOrderViewController alloc] init];
        [_itemModel setGoodsName:_shopModel.goodsName];
        sumVc.data = [NSMutableArray arrayWithObjects:_itemModel, nil];
        [self.navigationController pushViewController:sumVc animated:YES];

    }
    self.rankView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.rankView removeFromSuperview];
}

////加入购物车
- (void)addToStoreCarWithCurrentRank{
    YSSCWeakObj(self);
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        LoginViewController *loginVc = [[LoginViewController alloc] init];
        loginVc.BackBlock = ^(BOOL isLogin){
            if (isLogin) {
                [weakself loadInfo];
            }
        };
        [self presentViewController:loginVc animated:YES completion:nil];
    }else{
        //添加购物车操作
        NSDictionary *dict = @{@"mainGoodsMdf":_shopModel.mainGoodsMdf, @"subGoodsMdf":_itemModel.mdf, @"quantity":_itemModel.quantity};
//        NSLog(@"%@ ----%@ ---- %@",_shopModel.mainGoodsMdf, _itemModel.mdf, _itemModel.quantity);
        [YSSCShareBusinessManager.mallManager getAddToStoreCarWithParameters:dict success:^(id responObject) {
            [SVProgressHUD showSuccessWithStatus:@"成功添加至购物车"];
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            [SVProgressHUD showErrorWithStatus:errorMsg];
        }];
    }
    self.rankView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.rankView removeFromSuperview];

}

#pragma mark ----------------查看更多评论

- (void)lookMoreCommentAction{
    MallGoodsCommentViewController *commentVc = [[MallGoodsCommentViewController alloc] init];
    commentVc.mdf = _mdf;
    [self.navigationController pushViewController:commentVc animated:YES];
}

#pragma mark ----------------评论代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _jugeData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MallJugeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"juge"];
    MallJugeInfoItemModel *model = _jugeData[indexPath.row];
    cell.model = model;
    return cell;


}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MallJugeInfoItemModel *model = _jugeData[indexPath.row];
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[MallJugeTableViewCell class] contentViewWidth:SCREEN_WIDTH];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = GRAYCOLOR;
    [headView addSubview:lineView];
    
    UILabel *headLb = [[UILabel alloc] init];
    headLb.font = FONT(14);
    headLb.textColor = LIGHTTEXTCOLOR;
    headLb.text = [NSString stringWithFormat:@"评价(%ld条)",_jugeData.count];
    [headView addSubview:headLb];
    headLb.sd_layout
    .centerYEqualToView(headView)
    .leftSpaceToView(headView, 15)
    .autoHeightRatio(0);
    [headLb setSingleLineAutoResizeWithMaxWidth:200];
    return headView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    
    UILabel *footerlb = [[UILabel alloc] init];
    footerlb.text = @"查看更多";
    footerlb.font = FONT(14);
    footerlb.textColor = MALLColor;
    [footerView addSubview:footerlb];
    footerlb.sd_layout
    .centerXEqualToView(footerView)
    .centerYEqualToView(footerView)
    .autoHeightRatio(0);
    [footerlb setSingleLineAutoResizeWithMaxWidth:300];
    UIImageView *moreIv = [[UIImageView alloc] initWithImage:IMAGE(@"classify61")];
    [footerView addSubview:moreIv];
    moreIv.sd_layout
    .centerYEqualToView(footerView)
    .leftSpaceToView(footerlb, 7)
    .widthIs(15)
    .heightIs(10);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lookMoreCommentAction)];
    [footerView addGestureRecognizer:tap];
    return footerView;



}


#pragma mark ----------------BannerDelegate


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}


#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        YSSCWeakObj(self);
        _topView.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        [_topView setTitleText:@"商品详情" imageArrays:@[IMAGE(@"classify64")] selecterArys:@[@"mallRightEditAction"] target:self isShowLeftBtn:YES];
        [_topView addSubview:self.favoView];
    }
    return _topView;
}

- (UIView *)favoView{
    if (_favoView == nil) {
        _favoView = [[UIView alloc] init];
        _favoView.backgroundColor = WHITECOLOR;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mallRightFavoriteAciton)];
        [_favoView addGestureRecognizer:tap];
        [_favoView addSubview:self.favoriteBtn];
    }
    return _favoView;

}

- (UIButton *)favoriteBtn{
    if (_favoriteBtn == nil) {
        _favoriteBtn = [[UIButton alloc] init];
        [_favoriteBtn setBackgroundImage:IMAGE(@"classify94") forState:UIControlStateNormal];
        [_favoriteBtn setBackgroundImage:IMAGE(@"classify63") forState:UIControlStateSelected];
        [_favoriteBtn addTarget:self action:@selector(mallRightFavoriteAciton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _favoriteBtn;

}

- (MallTabView *)tabView{
    if (_tabView == nil) {
        _tabView = [[MallTabView alloc] init];
        _tabView.backgroundColor = WHITECOLOR;
        _tabView.delegate = self;
    }
    return _tabView;


}

- (UIScrollView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIScrollView alloc] init];
        _contentView.backgroundColor = GRAYCOLOR;
        _contentView.scrollEnabled = YES;
        [_contentView addSubview:self.bannerScr];
        [_contentView addSubview:self.firstView];
        [_contentView addSubview:self.secondView];
        [_contentView addSubview:self.thridView];
        [_contentView addSubview:self.jugeTableView];
        [_contentView addSubview:self.bussHeadView];
        YSSCWeakObj(self);
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            MallGoodsDetailImageViewController *imaVc = [[MallGoodsDetailImageViewController alloc] init];
            imaVc.mdf = _shopModel.mainGoodsMdf;
            [weakself.navigationController pushViewController:imaVc animated:YES];
            [_contentView.mj_footer endRefreshing];
        }];
        footer.automaticallyRefresh = NO;
        footer.mj_h = 45;
        [footer setTitle:@"------- 继续拖动，查看图文详情 ---------" forState:MJRefreshStateIdle];
        [footer setTitle:@"继续拖动，查看图文详情" forState:MJRefreshStatePulling];
        [footer setTitle:@"正在加载，请稍后" forState:MJRefreshStateRefreshing];
        _contentView.mj_footer = footer;
    }
    return _contentView;
}

- (SDCycleScrollView *)bannerScr{
    if (_bannerScr == nil) {
        _bannerScr = [[SDCycleScrollView alloc] init];
        _bannerScr.delegate = self;
        _bannerScr.placeholderImage = PlaceholderImage;
    }
    return _bannerScr;
}

- (UIView *)firstView{
    if (_firstView == nil) {
        _firstView = [[UIView alloc] init];
        _firstView.backgroundColor = WHITECOLOR;
        [_firstView addSubview:self.nameLb];
        [_firstView addSubview:self.priceLb];
    }
    return _firstView;

}

- (UIView *)secondView{
    if (_secondView == nil) {
        _secondView = [[UIView alloc] init];
        _secondView.backgroundColor = WHITECOLOR;
        [_secondView addSubview:self.paramerTitleLb];
        [_secondView addSubview:self.parameRightActionIv];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(parameterShowAction)];
        [_secondView addGestureRecognizer:tap];
    }
    return _secondView;
}

- (UIView *)thridView{
    if (_thridView == nil) {
        _thridView = [[UIView alloc] init];
        _thridView.backgroundColor = WHITECOLOR;
        [_thridView addSubview:self.rankLb];
        [_thridView addSubview:self.rankRightActionIv];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rankShowAction)];
        [_thridView addGestureRecognizer:tap];
    }
    return _thridView;



}

- (UITableView *)jugeTableView{
    if (_jugeTableView == nil) {
        _jugeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _jugeTableView.backgroundColor = WHITECOLOR;
        _jugeTableView.delegate = self;
        _jugeTableView.dataSource = self;
        _jugeTableView.scrollEnabled = NO;
        [_jugeTableView registerClass:[MallJugeTableViewCell class] forCellReuseIdentifier:@"juge"];
    }
    return _jugeTableView;
}

- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.textColor = BLACKTEXTCOLOR;
        _nameLb.text = @"知味观绿豆糕抹茶味XXXXXXX";
        _nameLb.font = FONT(17);
    }
    return _nameLb;
    
    
}

- (UILabel *)priceLb{
    if (_priceLb == nil) {
        _priceLb = [[UILabel alloc] init];
        _priceLb.textColor = MALLColor;
        _priceLb.text = @"¥: 29.00";
        _priceLb.font = FONT(17);
    }
    return _priceLb;
    
    
}

- (UILabel *)paramerTitleLb{
    if (_paramerTitleLb == nil) {
        _paramerTitleLb = [[UILabel alloc] init];
        _paramerTitleLb.font = FONT(14);
        _paramerTitleLb.textColor = BLACKTEXTCOLOR;
        _paramerTitleLb.text = @"产品参数";
    }
    return _paramerTitleLb;
}

- (UIImageView *)parameRightActionIv{
    if (_parameRightActionIv == nil) {
        _parameRightActionIv = [[UIImageView alloc] init];
        _parameRightActionIv.image = IMAGE(@"classify141");
    }
    return _parameRightActionIv;
}

- (UILabel *)rankLb{
    if (_rankLb == nil) {
        _rankLb = [[UILabel alloc] init];
        _rankLb.font = FONT(14);
        _rankLb.textColor = BLACKTEXTCOLOR;
        _rankLb.text = @"请选择规格";
    }
    return _rankLb;
}

- (UIImageView *)rankRightActionIv{
    if (_rankRightActionIv == nil) {
        _rankRightActionIv = [[UIImageView alloc] init];
        _rankRightActionIv.image = IMAGE(@"classify141");
    }
    return _rankRightActionIv;
}

- (MallGoodsDetailBussHeadView *)bussHeadView{
    if (_bussHeadView == nil) {
        _bussHeadView = [[MallGoodsDetailBussHeadView alloc] init];
        _bussHeadView.backgroundColor = WHITECOLOR;
        YSSCWeakObj(self);
        _bussHeadView.block = ^(){
            MallBussViewController *bussVc = [[MallBussViewController alloc] init];
            bussVc.Id = weakself.shopModel.shopId;
            [weakself.navigationController pushViewController:bussVc animated:YES];
        };
    }
    return _bussHeadView;
}

- (MallGoodsDetailParameView *)parameView{
    if (_parameView == nil) {
        _parameView = [[MallGoodsDetailParameView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _parameView;
}

- (MallGoodsDetailRankView *)rankView{
    if (_rankView == nil) {
        _rankView = [[MallGoodsDetailRankView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _rankView.delegate = self;
    }
    return _rankView;

}

@end
