//
//  STL_LimitCollectionViewCell.m
//  LSDevModel3
//
//  Created by 李明星 on 16/9/5.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "STL_LimitCollectionViewCell.h"

@interface STL_LimitCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLb;

@end

@implementation STL_LimitCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLb];
        self.titleLb.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .rightSpaceToView(self, 0)
        .bottomSpaceToView(self, 0);
        
        [self.titleLb setMaxNumberOfLinesToShow:0];
    }
    return self;
}


#pragma mark ----------------选中和取消

- (void)updateInfoWith:(STL_ClassifyLimitItemValueModel *)model{
    _titleLb.text = model.value;
}

- (void)updateInfoWithItemModel:(STL_GoodsDetailBaseSubItemModel *)model{
    _titleLb.text = model.avalue;
}

- (void)setColorWithBool:(BOOL)ret{
    if (ret) {
        _titleLb.textColor = MALLColor;
        _titleLb.layer.borderColor = MALLColor.CGColor;
        _titleLb.backgroundColor = YSSCRGBColor(226, 250, 246);
    }else{
        _titleLb.layer.borderColor = GRAYCOLOR.CGColor;
        _titleLb.textColor = SHENTEXTCOLOR;
        _titleLb.backgroundColor = WHITECOLOR;
    }
}


#pragma mark ---------实例化

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
//        _titleLb.frame  = self.bounds;
        _titleLb.font = FONT(14);
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.textColor = SHENTEXTCOLOR;
        _titleLb.layer.borderColor = GRAYCOLOR.CGColor;
        _titleLb.layer.borderWidth = 0.5;
        _titleLb.layer.cornerRadius = 5;
        _titleLb.clipsToBounds = YES;
    }
    return _titleLb;
}


@end
