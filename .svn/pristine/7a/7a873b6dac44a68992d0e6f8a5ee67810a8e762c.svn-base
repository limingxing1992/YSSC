//
//  YSSSliderButtonView.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YSSSliderButtonView;

@protocol YSSSliderButtonViewDelegate <NSObject>

-(void)ySSSliderButtonView:(YSSSliderButtonView *)view buttonDidClick:(UIButton *)button;
@end

@interface YSSSliderButtonView : UIView


///因为这个方法中使用到了自动布局，所以这个方法要在尺寸都确定后再调用
- (void)setButtonTitleArray:(NSArray *)array;

/**delegate*/
@property (nonatomic, assign) id<YSSSliderButtonViewDelegate> delegate;

@end
