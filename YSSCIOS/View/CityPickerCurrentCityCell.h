//
//  CityPickerCurrentCityCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityPickerCurrentCityCell : UITableViewCell

@property (nonatomic, strong) UIButton *GPSButton;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@property (nonatomic, strong) UILabel *label;

//@property (nonatomic, strong) YSSCLocationManager *locationManager;
//
//@property (nonatomic, strong) YSSCSearchManager *searchManager;

@property (nonatomic, copy) void (^buttonClickBlock)(UIButton *button);

- (void)buttonWhenClick:(void(^)(UIButton *button))block;


@end
