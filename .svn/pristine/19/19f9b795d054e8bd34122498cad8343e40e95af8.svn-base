//
//  HotelManager.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseManager.h"

@interface HotelManager : BaseManager

/**获取首页类型列表*/
- (void)getClassifyWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id object))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取乡宿列表*/
- (void)getHotelListWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id object))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**获取房型列表*/
- (void)getRoomListWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id object))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取乡宿详情*/
- (void)getHotelDetailWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取房型详情*/
- (void)getRoomDetailWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取订单*/
- (void)getHotelOrderWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取微信支付*/
- (void)getHotelWXPayWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取支付宝支付*/
- (void)getHotelAliPayWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**支付宝wap支付*/
- (void)getWapAliPayWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id object))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取余额支付*/
- (void)getHotelBalancePayWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id object))responseSuccess
                                 failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取乡宿评论*/
- (void)getHotelCommentWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取乡宿广告*/
- (void)getHotelAdWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id object))responseSuccess
                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/**获取热门城市*/
- (void)getHotelHotCitySuccess:(void (^)(id object))responseSuccess
                       failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取全部城市*/
- (void)getAllCityListSuccess:(void (^)(id object))responseSuccess
                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
/**获取首页城市*/
- (void)getHomePageCityListSuccess:(void (^)(id object))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;
@end
