//
//  MallJugeStarView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallJugeStarView.h"

@interface MallJugeStarView ()



@end

@implementation MallJugeStarView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.firstStar];
        [self addSubview:self.secondStar];
        [self addSubview:self.thirdStar];
        [self addSubview:self.fourthStar];
        [self addSubview:self.fifthStar];
        [self addSubview:self.starNumLb];
        
        self.firstStar.sd_layout
        .topSpaceToView(self, 0)
        .bottomSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .widthIs(10);
        
        self.secondStar.sd_layout
        .topEqualToView(self.firstStar)
        .leftSpaceToView(self.firstStar, 2)
        .widthRatioToView(self.firstStar, 1)
        .heightRatioToView(self.firstStar, 1);
        
        self.thirdStar.sd_layout
        .topEqualToView(self.firstStar)
        .leftSpaceToView(self.secondStar, 2)
        .widthRatioToView(self.firstStar, 1)
        .heightRatioToView(self.firstStar, 1);
        
        self.fourthStar.sd_layout
        .topEqualToView(self.firstStar)
        .leftSpaceToView(self.thirdStar, 2)
        .widthRatioToView(self.firstStar, 1)
        .heightRatioToView(self.firstStar, 1);
        
        self.fifthStar.sd_layout
        .topEqualToView(self.firstStar)
        .leftSpaceToView(self.fourthStar, 2)
        .widthRatioToView(self.firstStar, 1)
        .heightRatioToView(self.firstStar, 1);
        
        self.starNumLb.sd_layout
        .topEqualToView(self.firstStar)
        .leftSpaceToView(self.fifthStar, 10)
        .bottomEqualToView(self.fifthStar);
        [self.starNumLb setSingleLineAutoResizeWithMaxWidth:200];

        [self setupAutoWidthWithRightView:self.starNumLb rightMargin:0];
    }
    return self;
}

#pragma mark ----------------刷新星级

- (void)updateInfoWith:(NSInteger)level{
    self.starNumLb.text = [NSString stringWithFormat:@"%.1ld分",level];
    NSArray *ary = @[_firstStar, _secondStar, _thirdStar, _fourthStar, _fifthStar];
    for (NSInteger i = 0; i < level; i ++) {
        UIImageView *iv  = ary[i];
        iv.image = IMAGE(@"classify4");
    }
    
}

#pragma mark ----------------实例化

- (UIImageView *)firstStar{
    if (_firstStar == nil) {
        _firstStar = [[UIImageView alloc] init];
        _firstStar.image = IMAGE(@"classify0_1");
    }
    return _firstStar;
}


- (UIImageView *)secondStar{
    if (_secondStar == nil) {
        _secondStar = [[UIImageView alloc] init];
        _secondStar.image = IMAGE(@"classify0_1");
    }
    return _secondStar;
}
- (UIImageView *)thirdStar{
    if (_thirdStar == nil) {
        _thirdStar = [[UIImageView alloc] init];
        _thirdStar.image = IMAGE(@"classify0_1");
    }
    return _thirdStar;
}
- (UIImageView *)fourthStar{
    if (_fourthStar == nil) {
        _fourthStar = [[UIImageView alloc] init];
        _fourthStar.image = IMAGE(@"classify0_1");
    }
    return _fourthStar;
}
- (UIImageView *)fifthStar{
    if (_fifthStar == nil) {
        _fifthStar = [[UIImageView alloc] init];
        _fifthStar.image = IMAGE(@"classify0_1");
    }
    return _fifthStar;
}

- (UILabel *)starNumLb{
    if (_starNumLb == nil) {
        _starNumLb = [[UILabel alloc] init];
        _starNumLb.textColor = YSSCRGBColor(253, 178, 43);
        _starNumLb.font = FONT(12);
        _starNumLb.text = @"4.0分";
    }
    return _starNumLb;
}


@end
