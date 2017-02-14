//
//  UserProcessor.m
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserProcessor.h"



@implementation UserProcessor

/*请求用户信息*/
static NSString *const GetUserInfoInterface = @"app/user/getUserInfo.do";
/*编辑用户信息*/
static NSString *const EditUserInfoInterface = @"app/user/editUserInfo.do";
/*修改手机号*/
static NSString *const EditPhoneNumberInterface = @"app/user/reBind.do";
/*获取用户收货地址列表*/
static NSString *const GetUserAddressInterface = @"app/address/userAddr.do";
/*修改添加收货地址*/
static NSString *const SaveUserAddressInterface = @"app/address/saveAddress.do";
/*删除收货地址*/
static NSString *const RemoveUserAddressInterface = @"app/address/removeAddressById.do";
/*设置默认地址*/
static NSString *const SetDefAddressInterface = @"app/address/defAddr.do";
/*修改密码*/
static NSString *const EditPasswordInterface = @"app/user/editPassword.do";
/*获取乌云珠明细列表*/
static NSString *const GetUserBalanceInterface = @"app//user/balance/all.do";
/*获取乡宿订单*/
static NSString *const GetUserHotelOrderInterface = @"app/village/order/myOrder";
/*购物车列表接口*/
static NSString *const StoreCarListInterface = @"app/shopping/myCart.do"; //购物车列表接口
/*购物车商品删除接口*/
static NSString *const StoreCarDelGoodInterface = @"app/shopping/delcart.do";
/*获取名宿订单详情*/
static NSString *const GetUserHotelOrderDetailInterface = @"app/village/order/orderDetail";
/*取消乡宿订单*/
static NSString *const CancelHotelOrderDetailInterface = @"app/village/order/cancleVillageOrder.do";

/*获取我的商品订单*/
static NSString *const GetUserGoodsOrderInterface = @"app/order/myOrder.do";
/*获取我的商品订单详情*/
static NSString *const GetUserGoodsOrderDetailInterface = @"app/order/orderDetail.do";
/*取消商品订单*/
static NSString *const CancelUserGoodsOrderInterface = @"app/order/cancleOrder.do";
/*确认收货*/
static NSString *const ConfirmReceiveGoodInterface = @"app/order/confirmReceipt.do";

/*收藏列表*/
static NSString *const GetMyFavoriteInterface = @"app/collection/getCollectionList.do";

/*想住列表*/
static NSString *const GetHotelCollectInterface = @"app/collection/villageCollect.do";
/*住过列表*/
static NSString *const GetHotelLivedInterface = @"app/village/livedVillageList.do";

/*礼物*/
static NSString *const GetUserGiftInterface = @"app/gift/all.do";
/*邀请码*/
static NSString *const GetInviteCodeInterface = @"app/user/getMeInviteCode.do";

/*未读系统消息统计和订单消息统计*/
static NSString *const GetAllMessageInterface = @"app/user/message/getMsgCenter";
/*获取系统消息*/
static NSString *const GetPushMessageInterface = @"app/user/message/listPushMessage";
/*获取订单消息*/
static NSString *const GetOrderMessageInterface = @"app/user/message/listOrderMessage";

/*获取订单消息详情*/
static NSString *const GetOrderMessageDetailInterface = @"app/user/message/getOrderMessageDetail";
/*获取系统消息详情*/
static NSString *const GetPushMessageDetailInterface = @"app/user/message/getPushMessageDetail";

/*获取省市区*/
static NSString *const GetAreaInterface = @"app/area/getArea.do";
/*评论商品订单*/
static NSString *const PostOrderCommentInterface = @"app/order/orderComment.do";

/*评论民宿订单*/
static NSString *const PostHotelOrderCommentInterface = @"app/village/order/commentVillageOrder.do";

/*申请商品退款*/
static NSString *const ApplyRefundInterface = @"app/order/applyRefund.do";
/*申请民宿退款*/
static NSString *const ApplyHotelRefundInterface = @"app/village/order/applyRefund.do";
/*已读或删除订单消息*/
static NSString *const ReadOrDeleteOrderMessageInterface = @"app/user/message/readOrDeleteOrderMessage";

#pragma mark --------- 获取个人信息

- (void)getUserInfoWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{
    
    
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetUserInfoInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

-(void)editUserInfoWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{
    
    
    [self afHTTPSessionManagerToServerInteractionWithInterface:EditUserInfoInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

-(void)editPhoneNumberWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:EditPhoneNumberInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

-(void)getUserAddressWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetUserAddressInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


-(void)saveUserAddressWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:SaveUserAddressInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

-(void)removeUserAddressWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:RemoveUserAddressInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

-(void)editPasswordWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:EditPasswordInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)setDefAddressWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:SetDefAddressInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getUserBalanceWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetUserBalanceInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getUserHotelOrderWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id responseObject))success
                                failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetUserHotelOrderInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}
- (void)getUserHotelOrderDetailWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id responseObject))success
                                      failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetUserHotelOrderDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)cancelHotelOrderDetailWithDictionary:(NSDictionary *)parameters
                                     success:(void (^)(id responseObject))success
                                     failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:CancelHotelOrderDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getUserGoodsOrderWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id responseObject))success
                                failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetUserGoodsOrderInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getUserGoodsOrderDetailWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id responseObject))success
                                      failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetUserGoodsOrderDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)cancelUserGoodsOrderDetailWithDictionary:(NSDictionary *)parameters
                                         success:(void (^)(id responseObject))success
                                         failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:CancelUserGoodsOrderInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)confirmReceiveGoodWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id responseObject))success
                                 failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:ConfirmReceiveGoodInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)removeShopCarGoodsWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id responseObject))success
                                 failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:StoreCarDelGoodInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getMyFavoriteGoodsWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id responseObject))success
                                 failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetMyFavoriteInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getHotelCollectWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelCollectInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


- (void)getHotelLivedWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelLivedInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getUserGiftWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetUserGiftInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getInviteCodeWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetInviteCodeInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

//未读系统消息统计和订单消息统计
- (void)getAllMessageWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetAllMessageInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getPushMessageWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetPushMessageInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getOrderMessageDetailWithDictionary:(NSDictionary *)parameters
                                    success:(void (^)(id responseObject))success
                                    failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetOrderMessageDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getPushMessageDetailWithDictionary:(NSDictionary *)parameters
                                   success:(void (^)(id responseObject))success
                                   failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetPushMessageDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

- (void)getOrderMessageWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetOrderMessageInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

//获取省市区
- (void)getAreaWithDictionary:(NSDictionary *)parameters
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetAreaInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 评论商品订单
- (void)postOrderCommentWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:PostOrderCommentInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 评论民宿订单
- (void)postHotelOrderCommentWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:PostHotelOrderCommentInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


//申请退款
- (void)applyRefundWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:ApplyRefundInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


//申请民宿退款
- (void)applyHotelRefundWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:ApplyHotelRefundInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}
//已读或删除订单消息
- (void)readOrDeleteOrderMessageWithDictionary:(NSDictionary *)parameters
                                       success:(void (^)(id responseObject))success
                                       failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:ReadOrDeleteOrderMessageInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------获取购物车列表信息

- (void)getShopCarListWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:StoreCarListInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}




@end

