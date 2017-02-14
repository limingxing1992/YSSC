//
//  UserTitleButton.m
//  YSSCIOS
//
//  Created by Rock on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserTitleButton.h"

@implementation UserTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 进行一次性的初始化
        // 设置图片
        [self setImage:[UIImage imageNamed:@"classify80"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"classify79"] forState:UIControlStateSelected];
        // 设置颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置图片居中
        self.titleLabel.contentMode = NSTextAlignmentCenter;
        // 设置标题居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 高亮状态时不需要调整图片
        self.adjustsImageWhenHighlighted = NO;
        // 设置Frame(如果是设置titleView，那么x/y无效)

        
        self.titleLabel.sd_layout
        .topEqualToView(self)
        .leftEqualToView(self)
        .bottomEqualToView(self);
        [self.titleLabel setSingleLineAutoResizeWithMaxWidth:100];
        
        self.imageView.sd_layout
        .topEqualToView(self)
        .rightEqualToView(self)
        .bottomEqualToView(self)
        .widthIs(20);
        [self sizeToFit];

    }
    return self;
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//   // if (self.currentImage == nil) return;
//    
//    // 交换两个控件的位置，只需要将x值进行调整
//    self.titleLabel.mj_x = self.imageView.mj_x;
//    self.imageView.mj_x = CGRectGetMaxX(self.titleLabel.frame) + 5;
//}

@end
