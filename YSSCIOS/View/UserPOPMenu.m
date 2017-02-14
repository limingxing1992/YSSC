//
//  UserPOPMenu.m
//  YSSCIOS
//
//  Created by Rock on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserPOPMenu.h"




@implementation UserPOPMenu


static UIButton *_coverBtn;
static UIWindow *_window;
static dismissBlock _dismiss;
static UIViewController *_contentVC;

+ (void)popFrom:(UIView *)fromView content:(UIView *)content dismiss:(dismissBlock)dismiss
{
    [self popFromRect:fromView.frame inView:fromView.superview content:content dismiss:dismiss];
}


+ (void)popFrom:(UIView *)fromView contentVC:(UIViewController *)contentVC dismiss:(dismissBlock)dismiss
{

    
    _contentVC = contentVC;
    // 显示
    [self popFrom:fromView content:_contentVC.view dismiss:dismiss];
    
}

+ (void)popFromRect:(CGRect)fromRect inView:(UIView *)inView content:(UIView *)content dismiss:(dismissBlock)dismiss
{
    _dismiss = [dismiss copy];
    // 1、创建window
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.hidden = NO;
    _window.windowLevel = UIWindowLevelAlert;
    
    // 2、创建蒙板
    UIButton *cover = [[UIButton alloc] init];
    cover.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    cover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    cover.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0];
    _coverBtn = cover;
    [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:0.25 animations:^{
        cover.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
    }];
    // 3、创建菜单的容器
    UIImageView *menuView = [[UIImageView alloc] init];
   // UIImage *image = [UIImage imageWithStretchableName:@"popover_background"];
   // menuView.image = image;
#pragma mark - 存放容器的view要进行交互，在它上面的控件才能进行交互------
    menuView.userInteractionEnabled = YES;
    content.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
    // 4、设置菜单内容的Frome
    menuView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
    menuView.backgroundColor = [UIColor redColor];
    // 5、添加控件到UI上
    // 将蒙板添加到window上
    [_window addSubview:cover];
    // 将菜单添加到蒙板上
    [cover addSubview:menuView];
    // 将内容添加到菜单上
    [menuView addSubview:content];
}
+ (void)coverClick:(UIButton *)btn
{
    
    [UIView animateWithDuration:0.25 animations:^{
        _coverBtn.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0];
    }];
    _window.hidden = YES;
    _window = nil;
    if (_dismiss != nil ) {
        _dismiss();
    }
}

@end
