//
//  UserOrderGoodsDetailCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/19.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderGoodsDetailCell.h"
#import "UserGoodsOrderDetailObject.h"

@interface UserOrderGoodsDetailCell ()

/**图片*/
@property (nonatomic, strong) UIImageView *icon;
/**名称*/
@property (nonatomic, strong) UILabel *nameLabel;
/**规格*/
@property (nonatomic, strong) UILabel *goodsTypeLabel;
/**价格*/
@property (nonatomic, strong) UILabel *moneyLabel;
/**购买件数*/
@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation UserOrderGoodsDetailCell

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

- (UILabel *)goodsTypeLabel{
    if (_goodsTypeLabel == nil) {
        _goodsTypeLabel = [[UILabel alloc] init];
        _goodsTypeLabel.font = FONT(12);
        _goodsTypeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _goodsTypeLabel;
}

- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = FONT(12);
        _moneyLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _moneyLabel;
}
- (UILabel *)countLabel{
    if (_countLabel == nil) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.font = FONT(15);
        _countLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _countLabel;
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
    [self.contentView addSubview:self.goodsTypeLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.countLabel];
    
    self.icon.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10)
    .widthIs(70)
    .heightIs(70);
    
    self.nameLabel.sd_layout
    .leftSpaceToView(self.icon, 13)
    .topEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.nameLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH - 130];
    [self.nameLabel setMaxNumberOfLinesToShow:2];
    
    self.goodsTypeLabel.sd_layout
    .leftSpaceToView(self.icon, 13)
    .topSpaceToView(self.nameLabel, 5)
    .autoHeightRatio(0);
    [self.goodsTypeLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.moneyLabel.sd_layout
    .leftSpaceToView(self.icon, 13)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.moneyLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.countLabel.sd_layout
    .rightSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.contentView)
    .autoHeightRatio(0);
    [self.countLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    [self setupAutoHeightWithBottomView:self.icon bottomMargin:10];
}

#pragma mark --------- 更新数据
//- (void)setName:(NSString *)name goodsType:(NSString *)type goodsMoney:(CGFloat)money count:(int)count{
//    self.nameLabel.text = name;
//    self.goodsTypeLabel.text = [NSString stringWithFormat:@"规格：%@",type];
//    self.moneyLabel.text = [NSString stringWithFormat:@"¥%.2f",money];
//    self.countLabel.text = [NSString stringWithFormat:@"×%d",count];
//}



- (void)setModel:(UserGoodsDetailObject *)model{
    self.nameLabel.text = model.goodsname;
    self.goodsTypeLabel.text = [NSString stringWithFormat:@"%@：%@",model.attr_name,model.avalue];
    self.moneyLabel.text = [NSString stringWithFormat:@"¥%@",model.price];
    self.countLabel.text = [NSString stringWithFormat:@"×%@",model.quantity];
    [self.icon sd_setImageWithURL:model.pic_url placeholderImage:IMAGE(@"placeholder_loading")];
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
