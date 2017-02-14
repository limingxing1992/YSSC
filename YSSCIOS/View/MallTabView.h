//
//  MallTabView.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MallTabViewDelegate <NSObject>

@optional
- (void)enterBussHome;//进入商铺

- (void)callBussPhone;//拨打电话

- (void)enterShoppingCar;//进入购物车

- (void)addToShoppingCar;//添加商品到购物车

- (void)buyNow;//立即购买

@end

@interface MallTabView : UIView

@property (nonatomic, assign) id<MallTabViewDelegate> delegate;

@end
