//
//  YSSCycleScrollView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/28.
//  Copyright © 2016年 zzz. All rights reserved.
//在CycleScrollView上增加了属性

#import "YSSCycleScrollView.h"

@interface YSSCycleScrollView ()

/**头部标题*/
@property (nonatomic, strong) UILabel *headTitleLabel;
/**分割线*/
@property (nonatomic, strong) UIView *lineView;
/**详情*/
@property (nonatomic, strong) UILabel *headDetialLabel;

@end

@implementation YSSCycleScrollView

- (UILabel *)headTitleLabel{
    if (_headTitleLabel == nil) {
        _headTitleLabel = [[UILabel alloc] init];
        _headTitleLabel.font = [UIFont boldSystemFontOfSize:30];
        _headTitleLabel.textColor = [UIColor whiteColor];
    }
    return _headTitleLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}

- (UILabel *)headDetialLabel{
    if (_headDetialLabel == nil) {
        _headDetialLabel = [[UILabel alloc] init];
        _headDetialLabel.font = FONT(17);
        _headDetialLabel.textColor = [UIColor whiteColor];
    }
    return _headDetialLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [self addSubview:self.headTitleLabel];
    [self addSubview:self.lineView];
    [self addSubview:self.headDetialLabel];
    self.placeholderImage = IMAGE(@"placeholder_loading");
    self.headTitleLabel.sd_layout
    .topSpaceToView(self,140)
    .centerXEqualToView(self)
    .autoHeightRatio(0);
    [self.headTitleLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH)];
    

    
    self.headDetialLabel.sd_layout
    .topSpaceToView(self.headTitleLabel,25)
    .centerXEqualToView(self)
    .autoHeightRatio(0);
    [self.headDetialLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH)];
    
  //  self.headDetialLabel.backgroundColor = [UIColor redColor];

}

- (void)setTitle:(NSString *)title detailStr:(NSString *)detailStr{
    self.headTitleLabel.text = title;
    self.headDetialLabel.text = detailStr;
    CGFloat lineWidth = 0;
    if (self.headDetialLabel.text.length * 17 > self.headTitleLabel.text.length * 30) {
        lineWidth = self.headDetialLabel.text.length * 17;
    }else{
        lineWidth = self.headTitleLabel.text.length * 30;
    }
    self.lineView.sd_layout
    .topSpaceToView(self.headTitleLabel, 15)
    .centerXEqualToView(self)
    .widthIs(lineWidth * 1.1)
    .heightIs(0.5);
    self.lineView.mj_w = self.headDetialLabel.text.length * 17 * 1.1;
   
}

#pragma mark --------- cell增加分割线

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 5;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}

@end
