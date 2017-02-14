//
//  NSDate+Formater.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/7.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formater)
//判断今天是星期几
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
+ (NSInteger)day:(NSDate *)date;
+ (NSInteger)month:(NSDate *)date;
+ (NSInteger)year:(NSDate *)date;
/**计算两天相差几天*/
+ (NSInteger)getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate;

@end
