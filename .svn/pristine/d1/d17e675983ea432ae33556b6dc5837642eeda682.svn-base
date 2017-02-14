//
//  MallBussHeadSectionView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussHeadSectionView.h"

@interface MallBussHeadSectionView ()

@property (nonatomic, strong) UIView *singLeLineView;//切割线


@end

@implementation MallBussHeadSectionView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.bussHomeBtn];
        [self addSubview:self.allGoodsBtn];
        [self addSubview:self.bussMessBtn];
        [self addSubview:self.singLeLineView];
        
        self.singLeLineView.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .rightSpaceToView(self, 0)
        .heightIs(0.5);
        
        
        self.bussHomeBtn.sd_layout
        .topSpaceToView(self, 1)
        .leftSpaceToView(self, 0)
        .widthRatioToView(self, 1.00 /3.00)
        .bottomSpaceToView(self, 0);
        
        self.allGoodsBtn.sd_layout
        .topEqualToView(self.bussHomeBtn)
        .leftSpaceToView(self.bussHomeBtn, 0)
        .widthRatioToView(self.bussHomeBtn, 1)
        .heightRatioToView(self.bussHomeBtn, 1);
        
        self.bussMessBtn.sd_layout
        .topEqualToView(self.bussHomeBtn)
        .leftSpaceToView(self.allGoodsBtn, 0)
        .widthRatioToView(self.bussHomeBtn, 1)
        .heightRatioToView(self.allGoodsBtn, 1);

    }
    return self;
}


#pragma mark ----------------更新动作

- (void)addAction:(NSArray *)actionArys target:(id)target{
    for (NSInteger i= 0; i < actionArys.count; i++) {
        SEL sel = NSSelectorFromString(actionArys[i]);
        switch (i) {
            case 0:
                [self.bussHomeBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
                break;
            case 1:
                [self.allGoodsBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
                break;
            case 2:
                [self.bussMessBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
                break;
            default:
                break;
        }
    
    }
}



#pragma mark ----------------实例化


- (MallTabButton *)bussHomeBtn{
    if (_bussHomeBtn == nil) {
        _bussHomeBtn = [[MallTabButton alloc] init];
        [_bussHomeBtn setTitleText:@"商家首页" image:IMAGE(@"classify83")];
        _bussHomeBtn.tabLb.textColor = MALLColor;
    }
    return _bussHomeBtn;
}

- (MallTabButton *)allGoodsBtn{
    if (_allGoodsBtn == nil) {
        _allGoodsBtn = [[MallTabButton alloc] init];
        [_allGoodsBtn setTitleText:@"全部宝贝" image:IMAGE(@"classify72")];
    }
    return _allGoodsBtn;
    
    
}

- (MallTabButton *)bussMessBtn{
    if (_bussMessBtn == nil) {
        _bussMessBtn = [[MallTabButton alloc] init];
        [_bussMessBtn setTitleText:@"商家动态" image:IMAGE(@"classify84")];
    }
    return _bussMessBtn;
}

- (UIView *)singLeLineView{
    if (_singLeLineView == nil) {
        _singLeLineView = [[UIView alloc] init];
        _singLeLineView.backgroundColor = GRAYCOLOR;
    }
    return _singLeLineView;
}

@end
