//
//  UserPresentCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserPresentCell.h"
#import "UserGiftObject.h"

@interface UserPresentCell ()

/**icon*/
@property (nonatomic, strong) UIImageView *icon;
/**礼物名称*/
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation UserPresentCell

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = ORANGE_COLOR;
        _icon.layer.cornerRadius = 5;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT(14);
        _nameLabel.textColor = BLACKTEXTCOLOR;
    }
    return _nameLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.nameLabel];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.icon.sd_layout
    .topSpaceToView(self.contentView, 15)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(45)
    .heightIs(45);
    
    self.nameLabel.sd_layout
    .leftSpaceToView(self.icon, 15)
    .centerYEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.nameLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    [self setupAutoHeightWithBottomView:self.icon bottomMargin:15];
}

- (void)setModel:(UserGiftDataObject *)model{
    _model = model;
    self.nameLabel.text = _model.good_name;
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
