//
//  DatePickerViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewControllerDelegate <NSObject>

@optional

/**
 返回选中的日期

 @param dateArray 日期数组
 */
- (void)datePickerVCSelectedDate:(NSMutableArray *)dateArray;
@end

@interface DatePickerViewController : UIViewController

/**delegate传递选中的日期*/
@property (nonatomic, assign) id<DatePickerViewControllerDelegate> delegate;

@end
