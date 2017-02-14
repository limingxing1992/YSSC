//
//  UserOrderDetailMailCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//快递信息

#import "UserOrderDetailMailCell.h"
#import "UserGoodsOrderDetailObject.h"

@interface UserOrderDetailMailCell ()

/**订单编号*/
@property (nonatomic, strong) UILabel *mailNumLabel;
/**下单时间*/
@property (nonatomic, strong) UILabel *timeLabel;
/**配送方式*/
@property (nonatomic, strong) UILabel *mailTypeLabel;


@end

@implementation UserOrderDetailMailCell

- (UILabel *)mailNumLabel{
    if (_mailNumLabel == nil) {
        _mailNumLabel = [[UILabel alloc] init];
        _mailNumLabel.font = FONT(14);
        _mailNumLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _mailNumLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = FONT(14);
        _timeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _timeLabel;
}

- (UILabel *)mailTypeLabel{
    if (_mailTypeLabel == nil) {
        _mailTypeLabel = [[UILabel alloc] init];
        _mailTypeLabel.font = FONT(14);
        _mailTypeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _mailTypeLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.mailNumLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.mailTypeLabel];
    
    self.mailNumLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 8)
    .autoHeightRatio(0);
    [self.mailNumLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    
    self.timeLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.mailNumLabel, 11)
    .autoHeightRatio(0);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    
    self.mailTypeLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.timeLabel, 11)
    .autoHeightRatio(0);
    [self.mailTypeLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    [self setupAutoHeightWithBottomView:self.mailTypeLabel bottomMargin:8];
   

    
}
- (void)setModel:(UserGoodsOrderDetailObject *)model{
    _model = model;
    
    self.mailNumLabel.text = [NSString stringWithFormat:@"订单编号：%@",_model.data.order_number];
    self.timeLabel.text = [NSString stringWithFormat:@"下单时间：%@",_model.data.order_time];
    self.mailTypeLabel.text = [NSString stringWithFormat:@"配送方式：%@",_model.data.trans_method];
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
