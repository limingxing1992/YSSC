//
//  YSSNavView.h
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSSNavView : UIView

@property (nonatomic, copy) NILBlock block;


@property (nonatomic, strong) UIView *coverView;

/*
 title:标题
 imageAry:按钮图标
 selecterArys:动作标题
 target:父视图控制器
 ret：是否显示返回按钮
 */

- (void)setTitleText:(NSString *)title imageArrays:(NSArray *)imageArys selecterArys:(NSArray *)selecterArys  target:(id)target isShowLeftBtn:(BOOL)ret;

- (void)setLeftTitle:(NSString *)string;
- (void)setLeftImage:(UIImage *)image;
- (void)setTitletext:(NSString *)title;
- (void)hideShadow;
- (void)displayShadow;
- (void)setRightBtnTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
