//
//  UserOrderGoodsCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserGoodsObject;

@interface UserOrderGoodsCell : UITableViewCell

/**model*/
@property (nonatomic, strong) UserGoodsObject *model;

////测试
//- (void)setName:(NSString *)name goodsType:(NSString *)type goodsMoney:(CGFloat)money count:(int)count;

@end
