//
//  MallBussAllGoodsTableViewCell.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MallBussAllGoodsTableViewCellDelegate <NSObject>

- (void)reloadDataWithIndex:(NSInteger)index;

- (void)selectGoodsInShopWith:(NSString *)mdf;

@end


@interface MallBussAllGoodsTableViewCell : UITableViewCell

@property (nonatomic, assign) id<MallBussAllGoodsTableViewCellDelegate> delegate;


- (void)updateInfoWithAry:(NSArray *)ary;

@end
