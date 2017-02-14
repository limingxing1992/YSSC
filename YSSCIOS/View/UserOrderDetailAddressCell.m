//
//  UserOrderDetailAddressCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderDetailAddressCell.h"
#import "UserGoodsOrderDetailObject.h"

@interface UserOrderDetailAddressCell ()

/**图*/
@property (nonatomic, strong) UIImageView * icon;
/**用户名*/
@property (nonatomic, strong) UILabel *nameLabel;
/**电话号*/
@property (nonatomic, strong) UILabel *phoneNumber;
/**地址*/
@property (nonatomic, strong) UILabel *addressLabel;

@end

@implementation UserOrderDetailAddressCell

-(UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] initWithImage:IMAGE(@"classify132")];
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

- (UILabel *)phoneNumber{
    if (_phoneNumber == nil) {
        _phoneNumber = [[UILabel alloc] init];
        _phoneNumber.font = FONT(14);
        _phoneNumber.textColor = SHENTEXTCOLOR;
    }
    return _phoneNumber;
}
- (UILabel *)addressLabel{
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = FONT(12);
        _addressLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _addressLabel;
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
    [self.contentView addSubview:self.phoneNumber];
    [self.contentView addSubview:self.addressLabel];
    
    self.icon.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.contentView)
    .widthIs(20)
    .heightIs(25);
    
    self.nameLabel.sd_layout
    .leftSpaceToView(self.icon, 10)
    .topSpaceToView(self.contentView, 17)
    .autoHeightRatio(0);
    [self.nameLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.phoneNumber.sd_layout
    .leftSpaceToView(self.nameLabel, 20)
    .topEqualToView(self.nameLabel)
    .autoHeightRatio(0);
    [self.phoneNumber setSingleLineAutoResizeWithMaxWidth:200];
    
    self.addressLabel.sd_layout
    .leftEqualToView(self.nameLabel)
    .topSpaceToView(self.nameLabel, 11.5)
    .autoHeightRatio(0);
    [self.addressLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH - 60)];
    [self setupAutoHeightWithBottomView:self.addressLabel bottomMargin:16.5];

}

- (void)setModel:(UserGoodsOrderDetailObject *)model{
    _model = model;
    
    self.nameLabel.text = _model.data.name;
    self.phoneNumber.text = _model.data.cellphone;
    self.addressLabel.text = _model.data.order_address;
    
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
