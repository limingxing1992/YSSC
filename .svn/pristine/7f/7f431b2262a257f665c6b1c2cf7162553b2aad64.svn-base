//
//  HotelMapCell.m
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelMapCell.h"
#import <MapKit/MapKit.h>
#import "HotelDetailObject.h"


@interface HotelMapCell ()

<
BMKMapViewDelegate

>

@property (nonatomic, strong) BMKMapManager *mapManager;//百度引擎
@property (nonatomic, strong) BMKMapView *mapView;//基础地图
@property (nonatomic, strong) BMKLocationService *locService;//定位工具类

/**地理位置*/
@property (nonatomic, strong) UILabel *locTitle;
/**详细位置*/
@property (nonatomic, strong) UIView *locView;
/**位置左边*/
@property (nonatomic, strong) UILabel *leftTitle;
/**位置右边*/
@property (nonatomic, strong) UILabel *rightTitle;
/**酒店名字*/
@property (nonatomic, strong) UILabel *nameLabel;


@end

@implementation HotelMapCell

#pragma mark --------懒加载
- (BMKMapManager *)mapManager{
    if (_mapManager == nil) {
        _mapManager = [[BMKMapManager alloc] init];
        
    }
    return _mapManager;
}

- (BMKMapView *)mapView{
    if (_mapView == nil) {
        _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, 200)];
        _mapView.userTrackingMode = BMKUserTrackingModeFollow;
        _mapView.showsUserLocation = YES;
        _mapView.zoomLevel = 21;//地图比例尺等级。3-21.范围越小
    }
    return _mapView;
    
}


- (UILabel *)locTitle{
    if (_locTitle == nil) {
        _locTitle = [[UILabel alloc] init];
        _locTitle.font = FONT(14);
        _locTitle.textColor = SHENTEXTCOLOR;
        _locTitle.text = @"地理位置";
        
    }
    return _locTitle;
}

- (UIView *)locView{
    if (_locView == nil) {
        _locView = [[UIView alloc] init];
        _locView.layer.cornerRadius = 2.5;
        _locView.backgroundColor = [UIColor whiteColor];
    }
    return _locView;
}

- (UILabel *)leftTitle{
    if (_leftTitle == nil) {
        _leftTitle = [[UILabel alloc] init];
        _leftTitle.font = FONT(12);
        _leftTitle.textColor = LIGHTTEXTCOLOR;
    }
    return _leftTitle;
}

- (UILabel *)rightTitle{
    if (_rightTitle == nil) {
        _rightTitle = [[UILabel alloc] init];
        _rightTitle.font = FONT(12);
        _rightTitle.textColor = YSSCRGBColor(255, 123, 0);
        _rightTitle.text = @"游周边";
        _rightTitle.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(travelAround)];
        [_rightTitle addGestureRecognizer:tap];
    }
    return _rightTitle;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT(12);
        _nameLabel.textColor = SHENTEXTCOLOR;
    }
    return _nameLabel;
}

- (void)setModel:(HotelDetailDataObject *)model{
    _model = model;
    BMKCoordinateRegion region ;//表示范围的结构体
    CLLocationCoordinate2D coordinate; //设定经纬度
    coordinate.latitude = model.latitude.doubleValue; //纬度
    coordinate.longitude = model.longitude.doubleValue; //经度
    //    NSLog(@"%f",coordinate.longitude);
    
    //    //测试
    //    coordinate.latitude = 39.9129460000; //纬度
    //    coordinate.longitude = 116.4029750000; //经度
    //    coordinate.latitude = 30.2934060000;
    //    coordinate.longitude = 120.2181960000;
    region.center = coordinate;//中心点
    region.span.latitudeDelta = 0.05;//经度范围（设置为0.1表示显示范围为0.2的纬度范围）
    region.span.longitudeDelta = 0.05;//纬度范围
    [_mapView setRegion:region animated:YES];
    
    
    
    BMKPointAnnotation *item = [[BMKPointAnnotation alloc] init];
    item.coordinate = coordinate;
    
    item.title = _model.hotel_name;
    [self.mapView addAnnotation:item];
    [self.mapView showAnnotations:@[item] animated:YES];
    
    self.leftTitle.text = _model.address;
    
    
    
    //    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    //    CLLocation *loc = [[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    //
    //
    //    [geoCoder reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
    //
    //        CLPlacemark *place = placemarks.lastObject;
    //        if (place.locality == nil) {
    //            self.leftTitle.text = @"";
    //        }else{
    //           self.leftTitle.text = [NSString stringWithFormat:@"%@ %@ %@",place.locality,place.subLocality,place.thoroughfare];
    //        }
    //
    //    }];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
        
    }
    return  self;
}

- (void)setupUI{
    
    self.mapView.delegate = self;
    
    
    //需要加到最后面
    [self.contentView addSubview:self.mapView];
    [self.contentView addSubview:self.locTitle];
    [self.contentView addSubview:self.locView];
    [self.locView addSubview:self.leftTitle];
    [self.locView addSubview:self.rightTitle];
    
    self.locTitle.sd_layout
    .topSpaceToView(self.contentView, 15)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.locTitle setSingleLineAutoResizeWithMaxWidth:300];
    
    self.mapView.sd_layout
    .topSpaceToView(self.contentView, 45)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(222);
    
    
    self.locView.sd_layout
    .topSpaceToView(self.contentView, 217)
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(31);
    
    self.leftTitle.sd_layout
    .leftSpaceToView(self.locView, 15)
    .centerYEqualToView(self.locView)
    .autoHeightRatio(0);
    [self.leftTitle setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH - 100];
    
    self.rightTitle.sd_layout
    .rightSpaceToView(self.locView,15)
    .centerYEqualToView(self.locView)
    .autoHeightRatio(0);
    [self.rightTitle setSingleLineAutoResizeWithMaxWidth:300];
    [self setupAutoHeightWithBottomView:self.mapView bottomMargin:0];

}


#pragma mark - 跳转到周边页面

- (void)travelAround{
    if (_buttonClickBlock) {
        _buttonClickBlock([UIButton new]);
    }
}

- (void)buttonDidClick:(ButtonClickBlock)block{
    _buttonClickBlock = block;
}

#pragma mark - mapDelegate

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
        ((BMKPinAnnotationView *)annotationView).pinColor = BMKPinAnnotationColorPurple;
        ((BMKPinAnnotationView *)annotationView).animatesDrop = YES;
    }
    annotationView.image = IMAGE(@"hotel_detail_anno");
    annotationView.size = CGSizeMake(19, 30);
    annotationView.annotation = annotation;
    annotationView.canShowCallout = YES;
    annotationView.draggable = NO;

    return annotationView;
    
}

- (void)didFailToLocateUserWithError:(NSError *)error{
    NSLog(@"location error == %@",error);
}




@end
