//
//  CityPickerCurrentCityCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "CityPickerCurrentCityCell.h"

@interface CityPickerCurrentCityCell ()
<
BMKLocationServiceDelegate,
BMKGeoCodeSearchDelegate
>
/**定位*/
@property (nonatomic, strong) BMKLocationService *locService;
/**地理编码*/
@property (nonatomic, strong) BMKGeoCodeSearch *geoSearch;

@property (nonatomic, strong) BMKMapManager *mapManager;

@end

@implementation CityPickerCurrentCityCell

#define BUTTON_WIDTH (SCREEN_WIDTH - 125) / 4
#define BUTTON_HEIGHT 30


- (BMKMapManager *)mapManager{
    if (_mapManager == nil) {
        _mapManager = [[BMKMapManager alloc] init];
    }
    return _mapManager;
}

- (BMKLocationService *)locService{
    if (_locService == nil) {
        _locService = [[BMKLocationService alloc] init];
        _locService.delegate = self;
    }
    return _locService;
    
}

- (BMKGeoCodeSearch *)geoSearch{
    if (_geoSearch == nil) {
        _geoSearch = [[BMKGeoCodeSearch alloc] init];
        _geoSearch.delegate = self;
    }
    return _geoSearch;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.GPSButton];
        [self.contentView addSubview:self.activityIndicatorView];
        [self.contentView addSubview:self.label];
        
        [self.locService startUserLocationService];
        [self.activityIndicatorView startAnimating];
        
    }
    return self;
}



#pragma mark - Event Response
- (void)buttonWhenClick:(void (^)(UIButton *))block{
    self.buttonClickBlock = block;
}

- (void)buttonClick:(UIButton*)button{
    
    if (_buttonClickBlock) {
        self.buttonClickBlock(button);
    }
    
}

#pragma mark - Getter and Setter
- (UIButton*)GPSButton{
    if (_GPSButton == nil) {
        _GPSButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _GPSButton.frame = CGRectMake(15, 6 , 87, 30);
        [_GPSButton setTitle:@"" forState:UIControlStateNormal];
        _GPSButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
        _GPSButton.tintColor = [UIColor blackColor];
        _GPSButton.layer.borderColor = GRAYCOLOR.CGColor;
        _GPSButton.backgroundColor = BACKGROUNDCOLOR;
        _GPSButton.layer.borderWidth = 1;
        [_GPSButton setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_GPSButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _GPSButton;
}

- (UIActivityIndicatorView*)activityIndicatorView{
    if (_activityIndicatorView == nil) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(15, 8, BUTTON_HEIGHT, BUTTON_HEIGHT)];
        _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        _activityIndicatorView.color = [UIColor grayColor];
        _activityIndicatorView.hidesWhenStopped = YES;
    }
    return _activityIndicatorView;
}

- (UILabel*)label{
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(15 + BUTTON_HEIGHT, 8, BUTTON_WIDTH, BUTTON_HEIGHT)];
        _label.text = @"定位中...";
        _label.textColor = BLACKTEXTCOLOR;
        _label.font = [UIFont systemFontOfSize:12.0f];
    }
    return _label;
}

#pragma mark --------- 定位代理

- (void)willStartLocatingUser{
    NSLog(@"begin");
}



- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    //地理编码
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0,0};//初始化
    if (userLocation.location.coordinate.longitude!= 0
        && userLocation.location.coordinate.latitude!= 0) {
        //如果还没有给pt赋值,那就将当前的经纬度赋值给pt
        pt = (CLLocationCoordinate2D){userLocation.location.coordinate.latitude,
            userLocation.location.coordinate.longitude};
    }
    
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:userLocation.location.coordinate.latitude longitude:userLocation.location.coordinate.longitude];
    
    
    [geoCoder reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *place = placemarks.lastObject;

        NSString *cityStr = [place.locality stringByReplacingOccurrencesOfString:@"市" withString:@""];
    
        [self.activityIndicatorView stopAnimating];
        [self.label setHidden:YES];
        [_GPSButton setTitle:cityStr forState:UIControlStateNormal];
        [_GPSButton setHidden:NO];
        NSLog(@"city %@",cityStr);
        
    }];
    
    [self.locService stopUserLocationService];//停止定位
}

@end
