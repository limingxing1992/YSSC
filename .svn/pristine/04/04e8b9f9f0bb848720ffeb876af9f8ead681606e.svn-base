//
//  LoginManager.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseManager.h"

@interface LoginManager : BaseManager

/*********************************************************************
 函数名称 : getSmsVerifyCodeWithDictionary:
 函数描述 : 获取纯手机短信验证码
 输入参数 : phone,type
 输出参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)getSmsVerifyCodeWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id object))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;


/***********************************************
 函数名称 : registerInfoWithDictionary:
 函数秒数 ：注册用户接口
 输入参数 : username, password, regCode, inviteCode, regType, userType
 输出参数 : status, showMessgae
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)registerInfoWithDictionary:(NSDictionary *)parameters
                           success:(OBJBlock)responseSuccess
                            faiure:(ERRORCODEBlock)responseFailure;

/***********************************************
 函数名称 : loginWithDictionary:
 函数秒数 ：登录接口
 输入参数 : username password(MD5加密)
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)loginWithDictionary:(NSDictionary *)parameters
                    success:(OBJBlock)responseSuccess
                    failure:(ERRORCODEBlock)responseFailure;

/**找回密码*/
- (void)retrievePasswordWithDictionary:(NSDictionary *)parameters
                               success:(OBJBlock)responseSuccess
                               failure:(ERRORCODEBlock)responseFailure;

/**判断是否登录*/
- (BOOL)isLogin;
/**退出登录*/
- (void)quitLogin;
/** 获取提现余额*/
- (void)getWithdrawMoneyWithSuccess:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure;
/** 申请提现*/
- (void)postSumbitWithdrawApplyWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure;
/** 获取提现明细*/
- (void)getWithdrawDetailListWithParameters:(NSDictionary *)parameter success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure;



@end
