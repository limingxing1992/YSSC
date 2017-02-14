//
//  UserProcessor.h
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProcessor.h"

@interface UserProcessor : BaseProcessor
/**获取用户信息*/
- (void)getUserInfoWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

/**编辑用户信息*/
- (void)editUserInfoWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;
/**编辑电话号码*/
- (void)editPhoneNumberWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

/**获取用户收货地址列表*/
- (void)getUserAddressWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;
/**新增、修改收货地址*/
- (void)saveUserAddressWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;
/**删除收货地址*/
-(void)removeUserAddressWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure;
/**设置默认地址*/
- (void)setDefAddressWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;
/**修改密码*/
-(void)editPasswordWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

/**获取伍云珠明细列表*/
- (void)getUserBalanceWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;
/**获取乡宿订单*/
- (void)getUserHotelOrderWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id responseObject))success
                                failure:(void (^)(NSError *error))failure;
/**获取乡宿订单详情*/
- (void)getUserHotelOrderDetailWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id responseObject))success
                                      failure:(void (^)(NSError *error))failure;
/**取消乡宿订单*/
- (void)cancelHotelOrderDetailWithDictionary:(NSDictionary *)parameters
                                     success:(void (^)(id responseObject))success
                                     failure:(void (^)(NSError *error))failure;
/**删除购物车商品*/
- (void)removeShopCarGoodsWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id responseObject))success
                                 failure:(void (^)(NSError *error))failure;
/**获取我的商品订单*/
- (void)getUserGoodsOrderWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id responseObject))success
                                failure:(void (^)(NSError *error))failure;
/**获取我的商品订单详情*/
- (void)getUserGoodsOrderDetailWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id responseObject))success
                                      failure:(void (^)(NSError *error))failure;
/**取消我的商品订单*/
- (void)cancelUserGoodsOrderDetailWithDictionary:(NSDictionary *)parameters
                                         success:(void (^)(id responseObject))success
                                         failure:(void (^)(NSError *error))failure;

/**商品订单确认收货*/
- (void)confirmReceiveGoodWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id responseObject))success
                                 failure:(void (^)(NSError *error))failure;
/**获取我的收藏列表*/
- (void)getMyFavoriteGoodsWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id responseObject))success
                                 failure:(void (^)(NSError *error))failure;
/**获取想住*/
- (void)getHotelCollectWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;
/**获取住过*/
- (void)getHotelLivedWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;
/**获取用户礼物*/
- (void)getUserGiftWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;
/**获取邀请码*/
- (void)getInviteCodeWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;

/**未读系统消息统计和订单消息统计*/
- (void)getAllMessageWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;
/**获取系统消息*/
- (void)getPushMessageWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;
/**获取订单消息*/
- (void)getOrderMessageWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;
/**获取订单消息详情*/
- (void)getOrderMessageDetailWithDictionary:(NSDictionary *)parameters
                                    success:(void (^)(id responseObject))success
                                    failure:(void (^)(NSError *error))failure;
/**获取系统消息详情*/
- (void)getPushMessageDetailWithDictionary:(NSDictionary *)parameters
                                   success:(void (^)(id responseObject))success
                                   failure:(void (^)(NSError *error))failure;
/**获取省市区*/
- (void)getAreaWithDictionary:(NSDictionary *)parameters
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;
/**评论商品订单*/
- (void)postOrderCommentWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure;
/**评论民宿订单*/
- (void)postHotelOrderCommentWithDictionary:(NSDictionary *)parameters
                                    success:(void (^)(id responseObject))success
                                    failure:(void (^)(NSError *error))failure;
/**申请退款*/
- (void)applyRefundWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

/**申请民宿退款*/
- (void)applyHotelRefundWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure;
/**已读或删除订单消息*/
- (void)readOrDeleteOrderMessageWithDictionary:(NSDictionary *)parameters
                                       success:(void (^)(id responseObject))success
                                       failure:(void (^)(NSError *error))failure;
/***********************************************
 函数名称 : getShopCarListWithParameters:
 函数秒数 ：获取购物车列表
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getShopCarListWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;

@end
