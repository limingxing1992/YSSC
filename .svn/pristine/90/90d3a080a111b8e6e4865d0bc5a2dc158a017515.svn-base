//
//  UserPresentTopCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserPresentTopCell.h"

@interface UserPresentTopCell ()

/**icon*/
@property (nonatomic, strong) UIImageView *icon;
/**title*/
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation UserPresentTopCell

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        [_icon setImage:IMAGE(@"classify101")];
    }
    return _icon;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT(14);
        _titleLabel.textColor = BLACKTEXTCOLOR;
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
    .topSpaceToView(self.contentView, 15)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(15)
    .heightIs(15);
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.icon, 5)
    .centerYEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    [self setupAutoHeightWithBottomView:self.icon bottomMargin:15];
    
    
}

- (void)setTitle:(NSString *)title{
   
    self.titleLabel.text = title;
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
