//
//  MallBussAllGoodsCollectionReusableView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussAllGoodsCollectionReusableView.h"

@interface MallBussAllGoodsCollectionReusableView ()

@property (nonatomic, strong) UIButton *groupBtn;//综合安妮
@property (nonatomic, strong) UIButton *soldBtn;//销量
@property (nonatomic, strong) UIButton *neGoodsBtn;//新品
@property (nonatomic, strong) UIButton *priceBtn;//价格排序
@property (nonatomic, strong) UIImageView *upIv;//上
@property (nonatomic, strong) UIImageView *downIv;//下



@property (nonatomic, strong) UIView *firstLineView;//

@property (nonatomic, strong) UIView *secondLineView;

@property (nonatomic, strong) UIView *thirdLineView;

@property (nonatomic, strong) UIView *bottomLineView;//底部先




@end

@implementation MallBussAllGoodsCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.groupBtn];
        [self addSubview:self.soldBtn];
        [self addSubview:self.neGoodsBtn];
        [self addSubview:self.priceBtn];
        [self addSubview:self.firstLineView];
        [self addSubview:self.secondLineView];
        [self addSubview:self.thirdLineView];
        [self addSubview:self.bottomLineView];
        [self.priceBtn addSubview:self.upIv];
        [self.priceBtn addSubview:self.downIv];
        
        self.groupBtn.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .heightRatioToView(self, 1)
        .widthRatioToView(self, 1.00/4.00);
        
        self.firstLineView.sd_layout
        .centerYEqualToView(self.groupBtn)
        .leftSpaceToView(self.groupBtn, 0)
        .widthIs(0.5)
        .heightIs(14);
        
        self.soldBtn.sd_layout
        .topEqualToView(self.groupBtn)
        .leftSpaceToView(self.groupBtn, 0)
        .widthRatioToView(self.groupBtn, 1)
        .heightRatioToView(self.groupBtn, 1);
        
        self.secondLineView.sd_layout
        .centerYEqualToView(self.groupBtn)
        .leftSpaceToView(self.soldBtn, 0)
        .widthIs(0.5)
        .heightIs(14);

        
        self.neGoodsBtn.sd_layout
        .topEqualToView(self.groupBtn)
        .leftSpaceToView(self.soldBtn, 0)
        .widthRatioToView(self.groupBtn, 1)
        .heightRatioToView(self.groupBtn, 1);
        
        self.thirdLineView.sd_layout
        .centerYEqualToView(self.groupBtn)
        .leftSpaceToView(self.neGoodsBtn, 0)
        .widthIs(0.5)
        .heightIs(14);

        
        self.priceBtn.sd_layout
        .topEqualToView(self.groupBtn)
        .leftSpaceToView(self.neGoodsBtn, 0)
        .widthRatioToView(self.groupBtn, 1)
        .heightRatioToView(self.groupBtn, 1);
        
        self.upIv.sd_layout
        .centerYIs(18.5)
        .rightSpaceToView(self.priceBtn, 20)
        .widthIs(8)
        .heightIs(4.5);
        
        self.downIv.sd_layout
        .topSpaceToView(self.upIv, 3.5)
        .centerXEqualToView(self.upIv)
        .widthIs(8)
        .heightIs(4.5);
        
        self.bottomLineView.sd_layout
        .bottomSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .widthRatioToView(self, 1)
        .heightIs(0.5);
        
    }
    return self;
}


#pragma mark ----------------点击刷新数据

- (void)reloadDataAction{
    if (self.delegate) {
        [self.delegate reloadDataDelegate:_currentIndex];
    }
}


#pragma mark ----------------点击事件

- (void)groupAction{
    if (_currentIndex == 0) {
        return;
    }else{
        _currentIndex = 0;
    }
    
    [self reloadDataByIndex];

}

- (void)soldAction{
    if (_currentIndex == 1) {
        return;
    }else{
        _currentIndex = 1;
    }
    [self reloadDataByIndex];


}

- (void)neGoodsAction{
    if (_currentIndex == 2 ) {
        return;
    }else{
        _currentIndex = 2;
    }
    [self reloadDataByIndex];

}

- (void)priceAction{
    if (_currentIndex == 3) {
        _currentIndex = 4;
    }else{
        _currentIndex = 3;
    }
    [self reloadDataByIndex];

}

- (void)reloadDataByIndex{
    self.groupBtn.selected = NO;
    self.soldBtn.selected = NO;
    self.neGoodsBtn.selected = NO;
    self.priceBtn.selected = NO;
    _upIv.image = IMAGE(@"classify79");
    _downIv.image = IMAGE(@"classify80");
    
    switch (_currentIndex) {
        case 0:
        {
            [self.groupBtn setSelected:YES];
        }
            break;
        case 1:
        {
            [self.soldBtn setSelected:YES];
        }
            break;
        case 2:
        {
            [self.neGoodsBtn setSelected:YES];
        }
            break;
        case 3:
        {
            [self.priceBtn setSelected:YES];
            _upIv.image = IMAGE(@"classify155");
            NSLog(@"升序价格");
        }
            break;
        case 4:
        {
            [self.priceBtn setSelected:YES];
            _downIv.image = IMAGE(@"classify156");
            NSLog(@"降许价格");
        }
            break;
        default:
            break;
    }
    
    [self reloadDataAction];
}

#pragma mark ----------------实例化

- (UIButton *)groupBtn{
    if (_groupBtn == nil) {
        _groupBtn = [[UIButton alloc] init];
        _groupBtn.titleLabel.font = FONT(14);
        _groupBtn.selected = YES;
        [_groupBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_groupBtn setTitleColor:MALLColor forState:UIControlStateSelected];
        [_groupBtn setTitle:@"综合" forState:UIControlStateNormal];
        [_groupBtn addTarget:self action:@selector(groupAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _groupBtn;
}

- (UIButton *)soldBtn{
    if (_soldBtn == nil) {
        _soldBtn = [[UIButton alloc] init];
        _soldBtn.titleLabel.font = FONT(14);

        [_soldBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_soldBtn setTitleColor:MALLColor forState:UIControlStateSelected];
        [_soldBtn setTitle:@"销量" forState:UIControlStateNormal];
        [_soldBtn addTarget:self action:@selector(soldAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _soldBtn;
}

- (UIButton *)neGoodsBtn{
    if (_neGoodsBtn == nil) {
        _neGoodsBtn = [[UIButton alloc] init];
        _neGoodsBtn.titleLabel.font = FONT(14);

        [_neGoodsBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_neGoodsBtn setTitleColor:MALLColor forState:UIControlStateSelected];
        [_neGoodsBtn setTitle:@"新品" forState:UIControlStateNormal];
        [_neGoodsBtn addTarget:self action:@selector(neGoodsAction) forControlEvents:UIControlEventTouchUpInside];

    }
    return _neGoodsBtn;
}

- (UIButton *)priceBtn{
    if (_priceBtn == nil) {
        _priceBtn = [[UIButton alloc] init];
        _priceBtn.titleLabel.font = FONT(14);

        [_priceBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_priceBtn setTitleColor:MALLColor forState:UIControlStateSelected];
        [_priceBtn setTitle:@"价格" forState:UIControlStateNormal];
        [_priceBtn addTarget:self action:@selector(priceAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priceBtn;
}

- (UIView *)firstLineView{
    if (_firstLineView == nil) {
        _firstLineView = [[UIView alloc] init];
        _firstLineView.backgroundColor = GRAYCOLOR;
    }
    return _firstLineView;
}

- (UIView *)secondLineView{
    if (_secondLineView == nil) {
        _secondLineView = [[UIView alloc] init];
        _secondLineView.backgroundColor = GRAYCOLOR;
    }
    return _secondLineView;
}

- (UIView *)thirdLineView{
    if (_thirdLineView == nil) {
        _thirdLineView = [[UIView alloc] init];
        _thirdLineView.backgroundColor = GRAYCOLOR;
    }
    return _thirdLineView;
}

- (UIView *)bottomLineView{
    if (_bottomLineView == nil) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = GRAYCOLOR;
    }
    return _bottomLineView;
}

- (UIImageView *)upIv{
    if (_upIv == nil) {
        _upIv = [[UIImageView alloc] init];
        _upIv.image = IMAGE(@"classify79");
    }
    return _upIv;
}

- (UIImageView *)downIv{
    if (_downIv == nil) {
        _downIv = [[UIImageView alloc] init];
        _downIv.image = IMAGE(@"classify80");
    }
    return _downIv;
}
@end
