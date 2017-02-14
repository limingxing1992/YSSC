//
//  DatePickView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "DatePickView.h"
#import "DatePickerButton.h"

@interface DatePickView ()

/**点击的按钮存入这个数组*/
@property (nonatomic, strong) NSMutableArray *clickedArr;
/**所有的button存入这个数组*/
@property (nonatomic, strong) NSMutableArray *countArr;

@end

@implementation DatePickView

- (NSMutableArray *)clickedArr{
    if (_clickedArr == nil) {
        _clickedArr = [NSMutableArray array];
    }
    return _clickedArr;
}

-(NSMutableArray *)countArr{
    if (_countArr == nil) {
        _countArr = [NSMutableArray array];
    }
    return _countArr;
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
    self.backgroundColor = [UIColor whiteColor];
    [self layoutMonth:[NSDate date]];
    [self layoutMonth:[self nextMonth:[NSDate date] count:1]];
    [self layoutMonth:[self nextMonth:[NSDate date] count:2]];
    
    
}


- (void)layoutMonth:(NSDate *)date{
    
    
    NSInteger daysInThisMonth = [self totaldaysInMonth:date];
    NSInteger firstWeekday = [self firstWeekdayInThisMonth:date];
    
    //今天是哪个月 用于计算tag
    NSInteger currentMonth = [self month:date];
    
   //今天是这个月第几天,判断传入日期是否是当前月
    NSInteger today = [self day:date];
    if (currentMonth != [self month:[NSDate date]]) {
        today = 1;
    }
    
    //今天是哪年
    NSInteger currentYear = [self year:date];
    //已经过去的天数需要排几行
    NSInteger count = (today + firstWeekday - 1) / 7;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    
    //布局每个月的标题
    CGFloat labelY = CGRectGetMaxY(self.subviews.lastObject.frame);
    titleLabel.frame = CGRectMake(0, labelY, SCREEN_WIDTH, 32);
    titleLabel.text = [NSString stringWithFormat:@"   %ld年%ld月",(long)currentYear,(long)currentMonth];
    
    titleLabel.backgroundColor = BACKGROUNDCOLOR;
    titleLabel.textColor = MALLColor;
    [self addSubview:titleLabel];
    //布局每一天的按钮
    CGFloat btnY = CGRectGetMaxY(self.subviews.lastObject.frame) + 5;
    for (NSInteger i = today; i <= daysInThisMonth; i ++) {
        DatePickerButton *datePickerBtn = [[DatePickerButton alloc] init];
        [datePickerBtn addTarget:self action:@selector(chooseDate:) forControlEvents:UIControlEventTouchUpInside];

        datePickerBtn.tag = currentYear * 10000 + currentMonth * 100 + i;
        
        CGFloat width = SCREEN_WIDTH / 7;// 7列
        CGFloat height = width; //6行
        
        NSInteger row = ((i + firstWeekday - 1)/7) - count;//第几行
        
        NSInteger line = (i + firstWeekday - 1)%7;//第几列
        
        [datePickerBtn setTitle:[NSString stringWithFormat:@"%ld",i] forState:UIControlStateNormal];
        
        
        datePickerBtn.frame = CGRectMake(width * line, height * row + btnY, width, height);
        //设置title的位置
        [datePickerBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, height * 0.5, 0)];
        [datePickerBtn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [self addSubview:datePickerBtn];
        
        //所有的按钮加入到数组中
        [self.countArr addObject:datePickerBtn];
        //布局完成后重新计算contentSize
        self.contentSize = CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.subviews.lastObject.frame));
    }

}

#pragma mark - 重置日期
- (void)reSetDate{
    for (DatePickerButton *tempBtn in self.countArr) {
        tempBtn.flag = ButtonStateNone;
        
    }
    [self.clickedArr removeAllObjects];
}


#pragma mark --------- 点击事件处理

- (void)chooseDate:(DatePickerButton *)btn{
  
    if (self.clickedArr.count < 2) {
        [self.clickedArr addObject:btn];
        if (_clickedArr.count == 1) {
            btn.tagLabel.text = @"入住";
        }else{
            btn.tagLabel.text = @"退房";
        }
        
        if ([self.pickDelegate respondsToSelector:@selector(datePickerViewDidSelectDate:)]) {
            NSString *temp =[NSString stringWithFormat:@"%ld",btn.tag];
            [self.pickDelegate datePickerViewDidSelectDate:[NSMutableArray arrayWithObject:temp]];
        }
        
    }else{
        
        for (DatePickerButton *but in self.countArr) {
            but.flag = ButtonStateNone;
        }
        [self.clickedArr removeAllObjects];
        [self.clickedArr addObject:btn];
        if (_clickedArr.count == 1) {
            btn.tagLabel.text = @"入住";
        }else{
            btn.tagLabel.text = @"退房";
        }
        if ([self.pickDelegate respondsToSelector:@selector(datePickerViewDidSelectDate:)]) {
            [self.pickDelegate datePickerViewDidSelectDate:nil];
        }
    }
 
    
    if (self.clickedArr.count == 2) {
  
        DatePickerButton *firstButton =  self.clickedArr.firstObject;
        DatePickerButton *lastButton = self.clickedArr.lastObject;
        firstButton.flag = ButtonStateFirst;
        lastButton.flag = ButtonStateLast;
        
        //如果第二次点击的按钮比第一次的日期早，清空所有按钮状态，并清空所有存在于数组中的按钮，从头开始
        if (lastButton.tag <= firstButton.tag) {
            
            for (DatePickerButton *tempBtn in self.countArr) {
                tempBtn.flag = ButtonStateNone;
                
            }
            [self.clickedArr removeAllObjects];
            return;
        }
        
        NSMutableArray *temp = [NSMutableArray array];//所有被选中的日期存入这个数组中
        [temp addObject:[NSString stringWithFormat:@"%ld",(long)firstButton.tag]];

        for (DatePickerButton *tempBtn in self.countArr) {
            if (tempBtn.tag > firstButton.tag && tempBtn.tag < lastButton.tag) {
                tempBtn.flag = ButtonStateMiddle;
                [temp addObject:[NSString stringWithFormat:@"%ld",(long)tempBtn.tag]];
                
            }

        }
        
        [temp addObject:[NSString stringWithFormat:@"%ld",(long)lastButton.tag]];
        
        //被选中的日期返回代理
        if ([self.pickDelegate respondsToSelector:@selector(datePickerViewDidSelectDate:)]) {
            [self.pickDelegate datePickerViewDidSelectDate:temp];
        }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    }
    
    btn.flag = ButtonStateSel;
//    NSLog(@"点击了按钮,%ld",btn.tag);
}

#pragma mark - date

- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}


- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}


- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

- (NSInteger)totaldaysInThisMonth:(NSDate *)date{
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}

- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

- (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate*)nextMonth:(NSDate *)date count:(NSInteger)count{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +count;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    
    NSLog(@"%@",newDate);
    return newDate;
}




@end
