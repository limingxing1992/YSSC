//
//  MallManager.m
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallManager.h"
#import "MallProcessor.h"

@interface MallManager ()

@property(nonatomic,strong)MallProcessor *mallProcessor;

@end

@implementation MallManager


- (instancetype)init{
    self = [super init];
    if (self) {
        _mallProcessor = [[MallProcessor alloc] init];

    }
    return self;
}


#pragma mark ----------------商城一级分类请求

- (void)getBaseMallClassSuccess:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    
    YSSCWeakObj(self);
    
    [_mallProcessor getMallBaseClassSuccess:^(id responObject) {
        STL_ClassifyModel *model = [STL_ClassifyModel mj_objectWithKeyValues:responObject];
            responseSuccess(model.data);
            model = nil;
    }
                                    failure:^(NSError *error) {
            responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    
        }];
}

#pragma mark ----------------商城二级分类请求

- (void)getMallSecondClassWithDictonary:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getMallSecondClassWithDictonary:parameters
                                            success:^(id responObject) {
                                                STL_ClassifyModel *model = [STL_ClassifyModel mj_objectWithKeyValues:responObject];
                                                responseSuccess(model.data);
                                                model = nil;
                                            }
                                            failure:^(NSError *error) {
                                                responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                            }];
}


#pragma mark ----------------获取筛选信息

- (void)getClassifyAttributeWithDictonary:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getClassifyAttributeWithDictonary:parameters
                                              success:^(id responObject) {
                                                  STL_ClassifyLimitModel *model = [STL_ClassifyLimitModel mj_objectWithKeyValues:responObject];
                                                  responseSuccess(model.data);
                                                  model = nil;
                                              }
                                              failure:^(NSError *error) {
                                                  responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                              }];
}

#pragma mark ----------------获取商品列表

- (void)getGoodsListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getGoodsListWithParameters:parameters
                                       success:^(id responObject) {
                                           STL_GoodsModel *model = [STL_GoodsModel mj_objectWithKeyValues:responObject];
                                           responseSuccess(model.data.goods);
                                           model = nil;
                                       }
                                       failure:^(NSError *error) {
                                           responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                       }];
}

#pragma mark ----------------获取商品详情

- (void)getGoodsDetailWithMainMdf:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getGoodsDetailWithMainMdf:parameters
                                      success:^(id responObject) {
                                          STL_GoodsDetailBaseModel *model = [STL_GoodsDetailBaseModel mj_objectWithKeyValues:responObject];
                                          if ([model.errorCode isEqualToNumber:@1]) {
                                              responseSuccess(model.data);
                                          }else{
                                              responseFailure(0, model.errorMsg);
                                          }
                                          model = nil;
                                      } failure:^(NSError *error) {
                                          responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                      }];
}


#pragma mark ----------------获取商品图文详情

- (void)getGoodsDetailInfoWithMainMdf:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getGoodsDetailInfoWithMainMdf:parameters
                                          success:^(id responObject) {
                                              responseSuccess(responObject[@"data"][@"details"]);
                                          } failure:^(NSError *error) {
                                              responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
 
                                          }];
}

#pragma mark ----------------获取商品评论

- (void)getGoodsCommentWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getGoodsCommentWithParameters:parameters
                                          success:^(id responObject) {
                                              MallJugeModel *model = [MallJugeModel mj_objectWithKeyValues:responObject];
                                              if ([model.errorCode isEqualToNumber:@1]) {
                                                  responseSuccess(model.data);
                                              }else{
                                                  responseFailure(0, model.errorMsg);
                                              }
                                              model = nil;
                                          } failure:^(NSError *error) {
                                              responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                          }];
}


#pragma mark ----------------获取商家动态

- (void)getShopnewsWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getShopnewsWithParameters:parameters
                                      success:^(id responObject) {
                                          
                                          MallShopCommentModel *model = [MallShopCommentModel mj_objectWithKeyValues:responObject];
                                          if ([model.errorCode isEqualToNumber:@1]) {
                                              responseSuccess(model.data);
                                          }else{
                                              responseFailure(0, @"服务器异常");
                                          }
                                      } failure:^(NSError *error) {
                                          responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);

                                      }];
}

#pragma mark ----------------获取商家简介

- (void)getShopDetailsWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getShopDetailsWithParameters:parameters success:^(id responObject) {
        if ([responObject[@"status"] isEqualToNumber:@1]) {
            responseSuccess(responObject[@"data"]);
        }else{
            responseFailure(0, responObject[@"showMessage"]);
        }
    
    } failure:^(NSError *error) {
        responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);

    }];
}

#pragma mark ----------------获取商家广告

- (void)getShopBannerWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    
    YSSCWeakObj(self);
    [_mallProcessor getShopBannerWithParameters:parameters
                                        success:^(id responObject) {
                                            if ([responObject[@"status"] isEqualToNumber:@1]) {
                                                responseSuccess(responObject[@"data"]);
                                            }else{
                                                responseFailure(0,responObject[@"showMessage"]);
                                            }
                                        }
                                        failure:^(NSError *error) {
                                            responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                        }];
}

#pragma mark ----------------添加购物车

- (void)getAddToStoreCarWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getAddToStoreCarWithParameters:parameters success:^(id responObject) {
        BaseObject *obj = [BaseObject mj_objectWithKeyValues:responObject];
        if ([obj.errorCode isEqualToNumber:@1]) {
            responseSuccess(@1);
        }else{
            responseFailure(0, obj.errorMsg);
        }
    } failure:^(NSError *error) {
        responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark ----------------获取邮费

- (void)getExpressPriceWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getExpressPriceWithParameters:parameters success:^(id responObject) {
        if ([responObject[@"status"] isEqualToNumber:@1]) {
            responseSuccess(responObject[@"data"][@"totalFee"]);
        }else{
            responseFailure(0, responObject[@"showMessage"]);
        }
    
    } failure:^(NSError *error) {
        responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark ----------------生成订单

- (void)getMallCreateOrderWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_mallProcessor getMallCreateOrderWithParameters:parameters
                                             success:^(id responObject) {
                                                 if ([responObject[@"status"] isEqualToNumber:@1]) {
                                                     responseSuccess(responObject[@"data"]);
                                                 }else{
                                                     responseFailure(0, responObject[@"showMessage"]);
                                                 }
                                             } failure:^(NSError *error) {
                                                 responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                             }];
}

#pragma mark ----------------余额支付

- (void)balancePayOrderWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);
    
    [_mallProcessor getBalancePayForWithParameters:parameters
                                           success:^(id responObject) {
                                               ServerStatusObject *obj = [ServerStatusObject mj_objectWithKeyValues:responObject];
                                               if ([obj.errorCode isEqualToNumber:@1]) {
                                                   responSuccess(obj.errorMsg);
                                               }else{
                                                   responFailure(0, obj.errorMsg);
                                               }
                                           } failure:^(NSError *error) {
                                               responFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                           }];
}


#pragma mark ----------------打印函数信息
/***********************************************
 函数名称 : logRequestMessageWithUrl:
 函数秒数 ：打印请求信息
 输入参数 : urlstring 请求API
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)logRequestMessageWithUrl:(NSString*)urlstring parameters:(id)parameters{
    //
    
    NSDictionary* tmpdic = (NSDictionary*)parameters;
    NSMutableString* mbstring = [NSMutableString stringWithString:@"?"];
    for (int i = 0; i<tmpdic.allKeys.count; i++) {
        //
        NSString* key = tmpdic.allKeys[i];
        NSString* value = tmpdic[key];
        NSString* parstring = [NSString stringWithFormat:@"%@=%@",key,value];
        [mbstring appendString:[NSString stringWithFormat:@"%@&",parstring]];
    }
    
    NSString* requestapi = [NSString stringWithFormat:@"%@%@%@",HOSTNAME,urlstring,[mbstring substringToIndex:mbstring.length-1]];
    
    
    NSString* logstr = [NSString stringWithFormat:@"\n请求的api %@\n参数 %@\n完整的请求地址：%@\n",urlstring,parameters,requestapi];
    
    NSLog(@"完整请求地址:%@",logstr);
}

@end
