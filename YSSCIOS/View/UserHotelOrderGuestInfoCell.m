//
//  UserHotelOrderGuestInfoCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserHotelOrderGuestInfoCell.h"

@interface UserHotelOrderGuestInfoCell ()

/**icon*/
@property (nonatomic, strong) UIImageView *icon;
/**title*/
@property (nonatomic, strong) UILabel *topLabel;
/**姓名title*/
@property (nonatomic, strong) UILabel *nameTitleLabel;
/**姓名*/
@property (nonatomic, strong) UILabel *nameLabel;
/**手机号title*/
@property (nonatomic, strong) UILabel *phoneNumTitleLabel;
/**手机号*/
@property (nonatomic, strong) UILabel *phoneNumLabel;
/**分割线*/
@property (nonatomic, strong) UIView *topLineView;
/**分割线2*/
@property (nonatomic, strong) UIView *secondlineView;


@end

@implementation UserHotelOrderGuestInfoCell

#pragma mark --------- 懒加载
- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
       
        [_icon setImage:IMAGE(@"classify133")];
    }
    return _icon;
}
- (UILabel *)topLabel{
    if (_topLabel == nil) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.font = FONT(12);
        _topLabel.textColor = BLACKTEXTCOLOR;
        _topLabel.text = @"入住人信息";
    }
    return _topLabel;
}

- (UILabel *)nameTitleLabel{
    if (_nameTitleLabel == nil) {
        _nameTitleLabel = [[UILabel alloc] init];
        _nameTitleLabel.font = FONT(12);
        _nameTitleLabel.textColor = BLACKTEXTCOLOR;
        _nameTitleLabel.text = @"姓名:";
    }
    return _nameTitleLabel;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT(12);
        _nameLabel.textColor = SHENTEXTCOLOR;
    }
    return _nameLabel;
}

- (UILabel *)phoneNumTitleLabel{
    if (_phoneNumTitleLabel == nil) {
        _phoneNumTitleLabel = [[UILabel alloc] init];
        _phoneNumTitleLabel.font = FONT(12);
        _phoneNumTitleLabel.textColor = BLACKTEXTCOLOR;
        _phoneNumTitleLabel.text = @"手机号码：";
    }
    return _phoneNumTitleLabel;
}

- (UILabel *)phoneNumLabel{
    if (_phoneNumLabel == nil) {
        _phoneNumLabel = [[UILabel alloc] init];
        _phoneNumLabel.font = FONT(12);
        _phoneNumLabel.textColor = SHENTEXTCOLOR;
    }
    return _phoneNumLabel;
}

-(UIView *)topLineView{
    if (_topLineView == nil) {
        _topLineView = [[UIView alloc] init];
        _topLineView.backgroundColor = GRAYCOLOR;
    }
    return _topLineView;
}

-(UIView *)secondlineView{
    if (_secondlineView == nil) {
        _secondlineView = [[UIView alloc] init];
        _secondlineView.backgroundColor = GRAYCOLOR;
    }
    return _secondlineView;
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
    [self.contentView addSubview:self.topLabel];
    [self.contentView addSubview:self.topLineView];
    [self.contentView addSubview:self.nameTitleLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.secondlineView];
    [self.contentView addSubview:self.phoneNumTitleLabel];
    [self.contentView addSubview:self.phoneNumLabel];
    
    self.icon.sd_layout
    .topSpaceToView(self.contentView, 16.5)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(10)
    .heightIs(12);
    
    self.topLabel.sd_layout
    .leftSpaceToView(self.icon, 4.5)
    .centerYEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.topLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.topLineView.sd_layout
    .topSpaceToView(self.icon, 16.5)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);
    
    self.nameTitleLabel.sd_layout
    .topSpaceToView(self.topLineView, 15)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.nameTitleLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.nameLabel.sd_layout
    .topSpaceToView(self.topLineView, 15)
    .leftSpaceToView(self.nameTitleLabel, 8)
    .autoHeightRatio(0);
    [self.nameLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.secondlineView.sd_layout
    .topSpaceToView(self.nameTitleLabel, 15)
    .leftEqualToView(self.nameTitleLabel)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);
    
    self.phoneNumTitleLabel.sd_layout
    .topSpaceToView(self.secondlineView, 15)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.phoneNumTitleLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.phoneNumLabel.sd_layout
    .topSpaceToView(self.secondlineView, 15)
    .leftSpaceToView(self.phoneNumTitleLabel, 8)
    .autoHeightRatio(0);
    [self.phoneNumLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    [self setupAutoHeightWithBottomView:self.phoneNumTitleLabel bottomMargin:15];
    
    
    
}

- (void)setName:(NSString *)name phoneNum:(NSString *)number{
    self.nameLabel.text = name;
    self.phoneNumLabel.text = number;
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
