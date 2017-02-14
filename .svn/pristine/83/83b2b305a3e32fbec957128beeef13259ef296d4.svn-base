//
//  CityPickerHotCityCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "CityPickerHotCityCell.h"
#import "HotelHotCityObject.h"

@implementation CityPickerHotCityCell


#define BUTTON_WIDTH (SCREEN_WIDTH - 125) / 4
#define BUTTON_HEIGHT 30



- (instancetype)initWithModel:(HotelHotCityObject *)model reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.model = model;
    }
    return self;
}

#pragma mark - Event Response
- (void)buttonClick:(UIButton*)button{
    
    if (self.buttonClickBlock) {
        
        self.buttonClickBlock(button);
    }
}

- (void)buttonWhenClick:(void (^)(UIButton *))block{
    self.buttonClickBlock = block;
}

#pragma mark - init

- (void)setModel:(HotelHotCityObject *)model{
    _model = model;
    NSMutableArray *cityArr = [NSMutableArray array];
    for (HotelHotCityDataObject *city in _model.data) {
        [cityArr addObject:city.aname];
        NSLog(@"%@",city.aname);
    }
    for (int i = 0; i < [cityArr count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(15 + (i % 4) * (BUTTON_WIDTH + 25), 8 + (i / 4) * (8 + BUTTON_HEIGHT), BUTTON_WIDTH, BUTTON_HEIGHT);
        [button setTitle:cityArr[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12.0];
        HotelHotCityDataObject *cityObject = _model.data[i];
        button.tag = cityObject.areaId.integerValue;
        
        [button setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        button.backgroundColor = BACKGROUNDCOLOR;
        button.layer.borderColor = GRAYCOLOR.CGColor;
        button.layer.borderWidth = 1;
        button.alpha = 0.8;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
    }
    
}



@end
