//
//  UserShopCarCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserShopCarCell.h"

@interface UserShopCarCell ()

/**选中按钮*/
@property (nonatomic, strong) UIButton *selectBtn;
/**图标*/
@property (nonatomic, strong) UIImageView *icon;
/**titel*/
@property (nonatomic, strong) UILabel *titleLabel;
/**typeLabel*/
@property (nonatomic, strong) UILabel *typeLabel;
/**类型title*/
@property (nonatomic, strong) UILabel *typeTitleLabel;
/**price*/
@property (nonatomic, strong) UILabel *priceLabel;
///**减号*/
//@property (nonatomic, strong) UIButton *minusButton;
///**加号*/
//@property (nonatomic, strong) UIButton *plusButton;
/**商品数量*/
@property (nonatomic, strong) UILabel *countLabel;



@end

@implementation UserShopCarCell

- (UIButton *)selectBtn{
    if (_selectBtn == nil) {
        _selectBtn = [[UIButton alloc] init];
        [_selectBtn setImage:IMAGE(@"classify106") forState:UIControlStateNormal];
        [_selectBtn setImage:IMAGE(@"classify104") forState:UIControlStateSelected];
        [_selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBtn;
}

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc]init];
        _icon.image = IMAGE(@"placeholderImage");
    }
    return _icon;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT(12);
        _titleLabel.textColor = SHENTEXTCOLOR;
        
    }
    return _titleLabel;
}

- (UILabel *)typeTitleLabel{
    if (_typeTitleLabel == nil) {
        _typeTitleLabel = [[UILabel alloc] init];
        _typeTitleLabel.font = FONT(12);
        _typeTitleLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _typeTitleLabel;
}

- (UILabel *)typeLabel{
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.font = FONT(12);
        _typeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _typeLabel;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = FONT(12);
        _priceLabel.textColor = MALLColor;
    }
    return _priceLabel;
}

- (UIButton *)minusButton{
    if (_minusButton == nil) {
        _minusButton = [[UIButton alloc] init];
        [_minusButton setImage:IMAGE(@"classify74") forState:UIControlStateNormal];
        [_minusButton addTarget:self action:@selector(minusButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _minusButton;
}

- (UIButton *)plusButton{
    if (_plusButton == nil) {
        _plusButton = [[UIButton alloc] init];
        [_plusButton setImage:IMAGE(@"classify76") forState:UIControlStateNormal];
        [_plusButton addTarget:self action:@selector(plusButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _plusButton;
}

- (UILabel *)countLabel{
    if (_countLabel == nil) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.font = FONT(12);
        _countLabel.textColor = SHENTEXTCOLOR;
    }
    return _countLabel;
}


- (void)setupUI{
    [self.contentView addSubview:self.selectBtn];
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.typeTitleLabel];
    [self.contentView addSubview:self.typeLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.minusButton];
    [self.contentView addSubview:self.countLabel];
    [self.contentView addSubview:self.plusButton];
    
    self.selectBtn.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.contentView)
    .widthIs(20)
    .heightIs(20);
    
    self.icon.sd_layout
    .leftSpaceToView(self.contentView, 45)
    .centerYEqualToView(self.contentView)
    .widthIs(75)
    .heightIs(75);
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.icon, 15)
    .topEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.typeTitleLabel.sd_layout
    .leftSpaceToView(self.icon, 15)
    .topSpaceToView(self.titleLabel, 5)
    .autoHeightRatio(0);
    [self.typeTitleLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.typeLabel.sd_layout
    .leftSpaceToView(self.typeTitleLabel, 5)
    .topSpaceToView(self.titleLabel, 5)
    .autoHeightRatio(0);
    [self.typeLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.priceLabel.sd_layout
    .leftSpaceToView(self.icon, 15)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.priceLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.plusButton.sd_layout
    .rightSpaceToView(self.contentView, 15)
    .bottomEqualToView(self.icon)
    .widthIs(20)
    .heightIs(20);
    
    self.countLabel.sd_layout
    .rightSpaceToView(self.plusButton, 13.5)
    .centerYEqualToView(self.plusButton)
    .autoHeightRatio(0);
    [self.countLabel setSingleLineAutoResizeWithMaxWidth:50];
    
    self.minusButton.sd_layout
    .rightSpaceToView(self.countLabel, 13.5)
    .bottomEqualToView(self.icon)
    .widthIs(20)
    .heightIs(20);
    


}

- (void)setModel:(STL_GoodsDetailBaseSubItemModel *)model{
    _model = model;
    self.titleLabel.text = _model.goodsName;
    self.typeTitleLabel.text = [NSString stringWithFormat:@"%@ ：",_model.attr_name];

    self.typeLabel.text = _model.avalue;
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",_model.promotion_price];
    self.countLabel.text = _model.quantity;
    if ([_model.pic isKindOfClass:[NSNull class]]) {
        
    }else{
        [self.icon sd_setImageWithURL:[NSURL URLWithString:_model.pic] placeholderImage:IMAGE(@"placeholderImage")];
    }
    
    
    self.selectBtn.selected = _model.isSelected;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}


- (void)selectBtnClick:(UIButton *)button{
    button.selected = !button.selected;
    _model.isSelected = button.selected;
    
    if (_block) {
        _block(button);
    }
}

- (void)minusButtonClick:(UIButton *)button{
    
    if (_model.quantity.integerValue > 1) {
        NSString *quantityStr = [NSString stringWithFormat:@"%zd",_model.quantity.integerValue - 1];
        _model.quantity = quantityStr;
        self.countLabel.text = _model.quantity;
    }
    
    if (_block) {
        _block(button);
    }
    
}

- (void)plusButtonClick:(UIButton *)button{
    if (_model.quantity.integerValue < _model.amount.integerValue) {
        NSString *quantityStr = [NSString stringWithFormat:@"%zd",_model.quantity.integerValue + 1];
        _model.quantity = quantityStr;
        self.countLabel.text = _model.quantity;
    }else{
        [SVProgressHUD showSuccessWithStatus:@"商品库存不足"];
    }
    
    if (_block) {
        _block(button);
    }
}


- (void)buttonDidClick:(buttonDidClick)block{
    _block = block;
}





@end
