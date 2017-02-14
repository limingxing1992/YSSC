//
//  MallGoodsDetailBussHeadView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallGoodsDetailBussHeadView.h"

@interface MallGoodsDetailBussHeadView ()

@property (nonatomic, strong) UIImageView *busHeadIv;//商铺头像
@property (nonatomic, strong) UILabel *busNameLb;//商铺名称
@property (nonatomic, strong) UIButton *enterBus;//进入商铺

@end

@implementation MallGoodsDetailBussHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.busHeadIv];
        [self addSubview:self.busNameLb];
        [self addSubview:self.enterBus];
        
        self.busHeadIv.sd_layout
        .topSpaceToView(self, 14)
        .leftSpaceToView(self, 15)
        .widthIs(60)
        .heightIs(60);
        
        self.busNameLb.sd_layout
        .topSpaceToView(self, 19)
        .leftSpaceToView(self.busHeadIv, 12)
        .rightSpaceToView(self, 15)
        .autoHeightRatio(0);
        
        self.enterBus.sd_layout
        .bottomEqualToView(self.busHeadIv)
        .leftEqualToView(self.busNameLb)
        .heightIs(20);
        
        [self.enterBus setupAutoSizeWithHorizontalPadding:0 buttonHeight:20];
        
        [self setupAutoHeightWithBottomView:_busHeadIv bottomMargin:14];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterBussAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}


- (void)updateInfoWith:(NSString *)img title:(NSString *)title{
    [self.busHeadIv sd_setImageWithURL:[NSURL URLWithString:img] placeholderImage:PlaceholderHeadImage];
    self.busNameLb.text = title;
}

#pragma mark ----------------点击事件

- (void)enterBussAction{
    if (self.block) {
        self.block();
    }
}


#pragma mark ----------------实例化

- (UIImageView *)busHeadIv{
    if (_busHeadIv == nil) {
        _busHeadIv = [[UIImageView alloc] init];
        _busHeadIv.image = IMAGE(@"placeholderImage");
        _busHeadIv.layer.borderWidth = 0.5;
        _busHeadIv.layer.borderColor = GRAYCOLOR.CGColor;
    }
    return _busHeadIv;
}

- (UILabel *)busNameLb{
    if (_busNameLb == nil) {
        _busNameLb = [[UILabel alloc] init];
        _busNameLb.font = FONT(14);
        _busNameLb.textColor = BLACKTEXTCOLOR;
        _busNameLb.text = @"宝岛眼镜";
    }
    return _busNameLb;
}

- (UIButton *)enterBus{
    if (_enterBus == nil) {
        _enterBus = [[UIButton alloc] init];
        [_enterBus setTitleColor:MALLColor forState:UIControlStateNormal];
        [_enterBus setTitle:@"进店逛逛" forState:UIControlStateNormal];
        _enterBus.titleLabel.font = FONT(12);
        [_enterBus addTarget:self action:@selector(enterBussAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _enterBus;
}

@end
