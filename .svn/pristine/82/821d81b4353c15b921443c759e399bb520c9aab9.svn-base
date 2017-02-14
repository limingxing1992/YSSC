//
//  HotelProcessor.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseProcessor.h"

@interface HotelProcessor : BaseProcessor


- (void)getClassifyWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

- (void)getHotelListWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

- (void)getHotelDetailWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;

- (void)getRoomListWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

- (void)getRoomDetailWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;

- (void)getHotelOrderWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;
//获取评论
- (void)getHotelCommentWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

- (void)getHotelAdWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

- (void)getHotelHotCityWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;
//请求微信支付
- (void)getHotelWXPayWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id responseObject))success
                            failure:(void (^)(NSError *error))failure;
//请求支付宝支付
- (void)getHotelAliPayWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;
//请求支付宝wap支付
- (void)getWapAliPayWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;
//请求余额支付
- (void)getHotelBalancePayWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id responseObject))success
                                 failure:(void (^)(NSError *error))failure;
//获取全部城市列表
- (void)getAllCityListWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;
//获取首页城市列表
- (void)getHomePageCityListWithDictionary:(NSDictionary *)parameters
                                  success:(void (^)(id responseObject))success
                                  failure:(void (^)(NSError *error))failure;

@end
