//
//  HotelDetailDateView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelDetailDateView.h"
#import "NSDate+Formater.h"

@interface HotelDetailDateView ()

//今天日期
@property (nonatomic, strong) UILabel *dayLabel;
//月份
@property (nonatomic, strong) UILabel *monthLabel;
//星期
@property (nonatomic, strong) UILabel *weekLabel;

/**数字转汉字*/
@property (nonatomic, strong) NSDictionary *changeDict;


@end

@implementation HotelDetailDateView

#pragma mark --------- 懒加载

- (UILabel *)dayLabel{
    if (_dayLabel == nil) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.font = FONT(18);
        _dayLabel.textColor = ORANGE_COLOR;
    }
    return _dayLabel;
}

- (UILabel *)monthLabel{
    if (_monthLabel == nil) {
        _monthLabel = [[UILabel alloc] init];
        _monthLabel.font = FONT(10);
        _monthLabel.textColor = SHENTEXTCOLOR;
    }
    return _monthLabel;
}

- (UILabel *)weekLabel{
    if (_weekLabel == nil) {
        _weekLabel = [[UILabel alloc] init];
        _weekLabel.font = FONT(10);
        _weekLabel.textColor = SHENTEXTCOLOR;
    }
    return _weekLabel;
}

- (NSDictionary *)changeDict{
    if (_changeDict == nil) {
        _changeDict = @{@"1":@"礼拜一",@"2":@"礼拜二",@"3":@"礼拜三",@"4":@"礼拜四",@"5":@"礼拜五",@"6":@"礼拜六",@"7":@"礼拜日"};
    }
    return _changeDict;
}

#pragma mark --------- 生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.dayLabel];
        [self addSubview:self.weekLabel];
        [self addSubview:self.monthLabel];

    }
    return self;
}

- (void)setdate:(NSDate *)date{
    
    self.dayLabel.text = [NSString stringWithFormat:@"%ld",[NSDate day:date]];
    self.monthLabel.text = [NSString stringWithFormat:@"%ld月",[NSDate month:date]];
    self.weekLabel.text = [NSDate weekdayStringFromDate:date];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.dayLabel.sd_layout
    .topSpaceToView(self, 5)
    .leftEqualToView(self)
    .bottomSpaceToView(self, 5);
    [self.dayLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.monthLabel.sd_layout
    .topEqualToView(self)
    .leftSpaceToView(self.dayLabel, 10)
    .autoHeightRatio(0);
    [self.monthLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.weekLabel.sd_layout
    .bottomEqualToView(self)
    .leftSpaceToView(self.dayLabel, 10)
    .autoHeightRatio(0);
    [self.weekLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    [self setupAutoWidthWithRightView:self.weekLabel rightMargin:0];
    [self setupAutoHeightWithBottomView:self.weekLabel bottomMargin:0];
}

@end
