//
//  SurroundingAreaProcessor.h
//  YSSCIOS
//
//  Created by 李明星 on 16/9/13.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseProcessor.h"

@interface SurroundingAreaProcessor : BaseProcessor

/***********************************************
 函数名称 : getArroundingAreaListWithParameters:
 函数秒数 ：获取周边列表
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getArroundingAreaListWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;

/***********************************************
 函数名称 : getArroundingAreaClassifySuccess:
 函数秒数 ：获取商家分类
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getArroundingAreaClassifySuccess:(OBJBlock)success failure:(ERRORBlock)failure;

/***********************************************
 函数名称 : getArroundingAreaBussDetailWithParameter:
 函数秒数 ：获取商家详情
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getArroundingAreaBussDetailWithParameter:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;
/***********************************************
 函数名称 : getJugeSurroundingAreaBussWithParameter:
 函数秒数 ：点评商户
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getJugeSurroundingAreaBussWithParameter:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure;


@end
