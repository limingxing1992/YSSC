//
//  SurroundingAreaViewController.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SurroundingAreaViewController.h"

#define MYSELFTAG 100000000
@interface SurroundingAreaViewController ()
<
    BMKMapViewDelegate,
    BMKLocationServiceDelegate,
    BMKPoiSearchDelegate,
    SurroundingAreaHeadViewDelegate
>

@property (nonatomic, strong) SurroundingAreaHeadView *topView;//头部视图
@property (nonatomic, strong) BMKMapView *mapView;//基础地图
@property (nonatomic, strong) BMKLocationService *locService;//定位工具类
@property (nonatomic, strong) BMKPoiSearch *searcher;//检索


@property (nonatomic, strong) SurroundAreaItemView *itemView;//商家名片

@property (nonatomic, strong) NSMutableArray *anns;///annotionviews

@property (nonatomic, strong) NSMutableArray *data;//数据

@property (nonatomic, strong) SurroundingAreaItemModel *mySelfModel;//定位点
@property (nonatomic, strong) YSSCPointAnnotation *myanno;//定位标注

/** 检索数据*/
@property (nonatomic, strong) NSMutableArray *poiAns;
@property (nonatomic, strong) NSMutableArray *poiAry;


//保存定位信息

@property (nonatomic, copy) NSString *longti;//精度

@property (nonatomic, copy) NSString *lanti;//维度

@property (nonatomic, copy) NSNumber *classId;//分类

@property (nonatomic, copy) NSString *distance;//范围//默认2km





@end

//标识符
static NSString *const annotationViewID = @"testMark";


@implementation SurroundingAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.mapView];
    _classId = @0;//初始化默认分类为全部。对应id为0
    _anns = [[NSMutableArray alloc] init];
    _data = [[NSMutableArray alloc] init];
    _poiAns = [[NSMutableArray alloc] init];
    _poiAry = [[NSMutableArray alloc] init];
    
    [_locService startUserLocationService];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = YES;
    self.mapView.delegate = self;
    self.locService.delegate = self;
    self.searcher.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated{
    [self.locService startUserLocationService];
    [YSSCShareBusinessManager.arroundAreaManager getArroundingAreaClassifySuccess:^(id responObject) {
        [_topView updateInfoWith:responObject];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];//请求顶部分类

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.mapView.delegate = nil;
    self.locService.delegate = nil;
    self.searcher.delegate = nil;
}

#pragma mark ----------------检索周边

- (void)poiSearchNearWith:(CLLocationCoordinate2D)location keyWord:(NSString *)keyWord{
    //检索
    BMKNearbySearchOption *option = [[BMKNearbySearchOption alloc]init];
    option.pageIndex = 0;
    option.pageCapacity = 10;
    option.location = location;
    option.keyword = keyWord;
    BOOL flag = [_searcher poiSearchNearBy:option];
    if(flag)
    {
        NSLog(@"周边检索发送成功");
    }
    else
    {
        NSLog(@"周边检索发送失败");
    }

}


#pragma mark ----------------数据请求

- (void)loadinfo{
    
    YSSCWeakObj(self);
    if (!_longti || !_lanti || !_classId) {
        [_locService startUserLocationService];
        return;
    }
    [SVProgressHUD showWithStatus:@"正在搜索周边商家中"];
    NSDictionary *dict = @{@"longtitude":_longti, @"latitude":_lanti, @"distance":_distance, @"classifyId":_classId};
    
    [YSSCShareBusinessManager.arroundAreaManager getArroundingAreaListWithParameters:dict
                                                                             success:^(id responObject) {
                                                                                 //获取到data，进行添加标注操作
                                                                                 [SVProgressHUD dismiss];
                                                                                 [weakself useinfoWithAry:responObject];//处理数据去
                                                                             }
                                                                             failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                                 [SVProgressHUD dismiss];

                                                                             }];
}

- (void)useinfoWithAry:(NSArray *)ary{
    [_mapView removeAnnotations:_anns];
    [self.anns removeAllObjects];
    [self.data removeAllObjects];
    for (NSInteger i = 0; i < ary.count; i++) {
        SurroundingAreaItemModel *model = ary[i];
        [self.data addObject:model];
         CLLocationCoordinate2D coordinate;
        coordinate.latitude = model.latitude.floatValue;
        coordinate.longitude = model.longtitude.floatValue;
//        KYPointAnnotation *an = [[KYPointAnnotation alloc] init];
        YSSCPointAnnotation *annotation = [[YSSCPointAnnotation alloc] init];
        annotation.tag = i;
        annotation.coordinate = coordinate;
        [self.anns addObject:annotation];
    }
    [_mapView addAnnotations:self.anns];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = _lanti.floatValue;
    coordinate.longitude = _longti.floatValue;
    [_mapView setCenterCoordinate:coordinate animated:YES];
    [_mapView selectAnnotation:_myanno animated:YES];//数据刷新后。默认选中当前定位位置，设置中心店
}

#pragma mark ----------------周边检索结果处理

- (void)onGetPoiResult:(BMKPoiSearch*)searcher result:(BMKPoiResult*)poiResultList errorCode:(BMKSearchErrorCode)error
{
    if (error == BMK_SEARCH_NO_ERROR) {
        //在此处理正常结果
        [self addPoiInfoWithAry:poiResultList.poiInfoList];
    }
    else if (error == BMK_SEARCH_AMBIGUOUS_KEYWORD){
        //当在设置城市未找到结果，但在其他城市找到结果时，回调建议检索城市列表
        // result.cityList;
    } else {
        
    }
}

- (void)addPoiInfoWithAry:(NSArray *)ary{
    
    [_mapView removeAnnotations:_poiAns];
    [_poiAns removeAllObjects];
    [_poiAry removeAllObjects];
    [_poiAry addObjectsFromArray:ary];
    for (NSInteger i = 0 ; i  < ary.count; i++) {
        BMKPoiInfo *itemInfo = ary[i];
        YSSCPointAnnotation *annotation = [[YSSCPointAnnotation alloc] init];
        annotation.tag = i + 10000;
        annotation.coordinate = itemInfo.pt;
        [_poiAns addObject:annotation];
//        NSLog(@"添加一个");
    }
    [_mapView addAnnotations:_poiAns];
    
}

#pragma mark ----------------mapDelegate

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewID];
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewID];
        ((BMKPinAnnotationView *)annotationView).pinColor = BMKPinAnnotationColorPurple;
        ((BMKPinAnnotationView *)annotationView).animatesDrop = NO;
        YSSCPointAnnotation *anotion = (YSSCPointAnnotation *)annotation;
        annotationView.canShowCallout = YES;
        if (anotion.tag == MYSELFTAG) {
            annotationView.image = IMAGE(@"classify87@2x");
            anotion.title = @"我的位置";
        }else if(anotion.tag < 999){
            annotationView.image = IMAGE(@"商铺定位图标");
            anotion.title = @"";//必须实例化title。否则点击事件不会响应
            annotationView.canShowCallout = NO;
        }else if (anotion.tag >= 10000){
            annotationView.image = IMAGE(@"classify4");
            BMKPoiInfo *info = _poiAry[anotion.tag - 10000];
            anotion.title = info.name;
        }
//
    }
    
    annotationView.draggable = NO;
    annotationView.enabled = YES;
    return annotationView;

}


- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{

    YSSCPointAnnotation *anno = (YSSCPointAnnotation *)view.annotation;
    [_mapView setCenterCoordinate:anno.coordinate animated:YES];
    if (anno.tag == MYSELFTAG) {
        if (self.itemView) {
            [self.itemView removeFromSuperview];
        }
    }else if(anno.tag < 999){
        [self.view addSubview:self.itemView];
        self.itemView.sd_layout
        .bottomSpaceToView(self.view, 49 + 12)
        .leftSpaceToView(self.view, 15)
        .rightSpaceToView(self.view, 15)
        .heightIs(100);
        [self.itemView setSd_cornerRadius:@2.5];
        
        SurroundingAreaItemModel *model = _data[anno.tag];
        [self.itemView updateInfoWith:model];
        
    }else if(anno.tag > 9999){
        if (self.itemView) {
            [self.itemView removeFromSuperview];
        }
    }
    
}

- (void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view{
    
}

#pragma mark ----------------locationServiceDelegate

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    [self.mapView updateLocationData:userLocation];
    [self.locService stopUserLocationService];//停止定
    _longti = [NSString stringWithFormat:@"%f",userLocation.location.coordinate.longitude];
    _lanti = [NSString stringWithFormat:@"%f",userLocation.location.coordinate.latitude];
    _distance = @"50000";
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = userLocation.location.coordinate.latitude;
    coordinate.longitude = userLocation.location.coordinate.longitude;
    [self poiSearchNearWith:coordinate keyWord:@"酒店"];//进行周边检索
    _mapView.showsUserLocation = NO;
    if (_myanno) {
        [_mapView removeAnnotation:_myanno];
    }
    _myanno = [[YSSCPointAnnotation alloc] init];
    _myanno.coordinate = userLocation.location.coordinate;
    _myanno.tag = MYSELFTAG;
    [_mapView addAnnotation:_myanno];
    
    
    [self loadinfo];
}

- (void)didFailToLocateUserWithError:(NSError *)error{
    NSLog(@"location error == %@",error);
}


#pragma mark ----------------topDelegate

- (void)selectItemWithID:(NSNumber *)Id name:(NSString *)name{
    _classId = Id;
    [self loadinfo];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = _lanti.floatValue;
    coordinate.longitude = _longti.floatValue;

    if ([name isEqualToString:@"全部"]) {
        [self poiSearchNearWith:coordinate keyWord:@"酒店"];
    }else{
        [self poiSearchNearWith:coordinate keyWord:name];
    }
}




#pragma mark ----------------实例化

- (SurroundingAreaHeadView *)topView{
    if (_topView == nil) {
        _topView = [[SurroundingAreaHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _topView.backgroundColor = WHITECOLOR;
        _topView.delegate = self;
    }
    return _topView;
}

- (BMKMapView *)mapView{
    if (_mapView == nil) {
        _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _mapView.userTrackingMode = BMKUserTrackingModeFollow;
        _mapView.showsUserLocation = YES;
        _mapView.zoomLevel = 20;//地图比例尺等级。3-21.范围越小
        [_mapView setMapType:BMKMapTypeStandard];//设置地图类型
    }
    return _mapView;

}

- (BMKLocationService *)locService{
    if (_locService == nil) {
        _locService = [[BMKLocationService alloc] init];
        _locService.distanceFilter = 100;
        _locService.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return _locService;

}

- (BMKPoiSearch *)searcher{
    if (_searcher == nil) {
        _searcher = [[BMKPoiSearch alloc] init];
    }
    return _searcher;
}

- (SurroundAreaItemView *)itemView{
    if (_itemView == nil) {
        _itemView = [[SurroundAreaItemView alloc] init];
        _itemView.backgroundColor = WHITECOLOR;
        YSSCWeakObj(self);//弱化引用
        _itemView.block = ^(NSString *str){
            SurroundingAreaItemDetailViewController *sudDetailVc = [[SurroundingAreaItemDetailViewController alloc] init];
            sudDetailVc.Id = str;
            [weakself.navigationController pushViewController:sudDetailVc animated:YES];
        };
    }
    return _itemView;
    
}

- (SurroundingAreaItemModel *)mySelfModel{
    if (_mySelfModel == nil) {
        _mySelfModel = [[SurroundingAreaItemModel alloc] init];
    }
    return _mySelfModel;
}


@end
