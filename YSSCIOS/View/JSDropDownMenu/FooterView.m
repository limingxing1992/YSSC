//
//  FooterView.m
//  JSDropDownMenuDemo
//
//  Created by TSApple on 16/8/10.
//  Copyright © 2016年 jsfu. All rights reserved.
//

#import "FooterView.h"

@interface FooterView ()

@property (nonatomic, strong) UIButton *replaceBtn;

@property (nonatomic, strong) UIButton *sureBtn;

@end

@implementation FooterView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        [self addSubview:self.replaceBtn];
        [self addSubview:self.sureBtn];
        
        self.replaceBtn.sd_layout
        .topSpaceToView(self, 10)
        .leftSpaceToView(self, 15)
        .widthIs((WIDTH_CELL- 45)/2.00)
        .bottomSpaceToView(self, 10);
        
        self.sureBtn.sd_layout
        .topEqualToView(self.replaceBtn)
        .leftSpaceToView(self.replaceBtn, 15)
        .bottomSpaceToView(self, 10)
        .rightSpaceToView(self, 15);
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ref, 15, 0);
    CGContextAddLineToPoint(ref, self.frame.size.width, 0);
    [GRAYCOLOR set];
    CGContextSetLineCap(ref, 0.5);
    CGContextStrokePath(ref);
}


#pragma mark ---------按钮动作

- (void)replaceAction{
    if (_delegate) {
        [_delegate replaceDelegateAction];
    }
}

- (void)sureAction{
    if (_delegate) {
        [_delegate sureDelegateAction];
    }
}


#pragma mark ---------实例化

- (UIButton *)replaceBtn{
    if (_replaceBtn == nil) {
        _replaceBtn = [[UIButton alloc] init];
        _replaceBtn.titleLabel.font = FONT(15);
        [_replaceBtn setTitle:@"重置" forState:UIControlStateNormal];
        [_replaceBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        _replaceBtn.layer.borderWidth = 0.5;
        _replaceBtn.layer.borderColor = GRAYCOLOR.CGColor;
        _replaceBtn.backgroundColor = [UIColor whiteColor];
        [_replaceBtn addTarget:self action:@selector(replaceAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _replaceBtn;
}

- (UIButton *)sureBtn{
    if (_sureBtn == nil) {
        _sureBtn = [[UIButton alloc] init];
        _sureBtn.titleLabel.font = FONT(15);
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        _sureBtn.backgroundColor = MALLColor;
        [_sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}


@end
