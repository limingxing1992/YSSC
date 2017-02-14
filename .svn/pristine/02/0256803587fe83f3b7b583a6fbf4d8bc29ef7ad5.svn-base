//
//  UserFavoriteTravelDiaryCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserFavoriteTravelDiaryCell.h"
#import "UserFavoriteObject.h"

@interface UserFavoriteTravelDiaryCell ()

/**图片*/
@property (nonatomic, strong) UIImageView *icon;
/**内容*/
@property (nonatomic, strong) UILabel *titleLabel;
/**日记作者*/
@property (nonatomic, strong) UILabel *diaryAuthorLabel;
/**店铺地址*/
@property (nonatomic, strong) UILabel *timeLabel;

@end


@implementation UserFavoriteTravelDiaryCell

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

- (UILabel *)diaryAuthorLabel{
    if (_diaryAuthorLabel == nil) {
        _diaryAuthorLabel = [[UILabel alloc] init];
        _diaryAuthorLabel.font = FONT(12);
        _diaryAuthorLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _diaryAuthorLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = FONT(12);
        _timeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _timeLabel;
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
    [self.contentView addSubview:self.diaryAuthorLabel];
    [self.contentView addSubview:self.timeLabel];
    
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
    
    self.diaryAuthorLabel.sd_layout
    .leftEqualToView(self.titleLabel)
    .topSpaceToView(self.titleLabel, 10)
    .autoHeightRatio(0);
    [self.diaryAuthorLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.timeLabel.sd_layout
    .leftSpaceToView(self.icon, 15)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    [self setupAutoHeightWithBottomView:self.icon bottomMargin:12];
    
    
}

- (void)setModel:(UserFavoriteDataObject *)model{
    _model = model;
    self.titleLabel.text = _model.title;
    self.diaryAuthorLabel.text = _model.username;
    self.timeLabel.text = _model.collect_time;
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
