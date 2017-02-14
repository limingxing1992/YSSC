//
//  HotelDetailChooseView.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickBlock)(UIButton *button);

@interface HotelDetailChooseView : UIView

@property (nonatomic, copy) ButtonClickBlock buttonClickBlock;

- (void)buttonDidClick:(ButtonClickBlock)block;

//设置时间
- (void)setdateArray:(NSMutableArray *)dateArr;

@end
