//
//  ArroundingAreaManager.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/13.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "ArroundingAreaManager.h"
#import "SurroundingAreaProcessor.h"

@interface ArroundingAreaManager ()

@property (nonatomic, strong) SurroundingAreaProcessor *processor;

@end


@implementation ArroundingAreaManager

- (instancetype)init{
    self = [super init];
    if (self) {
        _processor = [[SurroundingAreaProcessor alloc] init];
    }
    return self;
}

#pragma mark ----------------获取商家列表

- (void)getArroundingAreaListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);

    [_processor getArroundingAreaListWithParameters:parameters
                                            success:^(id responObject) {
                                                SurroundingAreaModel *model = [SurroundingAreaModel mj_objectWithKeyValues:responObject];
                                                responseSuccess(model.data);
                                                model = nil;
                                            }
                                            failure:^(NSError *error) {
                                                responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                            }];
}

#pragma mark ----------------获取商家分类


- (void)getArroundingAreaClassifySuccess:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);

    [_processor getArroundingAreaClassifySuccess:^(id responObject) {
        responseSuccess(responObject[@"data"]);
    } failure:^(NSError *error) {
        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}


#pragma mark ----------------获取商家详情

- (void)getArroundingAreaBussDetailWithParameter:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_processor getArroundingAreaBussDetailWithParameter:parameters
                                                 success:^(id responObject) {
                                                     SurroundingAreaBussDetailModel *model = [SurroundingAreaBussDetailModel mj_objectWithKeyValues:responObject[@"data"]];
                                                     
                                                     responseSuccess(model);
                                                     model = nil;
                                                 
                                                 } failure:^(NSError *error) {
                                                     responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                                 }];
}

#pragma mark ----------------商户点评
- (void)getJugeSurroundingAreaBussWithParameter:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);
    [_processor getJugeSurroundingAreaBussWithParameter:parameters
                                                success:^(id responObject) {
                                                    if ([responObject[@"status"] isEqualToNumber:@1]) {
                                                        responSuccess(responObject[@"showMessage"]);
                                                    }else{
                                                        responFailure(0, responObject[@"showMessage"]);
                                                    }
                                                } failure:^(NSError *error) {
                                                    responFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                                }];
}

@end
