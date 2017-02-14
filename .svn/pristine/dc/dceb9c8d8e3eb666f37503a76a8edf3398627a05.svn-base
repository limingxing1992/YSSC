//
//  MallTopView.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/10.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallTopView.h"

@interface MallTopView ()

@property (nonatomic, strong) UILabel *titleLb;//标题

@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, strong) UIView *backLeftview;


@property (nonatomic, strong) UIView *lineView;//下划线

@end

@implementation MallTopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLb];
        [self addSubview:self.backLeftview];
        [self addSubview:self.lineView];
        _titleLb.sd_layout
        .centerYIs(42)
        .centerXEqualToView(self)
        .autoHeightRatio(0);
        [_titleLb setSingleLineAutoResizeWithMaxWidth:self.frame.size.width];//标题宽度自适应
        
        _backLeftview.sd_layout
        .centerYIs(42)
        .leftSpaceToView(self, 0)
        .widthIs(50)
        .heightIs(50);
        
        self.leftBtn.sd_layout
        .centerYEqualToView(self.backLeftview)
        .leftSpaceToView(self.backLeftview, 15)
        .heightIs(18)
        .widthIs(10);
        
        self.lineView.sd_layout
        .bottomSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .rightSpaceToView(self, 0)
        .heightIs(0.5);
        
    }
    return self;


}


#pragma mark ----------------更新视图

- (void)setTitleText:(NSString *)title imageArrays:(NSArray *)imageArys selecterArys:(NSArray *)selecterArys  target:(id)target isShowLeftBtn:(BOOL)ret{
    if (!ret) {
        [self.leftBtn removeFromSuperview];
    }
    self.titleLb.text = title;
    
    if (!_btnAry) {
        _btnAry = [NSMutableArray array];
    }
    
    for (NSInteger i = 0; i < selecterArys.count; i++) {
        UIView *backView = [[UIView alloc] init];
        backView.backgroundColor = WHITECOLOR;
        [self addSubview:backView];
        backView.sd_layout
        .centerYIs(42)
        .rightSpaceToView(self, 40*i)
        .heightIs(40)
        .widthIs(40);
        SEL sel = NSSelectorFromString(selecterArys[i]);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:sel];
        [backView addGestureRecognizer:tap];
        
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:imageArys[i] forState:UIControlStateNormal];
        
        [_btnAry addObject:btn];
        
        [backView addSubview:btn];
        
        btn.sd_layout
        .centerYEqualToView(backView)
        .centerXEqualToView(backView)
        .heightIs(18)
        .widthIs(18);
    }
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
        [_leftBtn setBackgroundImage:IMAGE(@"classify15") forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(mallTopViewLeftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (UIView *)backLeftview{
    if (_backLeftview == nil) {
        _backLeftview = [[UIView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mallTopViewLeftBtnAction)];
        
        [_backLeftview addSubview:self.leftBtn];
        [_backLeftview addGestureRecognizer:tap];
    }
    return _backLeftview;
}
@end
