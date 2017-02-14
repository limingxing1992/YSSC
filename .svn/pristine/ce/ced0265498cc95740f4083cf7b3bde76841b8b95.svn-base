//
//  HotelChooseCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YSSChooseDateButton;

typedef void(^chooseBlock)(UIButton *button);

@interface HotelChooseCell : UITableViewCell


@property (nonatomic, strong) YSSChooseDateButton *choseBtn;
@property (nonatomic, copy) chooseBlock chooseDate;
@property (nonatomic, copy) chooseBlock moreInfo;

- (void)chooseDateButtonClick:(chooseBlock)block;
- (void)moreInfoBtnClick:(chooseBlock)block;

@end
