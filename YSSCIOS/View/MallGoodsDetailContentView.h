//
//  MallGoodsDetailContentView.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STL_GoodsDetailBaseInfoModel;

@protocol MallGoodsDetailContentViewDelegate <NSObject>

- (void)selectedParame;//产品参数

- (void)selectedRank;//选择规格

@end

@interface MallGoodsDetailContentView : UIView

@property (nonatomic, assign) id<MallGoodsDetailContentViewDelegate> delegate;

- (void)updateInfoWith:(STL_GoodsDetailBaseInfoModel *)model;

@end
