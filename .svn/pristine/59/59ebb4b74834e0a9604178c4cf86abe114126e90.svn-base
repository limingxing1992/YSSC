//
//  YSSButtonListView.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YSSButtonListViewDelegate <NSObject>

@optional

-(void)yssButtonListView:(UIView *)view buttonDidSelect:(UIButton *)button;

@end

@interface YSSButtonListView : UIView




///因为这个方法中使用到了自动布局，所以这个方法要在尺寸都确定后再调用
- (void)setButtonTitleArray:(NSArray *)array;

/**
 选中某个button

 @param index 选中第几个button
 */
- (UIButton *)selectBtnAtIndex:(NSInteger)index;
/**delegate*/
@property (nonatomic, assign) id<YSSButtonListViewDelegate> delegate;

@end
