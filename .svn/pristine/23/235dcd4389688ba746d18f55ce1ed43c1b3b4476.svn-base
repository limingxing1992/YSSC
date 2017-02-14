//
//  YSSSliderButtonView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "YSSSliderButtonView.h"

@interface YSSSliderButtonView ()

/**滑动条*/
@property (nonatomic, strong) UIView *sliderView;
/**选中的按钮*/
@property (nonatomic, strong) UIButton *selButton;
/**底部分割线*/
@property (nonatomic, strong) UIView *lineView;

@end

@implementation YSSSliderButtonView

- (UIView *)sliderView{
    if (_sliderView == nil) {
        _sliderView = [[UIView alloc] init];
        _sliderView.backgroundColor = MALLColor ;
    }
    return _sliderView;
}
- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}


#pragma mark --------- 生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.sliderView];
    [self addSubview:self.lineView];
    
    self.lineView.sd_layout
    .bottomSpaceToView(self, 0)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(0.5);
}

- (void)setButtonTitleArray:(NSArray *)array {
    
    if (array) {
        for (NSInteger i = 0; i< array.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.font = FONT(14);
            [button setTitle:array[i] forState:UIControlStateNormal];
            [button setTitleColor:MALLColor forState:UIControlStateSelected];
            [button setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
            
//            [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
            CGFloat width = SCREEN_WIDTH / array.count;
            
            
            CGFloat height = self.frame.size.height - 2.5;
            button.frame = CGRectMake(i * width, 0, width, height);
                       [self addSubview:button];
            if (i == 0) {
                [self buttonDidClick:button];
            }
           
            
            
        }
    }
    
}

#pragma mark --------- 点击事件

- (void)buttonDidClick:(UIButton *)button{
    self.selButton.selected = NO;
    self.selButton = button;
    self.selButton.selected = YES;
    
    NSString *str = button.currentTitle;
    CGFloat sliderWidth = str.length * 15;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.sliderView.sd_layout
        .bottomSpaceToView(self, 0.5)
        .centerXEqualToView(button)
        .widthIs(sliderWidth)
        .heightIs(2);
        [self.sliderView updateLayout];
        
    }];
    
    if ([self.delegate respondsToSelector:@selector(ySSSliderButtonView:buttonDidClick:)]) {
        [self.delegate ySSSliderButtonView:self buttonDidClick:button];
    }

}

@end
