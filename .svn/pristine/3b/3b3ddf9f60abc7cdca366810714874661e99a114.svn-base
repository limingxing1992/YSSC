//
//  UserPOPMenu.h
//  YSSCIOS
//
//  Created by Rock on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^dismissBlock)();
@interface UserPOPMenu : NSObject
@property (nonatomic, strong) UIWindow *window;
/**
 *  显示菜单
 *
 *  fromView  需要指向的控件
 *  content   需要显示的控件
 *  dismiss   需要回调控制器内代码
 */
+ (void)popFrom:(UIView *)fromView content:(UIView *)content dismiss:(dismissBlock)dismiss;
/**
 *  显示菜单
 *
 *  fromRect  需要指向控件的frame
 *  inView    需要指向控件的父控件
 *  content   需要显示的控件
 *  dismiss   需要回调控制器内代码
 */
+ (void)popFromRect:(CGRect)fromRect inView:(UIView *)inView content:(UIView *)content dismiss:(dismissBlock)dismiss;
/**
 *  显示菜单
 *
 *  fromView  需要指向的控件
 *  contentVC 需要显示的控制器
 *  dismiss   需要回调控制器内代码
 */
+ (void)popFrom:(UIView *)fromView contentVC:(UIViewController *)contentVC dismiss:(dismissBlock)dismiss;

+ (void)coverClick:(UIButton *)btn;

@end
