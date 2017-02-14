//
//  UserShopCarCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STL_GoodsDetailBaseSubItemModel;


typedef void(^buttonDidClick)(UIButton *button);

@interface UserShopCarCell : UITableViewCell

@property (nonatomic, copy) buttonDidClick block;

- (void)buttonDidClick:(buttonDidClick)block;

/**model*/
@property (nonatomic, strong) STL_GoodsDetailBaseSubItemModel *model;
/**减号*/
@property (nonatomic, strong) UIButton *minusButton;
/**加号*/
@property (nonatomic, strong) UIButton *plusButton;

@end
