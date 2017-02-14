//
//  STL_DropDownMenu.h
//  LSDevModel3
//
//  Created by 李明星 on 16/9/5.
//  Copyright © 2016年 sen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol STL_DropDownMenuDelegate <NSObject>
@optional
/***********************************************
 函数名称 : didSelectIndex:
 函数秒数 ：选中item
 输入参数 : index 当前选中筛选或者排序或者分类  firstId一级分类id secId二级分类 ret//0点的左边1点的右边
 输出参数 :
 返回值 :
 作者 :    李明星
 ***********************************************/
- (void)didSelectIndex:(NSInteger)index firstId:(NSString *)firstId secId:(NSString *)secId leftOrRight:(BOOL)ret;

- (void)getClassLimit;                                                      //请求筛选条件

- (void)sumbitClassLimitAry:(NSArray *)data;                                //提交筛选

@end



@interface STL_DropDownMenu : UIView

@property (nonatomic, assign) id<STL_DropDownMenuDelegate> delegate;

/***********************************************
 函数名称 : initWithTitleAry:
 函数秒数 ：初始化菜单栏。传入初始标题，三个
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (instancetype)initWithTitleAry:(NSArray *)titles fram:(CGRect)frame;

- (void)updateFisrtDataWithAry:(NSArray *)data;                             //刷新一级分类
- (void)updateSecDataWithAry:(NSArray *)data;                               //刷新二级分类
- (void)updateLimitWithAry:(NSArray *)data;                                 //刷新筛选项

@end
