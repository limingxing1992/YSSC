//
//  DatePickerButton.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ButtonState) {
    ButtonStateFirst, //第一个按钮
    ButtonStateMiddle,//中间
    ButtonStateLast,//最后
    ButtonStateNone,//清空状态
    ButtonStateSel,//选中
};

@interface DatePickerButton : UIButton

/**label*/
@property (nonatomic, strong) UILabel *tagLabel;

@property (nonatomic, assign) ButtonState flag;
//每一个按钮绑定一个时间属性
@property (nonatomic, strong) NSDate *date;

@end
