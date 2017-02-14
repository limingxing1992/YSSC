//
//  LoginProcessor.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "BaseProcessor.h"

@interface LoginProcessor : BaseProcessor

/*********************************************************************
 函数名称 : getSmsVerifyCodeWithDictionary:
 函数描述 : 获取纯手机短信验证码
 输入参数 : phone,type
 输出参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)getSmsVerifyCodeWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure;


/***********************************************
 函数名称 : registerInfoWithDictionary
 函数秒数 ：注册用户接口
 输入参数 : username, password, regCode, inviteCode, regType, userType
 输出参数 : status, showMessgae
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)registerInfoWithDictionary:(NSDictionary *)parameters
                           success:(OBJBlock)success
                            faiure:(ERRORBlock)failure;

/***********************************************
 函数名称 : loginWithDictonary
 函数秒数 ：登录接口
 输入参数 : parameter
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)loginWithDictionary:(NSDictionary *)parameters
                    success:(OBJBlock)success
                    failure:(ERRORBlock)failure;

/**判断登录状态*/
- (void)getLoginStatusWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;
/**找回密码*/
- (void)retrievePasswordWithDictionary:(NSDictionary *)parameters
                               success:(OBJBlock)success
                               failure:(ERRORBlock)failure;

/** 获取提现余额*/
- (void)getWithdrawMoneyWithSuccess:(OBJBlock)success failure:(ERRORBlock)failure;
/** 提交提现申请*/
- (void)postWithdrawSupplyWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/** 获取提现明细*/
- (void)getWithdrawDetailListWithParameters:(NSDictionary *)parameter success:(OBJBlock)success failure:(ERRORBlock)failure;


@end
