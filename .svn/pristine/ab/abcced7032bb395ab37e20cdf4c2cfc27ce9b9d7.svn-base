//
//  UserRankTopView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserRankTopView.h"

@interface UserRankTopView ()

/**用户名*/
@property (nonatomic, strong) UILabel *nameLabel;
/**会员等级*/
@property (nonatomic, strong) UILabel *rankLabel;
/**顶部图片*/
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation UserRankTopView

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT(12);
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}

- (UILabel *)rankLabel{
    if (_rankLabel == nil) {
        _rankLabel = [[UILabel alloc] init];
        _rankLabel.font = FONT(33);
        _rankLabel.textColor = [UIColor whiteColor];
    }
    return _rankLabel;
    
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        [_imageView setImage:IMAGE(@"classify149")];
    }
    return _imageView;
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
    self.backgroundColor = MALLColor;
    [self addSubview:self.nameLabel];
    [self addSubview:self.rankLabel];
    [self addSubview:self.imageView];
    
    
    self.imageView.sd_layout
    .bottomSpaceToView(self, 24)
    .centerXEqualToView(self)
    .widthIs(250)
    .heightIs(170);
    
    self.rankLabel.sd_layout
    .bottomSpaceToView(self, 60)
    .centerXEqualToView(self)
    .autoHeightRatio(0);
    [self.rankLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    
    self.nameLabel.sd_layout
    .bottomSpaceToView(self.rankLabel, 25)
    .centerXEqualToView(self)
    .autoHeightRatio(0);
    [self.nameLabel setSingleLineAutoResizeWithMaxWidth:200];
    
 
    

    
    
    
}

- (void)setName:(NSString *)name rank:(NSString *)rank{
    self.nameLabel.text = name;
    self.rankLabel.text = rank;
}

@end
