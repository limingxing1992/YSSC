//
//  UserOrderHotelCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderHotelCell.h"
#import "UserHotelOrderObject.h"

@interface UserOrderHotelCell ()

/**图片*/
@property (nonatomic, strong) UIImageView *icon;
/**名称*/
@property (nonatomic, strong) UILabel *nameLabel;
/**入住时间*/
@property (nonatomic, strong) UILabel *checkInTimeLabel;
/**退房时间*/
@property (nonatomic, strong) UILabel *checkOutTimeLabel;


@end

@implementation UserOrderHotelCell

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = GRAYCOLOR;
    }
    return _icon;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT(14);
        _nameLabel.textColor = SHENTEXTCOLOR;

    }
    return _nameLabel;
}

- (UILabel *)checkInTimeLabel{
    if (_checkInTimeLabel == nil) {
        _checkInTimeLabel = [[UILabel alloc] init];
        _checkInTimeLabel.font = FONT(12);
        _checkInTimeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _checkInTimeLabel;
}

- (UILabel *)checkOutTimeLabel{
    if (_checkOutTimeLabel == nil) {
        _checkOutTimeLabel = [[UILabel alloc] init];
        _checkOutTimeLabel.font = FONT(12);
        _checkOutTimeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _checkOutTimeLabel;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.checkInTimeLabel];
    [self.contentView addSubview:self.checkOutTimeLabel];
    
    self.icon.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10)
    .widthIs(70)
    .heightIs(70);
    
    self.nameLabel.sd_layout
    .leftSpaceToView(self.icon, 13)
    .topEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.nameLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.checkInTimeLabel.sd_layout
    .leftSpaceToView(self.icon, 13)
    .centerYEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.checkInTimeLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.checkOutTimeLabel.sd_layout
    .leftSpaceToView(self.icon, 13)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.checkOutTimeLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    [self setupAutoHeightWithBottomView:self.icon bottomMargin:10];
}

#pragma mark --------- 更新数据


- (void)setModel:(UserHotelOrderDataObject *)model{
    _model = model;
    self.nameLabel.text = _model.hotel_name;
    self.checkInTimeLabel.text = [NSString stringWithFormat:@"入住时间：%@",_model.come_time];
    self.checkOutTimeLabel.text = [NSString stringWithFormat:@"退房时间：%@",_model.leave_time];
    [self.icon sd_setImageWithURL:_model.pic placeholderImage:IMAGE(@"placeholder_loading")];
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
