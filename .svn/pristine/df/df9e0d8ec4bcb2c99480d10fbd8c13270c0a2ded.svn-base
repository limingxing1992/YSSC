//
//  UserShopCarHeadCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserShopCarHeadCell.h"

@interface UserShopCarHeadCell ()
/**店铺图标*/
@property (nonatomic, strong) UIImageView *shopImageView;

@end

@implementation UserShopCarHeadCell

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




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.allSelectButton];
        [self.contentView addSubview:self.shopImageView];
        [self.contentView addSubview:self.shopNameLabel];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.allSelectButton.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.contentView)
        .widthIs(20)
        .heightIs(20);
        
        self.shopImageView.sd_layout
        .leftSpaceToView(self.allSelectButton, 10)
        .centerYEqualToView(self.contentView)
        .widthIs(14)
        .heightIs(14);
        
        self.shopNameLabel.sd_layout
        .leftSpaceToView(self.shopImageView, 10)
        .centerYEqualToView(self.contentView)
        .autoHeightRatio(0);
        [self.shopNameLabel setSingleLineAutoResizeWithMaxWidth:100];
    }
    return self;
}


@end
