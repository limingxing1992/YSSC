//
//  MallTabButtom.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallTabButton.h"

@interface MallTabButton ()



@end

@implementation MallTabButton

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.tabIv];
        [self addSubview:self.tabLb];
        [self addSubview:self.singleLineView];
    
        self.tabIv.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(self, 5)
        .widthIs(20)
        .heightEqualToWidth();
        
        self.tabLb.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(self.tabIv , 5)
        .autoHeightRatio(0);
        [self.tabLb setSingleLineAutoResizeWithMaxWidth:self.frame.size.width];
        
        self.singleLineView.sd_layout
        .rightSpaceToView(self, 0.5)
        .topSpaceToView(self, 10)
        .bottomSpaceToView(self, 10)
        .widthIs(0.5);
    }
    return self;
}


#pragma mark ----------------更新

- (void)setTitleText:(NSString *)text image:(UIImage *)image{
    self.tabLb.text = text;
    self.tabLb.textColor = BLACKTEXTCOLOR;
    self.tabIv.image = image;
}


#pragma mark ----------------实例化

- (UIImageView *)tabIv{
    if (_tabIv == nil) {
        _tabIv = [[UIImageView alloc] init];
    }
    return _tabIv;
}

- (UILabel *)tabLb{
    if (_tabLb == nil) {
        _tabLb = [[UILabel alloc] init];
        _tabLb.textColor = BLACKTEXTCOLOR;
        _tabLb.font = FONT(12);
        _tabLb.textAlignment = NSTextAlignmentCenter;
    }
    return _tabLb;
}

- (UIView *)singleLineView{
    if (_singleLineView == nil) {
        _singleLineView = [[UIView alloc] init];
        _singleLineView.backgroundColor = GRAYCOLOR;
    }
    return _singleLineView;
}
@end
