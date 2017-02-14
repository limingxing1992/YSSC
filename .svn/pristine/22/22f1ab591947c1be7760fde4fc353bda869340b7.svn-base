//
//  TravelManager.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/13.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelManager.h"
#import <AFNetworking.h>

@interface TravelManager ()

@property (nonatomic, strong) TravelProcessor *processor;


@end

@implementation TravelManager

- (instancetype)init{
    self = [super init];
    if (self) {
        _processor = [[TravelProcessor alloc] init];
    }
    return self;
}


#pragma mark ------游记列表

- (void)getTravelListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    
    [_processor getTravelListWithParameters:parameters
                                    success:^(id responObject) {
                                        TravelListModel *model = [TravelListModel mj_objectWithKeyValues:responObject];
                                        if ([model.errorCode isEqualToNumber:@1]) {
                                            responseSuccess(model.data);
                                        }else{
                                            responseFailure(0, model.errorMsg);
                                        }
                                        model = nil;
                                    
                                    } failure:^(NSError *error) {
                                        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                    }];
}


#pragma mark ----------------发表游记

- (void)getSumbitTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);

    [_processor getSumbitTravelWithParameters:parameters
                                      success:^(id responObject) {
                                          if ([responObject[@"status"] isEqualToNumber:@1]) {
                                              responseSuccess(responObject[@"showMessage"]);
                                          }else{
                                              responseFailure(0, responObject[@"showMessage"]);
                                          }
                        
                                      } failure:^(NSError *error) {
                                          responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);

                                      }];
}


#pragma mark ----------------查看游记评论

- (void)getTravelCommentListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);

    [_processor getTravelCommentListWithParameters:parameters
                                           success:^(id responObject) {
                                               if ([responObject[@"status"] isEqualToNumber:@1]) {
                                                   NSMutableArray *data = [NSMutableArray array];
                                                   for (NSDictionary *dict in responObject[@"data"]) {
                                                       TravelCommentModel *model = [TravelCommentModel mj_objectWithKeyValues:dict];
                                                       [data addObject:model];
                                                   }
                                                   responseSuccess(data);
                                               }else{
                                                   responseFailure(0, responObject[@"showMessage"]);
                                               }
                                           } failure:^(NSError *error) {
                                               responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                           }];
}


#pragma mark ----------------评论游记

- (void)getJugeTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);

    [_processor getJugeTravelWithParameters:parameters
                                    success:^(id responObject) {
                                        if ([responObject[@"status"] isEqualToNumber:@1]) {
                                            responseSuccess(responObject[@"showMessage"]);
                                        }else{
                                            responseFailure(0, responObject[@"showMessage"]);
                                        }
                                    } failure:^(NSError *error) {
                                        responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);

                                    }];
}


#pragma mark ----------------点赞

- (void)getPraizeTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);

    [_processor getPraizeTravelWithParameters:parameters
                                      success:^(id responObject) {
                                          if ([responObject[@"status"] isEqualToNumber:@1]) {
                                              responseSuccess(responObject[@"showMessage"]);
                                          }else{
                                              responseFailure(0, responObject[@"showMessage"]);
                                          }
                                      } failure:^(NSError *error) {
                                          responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                      }];
}

#pragma mark ----------------收藏

- (void)getFavoriteTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responseSuccess failure:(ERRORCODEBlock)responseFailure{
    YSSCWeakObj(self);
    [_processor getFavoriteTravelWithParameters:parameters
                                        success:^(id responObject) {
                                            
                                            if ([responObject[@"status"] isEqualToNumber:@1]) {
                                    
                                                responseSuccess(responObject[@"showMessage"]);
                                            }else{
                                                responseFailure(0, responObject[@"showMessage"]);
                                            }
                                        }
                                        failure:^(NSError *error) {
                                            responseFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                        }];
}

#pragma mark ----------------获取时间戳
- (NSString *)getSecret
{
    //获取当前时间戳
    NSTimeInterval timeIn = [[NSDate date] timeIntervalSince1970];
    return  [NSString stringWithFormat:@"%.f",timeIn];
}

#pragma mark ----------------上传图片

- (void)upLoadImageWith:(NSArray *)imgs parameters:(NSDictionary *)parameters urlString:(NSString *)urlString success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:[NSString stringWithFormat:@"%@%@",[YSSUserDefault objectForKey:@"currentAPI"], urlString] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i<imgs.count; i++) {
            UIImage* tmpimg = imgs[i];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmssSSS";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString* filename = [NSString stringWithFormat:@"%@.png",str];//;
            NSData* imgdata = UIImageJPEGRepresentation(tmpimg, 0.25);
            [formData appendPartWithFileData:imgdata name:[NSString stringWithFormat:@"Name+ %d",i] fileName:filename mimeType:@"image/png"];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"status"] isEqualToNumber:@1]) {
            responSuccess(responseObject[@"showMessage"]);
        }else{
            responFailure(0, responseObject[@"showMessage"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        responFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
    }];
}

#pragma mark ----------------获取个人游记列表

- (void)getUserTravelListWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);
    [_processor getUserTravelListWithParameters:parameters
                                        success:^(id responObject) {
                                            TravelListModel *model = [TravelListModel mj_objectWithKeyValues:responObject];
                                            if ([model.errorCode isEqualToNumber:@1]) {
                                                responSuccess(model.data);
                                            }else{
                                                responFailure(0, model.errorMsg);
                                            }
                                            model = nil;
                                        } failure:^(NSError *error) {
                                            responFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                        }];
}

#pragma mark ----------------分享

- (void)shareWithParameters:(NSDictionary *)parameters target:(id)target{
    
    YSSCWeakObj(self);
    [UMSocialUIManager showShareMenuViewInView:nil sharePlatformSelectionBlock:^(UMSocialShareSelectionView *shareSelectionView, NSIndexPath *indexPath, UMSocialPlatformType platformType) {
        [UMSocialUIManager dismissShareMenuView];
        [weakself shareDataWithPlatform:platformType target:target];
    }];
    
}


- (void)shareDataWithPlatform:(UMSocialPlatformType)platformType target:(id)target{
        // 创建UMSocialMessageObject实例进行分享
        // 分享数据对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    NSString *text;
    if ([YSSCShareBusinessManager.loginManger isLogin]) {
        NSString *inviteNum = [YSSUserDefault objectForKey:@"inviteCode"];
        text = [NSString stringWithFormat:@"乡宿在线，发现心中的世外桃源。赶紧下载体验吧，我的邀请码是%@～App应用入口：http://115.236.69.110:8458/mountainVillage/app/redpacket/download，福利入口：http://115.236.69.110:8458/mountainVillage/app/redpacket/index。",inviteNum];//登录ok分享邀请码
    }else{
        text = @"乡宿在线，发现心中的世外桃源。赶紧下载体验吧～App应用入口：http://115.236.69.110:8458/mountainVillage/app/redpacket/download，福利入口：http://115.236.69.110:8458/mountainVillage/app/redpacket/index。";//未登录状态不分享邀请码
    }
    messageObject.text = text;
    
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:target completion:^(id result, NSError *error) {
        NSString *message = nil;
        if (!error) {
            message = [NSString stringWithFormat:@"分享成功"];
        } else {
            message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
            
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
        
    }];

}


- (void)reportTravelDiaryWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);
    [_processor reportTravelDiaryWithParameters:parameters
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

- (void)getTravelDetailInfoWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);
    [_processor getTravelDetailInfoWithParameters:parameters
                                          success:^(id responObject) {
                                              if ([responObject[@"status"] isEqualToNumber:@1]) {
                                                  TravelItemModel *model = [TravelItemModel mj_objectWithKeyValues:responObject[@"data"]];
                                                  responSuccess(model);
                                              }else{
                                                  responFailure(0, responObject[@"showMessage"]);
                                              }
                                          } failure:^(NSError *error) {
                                              responFailure(error.code,[weakself analyticalHttpErrorDescription:error]);
                                          }];
}

- (void)deleteTravelWithParameters:(NSDictionary *)parameters success:(OBJBlock)responSuccess failure:(ERRORCODEBlock)responFailure{
    YSSCWeakObj(self);

    [_processor deleteTravelDiaryWithParameters:parameters
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
