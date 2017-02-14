//
//  YSSNavView.m
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "YSSNavView.h"

@interface YSSNavView ()

@property (nonatomic, strong) UILabel *titleLb;//标题

/**left*/
@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, strong) UIView *lineView;

/**rightBtnContentView*/
@property (nonatomic, strong) UIView *rightBtnContentView;

@end

@implementation YSSNavView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.coverView];
        [self.coverView addSubview:self.titleLb];
        [self addSubview:self.leftBtn];
        [self addSubview:self.lineView];
        [self addSubview:self.rightBtnContentView];
        _titleLb.sd_layout
        .centerYIs(42)
        .centerXEqualToView(self)
        .autoHeightRatio(0);
        [_titleLb setSingleLineAutoResizeWithMaxWidth:self.frame.size.width];//标题宽度自适应
        
        _leftBtn.sd_layout
        .centerYIs(42)
        .leftSpaceToView(self, 5)
        .widthIs(40)
        .heightIs(31);
        
        self.lineView.sd_layout
        .leftEqualToView(self)
        .rightEqualToView(self)
        .bottomEqualToView(self)
        .heightIs(0.5);
        
        self.rightBtnContentView.sd_layout
        .topEqualToView(self)
        .rightEqualToView(self)
        .bottomEqualToView(self)
        .widthIs(SCREEN_WIDTH * 0.3);
        
        
    }
    return self;
    
    
}



#pragma mark ----------------更新视图

- (void)setTitleText:(NSString *)title imageArrays:(NSArray *)imageArys selecterArys:(NSArray *)selecterArys  target:(id)target isShowLeftBtn:(BOOL)ret{
    if (!ret) {
        [self.leftBtn removeFromSuperview];
    }
    self.titleLb.text = title;

    for (UIView *view in self.rightBtnContentView.subviews) {
        [view removeFromSuperview];
    }
    for (NSInteger i = 0; i < selecterArys.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        SEL sel = NSSelectorFromString(selecterArys[i]);
        [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:imageArys[i] forState:UIControlStateNormal];
      //  btn.imageEdgeInsets = UIEdgeInsetsMake(7, 10, 7, 20);
        
        [self.rightBtnContentView addSubview:btn];
        btn.sd_layout
        .centerYIs(42)
        .rightSpaceToView(self.rightBtnContentView, 15 + 30 *i)
        .widthIs(20)
        .heightIs(20);
    }
}

- (void)setRightBtnTitle:(NSString *)title target:(id)target action:(SEL)action{
    if (title) {
        
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:MALLColor forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        btn.titleLabel.font = FONT(14);
        btn.sd_layout
        .centerYIs(42)
        .rightSpaceToView(self, 12 )
        .widthIs(40)
        .heightEqualToWidth();
    }
}

- (void)hideShadow{
    self.lineView.hidden = YES;
}

- (void)displayShadow{
    self.lineView.hidden = NO;
}

- (void)setLeftImage:(UIImage *)image{
    [self.leftBtn setImage:image forState:UIControlStateNormal];
}

- (void)setLeftTitle:(NSString *)string{
    [self.leftBtn setTitle:string forState:UIControlStateNormal];
    self.leftBtn.titleLabel.font = FONT(14);
    [self.leftBtn setTitleColor:MALLColor forState:UIControlStateNormal];
//    [self.leftBtn setImage:nil forState:UIControlStateNormal];
    [self.leftBtn setImage:nil forState:UIControlStateNormal];
}


- (void)setTitletext:(NSString *)title{
      self.titleLb.text = title;
}

#pragma mark ----------------动作

- (void)mallTopViewLeftBtnAction{
    if (self.block) {
        self.block();
    }
}


#pragma mark ---------实例化

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(17);
        _titleLb.textColor = BLACKTEXTCOLOR;
    }
    return _titleLb;
    
}

- (UIButton *)leftBtn{
    if (_leftBtn == nil) {
        _leftBtn = [[UIButton alloc] init];
        [_leftBtn setImage:IMAGE(@"classify15") forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(mallTopViewLeftBtnAction) forControlEvents:UIControlEventTouchUpInside];
        _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 10, 7, 20);
        
    }
    return _leftBtn;
}

- (UIView *)coverView{
    if (_coverView == nil) {
        _coverView = [[UIView alloc] initWithFrame:self.bounds];
        
    }
    return _coverView;
}
- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (UIView *)rightBtnContentView{
    if (_rightBtnContentView == nil) {
        _rightBtnContentView = [[UIView alloc] init];
    }
    return _rightBtnContentView;
}


@end
