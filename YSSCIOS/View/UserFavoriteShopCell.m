//
//  UserFavoriteShopCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserFavoriteShopCell.h"
#import "UserFavoriteObject.h"
#import "YSSStarView.h"

@interface UserFavoriteShopCell ()

/**图片*/
@property (nonatomic, strong) UIImageView *icon;
/**内容*/
@property (nonatomic, strong) UILabel *titleLabel;
/**星星*/
@property (nonatomic, strong) YSSStarView *starView;
/**店铺地址*/
@property (nonatomic, strong) UILabel *shopAddressLabel;

@end

@implementation UserFavoriteShopCell

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = GRAYCOLOR;
    }
    return _icon;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT(14);
        _titleLabel.textColor = SHENTEXTCOLOR;
    }
    return _titleLabel;
}

- (YSSStarView *)starView{
    if (_starView == nil) {
        _starView = [[YSSStarView alloc] init];
    }
    return _starView;
}

- (UILabel *)shopAddressLabel{
    if (_shopAddressLabel == nil) {
        _shopAddressLabel = [[UILabel alloc] init];
        _shopAddressLabel.font = FONT(12);
        _shopAddressLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _shopAddressLabel;
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
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.starView];
    [self.contentView addSubview:self.shopAddressLabel];
    
    self.icon.sd_layout
    .topSpaceToView(self.contentView, 12)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(75)
    .heightIs(75);
    
    
    self.titleLabel.sd_layout
    .topEqualToView(self.icon)
    .leftSpaceToView(self.icon, 15)
    .autoHeightRatio(0);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:240];
    
    self.starView.sd_layout
    .leftEqualToView(self.titleLabel)
    .topSpaceToView(self.titleLabel, 10)
    .widthIs(110)
    .heightIs(12);
    
    self.shopAddressLabel.sd_layout
    .leftSpaceToView(self.icon, 15)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.shopAddressLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    [self setupAutoHeightWithBottomView:self.icon bottomMargin:12];
    
    
}

- (void)setModel:(UserFavoriteDataObject *)model{
    _model = model;
    self.titleLabel.text = _model.title;
    [self.starView setSelectedImageCount:_model.score.floatValue];
    [self.icon sd_setImageWithURL:_model.url placeholderImage:IMAGE(@"placeholder_loading")];
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
