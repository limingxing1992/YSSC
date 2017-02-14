//
//  UserManager.h
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"

@interface UserManager : BaseManager



/**获取用户信息*/
- (void)getUserInfoSuccess:(void (^)(id object))responseSuccess
                   failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**编辑用户信息*/
- (void)editUserInfoWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id object))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**编辑电话号码*/
- (void)editPhoneNumberWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取用户收货地址列表*/
- (void)getUserAddressWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**新增、修改用户地址*/
- (void)saveUserAddressWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**删除用户地址*/
- (void)removeUserAddressWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id object))responseSuccess
                                failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**设置默认地址*/
- (void)setDefAddressWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**修改密码*/
- (void)editPasswordWithOldPassWord:(NSString *)oldpw
                        newPassWord:(NSString *)newpw
                    confirmPassword:(NSString *)confirmpw
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取乌云珠明细列表*/
- (void)getUserBalanceWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**获取我的乡宿订单*/
- (void)getUserHotelOrderWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id object))responseSuccess
                                failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取我的乡宿订单详情*/
- (void)getUserHotelOrderDetailWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id object))responseSuccess
                                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**取消乡宿订单*/
- (void)cancelHotelOrderWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取我的商品订单列表*/
- (void)getUserGoodsOrderWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id object))responseSuccess
                                failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**获取我的商品订单详情*/
- (void)getUserGoodsOrderDetailWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id object))responseSuccess
                                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**取消我的商品订单*/
- (void)cancelUserGoodsOrderDetailWithDictionary:(NSDictionary *)parameters
                                         success:(void (^)(id object))responseSuccess
                                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**商品订单确认收货*/
- (void)confirmReceiveGoodWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id object))responseSuccess
                                 failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**删除购物车中商品*/
- (void)removeShopCarGoodsWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id object))responseSuccess
                                 failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**获取我的收藏列表*/
- (void)getMyFavoriteWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取想住*/
- (void)getHotelCollectWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取住过*/
- (void)getHotelLivedWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取礼物*/
- (void)getUserGiftWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id object))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取邀请码*/
- (void)getInviteCodeWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取全部消息*/
- (void)getAllMessageWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取系统消息*/
- (void)getPushMessageWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**获取订单消息*/
- (void)getOrderMessageWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**获取订单消息详情*/
- (void)getOrderMessageDetailWithDictionary:(NSDictionary *)parameters
                                    success:(void (^)(id object))responseSuccess
                                    failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取系统消息详情*/
- (void)getPushMessageDetailWithDictionary:(NSDictionary *)parameters
                                   success:(void (^)(id object))responseSuccess
                                   failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取省市区*/
- (void)getAreaWithDictionary:(NSDictionary *)parameters
                      success:(void (^)(id object))responseSuccess
                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**评论商品订单*/
- (void)postOrderCommentWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**评论民宿订单*/
- (void)postHotelOrderCommentWithDictionary:(NSDictionary *)parameters
                                    success:(void (^)(id object))responseSuccess
                                    failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**申请退款*/
- (void)applyRefundWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id object))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**申请民宿退款*/
- (void)applyHotelRefundWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**设置消息已读*/
- (void)readOrDeleteOrderMessage:(NSDictionary *)parameters
                         success:(void (^)(id object))responseSuccess
                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;


/***********************************************
 函数名称 : getShopCarListWithParameters:
 函数秒数 ：获取购物车列表
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/

- (void)getShopCarListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure;

/**存储用户信息*/
- (void)saveUserInfoToUserDefaults;


@end
