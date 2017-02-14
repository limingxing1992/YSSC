//
//  LoginManager.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "LoginManager.h"
#import "LoginProcessor.h"
#import <MJExtension.h>
@interface LoginManager ()

@property (nonatomic, strong) LoginProcessor *loginProcessor;

@end

@implementation LoginManager


- (instancetype)init
{
    if (self = [super init]) {
        _loginProcessor = [[LoginProcessor alloc] init];
    }
    return self;
}

#pragma mark ---获取纯手机短信验证码---

- (void)getSmsVerifyCodeWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure
{
    YSSCWeakObj(self);
    [_loginProcessor getSmsVerifyCodeWithDictionary:parameters
                                           success:^(id responseObject){
                                               ServerStatusObject *object = [ServerStatusObject mj_objectWithKeyValues:responseObject];
                                               if ([object.errorCode isEqualToNumber:@1]) {
                                                   responseSuccess(object);
                                               }else{
                                                   responseFailure(0, object.errorMsg);
                                               }
                                           }
                                           failure:^(NSError *error){
                                               responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                           }];
}



#pragma mark ----------------注册

- (void)registerInfoWithDictionary:(NSDictionary *)parameters
                           success:(OBJBlock)responseSuccess
                            faiure:(ERRORCODEBlock)responseFailure
{
    YSSCWeakObj(self);
    [_loginProcessor registerInfoWithDictionary:parameters
                                        success:^(id responObject) {
                                           
                                            ServerStatusObject *object = [ServerStatusObject mj_objectWithKeyValues:responObject];
                                            responseSuccess(object);
                                            object = nil;
                                        }
                                         faiure:^(NSError *error) {
                                            responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                        }];

}


#pragma mark ----------------登录

- (void)loginWithDictionary:(NSDictionary *)parameters
                    success:(OBJBlock)responseSuccess
                    failure:(ERRORCODEBlock)responseFailure
{
    YSSCWeakObj(self);
    [_loginProcessor loginWithDictionary:parameters
                                 success:^(id responObject) {
                                     LoginObject *obj = [LoginObject mj_objectWithKeyValues:responObject];
                                     if ([obj.errorCode isEqualToNumber:@1]) {
                                         responseSuccess(obj);
                                     }else{
                                         responseFailure(0, obj.errorMsg);
                                     }
                                     obj = nil;
                                 }
                                 failure:^(NSError *error) {
                                     responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                 }];
}

#pragma mark ----------------找回密码

- (void)retrievePasswordWithDictionary:(NSDictionary *)parameters
                    success:(OBJBlock)responseSuccess
                    failure:(ERRORCODEBlock)responseFailure
{
    YSSCWeakObj(self);
    [_loginProcessor retrievePasswordWithDictionary:parameters
                                 success:^(id responObject) {
                                     LoginObject *obj = [LoginObject mj_objectWithKeyValues:responObject];
                                     if ([obj.errorCode isEqualToNumber:@1]) {
                                         responseSuccess(obj);
                                     }else{
                                         responseFailure(0, obj.errorMsg);
                                     }
                                     obj = nil;
                                 }
                                 failure:^(NSError *error) {
                                     responseFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                 }];
}

#pragma mark ----------------获取是否登录

- (BOOL)isLogin{

    NSArray *allCookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in allCookies) {
        if ([cookie.name isEqualToString:@"ticket"]) {
            if (cookie.value) {
               // NSLog(@"%@",cookie.value);
//                NSString *loginTime = [[NSUserDefaults standardUserDefaults]objectForKey:@"kLoginTime"];
                return YES;
//                if (loginTime.doubleValue + LoginTimeOverride > [NSDate date].timeIntervalSince1970 ) {
//                    return YES;
//                }
            }
        }
    }
    return NO;
}

- (void)quitLogin{
    NSArray *allCookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *cookie in allCookies) {
        if ([cookie.name isEqualToString:@"ticket"]) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
}


#pragma mark ----------------获取提现余额

- (void)getWithdrawMoneyWithSuccess:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);

    [_loginProcessor getWithdrawMoneyWithSuccess:^(id responObject) {
        NSDictionary *obj = responObject;
        if ([obj[@"status"] isEqualToNumber:@1]) {
            responSuccess(obj[@"data"]);
        }else{
            responFailure(0, obj[@"showMessage"]);
        }
    } failure:^(NSError *error) {
        responFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark ----------------申请提现

- (void)postSumbitWithdrawApplyWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);
    [_loginProcessor postWithdrawSupplyWithParameters:parameters
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


#pragma mark ----------------获取提现明细列表

- (void)getWithdrawDetailListWithParameters:(NSDictionary *)parameter success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);

    [_loginProcessor getWithdrawDetailListWithParameters:parameter
                                                 success:^(id responObject) {
                                                     NSDictionary *obj = responObject;
                                                     if ([obj[@"status"] isEqualToNumber:@1]) {
                                                         responSuccess(obj[@"data"]);
                                                     }else{
                                                         responFailure(0, obj[@"showMessage"]);
                                                     }
                                                 } failure:^(NSError *error) {
                                                     responFailure(error.code, [weakself analyticalHttpErrorDescription:error]);
                                                 }];
}


@end
