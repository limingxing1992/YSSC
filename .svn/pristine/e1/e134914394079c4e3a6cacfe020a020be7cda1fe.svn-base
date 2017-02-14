//
//  HotelProcessor.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelProcessor.h"

@implementation HotelProcessor


/*乡宿主题接口*/
static NSString *const GetClassifyInterface = @"/app/village/classify/getVillageTheme";
/*乡宿列表接口*/
static NSString *const GetHotelListInterface = @"app/village/villageList";
/*乡宿详情接口*/
static NSString *const GetHotelDetailInterface = @"app/village/villageDetail";
/*乡宿获取房型列表*/
static NSString *const GetRoomListInterface = @"app/village/room/roomList";
/*乡宿获取房型详情*/
static NSString *const GetRoomDetailInterface = @"app/village/room/roomDetail";
/*获取订单*/
static NSString *const GetHotelOrderInterface = @"app/village/order/submitOrder";
/*获取评论*/
static NSString *const GetHotelCommentInterface = @"app/village/room/getRoomCommentList";
/*获取广告*/
static NSString *const GetHotelAdInterface = @"app/ad/getAds.do";
/*获取热门城市*/
static NSString *const GetHotelHotCityInterface = @"app/area/hotCityList";
/*请求微信支付*/
static NSString *const GetHotelWXPayInterface = @"app/wxpay/payOrder.do";
/*请求支付宝支付*/
static NSString *const GetHotelAliPayInterface = @"app/alipay/payOrder.do";
/*请求支付宝wap支付*/
static NSString *const GetWapAliPayInterface = @"app/alipay/aliWapPay.do";
/*请求余额支付*/
static NSString *const GetHotelBalancePayInterface = @"app/balance/payOrder";
/*请求全部城市*/
static NSString *const GetAllCityListInterface = @"/app/village/getCityModelList.do";
/*请求首页推荐城市*/
static NSString *const GetHomePageCityListInterface = @"/app/village/getIndexCityList.do";




#pragma mark - 获取乡宿主题

- (void)getClassifyWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetClassifyInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}
#pragma mark - 获取乡宿列表

- (void)getHotelListWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelListInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 获取乡宿详情
- (void)getHotelDetailWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 获取房型列表
- (void)getRoomListWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetRoomListInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 获取房型详情
- (void)getRoomDetailWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetRoomDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 下订单

- (void)getHotelOrderWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelOrderInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 请求微信支付

- (void)getHotelWXPayWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelWXPayInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}
#pragma mark - 请求支付宝支付

- (void)getHotelAliPayWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelAliPayInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark - 支付宝wap支付

- (void)getWapAliPayWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetWapAliPayInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 请求余额支付

- (void)getHotelBalancePayWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelBalancePayInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}



#pragma mark - 获取乡宿评论

- (void)getHotelCommentWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelCommentInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark - 获取广告

- (void)getHotelAdWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelAdInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 获取热门城市

- (void)getHotelHotCityWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHotelHotCityInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}
#pragma mark - 获取全部城市列表
- (void)getAllCityListWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetAllCityListInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark - 获取首页城市列表
- (void)getHomePageCityListWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetHomePageCityListInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


@end
