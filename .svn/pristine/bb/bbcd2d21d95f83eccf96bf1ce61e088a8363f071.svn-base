//
//  MallBussHomeTableViewCell.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MallBussHomeTableViewCellDelegate <NSObject>

- (void)selectGoodsInHomeShop:(NSString *)mdf;

- (void)intoGoodsDetailWithID:(NSString *)Id;
@end


@interface MallBussHomeTableViewCell : UITableViewCell


@property (nonatomic, assign) id<MallBussHomeTableViewCellDelegate> delegate;

@property (nonatomic, copy) NSString *shopId;//商家id，用来请求banner图

- (void)updateWith:(NSArray *)ary ret:(BOOL)ret;

@end
