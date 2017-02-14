//
//  YSSBlockUserButton.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YSSBlockUserButton;

@interface YSSBlockUserButton : UIButton

typedef void (^TouchButton)(YSSBlockUserButton *button);

@property (nonatomic, copy) TouchButton block;

- (void)addTargetBlock:(TouchButton)touchButtonBlock;

@end
