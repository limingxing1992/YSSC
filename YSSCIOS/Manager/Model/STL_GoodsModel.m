//
//  STL_GoodsModel.m
//  LSDevModel3
//
//  Created by 李明星 on 16/9/5.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "STL_GoodsModel.h"

@implementation STL_GoodsModel

@end


@implementation STL_GoodsListModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"goods": @"STL_GoodsItemModel"};
}

@end

@implementation STL_GoodsItemModel

- (NSString *)description{
    return [NSString stringWithFormat:@"名字：%@  价格：%@",self.goodsName,self.price];
}
@end