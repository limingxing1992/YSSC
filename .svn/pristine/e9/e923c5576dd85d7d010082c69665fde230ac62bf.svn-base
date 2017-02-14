//
//  CustomCollectionViewCell.m
//  筛选
//
//  Created by TSApple on 16/8/10.
//  Copyright © 2016年 StarLi. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@interface CustomCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLb;

@end

@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLb];
    }
    return self;
}


- (void)setItemTitle:(NSString *)title{
    _titleLb.text = title;
    
//    for (ClassAttributeItemValueObject *obj in [MallLimitObject sharedMallLimitObject].limitDic.allKeys) {
//        if ([title isEqualToString:obj.value]) {
//            self.selected = YES;
//        }
//    }
    [self setColor];
    
}

- (void)setColor{
    if (self.isSelected) {
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
        _titleLb.frame  = self.bounds;
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
