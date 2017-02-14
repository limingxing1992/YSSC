//
//  CityPickerHotCityCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HotelHotCityObject;

@interface CityPickerHotCityCell : UITableViewCell

@property (nonatomic,copy) void (^buttonClickBlock)(UIButton *);

- (instancetype)initWithModel:(HotelHotCityObject *)model reuseIdentifier:(NSString *)reuseIdentifier;

- (void)buttonWhenClick:(void(^)(UIButton *button))block;



/**model*/
@property (nonatomic, strong) HotelHotCityObject *model;

@end
