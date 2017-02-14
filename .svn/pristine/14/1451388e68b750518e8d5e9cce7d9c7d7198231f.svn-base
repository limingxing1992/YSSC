//
//  MallProcessor.h
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProcessor.h"

@interface MallProcessor : BaseProcessor

/***********************************************
 函数名称 : getMallBaseClassSuccess
 函数秒数 ：获取商城一级分类
 输入参数 : 无
 输出参数 : data
 返回值 :
 作者 :     李明星
 ***********************************************/

- (void)getMallBaseClassSuccess:(OBJBlock)success failure:(ERRORBlock)failure;

/***********************************************
 函数名称 : getMallSecondClassWithDictonary:
 函数秒数 ：获取二级分类
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/

- (void)getMallSecondClassWithDictonary:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;

/***********************************************
 函数名称 : getClassifyAttributeWithDictonary:
 函数秒数 ：根据二级分类获取筛选条件信息
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getClassifyAttributeWithDictonary:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/***********************************************
 函数名称 : getClassifyGoodsListWithParameters:
 函数秒数 ：根据分类ID和排序获取商品列表
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getGoodsListWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/***********************************************
 函数名称 : getGoodsDetailWithMainMdf:
 函数秒数 ：获取商品详情
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getGoodsDetailWithMainMdf:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/***********************************************
 函数名称 : getGoodsDetailInfoWithMainMdf:
 函数秒数 ：获取商品图文介绍
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getGoodsDetailInfoWithMainMdf:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;

/***********************************************
 函数名称 : getGoodsCommentWithParameters:
 函数秒数 ：获取商品评论
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getGoodsCommentWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/***********************************************
 函数名称 : getShopnewsWithParameters:
 函数秒数 ：商家动态
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getShopnewsWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;

/***********************************************
 函数名称 : getShopDetailsWithParameters:
 函数秒数 ：获取商家简介
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getShopDetailsWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/***********************************************
 函数名称 : getShopBannerWithParameters:
 函数秒数 ：
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getShopBannerWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;

/***********************************************
 函数名称 : getAddToStoreCarWithParameters:
 函数秒数 ：添加购物车
 输入参数 :mainGoodsMdf  subGoodsMdf  quantity
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getAddToStoreCarWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/***********************************************
 函数名称 : getExpressPriceWithParameters:
 函数秒数 ：获取邮费
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getExpressPriceWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/***********************************************
 函数名称 : getMallCreateOrderWithParameters:
 函数秒数 ：生成订单
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getMallCreateOrderWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/***********************************************
 函数名称 : getBalancePayForWithParameters:
 函数秒数 ：余额支付方式
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getBalancePayForWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;

@end
