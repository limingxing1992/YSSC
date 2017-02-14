//
//  TravelManager.h
//  YSSCIOS
//
//  Created by 李明星 on 16/9/13.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseManager.h"
#import "TravelProcessor.h"
#import <UMSocialCore/UMSocialCore.h>

@interface TravelManager : BaseManager

/***********************************************
 函数名称 : getTravelListWithParameters:
 函数秒数 ：获取所有游记列表
 输入参数 : page pageSize
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getTravelListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure;

/***********************************************
 函数名称 : getSumbitTravelWithParameters:
 函数秒数 ：发表游戏
 输入参数 : type publishingText title 图片
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getSumbitTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure;
/***********************************************
 函数名称 : getTravelCommentListWithParameters:
 函数秒数 ：获取游记评论列表
 输入参数 : id page pageSize
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getTravelCommentListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure;
/***********************************************
 函数名称 : getPraizeTravelWithParameters:
 函数秒数 ：游记点赞
 输入参数 : id
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getPraizeTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure;
/***********************************************
 函数名称 : getFavoriteTravelWithParameters:
 函数秒数 ：收藏通用，传入收藏对象ID和类型
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getFavoriteTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure;

/***********************************************
 函数名称 : getJugeTravelWithParameters:
 函数秒数 ：评论游记
 输入参数 : id content
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getJugeTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure;
/***********************************************
 函数名称 : getSecret
 函数秒数 ：获取当前时间戳
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (NSString *)getSecret;
/***********************************************
 函数名称 : upLoadImageWith:
 函数秒数 ：上传图片
 输入参数 : 图片数组 参数  API
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)upLoadImageWith:(NSArray *)imgs parameters:(NSDictionary *)parameters urlString:(NSString *)urlString success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure;
/***********************************************
 函数名称 : getUserTravelListWithParameters:
 函数秒数 ：我的游记
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     获取个人游记
 ***********************************************/
- (void)getUserTravelListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure;

/***********************************************
 函数名称 : shareWithImage:
 函数秒数 ：分享、、//暂定内容固定。等待后续
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)shareWithParameters:(NSDictionary *)parameters target:(id)target;

/***********************************************
 函数名称 : reportTravelDiaryWithParameters:
 函数秒数 ：举报游记
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)reportTravelDiaryWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure;

/***********************************************
 函数名称 : getTravelDetailInfoWithParameters:
 函数秒数 ：获取游记详情
 输入参数 :
 输出参数 :
 返回值 :
 作者 :     李明星
 ***********************************************/
- (void)getTravelDetailInfoWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure;

/** 删除*/
- (void)deleteTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure;


@end
