//
//  UserRankHeaderView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserRankHeaderView.h"

@interface UserRankHeaderView ()

/**Header图片*/
@property (nonatomic, strong) UIImageView *headerImageView;
/**HeaderTitle*/
@property (nonatomic, strong) UILabel *headerTitle;
/**HerderDetail*/
@property (nonatomic, strong) UILabel *headerDetailLabel;

@end

@implementation UserRankHeaderView

- (UIImageView *)headerImageView{
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc] init];
        _headerImageView.image = IMAGE(@"classify113");
    }
    return _headerImageView;
}

- (UILabel *)headerTitle{
    if (_headerTitle == nil) {
        _headerTitle = [[UILabel alloc] init];
        _headerTitle.font = FONT(14);
        _headerTitle.textColor = SHENTEXTCOLOR;
    }
    return _headerTitle;
}

- (UILabel *)headerDetailLabel{
    if (_headerDetailLabel == nil) {
        _headerDetailLabel = [[UILabel alloc] init];
        _headerDetailLabel.font = FONT(12);
        _headerDetailLabel.textColor = SHENTEXTCOLOR;
    }
    return _headerDetailLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [self addSubview:self.headerImageView];
    [self addSubview:self.headerTitle];
    [self addSubview:self.headerDetailLabel];
    
    self.headerImageView.sd_layout
    .leftSpaceToView(self, 15)
    .centerYEqualToView(self)
    .heightIs(17)
    .widthIs(17);
    
    self.headerTitle.sd_layout
    .leftSpaceToView(self.headerImageView, 3.5)
    .centerYEqualToView(self)
    .autoHeightRatio(0);
    [self.headerTitle setSingleLineAutoResizeWithMaxWidth:300];
    
    self.headerDetailLabel.sd_layout
    .leftSpaceToView(self.headerTitle, 8)
    .centerYEqualToView(self)
    .autoHeightRatio(0);
    [self.headerDetailLabel setSingleLineAutoResizeWithMaxWidth:300];

}

- (void)setTitle:(NSString *)title detail:(NSString *)detail{
    self.headerTitle.text = title;
    self.headerDetailLabel.text = detail;
}
@end
