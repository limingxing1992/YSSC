//
//  MallTabView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallTabView.h"

@interface MallTabView ()

@property (nonatomic, strong) MallTabButton *mallBtn;//商铺按钮
@property (nonatomic, strong) MallTabButton *mallPhoneBtn;//商铺电话
@property (nonatomic, strong) MallTabButton *mallShoppingCarBtn;//购物车

@property (nonatomic, strong) UIButton *addShoppingCarBtn;//加入购物车按钮

@property (nonatomic, strong) UIButton *buyNowBtn;//立即购买按钮

@property (nonatomic, strong) UIView *lineView;//顶部微线




@end

@implementation MallTabView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addSubview:self.mallBtn];
        [self addSubview:self.mallPhoneBtn];
        [self addSubview:self.mallShoppingCarBtn];
        [self addSubview:self.addShoppingCarBtn];
        [self addSubview:self.buyNowBtn];
        [self addSubview:self.lineView];
        
        self.lineView.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self,0)
        .rightSpaceToView(self, 0)
        .heightIs(0.5);
        
        self.mallBtn.sd_layout
        .topSpaceToView(self.lineView, 0)
        .leftSpaceToView(self, 0)
        .widthRatioToView(self, 0.5*1.0/3.0)
        .heightRatioToView(self, 1);

        
        self.mallPhoneBtn.sd_layout
        .topEqualToView(self.mallBtn)
        .leftSpaceToView(self.mallBtn, 0.5)
        .widthRatioToView(self.mallBtn, 1)
        .heightRatioToView(self.mallBtn, 1);
        
        self.mallShoppingCarBtn.sd_layout
        .leftSpaceToView(self.mallPhoneBtn, 0.5)
        .topEqualToView(self.mallBtn)
        .widthRatioToView(self.mallBtn, 1)
        .heightRatioToView(self.mallBtn ,1);
        
        self.addShoppingCarBtn.sd_layout
        .leftSpaceToView(self.mallShoppingCarBtn, 0.5)
        .topEqualToView(self.mallShoppingCarBtn)
        .widthRatioToView(self, 0.25)
        .heightRatioToView(self, 1);
        
        self.buyNowBtn.sd_layout
        .topEqualToView(self.addShoppingCarBtn)
        .rightSpaceToView(self, 0)
        .leftSpaceToView(self.addShoppingCarBtn, 0)
        .heightRatioToView(self, 1);
        
    }
    return self;
}


#pragma mark ----------------点击事件

- (void)onClickBussHome{
    if (self.delegate) {
        [self.delegate enterBussHome];
    }
}

- (void)onClickPhone{
    if (self.delegate) {
        [self.delegate callBussPhone];
    }
}

- (void)onClickShoppingCar{
    if (self.delegate) {
        [self.delegate enterShoppingCar];
    }
}

- (void)onClickAddShoppingCar{
    if (self.delegate) {
        [self.delegate addToShoppingCar];
    }
}

- (void)onClickBuyNow{
    if (self.delegate) {
        [self.delegate buyNow];
    }
}

#pragma mark ----------------实例化

- (MallTabButton *)mallBtn{
    if (_mallBtn == nil) {
        _mallBtn = [[MallTabButton alloc] init];
        [_mallBtn setTitleText:@"店铺" image:IMAGE(@"classify66")];
        [_mallBtn addTarget:self action:@selector(onClickBussHome) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mallBtn;
}

- (MallTabButton *)mallPhoneBtn{
    if (_mallPhoneBtn == nil) {
        _mallPhoneBtn = [[MallTabButton alloc] init];
        [_mallPhoneBtn setTitleText:@"电话" image:IMAGE(@"classify67")];
        [_mallPhoneBtn addTarget:self action:@selector(onClickPhone) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mallPhoneBtn;
}

- (MallTabButton *)mallShoppingCarBtn{
    if (_mallShoppingCarBtn == nil) {
        _mallShoppingCarBtn = [[MallTabButton alloc] init];
        [_mallShoppingCarBtn setTitleText:@"购物车" image:IMAGE(@"classify68")];
        [_mallShoppingCarBtn addTarget:self action:@selector(onClickShoppingCar) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mallShoppingCarBtn;
}

- (UIButton *)addShoppingCarBtn{
    if (_addShoppingCarBtn == nil) {
        _addShoppingCarBtn = [[UIButton alloc] init];
        _addShoppingCarBtn.backgroundColor = [UIColor orangeColor];
        _addShoppingCarBtn.titleLabel.font = FONT(15);
        [_addShoppingCarBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_addShoppingCarBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_addShoppingCarBtn addTarget:self action:@selector(onClickAddShoppingCar) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addShoppingCarBtn;
}

- (UIButton *)buyNowBtn{
    if (_buyNowBtn == nil) {
        _buyNowBtn = [[UIButton alloc] init];
        _buyNowBtn.backgroundColor = MALLColor;
        _buyNowBtn.titleLabel.font = FONT(15);
        [_buyNowBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_buyNowBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [_buyNowBtn addTarget:self action:@selector(onClickBuyNow) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyNowBtn;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}
@end
