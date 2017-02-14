//
//  UserPresentationViewController.m
//  YSSCIOS
//
//  Created by Rock on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserPresentationViewController.h"

@interface UserPresentationViewController ()
@property (nonatomic, strong)UIButton *coverButton;
@end

@implementation UserPresentationViewController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    return [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
}


// 自定义转场即将展示时调用
- (void)presentationTransitionWillBegin {
    [super presentationTransitionWillBegin];

    // 1.添加蒙版
    self.coverButton.backgroundColor = [UIColor blackColor];
    self.coverButton.alpha = 0.3;
    self.coverButton.frame = self.containerView.bounds;
    [self.coverButton addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:self.coverButton];

}


// 即将布局存放在容器视图上的子控件时调用
- (void)containerViewWillLayoutSubviews {
    /*
     通过当前对象的containerView属性可以获取容器视图
     通过当前对象的presentedView()方法, 可以获取被弹出的控制器的view
     */
    
    // frame随着按钮位置的变化而变化
    //    cityButton.frame = CGRectMake(50, 60, 200, 50);
    //    self.presentedView.frame = CGRectMake(40, 78, 180, 140);
    self.presentedView.frame = CGRectMake(0 , SCREEN_HEIGHT * 0.618, SCREEN_WIDTH   , SCREEN_HEIGHT * 0.382);
    self.presentedView.backgroundColor = [UIColor whiteColor];
}

- (void)coverBtnClick:(UIButton *)coverBtnClick {
    // 关闭modal控制器
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 懒加载
- (UIButton *)coverButton {
    if (_coverButton == nil) {
        _coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _coverButton;
}


@end
