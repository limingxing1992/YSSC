//
//  UserFavoriteGoodsCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserFavoriteGoodsCell.h"
#import "UserFavoriteObject.h"

@interface UserFavoriteGoodsCell ()

/**图片*/
@property (nonatomic, strong) UIImageView *icon;
/**内容*/
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation UserFavoriteGoodsCell

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


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.titleLabel];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.icon.sd_layout
    .topSpaceToView(self.contentView, 12)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(75)
    .heightIs(75);
    

    self.titleLabel.sd_layout
    .leftSpaceToView(self.icon, 15)
    .centerYEqualToView (self.contentView)
    .autoHeightRatio(0);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:240];
    
    [self setupAutoHeightWithBottomView:self.icon bottomMargin:12];
    
    
}

- (void)setModel:(UserFavoriteDataObject *)model{
    _model = model;
    self.titleLabel.text = _model.title;
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
