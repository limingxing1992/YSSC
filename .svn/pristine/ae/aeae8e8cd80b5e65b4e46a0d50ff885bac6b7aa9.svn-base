
//
//  YSSButtonListView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "YSSButtonListView.h"

@interface YSSButtonListView ()

/**选中的按钮*/
@property (nonatomic, strong) UIButton *selButton;
/**底部分割线*/
@property (nonatomic, strong) UIView *lineView;
/**所有的按钮*/
@property (nonatomic, strong) NSMutableArray *allBtns;

@end


@implementation YSSButtonListView


- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (NSMutableArray *)allBtns{
    if (_allBtns == nil) {
        _allBtns = [[NSMutableArray alloc] init];
    }
    return _allBtns;
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


//    self.lineView.sd_layout
//    .bottomSpaceToView(self, 0)
//    .leftEqualToView(self)
//    .rightEqualToView(self)
//    .heightIs(0.5);
}

- (void)setButtonTitleArray:(NSArray *)array{
    
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    [self.allBtns removeAllObjects];
    if (array) {
        for (NSInteger i = 0; i< array.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.font = FONT(14);
            [button setTitle:array[i] forState:UIControlStateNormal];
            [button setTitleColor:MALLColor forState:UIControlStateSelected];
            [button setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];

            [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.allBtns addObject:button];
            CGFloat width = SCREEN_WIDTH / array.count;
            
            
            CGFloat height = self.frame.size.height - 2.5;
            button.frame = CGRectMake(i * width, 0, width, height);
            [self addSubview:button];
            if (i == 0) {
                [self buttonDidClick:button];
            }
            
            
            if (i < array.count - 1) {
                //增加分割线
                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, 15)];
                lineView.backgroundColor = GRAYCOLOR;
                lineView.center = CGPointMake(width * (i + 1), self.frame.size.height * 0.5);
                [self addSubview:lineView];
            }
            
        }
    }
    
    [self addSubview:self.lineView];
    self.lineView.frame = CGRectMake(0, self.mj_h - 0.5, SCREEN_WIDTH, 0.5);
}

#pragma mark - 点击事件

- (void)buttonDidClick:(UIButton *)button{
    self.selButton.selected = NO;
    self.selButton = button;
    self.selButton.selected = YES;
    if ([self.delegate respondsToSelector:@selector(yssButtonListView:buttonDidSelect:)]) {
        [self.delegate yssButtonListView:self buttonDidSelect:button];
    }
   
}

- (UIButton *)selectBtnAtIndex:(NSInteger)index{
   
    UIButton *button = self.allBtns[index];
    [self buttonDidClick:button];
    return button;
    
}

@end
