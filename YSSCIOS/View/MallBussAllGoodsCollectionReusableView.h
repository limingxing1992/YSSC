//
//  MallBussAllGoodsCollectionReusableView.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MallBussAllGoodsCollectionReusableViewDelegate <NSObject>

- (void)reloadDataDelegate:(NSInteger)index;

@end

@interface MallBussAllGoodsCollectionReusableView : UICollectionReusableView


@property (nonatomic, assign) id<MallBussAllGoodsCollectionReusableViewDelegate> delegate;

@property (nonatomic, assign) NSInteger currentIndex;//当前选择排序 0 - 4 分别对应综合 ，销量 新品， 价格升序 ，价格降许



@end
