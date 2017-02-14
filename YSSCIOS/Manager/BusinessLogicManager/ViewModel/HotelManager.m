//
//  HotelManager.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelManager.h"
#import "HotelProcessor.h"
#import "HotelObject.h"

#import "HotelClassifyObject.h"

#import "HotelDetailObject.h"
#import <MJExtension/MJExtension.h>
#import "RoomTypeObject.h"
#import "RoomTypeObject.h"
#import "RoomDetailObject.h"
#import "RoomAttr.h"
#import "HotelDetailObject.h"
#import "HotelOrderObject.h"
#import "HotelCommentObject.h"
#import "AdObject.h"
#import "HotelAdObject.h"
#import "HotelHotCityObject.h"
#import "HotelWXPayObject.h"
#import "HotelAliPayObject.h"
#import "HotelIndexCityObject.h"
#import "AllCityListObject.h"

@interface HotelManager ()

@property (nonatomic, strong) HotelProcessor *hotelProcessor;

@end

@implementation HotelManager

- (instancetype)init
{
    if (self = [super init]) {
        _hotelProcessor = [[HotelProcessor alloc] init];
    }
    return self;
}
//首页获取乡宿主题
- (void)getClassifyWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id object))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure
{
    YSSCWeakObj(self)
    [_hotelProcessor getClassifyWithDictionary:parameters success:^(id responseObject) {
//        NSLog(@"乡宿主题%@",responseObject);
        HotelClassifyObject *obj = [HotelClassifyObject mj_objectWithKeyValues:responseObject];
        responseSuccess(obj);
        obj = nil;

    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
    
}

//获取乡宿列表
- (void)getHotelListWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id object))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure
{
    YSSCWeakObj(self);
    
    [_hotelProcessor getHotelListWithDictionary:parameters success:^(id responseObject) {
//       NSLog(@"乡宿列表%@",responseObject);
        HotelObject *obj = [HotelObject mj_objectWithKeyValues:responseObject];
        responseSuccess(obj);
        obj = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
    
    
}

//获取乡宿详情
- (void)getHotelDetailWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id object))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure
{
    YSSCWeakObj(self);
    
    [_hotelProcessor getHotelDetailWithDictionary:parameters success:^(id responseObject) {
//       NSLog(@"民俗详情：%@",responseObject);
        HotelDetailObject * detailObject = [HotelDetailObject mj_objectWithKeyValues:responseObject];
        responseSuccess(detailObject.data);
        detailObject = nil;

    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
    
}


//获取房型列表
- (void)getRoomListWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id object))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_hotelProcessor getRoomListWithDictionary:parameters success:^(id responseObject) {
        RoomTypeObject *obj = [RoomTypeObject mj_objectWithKeyValues:responseObject];
        responseSuccess(obj.data);
        obj = nil;
    
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

//获取房型详情
- (void)getRoomDetailWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id object))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    
    
    
    YSSCWeakObj(self);
    [_hotelProcessor getRoomDetailWithDictionary:parameters success:^(id responseObject) {
        
        
        RoomDetailObject *roomDetailObject = [RoomDetailObject mj_objectWithKeyValues:responseObject];
        responseSuccess(roomDetailObject);
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}


- (void)getHotelOrderWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_hotelProcessor getHotelOrderWithDictionary:parameters success:^(id responseObject) {
//        NSLog(@"=====%@",responseObject);
        HotelOrderObject *hotelOrderObject = [HotelOrderObject mj_objectWithKeyValues:responseObject];
        responseSuccess(hotelOrderObject);
        hotelOrderObject = nil;
         
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}
//获取微信支付
- (void)getHotelWXPayWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    
    
    YSSCWeakObj(self);
    [_hotelProcessor getHotelWXPayWithDictionary:parameters success:^(id responseObject) {
        
//        NSLog(@"=====微信支付%@",responseObject);
        HotelWXPayObject *wxPay = [HotelWXPayObject mj_objectWithKeyValues:responseObject];
        responseSuccess(wxPay);
       
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

//获取支付宝支付
- (void)getHotelAliPayWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    
    
    YSSCWeakObj(self);
    [_hotelProcessor getHotelAliPayWithDictionary:parameters success:^(id responseObject) {
        NSLog(@"支付宝支付结果返回：%@", responseObject);
        
        
        HotelAliPayObject *aliPay = [HotelAliPayObject mj_objectWithKeyValues:responseObject];
        responseSuccess(aliPay);
    
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}


//支付宝wap支付
- (void)getWapAliPayWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{

    YSSCWeakObj(self);
    NSLog(@"参数：%@", parameters);
    [_hotelProcessor getWapAliPayWithDictionary:parameters success:^(id responseObject) {
        NSLog(@"支付宝支付结果返回：%@", responseObject);
        
    } failure:^(NSError *error) {
        NSLog(@"支付宝支付结果返回：%ld", (long)error.code);
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

//获取余额支付
- (void)getHotelBalancePayWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    
    
    YSSCWeakObj(self);
    [_hotelProcessor getHotelBalancePayWithDictionary:parameters success:^(id responseObject) {
        
        ServerStatusObject *severStatusObject = [ServerStatusObject mj_objectWithKeyValues:responseObject];
        responseSuccess(severStatusObject);
        severStatusObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

- (void)getHotelCommentWithDictionary:(NSDictionary *)parameters
                            success:(void (^)(id object))responseSuccess
                            failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_hotelProcessor getHotelCommentWithDictionary:parameters success:^(id responseObject) {
       
        HotelCommentObject *hotelCommentObject = [HotelCommentObject mj_objectWithKeyValues:responseObject];
        responseSuccess(hotelCommentObject);
        hotelCommentObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

- (void)getHotelAdWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_hotelProcessor getHotelAdWithDictionary:parameters success:^(id responseObject) {
      //  NSLog(@"广告%@",responseObject);
        HotelAdObject *adObject = [HotelAdObject mj_objectWithKeyValues:responseObject];
        responseSuccess(adObject);
        adObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

- (void)getHotelHotCitySuccess:(void (^)(id object))responseSuccess
                       failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_hotelProcessor getHotelHotCityWithDictionary:nil success:^(id responseObject) {
//        NSLog(@"热门城市%@",responseObject);
        HotelHotCityObject *hotCityObject = [HotelHotCityObject mj_objectWithKeyValues:responseObject];
        responseSuccess(hotCityObject);
        hotCityObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

- (void)getAllCityListSuccess:(void (^)(id object))responseSuccess
                       failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_hotelProcessor getAllCityListWithDictionary:nil success:^(id responseObject) {
//        NSLog(@"全部%@",responseObject);
        AllCityListObject *allCityObject = [AllCityListObject mj_objectWithKeyValues:responseObject];
        responseSuccess(allCityObject);
        allCityObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

- (void)getHomePageCityListSuccess:(void (^)(id object))responseSuccess
                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure{
    YSSCWeakObj(self);
    [_hotelProcessor getHomePageCityListWithDictionary:nil success:^(id responseObject) {
        
        HotelIndexCityObject *homePageCityObject = [HotelIndexCityObject mj_objectWithKeyValues:responseObject];
        responseSuccess(homePageCityObject);
        homePageCityObject = nil;
        
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}


@end
