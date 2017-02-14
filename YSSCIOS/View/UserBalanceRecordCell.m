//
//  UserBalanceRecordCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//  消费明细

#import "UserBalanceRecordCell.h"
#import "UserBalanceObject.h"

@interface UserBalanceRecordCell ()

/**消费项目*/
@property (nonatomic, strong) UILabel *titleLabel;
/**消费时间*/
@property (nonatomic, strong) UILabel *timeLabel;
/**消费钱数*/
@property (nonatomic, strong) UILabel *moneyLabel;

@end

@implementation UserBalanceRecordCell

#pragma mark --------- 懒加载

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT(14);
        _titleLabel.textColor = SHENTEXTCOLOR;
    }
    return _titleLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = FONT(14);
        _timeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _timeLabel;
}

- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = FONT(14);
    }
    return _moneyLabel;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    [self.titleLabel setMaxNumberOfLinesToShow:1];
    
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH - 90];
    
    self.timeLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .bottomSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.moneyLabel.sd_layout
    .rightSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.contentView)
    .autoHeightRatio(0);
    [self.moneyLabel setSingleLineAutoResizeWithMaxWidth:300];
    
}

- (void)setTitle:(NSString *)title time:(NSString *)time money:(CGFloat)money{
    self.titleLabel.text = title;
    self.timeLabel.text = time;
    if (money > 0) {
        self.moneyLabel.textColor = YSSCRGBColor(252, 85, 32);
        self.moneyLabel.text = [NSString stringWithFormat:@"%.2f",money];
    }else{
        self.moneyLabel.textColor = MALLColor;
        self.moneyLabel.text = [NSString stringWithFormat:@"%.2f",money];
    }
}

- (void)setModel:(UserBalanceDataDetailObject *)model{
    _model = model;
    if (_model.good_name.length > 0) {
        self.titleLabel.text = _model.good_name;
    }else{
        self.titleLabel.text = _model.room_name;
    }
    
    self.timeLabel.text = _model.create_time;
    if (_model.type.integerValue == 10 || _model.type.integerValue == 50 || _model.type.integerValue == 20 || _model.type.integerValue == 60) {//如果是充值，返润，退款,红包
        self.moneyLabel.textColor = YSSCRGBColor(252, 85, 32);
        self.moneyLabel.text = [NSString stringWithFormat:@"+%@",_model.amount];
    }else{
        self.moneyLabel.textColor = MALLColor;
        self.moneyLabel.text = [NSString stringWithFormat:@"-%@",_model.amount];
    }
    
    if (_model.type.integerValue == 60) {
        self.titleLabel.text = @"红包";
    }
    
    if (_model.type.integerValue == 70) {
        self.titleLabel.text = @"提现";
    }
    
    if (_model.type.integerValue == 10) {
        self.titleLabel.text = @"充值";
    }
}

#pragma mark --------- cell增加分割线

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 0.5;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}

@end
