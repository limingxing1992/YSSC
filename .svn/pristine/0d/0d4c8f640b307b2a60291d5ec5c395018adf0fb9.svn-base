//
//  UserManager.m
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserManager.h"
#import "UserProcessor.h"
#import <MJExtension/MJExtension.h>
#import "UserInfoObject.h"
#import "UserAddressObject.h"
#import "UserBalanceObject.h"
#import "UserHotelOrderObject.h"
#import "UserHotelOrderDetailObject.h"
#import "UserGoodsOrderObject.h"
#import "UserGoodsOrderDetailObject.h"
#import "UserFavoriteObject.h"
#import "HotelObject.h"
#import "UserGiftObject.h"
#import "UserInviteCodeObject.h"
#import "UserAllMessageObject.h"
#import "AreaObject.h"
#import "UserPushMessageObject.h"
#import "UserMessageDetailObject.h"


@interface UserManager ()

@property(nonatomic,strong)UserProcessor *userProcessor;

@end

@implementation UserManager



- (instancetype)init
{
    if (self = [super init]) {
        _userProcessor = [[UserProcessor alloc] init];
    }
    return self;
}

#pragma mark --------- 请求用户信息
//请求用户信息
- (void)getUserInfoSuccess:(void (^)(id object))responseSuccess
                   failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure
{
    YSSCWeakObj(self)
    [_userProcessor getUserInfoWithDictionary:nil success:^(id responseObject) {
//        NSLog(@"用户%@",responseObject);
        UserInfoObject *userInfoObject = [UserInfoObject mj_objectWithKeyValues:responseObject];
        responseSuccess(userInfoObject);
        if (userInfoObject.errorCode.integerValue == SeverStateSuccess) {
            [weakself saveUserInfo:userInfoObject.data];
        }
        userInfoObject = nil;
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
    
    
}
#pragma mark --------- 编辑用户信息
//编辑用户信息
- (void)editUserInfoWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id object))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor editUserInfoWithDictionary:parameters success:^(id responseObject) {
        //        NSLog(@"修改昵称%@",responseObject);
        ServerStatusObject *editUserInfoObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(editUserInfoObject);
        editUserInfoObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 编辑电话号
//编辑电话号
- (void)editPhoneNumberWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor editPhoneNumberWithDictionary:parameters success:^(id responseObject) {
        
        ServerStatusObject *phoneObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(phoneObject);
        phoneObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}
#pragma mark --------- 获取用户收货地址
//获取用户收货地址列表
- (void)getUserAddressWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getUserAddressWithDictionary:parameters success:^(id responseObject) {
        UserAddressObject *addressObject = [UserAddressObject mj_objectWithKeyValues:responseObject];
        responseSuccess(addressObject);
        addressObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 新增修改收货地址
//新增、修改收货地址
- (void)saveUserAddressWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor saveUserAddressWithDictionary:parameters success:^(id responseObject) {
        
        //        NSLog(@"新增、修改收货地址%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 删除收货地址
//删除收货地址
- (void)removeUserAddressWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id object))responseSuccess
                                failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor removeUserAddressWithDictionary:parameters success:^(id responseObject) {
        
        //        NSLog(@"删除收货地址%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 设置默认地址
//设置默认地址
- (void)setDefAddressWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor setDefAddressWithDictionary:parameters success:^(id responseObject) {
        
        //        NSLog(@"设置默认收货地址%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 修改密码
//修改密码
- (void)editPasswordWithOldPassWord:(NSString *)oldpw
                        newPassWord:(NSString *)newpw
                    confirmPassword:(NSString *)confirmpw
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    
    NSDictionary *parameters = @{@"curpw":[oldpw MD5Hash],
                                 @"newpw":[newpw MD5Hash],
                                 @"confirmPw":[confirmpw MD5Hash]};
    
    
    YSSCWeakObj(self);
    [_userProcessor editPasswordWithDictionary:parameters success:^(id responseObject) {
        
        //        NSLog(@"修改密码%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取乌云珠
//获取伍云珠明细列表
- (void)getUserBalanceWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getUserBalanceWithDictionary:parameters success:^(id responseObject) {
        //         NSLog(@"获取乌云珠明细列表%@",responseObject);
        UserBalanceObject *userBalanceObject = [UserBalanceObject mj_objectWithKeyValues:responseObject];
        responseSuccess(userBalanceObject);
        userBalanceObject = nil;
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取乡宿订单
//获取乡宿订单
- (void)getUserHotelOrderWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id object))responseSuccess
                                failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getUserHotelOrderWithDictionary:parameters success:^(id responseObject) {
//        NSLog(@"获取乡宿订单%@",responseObject);
        UserHotelOrderObject *hotelOrderObject = [UserHotelOrderObject mj_objectWithKeyValues:responseObject];
        responseSuccess(hotelOrderObject);
        hotelOrderObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}
#pragma mark --------- 获取乡宿订单详情
//获取乡宿订单详情
- (void)getUserHotelOrderDetailWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id object))responseSuccess
                                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getUserHotelOrderDetailWithDictionary:parameters success:^(id responseObject) {
//          NSLog(@"获取乡宿订单详情%@",responseObject);
        UserHotelOrderDetailObject *hotelOrderDetailObject = [UserHotelOrderDetailObject mj_objectWithKeyValues:responseObject];
        responseSuccess(hotelOrderDetailObject);
        hotelOrderDetailObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}
#pragma mark --------- 取消乡宿订单
//取消乡宿订单
- (void)cancelHotelOrderWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor cancelHotelOrderDetailWithDictionary:parameters success:^(id responseObject) {
        //        NSLog(@"取消订单%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}
#pragma mark --------- 获取我的商品订单列表
//获取我的商品订单列表
- (void)getUserGoodsOrderWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id object))responseSuccess
                                failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getUserGoodsOrderWithDictionary:parameters success:^(id responseObject) {
        //        NSLog(@"获取我的商品订单%@",responseObject);
        UserGoodsOrderObject *goodsOrderObject = [UserGoodsOrderObject mj_objectWithKeyValues:responseObject];
        responseSuccess(goodsOrderObject);
        goodsOrderObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取我的商品订单详情

- (void)getUserGoodsOrderDetailWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id object))responseSuccess
                                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getUserGoodsOrderDetailWithDictionary:parameters success:^(id responseObject) {
        //        NSLog(@"获取我的商品订单详情%@",responseObject);
        UserGoodsOrderDetailObject *goodsOrderDetailObject = [UserGoodsOrderDetailObject mj_objectWithKeyValues:responseObject];
        responseSuccess(goodsOrderDetailObject);
        goodsOrderDetailObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 取消我的商品订单详情

- (void)cancelUserGoodsOrderDetailWithDictionary:(NSDictionary *)parameters
                                         success:(void (^)(id object))responseSuccess
                                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor cancelUserGoodsOrderDetailWithDictionary:parameters success:^(id responseObject) {
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 商品订单确认收货

- (void)confirmReceiveGoodWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id object))responseSuccess
                                 failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    
    
    YSSCWeakObj(self);
    [_userProcessor confirmReceiveGoodWithDictionary:parameters success:^(id responseObject) {
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
//        NSLog(@"%@",responseObject);
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 删除购物车中商品
- (void)removeShopCarGoodsWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id object))responseSuccess
                                 failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor removeShopCarGoodsWithDictionary:parameters success:^(id responseObject) {
        //        NSLog(@"删除购物车中商品%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取我的收藏列表

- (void)getMyFavoriteWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getMyFavoriteGoodsWithDictionary:parameters success:^(id responseObject) {
        
        NSLog(@"获取我的收藏列表%@",responseObject);
        UserFavoriteObject *favoriteObject = [UserFavoriteObject mj_objectWithKeyValues:responseObject];
        responseSuccess(favoriteObject);
        favoriteObject = nil;
    
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
        NSLog(@"获取我的收藏列表%@",error);
    }];
}

#pragma mark --------- 获取想住

- (void)getHotelCollectWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getHotelCollectWithDictionary:parameters success:^(id responseObject) {
                 NSLog(@"获取想住列表%@",responseObject);
        HotelObject *hotelObject = [HotelObject mj_objectWithKeyValues:responseObject];
        responseSuccess(hotelObject);
        hotelObject = nil;
        
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取住过

- (void)getHotelLivedWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getHotelLivedWithDictionary:parameters success:^(id responseObject) {
         NSLog(@"获取住过列表%@",responseObject);
        HotelObject *hotelObject = [HotelObject mj_objectWithKeyValues:responseObject];
        responseSuccess(hotelObject);
        hotelObject = nil;
        
        
    } failure:^(NSError *error) {
        
        NSLog(@"获取住过列表%@",error);
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取礼物

- (void)getUserGiftWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id object))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getUserGiftWithDictionary:parameters success:^(id responseObject) {
        
        UserGiftObject *giftObject = [UserGiftObject mj_objectWithKeyValues:responseObject];
        responseSuccess(giftObject);
        giftObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}


#pragma mark --------- 获取邀请码

- (void)getInviteCodeWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getInviteCodeWithDictionary:parameters success:^(id responseObject) {
        
        UserInviteCodeObject *inviteCodeObject = [UserInviteCodeObject mj_objectWithKeyValues:responseObject];
        responseSuccess(inviteCodeObject);
        inviteCodeObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取未读系统消息统计和订单消息统计

- (void)getAllMessageWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getAllMessageWithDictionary:parameters success:^(id responseObject) {
        //         NSLog(@"获取未读系统消息统计和订单消息统计%@",responseObject);
        UserAllMessageObject *userAllMessageObject = [UserAllMessageObject mj_objectWithKeyValues:responseObject];
        
        responseSuccess(userAllMessageObject);
        userAllMessageObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取系统消息

- (void)getPushMessageWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getPushMessageWithDictionary:parameters success:^(id responseObject) {
        
        //        NSLog(@"获取系统消息%@",responseObject);
        UserPushMessageObject *pushObject = [UserPushMessageObject mj_objectWithKeyValues:responseObject];
        responseSuccess(pushObject);
        pushObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取订单消息

- (void)getOrderMessageWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getOrderMessageWithDictionary:parameters success:^(id responseObject) {
        
        NSLog(@"获取订单消息%@",responseObject);
        UserPushMessageObject *pushObject = [UserPushMessageObject mj_objectWithKeyValues:responseObject];
        responseSuccess(pushObject);
        pushObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取订单消息详情

- (void)getOrderMessageDetailWithDictionary:(NSDictionary *)parameters
                                    success:(void (^)(id object))responseSuccess
                                    failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getOrderMessageDetailWithDictionary:parameters success:^(id responseObject) {
        
        NSLog(@"===%@",responseObject);
        UserMessageDetailObject *orderDetail = [UserMessageDetailObject mj_objectWithKeyValues:responseObject];
        responseSuccess(orderDetail);
        orderDetail = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 获取系统消息详情

- (void)getPushMessageDetailWithDictionary:(NSDictionary *)parameters
                                   success:(void (^)(id object))responseSuccess
                                   failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getPushMessageDetailWithDictionary:parameters success:^(id responseObject) {
        
        UserMessageDetailObject *orderDetail = [UserMessageDetailObject mj_objectWithKeyValues:responseObject];
        responseSuccess(orderDetail);
        orderDetail = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}



#pragma mark --------- 获取省市区

- (void)getAreaWithDictionary:(NSDictionary *)parameters
                      success:(void (^)(id object))responseSuccess
                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getAreaWithDictionary:parameters success:^(id responseObject) {
        
        //        NSLog(@"获取省市区%@",responseObject);
        AreaObject *areaObject = [AreaObject mj_objectWithKeyValues:responseObject];
        responseSuccess(areaObject);
        areaObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark - 评论商品订单

- (void)postOrderCommentWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor postOrderCommentWithDictionary:parameters success:^(id responseObject) {
        
        //        NSLog(@"评论订单%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark - 评论民宿订单

- (void)postHotelOrderCommentWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor postHotelOrderCommentWithDictionary:parameters success:^(id responseObject) {
        
        //        NSLog(@"评论订单%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}


#pragma mark - 申请退款

- (void)applyRefundWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id object))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor applyRefundWithDictionary:parameters success:^(id responseObject) {
        
        NSLog(@"申请退款%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark --------- 申请民宿退款

- (void)applyHotelRefundWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor applyHotelRefundWithDictionary:parameters success:^(id responseObject) {
        
        NSLog(@"申请民宿退款%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
    } failure:^(NSError *error) {
        NSLog(@"申请民宿退款%@",error);
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}
#pragma mark --------- 设置消息已读
- (void)readOrDeleteOrderMessage:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_userProcessor readOrDeleteOrderMessageWithDictionary:parameters success:^(id responseObject) {
        
        NSLog(@"已读或删除订单消息%@",responseObject);
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
    } failure:^(NSError *error) {
        NSLog(@"已读或删除订单消息%@",error);
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}




#pragma mark ----------------获取购物车列表

- (void)getShopCarListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_userProcessor getShopCarListWithParameters:parameters
                                         success:^(id responObject) {
                                            NSLog(@"购物车信息: %@",responObject);
                                             if ([responObject[@"status"] isEqualToNumber:@1]) {
                                                 NSArray *data = responObject[@"data"];
                                                 NSMutableArray *newData = [NSMutableArray array];
                                                 for (NSInteger i = 0; i <data.count; i++) {
                                                     NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
                                                     NSDictionary *dict = data[i];
                                                     NSArray *goods = dict[@"goods"];
                                                     if (goods.count) {
                                                         NSMutableArray *newGoods = [NSMutableArray array];
                                                         for (NSInteger l = 0; l < goods.count; l++) {
                                                             NSDictionary *goodsItem = goods[l];
                                                             STL_GoodsDetailBaseSubItemModel *item = [[STL_GoodsDetailBaseSubItemModel alloc] init];
                                                             
                                                             item.mdf = goodsItem[@"subGoodsMdf"];
                                                             item.goodsName = goodsItem[@"goodsName"];
                                                             item.quantity = [goodsItem[@"quantity"] stringValue];
                                                             item.cartId = goodsItem[@"cartId"];
                                                             item.promotion_price = goodsItem[@"goodsprice"];
                                                             
                                                             if (goodsItem[@"amount"]) {
                                                                item.amount = [goodsItem[@"amount"] stringValue];
                                                             }else{
                                                                 item.amount = @"0";
                                                             }
                                                             
                                                             item.attr_name = goodsItem[@"attr_name"];
                                                             item.avalue = goodsItem[@"avalue"];
                                                             item.pic = goodsItem[@"img"];
                                                             [newGoods addObject:item];
                                                         }
                                                         [newDict setValue:newGoods forKey:@"goodsList"];//商品列表
                                                     }
                                                     [newDict setValue:dict[@"shopId"] forKey:@"shopId"];//店铺ID
                                                     [newDict setValue:dict[@"shopName"] forKey:@"shopName"];//店铺名字
                                                     [newData addObject:newDict];
                                                 }
                                                 
                                                 responseSuccess(newData);
                                             }else{
                                                 responseFailure(0, responObject[@"showMessage"]);
                                             }
                                             
                                         }
                                         failure:^(NSError *error) {
                                             responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                         }];
    
}



#pragma mark - 购物车删除



- (void)saveUserInfoToUserDefaults{
    [self getUserInfoSuccess:^(id object) {
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}


- (void)saveUserInfo:(UserInfoDataObject *)object{
    
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:object.username forKey:@"username"];
    [userDef setObject:object.name forKey:@"name"];
    [userDef setObject:object.nickname forKey:@"nickname"];
    [userDef setObject:object.sex forKey:@"sex"];
    [userDef setObject:object.phone forKey:@"phone"];
    [userDef setObject:object.email forKey:@"email"];
    [userDef setObject:object.head_img forKey:@"head_img"];
    [userDef setObject:object.type forKey:@"type"];
    [userDef setObject:object.shop_cart_num forKey:@"shop_cart_num"];
    [userDef setObject:object.inviteCode forKey:@"inviteCode"];
    [userDef synchronize];
}

@end
