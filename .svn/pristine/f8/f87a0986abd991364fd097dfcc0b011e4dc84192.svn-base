//
//  UserBalanceTopView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserBalanceTopView.h"

@interface UserBalanceTopView ()

/**钱币图标*/
@property (nonatomic, strong) UIImageView *icon;
/**title*/
@property (nonatomic, strong) UILabel *titleLabel;
/**余额*/
@property (nonatomic, strong) UILabel *balanceLabel;

@end

@implementation UserBalanceTopView

#pragma mark --------- 懒加载

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        [_icon setImage:IMAGE(@"classify99")];
    }
    return _icon;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT(14);
        _titleLabel.text = @"五云铢余额";
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UILabel *)balanceLabel{
    if (_balanceLabel == nil) {
        _balanceLabel = [[UILabel alloc] init];
        _balanceLabel.font = FONT(39);
        _balanceLabel.textColor = [UIColor whiteColor];
    }
    return _balanceLabel;
}


#pragma mark --------- 生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = MALLColor;
    [self addSubview:self.icon];
    [self addSubview:self.titleLabel];
    [self addSubview:self.balanceLabel];
    
    self.icon.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self,15)
    .widthIs(14)
    .heightIs(14);
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.icon, 4)
    .centerYEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.balanceLabel.sd_layout
    .topSpaceToView(self, 45)
    .centerXEqualToView(self)
    .autoHeightRatio(0);
    [self.balanceLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
}

- (void)setbalance:(NSString *)balance{
    self.balanceLabel.text = balance;
}

@end
