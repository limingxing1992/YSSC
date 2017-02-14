//
//  STL_GoodsModel.h
//  LSDevModel3
//
//  Created by 李明星 on 16/9/5.
//  Copyright © 2016年 sen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STL_GoodsListModel;

@interface STL_GoodsModel : BaseObject

@property (nonatomic, strong) STL_GoodsListModel *data;

@end

@interface STL_GoodsListModel : NSObject

@property (nonatomic, copy) NSString *classifyId;//分类ID。二级

@property (nonatomic, strong) NSArray *goods;//商品

@end

@interface STL_GoodsItemModel : NSObject

@property (nonatomic, copy) NSString *mainGoodsMdf;//主id
@property (nonatomic, copy) NSString *subGoodsMdf;//次id
@property (nonatomic, copy) NSString *goodsName;//商品名字
@property (nonatomic, copy) NSString *pic;//图片
@property (nonatomic, copy) NSString *price;//价格
@property (nonatomic, copy) NSString *minPrice;//最低价格
@property (nonatomic, copy) NSString *maxPrice;//最高价格
@property (nonatomic, copy) NSString *commentCount;//评论
@property (nonatomic, copy) NSString *orderCount;//已售

@end