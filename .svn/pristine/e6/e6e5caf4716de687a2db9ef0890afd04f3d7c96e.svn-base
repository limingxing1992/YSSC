//
//  MallGoodsDetailRankView.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>


@class STL_GoodsDetailBaseSubItemModel;

@protocol MallGoodsDetailRankViewDelegate <NSObject>

- (void)selectItemWith:(STL_GoodsDetailBaseSubItemModel *)model;

- (void)addToStoreCarWithCurrentRank;

- (void)buyNowWithCurrentRank;

@end


@interface MallGoodsDetailRankView : UIView


@property (nonatomic, assign) id<MallGoodsDetailRankViewDelegate> delegate;

@property (nonatomic, copy) NSString *currentValue;


- (void)updateInfoWith:(STL_GoodsDetailBaseInfoModel *)model;

@end
