//
//  LoginProcessor.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "LoginProcessor.h"

@implementation LoginProcessor

/*
 验证码获取相关接口
 */
static NSString *const GetSmsVerifyCodeInterface = @"app/user/sendRegCode.do";         //获取纯手机短信验证码接口
/*
 注册接口
 */
static NSString *const RegisterInfoInterface = @"app/user/userRegister.do";   //注册接口

/*
    登录接口
 */
static NSString *const LoginInterface = @"app/user/login.do"; //登录接口

/*
 是否登录接口
 */
static NSString *const LoginStatusInterface = @"app/user/getUserInfo.do"; //是否登录接口
/*
找回密码
 */
static NSString *const RetrievePasswordInterface = @"app/user/retrievePassword.do"; //是否登录接口
/** 
 提取余额
 */
static NSString *const withdrawInterface  = @"app/withdrawcash/getUserAmount";//提现余额
/** 
 申请提现
 */
static NSString *const applyWithdrawInterface = @"app/withdrawcash/submit";//申请提现
/**
 提现明细
 */
static NSString *const withdrawDetailListInterface = @"app/withdrawcash/userWithdrawCashList";//提现明细


#pragma mark ---获取纯手机短信验证码---
- (void)getSmsVerifyCodeWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:GetSmsVerifyCodeInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------注册用户

- (void)registerInfoWithDictionary:(NSDictionary *)parameters
                           success:(OBJBlock)success
                            faiure:(ERRORBlock)failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:RegisterInfoInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------登录

- (void)loginWithDictionary:(NSDictionary *)parameters
                    success:(OBJBlock)success
                    failure:(ERRORBlock)failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:LoginInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------找回密码

- (void)retrievePasswordWithDictionary:(NSDictionary *)parameters
                    success:(OBJBlock)success
                    failure:(ERRORBlock)failure
{
    [self afHTTPSessionManagerToServerInteractionWithInterface:RetrievePasswordInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark --------- 判断登录状态
- (void)getLoginStatusWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{

    [self afHTTPSessionManagerToServerInteractionWithInterface:LoginStatusInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------获取提现余额

- (void)getWithdrawMoneyWithSuccess:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:withdrawInterface
                                                     parameter:nil
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------提交申请提现

- (void)postWithdrawSupplyWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:applyWithdrawInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------提现明细

- (void)getWithdrawDetailListWithParameters:(NSDictionary *)parameter success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:withdrawDetailListInterface
                                                     parameter:parameter
                                                       success:success
                                                       failure:failure];
}

@end
