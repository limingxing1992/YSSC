//
//  SurroundingAreaItemDetailViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SurroundingAreaItemDetailViewController.h"

@interface SurroundingAreaItemDetailViewController ()
<
    SDCycleScrollViewDelegate,
    UITableViewDelegate,
    UITableViewDataSource,
    BMKMapViewDelegate
>

@property (nonatomic, strong) MallTopView *topView;//顶部视图

@property (nonatomic, strong) UIView *favoriteView;

@property (nonatomic, strong) UIButton *favoriteBtn;//收藏按钮


@property (nonatomic, strong) UIScrollView *contentView;//内容

@property (nonatomic, strong) SDCycleScrollView *bannerScr;//banner轮播图

@property (nonatomic, strong) UILabel *bussNameLb;//商家名称

@property (nonatomic, strong) MallJugeStarView *starView;//星图

@property (nonatomic, strong) UIView *firstSingleLineView;//第一个切割线

@property (nonatomic, strong) UILabel *bussPhoneLb;//商家电话
@property (nonatomic, strong) UIView *shortLineView;//短线

@property (nonatomic, strong) UIImageView *bussPhoneIv;//商家电话图标
@property (nonatomic, strong) UIView *secondSingleLineView;//第二个切割

@property (nonatomic, strong) UIView *commentView;//评论入口

@property (nonatomic, strong) UILabel *commentActionTitleLb;//给商家点评

@property (nonatomic, strong) UIImageView *commentRightIV;//右侧箭头






@property (nonatomic, strong) BMKMapView *mapView;//地图

@property (nonatomic, strong) UITableView *jugeTableView;//评论列表
@property (nonatomic, strong) NSMutableArray *commentData;//评论数据

//@property (nonatomic, strong) TravelCommentView *commentView;//评论组件

@property (nonatomic, strong) SurroundingAreaBussDetailModel *model;



@end

static NSString *const jugeCell = @"cell";

//标识符
static NSString *const annotationViewID = @"testMark";

@implementation SurroundingAreaItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.bannerScr];
    [self.contentView addSubview:self.bussNameLb];
    [self.contentView addSubview:self.starView];
    [self.contentView addSubview:self.firstSingleLineView];
    [self.contentView addSubview:self.bussPhoneLb];
    [self.contentView addSubview:self.shortLineView];
    [self.contentView addSubview:self.bussPhoneIv];
    [self.contentView addSubview:self.commentView];
    [self.contentView addSubview:self.secondSingleLineView];
    [self.contentView addSubview:self.mapView];
    [self.contentView addSubview:self.jugeTableView];
    
//    [self.view addSubview:self.commentView];
    _commentData = [NSMutableArray array];
    [YSSCNotificationCenter addObserver:self selector:@selector(loadInfo) name:@"surroundingCommentListUpdate" object:nil];
    [self loadInfo];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    
    self.mapView.delegate = self;
    
    self.favoriteView.sd_layout
    .centerYIs(42)
    .rightSpaceToView(self.topView, 40)
    .widthIs(40)
    .heightEqualToWidth();
    
    self.favoriteBtn.sd_layout
    .centerYIs(21)
    .centerXEqualToView(self.favoriteView)
    .widthIs(20)
    .heightIs(18);
    
    
    self.contentView.sd_layout
    .widthRatioToView(self.view, 1)
    .leftSpaceToView(self.view, 0)
    .topSpaceToView(self.topView, 0)
    .bottomSpaceToView(self.view, 0);
    
    self.bannerScr.sd_layout
    .widthRatioToView(self.contentView, 1)
    .heightIs(200)
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, 0);
    
    self.bussNameLb.sd_layout
    .topSpaceToView(self.bannerScr, 8.75)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.bussNameLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.starView.sd_layout
    .topSpaceToView(self.bussNameLb, 20)
    .leftEqualToView(self.bussNameLb)
    .heightIs(12);
    
    self.firstSingleLineView.sd_layout
    .topSpaceToView(self.starView, 12)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(0.5);
    
    self.bussPhoneLb.sd_layout
    .topSpaceToView(self.firstSingleLineView, 15)
    .leftEqualToView(self.bussNameLb)
    .autoHeightRatio(0);
    [self.bussPhoneLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.bussPhoneIv.sd_layout
    .topEqualToView(self.bussPhoneLb)
    .rightSpaceToView(self.contentView, 15)
    .widthIs(20)
    .heightEqualToWidth();
    
    self.shortLineView.sd_layout
    .topSpaceToView(self.firstSingleLineView, 10)
    .rightSpaceToView(self.bussPhoneIv, 13)
    .heightIs(25)
    .widthIs(0.5);
    
    self.secondSingleLineView.sd_layout
    .topSpaceToView(self.firstSingleLineView, 45)
    .leftEqualToView(self.firstSingleLineView)
    .rightEqualToView(self.firstSingleLineView)
    .heightIs(0.5);

    self.commentView.sd_layout
    .topSpaceToView(self.secondSingleLineView, 0)
    .leftEqualToView(self.firstSingleLineView)
    .rightEqualToView(self.firstSingleLineView)
    .heightIs(45);
    
    self.commentActionTitleLb.sd_layout
    .centerYEqualToView(self.commentView)
    .leftSpaceToView(self.commentView, 15)
    .autoHeightRatio(0);
    [self.commentActionTitleLb setSingleLineAutoResizeWithMaxWidth:400];
    
    self.commentRightIV.sd_layout
    .centerYEqualToView(self.commentView)
    .rightSpaceToView(self.commentView, 15)
    .heightIs(15)
    .widthIs(8);

    self.mapView.sd_layout
    .topSpaceToView(self.commentView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(200);
    
    self.jugeTableView.sd_layout
    .topSpaceToView(self.mapView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs([self.jugeTableView cellsTotalHeight] + 90);
    
    
    [self.contentView setupAutoContentSizeWithBottomView:_jugeTableView bottomMargin:0];






}

- (void)viewWillDisappear:(BOOL)animated{
    self.mapView.delegate = nil;
}

- (void)dealloc{
    [YSSCNotificationCenter removeObserver:self];
}

#pragma mark ----------------数据请求

- (void)loadInfo{
    [SVProgressHUD showWithStatus:@"正在请求商家详情"];
    YSSCWeakObj(self);
    [YSSCShareBusinessManager.arroundAreaManager getArroundingAreaBussDetailWithParameter:@{@"businessId":_Id} success:^(id responObject) {
        [SVProgressHUD dismiss];
        SurroundingAreaBussDetailModel *model = (SurroundingAreaBussDetailModel *)responObject;
        _model = model;
        [weakself updateUIWithInfo];//刷新界面
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:@"网络连接失败"];
    }];

}

- (void)updateUIWithInfo{
    [_bannerScr setImageURLStringsGroup:_model.picUrls];
    _bussNameLb.text = _model.name;
    [_starView updateInfoWith:_model.avgScore.integerValue];
    _bussPhoneLb.text = [NSString stringWithFormat:@"商家电话: %@", _model.phone];
    BMKPointAnnotation *ano = [[BMKPointAnnotation alloc] init];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = _model.latitude.floatValue;
    coordinate.longitude = _model.longtitude.floatValue;
    ano.coordinate = coordinate;
    [self.mapView addAnnotation:ano];
    [self.mapView setCenterCoordinate:coordinate animated:YES];
    
    [_commentData removeAllObjects];
    for (NSInteger i = 0; i < _model.commentList.count; i++) {
        if (i <= 4 ) {
            SurroundingAreaBussDetailCommentItemModel *itemModel = _model.commentList[i];
            [_commentData addObject:itemModel];
        }else{
            break;
        }
    }
    [_jugeTableView reloadData];
    _jugeTableView.sd_layout
    .heightIs([self.jugeTableView cellsTotalHeight] + 90);
    
    _favoriteBtn.selected = _model.flag;
    
}

#pragma mark ----------------Top点击事件
//收藏
- (void)surroundAreaFavoriteAction{
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return;
    }
    
    if (!_Id) {
        [SVProgressHUD showErrorWithStatus:@"信息错误"];
        return;
    }
    [SVProgressHUD showWithStatus:@"发送中"];
    _favoriteBtn.selected = !_favoriteBtn.isSelected;
    [YSSCShareBusinessManager.travelManager getFavoriteTravelWithParameters:@{@"linkId":_Id,
                                                                              @"collectType":@80}
                                                                    success:^(id responObject) {
                                                                        [SVProgressHUD showSuccessWithStatus:responObject];
                                                                    } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                        [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                    }];

}
//分享
- (void)surroundAreaEditAction{
    [YSSCShareBusinessManager.travelManager shareWithParameters:nil target:self];
}

//联系商户
- (void)surroundAreaConnectBussPhone{
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",_model.phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

}

#pragma mark ----------------进入点评界面

- (void)intoPushComment{
    
    BOOL ret =[YSSCShareBusinessManager.loginManger isLogin];
    if (!ret) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return;
    }
    
    
    CommonPushCommentViewController *commentVc = [[CommonPushCommentViewController alloc] init];
    commentVc.shopId = _Id;
    [self.navigationController pushViewController:commentVc animated:YES];
}


#pragma mark ----------------banner轮播点击回调

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{

}


#pragma mark ----------------mapViewDelegate

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewID];
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewID];
        ((BMKPinAnnotationView *)annotationView).pinColor = BMKPinAnnotationColorPurple;
        ((BMKPinAnnotationView *)annotationView).animatesDrop = NO;
        BMKPointAnnotation *ano = (BMKPointAnnotation *)annotation;
        ano.title = _model.name;
        
    }
    
    annotationView.canShowCallout = NO;
    annotationView.draggable = NO;
    annotationView.enabled = YES;
    return annotationView;


}


#pragma mark ----------------跳转评价列表界面

- (void)changeToJugeList{
    
    SurroundingAreaCommentListViewController *commentList = [[SurroundingAreaCommentListViewController alloc] init];
    commentList.data = [NSMutableArray arrayWithArray:_model.commentList];
    commentList.score = _model.avgScore;
    [self.navigationController pushViewController:commentList animated:YES];
    
}


#pragma mark ----------------TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _commentData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SurroundingAreaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:jugeCell];
    SurroundingAreaBussDetailCommentItemModel *itemModel = _commentData[indexPath.row];
    cell.model = itemModel;
    return cell;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = GRAYCOLOR;
    [headView addSubview:lineView];
    
    UILabel *headLb = [[UILabel alloc] init];
    headLb.font = FONT(14);
    headLb.textColor = LIGHTTEXTCOLOR;
    headLb.text = [NSString stringWithFormat:@"评价(%ld)", _model.commentList.count];
    [headView addSubview:headLb];
    headLb.sd_layout
    .centerYEqualToView(headView)
    .leftSpaceToView(headView, 15)
    .autoHeightRatio(0);
    [headLb setSingleLineAutoResizeWithMaxWidth:200];
    
    UIImageView *rightIv = [[UIImageView alloc] init];
    rightIv.image = IMAGE(@"classify141");
    [headView addSubview:rightIv];
    rightIv.sd_layout
    .centerYEqualToView(headView)
    .rightSpaceToView(headView, 10)
    .heightIs(15)
    .widthIs(8);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeToJugeList)];
    [headView addGestureRecognizer:tap];

    return headView;
    

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = GRAYCOLOR;
    [footerView addSubview:lineView];
    UIButton *footerBtn = [[UIButton alloc] init];
    [footerBtn setTitleColor:MALLColor forState:UIControlStateNormal];
    [footerBtn setTitle:@"查看更多网友点评" forState:UIControlStateNormal];
    [footerBtn addTarget:self action:@selector(changeToJugeList) forControlEvents:UIControlEventTouchUpInside];
    footerBtn.titleLabel.font = FONT(14);
    [footerView addSubview:footerBtn];
    footerBtn.sd_layout
    .centerXEqualToView(footerView)
    .centerYEqualToView(footerView)
    .heightIs(14);
    [footerBtn setupAutoSizeWithHorizontalPadding:0 buttonHeight:14];
    
    UIImageView *moreIv = [[UIImageView alloc] initWithImage:IMAGE(@"classify61")];
    [footerView addSubview:moreIv];
    moreIv.sd_layout
    .centerYEqualToView(footerView)
    .leftSpaceToView(footerBtn, 7)
    .widthIs(15)
    .heightIs(10);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeToJugeList)];
    [footerView addGestureRecognizer:tap];
    
    return footerView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SurroundingAreaBussDetailCommentItemModel *itemModel = _commentData[indexPath.row];

    return [self.jugeTableView cellHeightForIndexPath:indexPath model:itemModel keyPath:@"model" cellClass:[SurroundingAreaTableViewCell class] contentViewWidth:SCREEN_WIDTH];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 45;
}


#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        YSSCWeakObj(self);
        _topView.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        [_topView setTitleText:@"商户详情" imageArrays:@[IMAGE(@"classify64")] selecterArys:@[@"surroundAreaEditAction"] target:self isShowLeftBtn:YES];
        [_topView addSubview:self.favoriteView];
    }
    return _topView;
}

- (UIView *)favoriteView{
    if (_favoriteView == nil) {
        _favoriteView = [[UIView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(surroundAreaFavoriteAction)];
        [_favoriteView addGestureRecognizer:tap];
        [_favoriteView addSubview:self.favoriteBtn];
    }
    return _favoriteView;
}
- (UIButton *)favoriteBtn{
    if (_favoriteBtn == nil) {
        _favoriteBtn = [[UIButton alloc] init];
        [_favoriteBtn setBackgroundImage:IMAGE(@"classify63") forState:UIControlStateSelected];
        [_favoriteBtn setBackgroundImage:IMAGE(@"classify94") forState:UIControlStateNormal];
        [_favoriteBtn addTarget:self action:@selector(surroundAreaFavoriteAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _favoriteBtn;

}

- (UIScrollView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIScrollView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

- (SDCycleScrollView *)bannerScr{
    if (_bannerScr == nil) {
        _bannerScr = [[SDCycleScrollView alloc] init];
        _bannerScr.delegate = self;
        _bannerScr.imageURLStringsGroup = nil;
        _bannerScr.placeholderImage = PlaceholderImage;
    }
    return _bannerScr;
}

- (UILabel *)bussNameLb{
    if (_bussNameLb == nil) {
        _bussNameLb = [[UILabel alloc] init];
        _bussNameLb.font = FONT(17);
        _bussNameLb.textColor = BLACKTEXTCOLOR;
        _bussNameLb.text = @"哈里欧咖啡";
    }
    return _bussNameLb;
}

- (MallJugeStarView *)starView{
    if (_starView == nil) {
        _starView = [[MallJugeStarView alloc] init];
    }
    return _starView;
}

- (UIView *)firstSingleLineView{
    if (_firstSingleLineView == nil) {
        _firstSingleLineView = [[UIView alloc] init];
        _firstSingleLineView.backgroundColor = GRAYCOLOR;
    }
    return _firstSingleLineView;
}

- (UIImageView *)bussPhoneIv{
    if (_bussPhoneIv == nil) {
        _bussPhoneIv = [[UIImageView alloc] initWithImage:IMAGE(@"classify85")];
        _bussPhoneIv.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(surroundAreaConnectBussPhone)];
        [_bussPhoneIv addGestureRecognizer:tap];
    }
    return _bussPhoneIv;
}

- (UIView *)shortLineView{
    if (_shortLineView == nil) {
        _shortLineView = [[UIView alloc] init];
        _shortLineView.backgroundColor = GRAYCOLOR;
    }
    return _shortLineView;
}

- (UILabel *)bussPhoneLb{
    if (_bussPhoneLb == nil) {
        _bussPhoneLb = [[UILabel alloc] init];
        _bussPhoneLb.font = FONT(14);
        _bussPhoneLb.textColor = BLACKTEXTCOLOR;
        _bussPhoneLb.text = @"商家电话: 0575-25845698";
    }
    return _bussPhoneLb;
}

- (BMKMapView *)mapView{
    if (_mapView == nil) {
        _mapView = [[BMKMapView alloc] init];
        _mapView.userTrackingMode = BMKUserTrackingModeFollow;
        _mapView.zoomLevel = 21;//地图比例尺等级。3-21.范围越小
        [_mapView setMapType:BMKMapTypeStandard];//设置地图类型
        _mapView.scrollEnabled = NO;
    }
    return _mapView;
}

- (UITableView *)jugeTableView{
    if (_jugeTableView == nil) {
        _jugeTableView = [[UITableView alloc] init];
        _jugeTableView.delegate = self;
        _jugeTableView.dataSource = self;
        _jugeTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _jugeTableView.separatorColor = GRAYCOLOR;
        _jugeTableView.backgroundColor = WHITECOLOR;
        [_jugeTableView registerClass:[SurroundingAreaTableViewCell class] forCellReuseIdentifier:jugeCell];
    }
    return _jugeTableView;
    


}

- (UIView *)commentView{
    if (_commentView == nil) {
        _commentView = [[UIView alloc] init];
        _commentView.backgroundColor = WHITECOLOR;
        [_commentView addSubview:self.commentActionTitleLb];//点评
        [_commentView addSubview:self.commentRightIV];//右侧箭头
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(intoPushComment)];
        [_commentView addGestureRecognizer:tap];
    }
    return _commentView;

}

- (UIView *)secondSingleLineView{
    if (_secondSingleLineView == nil) {
        _secondSingleLineView = [[UIView alloc] init];
        _secondSingleLineView.backgroundColor = GRAYCOLOR;
    }
    return _secondSingleLineView;
}

- (UILabel *)commentActionTitleLb{
    if (_commentActionTitleLb == nil) {
        _commentActionTitleLb = [[UILabel alloc] init];
        _commentActionTitleLb.font = FONT(14);
        _commentActionTitleLb.textColor = MALLColor;
        _commentActionTitleLb.text = @"给商家点评";
    }
    return _commentActionTitleLb;
}

- (UIImageView *)commentRightIV{
    if (_commentRightIV == nil) {
        _commentRightIV = [[UIImageView alloc] init];
        _commentRightIV.image  = IMAGE(@"classify141");
    }
    return _commentRightIV;
}

@end
