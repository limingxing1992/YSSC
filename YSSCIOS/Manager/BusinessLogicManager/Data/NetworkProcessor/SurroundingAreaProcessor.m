//
//  SurroundingAreaProcessor.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/13.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SurroundingAreaProcessor.h"

static NSString *const ArroundingAreaListInterface = @"app/village/getBusinessList.do";//周边列表
static NSString *const ArroundingAreaClassifyInterface = @"app/village/getBusinessClassify.do";//商家分类
static NSString *const ArroundingAreaBussDetailInterface = @"app/village/getBusinessInfo.do";//商家详情
static NSString *const ArroundingAreaBussPushJugeInterface = @"app/village/commentBusiness.do";//评价商户

@implementation SurroundingAreaProcessor

#pragma mark ----------------获取商家列表

- (void)getArroundingAreaListWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
  [self afHTTPSessionManagerToServerInteractionWithInterface:ArroundingAreaListInterface
                                                   parameter:parameters
                                                     success:success
                                                     failure:failure];
}


#pragma mark ----------------获取商家分类

- (void)getArroundingAreaClassifySuccess:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:ArroundingAreaClassifyInterface
                                                     parameter:nil
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------获取商家详情

- (void)getArroundingAreaBussDetailWithParameter:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:ArroundingAreaBussDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------商户点评
- (void)getJugeSurroundingAreaBussWithParameter:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:ArroundingAreaBussPushJugeInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

@end
