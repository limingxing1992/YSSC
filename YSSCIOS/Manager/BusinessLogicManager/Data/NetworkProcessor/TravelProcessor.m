//
//  TravelProcessor.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/13.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelProcessor.h"


static NSString *const travelListInterface = @"app/record/listRecord.do";//游记列表

static NSString *const travelSumbitInterface = @"app/record/publish.do";//提交游记

static NSString *const travelPraizeInterface = @"app/record/createPraize.do";//点赞游记

static NSString *const travelFavoriteInterface = @"app/collection/collect.do";   //收藏

static NSString *const travelJugeInterface = @"app/record/createComment.do";//评论游记

static NSString *const travelCommentListInterface = @"app/record/listComment.do";//查看游记评论

static NSString *const travelUserListInterface = @"app/record//listMyRecord.do";//查看个人游记

static NSString *const reportTravelInterface = @"app/record/report.do";//举报

static NSString *const travelDetailInterface = @"app/record/getRecordDetail.do";//游记详情

static NSString *const travelDeleteInterface = @"app/record/deleteRecord.do";//删除游记


@implementation TravelProcessor

#pragma mark ----------------获取列表

- (void)getTravelListWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    
    [self afHTTPSessionManagerToServerInteractionWithInterface:travelListInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------发表游记

- (void)getSumbitTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:travelSumbitInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
    
}

#pragma mark ----------------查看评论

- (void)getTravelCommentListWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:travelCommentListInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}


#pragma mark ----------------发表评论

- (void)getJugeTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:travelJugeInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------点赞(再次发送请求则取消点赞)

- (void)getPraizeTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:travelPraizeInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------获取个人游记

- (void)getUserTravelListWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:travelUserListInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}



#pragma mark ----------------收藏---所有收藏

- (void)getFavoriteTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:travelFavoriteInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------举报游记

- (void)reportTravelDiaryWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:reportTravelInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------获取游记详情

- (void)getTravelDetailInfoWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:travelDetailInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}

#pragma mark ----------------删除游记

- (void)deleteTravelDiaryWithParameters:(NSDictionary *)parameters success:(OBJBlock)success failure:(ERRORBlock)failure{
    [self afHTTPSessionManagerToServerInteractionWithInterface:travelDeleteInterface
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
}




@end
