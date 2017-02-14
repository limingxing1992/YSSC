//
//  MallProcessor.m
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallProcessor.h"

/*
一级分类接口
 */
static NSString *const baseClassInterface = @"app/goods/classifyFirst.do";//一级分类接口
/*
 二级分类接口
 */
static NSString *const secondClassInterface = @"app/goods/classifySec.do";//二级分类接口
/*
 筛选信息接口
*/
static NSString *const classAttirbuteInterface = @"app/goods/getClassifyAttribute.do";//筛选信息接口
/*
 获取商品列表接口
 */
static NSString *const goodsListInterface = @"app/goods/goodsList.do";//商品列表接口
/*
 获取商品详情
 */
static NSString *const goodsDetailInterface = @"app/goods/goodsDetailBase.do";//商品详情
/*
 获取商品图文详情
 */
static NSString *const goodsDetailInfoInterface = @"app/goods/goodsDetailIntro.do";//商品图文

/*
 获取商品评论
 */
static NSString *const goodsCommentInterface = @"app/goods/goodsDetailComment.do";//商品详情
/*
获取商家动态
 */
static NSString *const shopNewsInterface = @"app/shop/shopnews.do";//商家动态

/*
 商家简介
 */
static NSString *const shopDetailsInterface = @"app/shop/shopDetails.do";//商家简介
/*
 商家广告
 */
static NSString *const shopBannerInterface = @"app/ad/getAds.do";//商家广告
/*
 添加购物
 */
static NSString *const addToCarInterface = @"app/shopping/addcart.do";//添加购物车
/*
 获取邮费
 */
static NSString *const expressInterface = @"app/express/expressPrice.do";//获取邮费
/*
 生成订单
 */
static NSString *const mallCreateOrderInterface = @"app/order/submitOrder.do";//生成订单
/*
 余额支付
 */
static NSString *const mallPayInterface = @"app/balance/payOrder";//余额支付



@implementation MallProcessor


#pragma mark ----------------获取一级分类信息

- (void)getMallBaseClassSuccess:(OBJBlock)success failure:(ERRORBlock)failure{
    
    [self afHTTPSessionManagerToServerInteractionWithInterface:baseClassInterface
                                                     parameter:nil
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------获取二级分类信息

- (void)getMallSecondClassWithDictonary:(NSDictionary *)parameters
                                success:(OBJBlock)success
                                failure:(ERRORBlock)failure
{
        [self afHTTPSessionManagerToServerInteractionWithInterface:secondClassInterface
                                                         parameter:parameters
                                                           success:success
                                                           failure:failure];
}


#pragma mark ----------------获取筛选条件

- (void)getClassifyAttributeWithDictonary:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:classAttirbuteInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------获取商品列表

- (void)getGoodsListWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:goodsListInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------获取商品详情

- (void)getGoodsDetailWithMainMdf:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:goodsDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------获取商品图文详情

- (void)getGoodsDetailInfoWithMainMdf:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:goodsDetailInfoInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------获取商品评论

- (void)getGoodsCommentWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:goodsCommentInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------商家动态

- (void)getShopnewsWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:shopNewsInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------商家简介
- (void)getShopDetailsWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:shopDetailsInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------商家头部广告

- (void)getShopBannerWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:shopBannerInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------添加商品至购物车

- (void)getAddToStoreCarWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:addToCarInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------获取邮费

- (void)getExpressPriceWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:expressInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------生成订单

- (void)getMallCreateOrderWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:mallCreateOrderInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------余额支付
- (void)getBalancePayForWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:mallPayInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

@end
