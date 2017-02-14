//
//  DatePickView.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewDelegate <NSObject>

@optional

- (void)datePickerViewDidSelectDate:(NSMutableArray *)dateArr;

@end

@interface DatePickView : UIScrollView

///当前cell需要显示的时间
@property (nonatomic, strong) NSDate *date;
/**delegate*/
@property (nonatomic, assign) id <DatePickerViewDelegate> pickDelegate;

/**
 重置所有选中的日期
 */
- (void)reSetDate;

@end
