//
//  MallCollectionViewCell.h
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>


@class STL_GoodsItemModel;

@interface MallCollectionViewCell : UICollectionViewCell


- (void)updateInfoWith:(STL_GoodsItemModel *)model;

@end
