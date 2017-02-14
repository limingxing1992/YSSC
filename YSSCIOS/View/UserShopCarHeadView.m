//
//  UserShopCarHeadView.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserShopCarHeadView.h"

@interface UserShopCarHeadView ()

/**店铺图标*/
@property (nonatomic, strong) UIImageView *shopImageView;

@end

@implementation UserShopCarHeadView

- (UIButton *)allSelectButton{
    if (_allSelectButton == nil) {
        _allSelectButton = [[UIButton alloc] init];
        [_allSelectButton setImage:IMAGE(@"classify106") forState:UIControlStateNormal];
        [_allSelectButton setImage:IMAGE(@"classify104") forState:UIControlStateSelected];

        
    }
    return _allSelectButton;
}

- (UIImageView *)shopImageView{
    if (_shopImageView == nil) {
        _shopImageView = [[UIImageView alloc] init];
        _shopImageView.image = IMAGE(@"classify101");
    }
    return _shopImageView;
}

- (UILabel *)shopNameLabel{
    if (_shopNameLabel == nil) {
        _shopNameLabel = [[UILabel alloc] init];
        _shopNameLabel.font = FONT(12);
        _shopNameLabel.textColor = SHENTEXTCOLOR;
    }
    return _shopNameLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.allSelectButton];
        [self addSubview:self.shopImageView];
        [self addSubview:self.shopNameLabel];
        
        self.allSelectButton.sd_layout
        .leftSpaceToView(self, 15)
        .centerYEqualToView(self)
        .widthIs(20)
        .heightIs(20);
        
        self.shopImageView.sd_layout
        .leftSpaceToView(self.allSelectButton, 10)
        .centerYEqualToView(self)
        .widthIs(14)
        .heightIs(14);
        
        self.shopNameLabel.sd_layout
        .leftSpaceToView(self.shopImageView, 10)
        .centerYEqualToView(self)
        .autoHeightRatio(0);
        [self.shopNameLabel setSingleLineAutoResizeWithMaxWidth:100];

    }
    return self;
}




@end
