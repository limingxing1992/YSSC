//
//  TravelListModel.h
//  YSSCIOS
//
//  Created by 李明星 on 16/9/14.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@interface TravelListModel : BaseObject

@property (nonatomic, strong) NSArray *data;

@end


@interface TravelItemModel : NSObject


@property (nonatomic, copy) NSString *ID;//游记编号
@property (nonatomic, copy) NSString *mdf;//游记mdf
@property (nonatomic, copy) NSString *userid;//作者id
@property (nonatomic, copy) NSString *title;//游记标题
@property (nonatomic, copy) NSString *content;//游记内容
@property (nonatomic, copy) NSString *add_time;//发表时间


@property (nonatomic, assign) NSInteger selfFlag;//是否个人游记

@property (nonatomic, copy) NSString *type;//游记类型
@property (nonatomic, copy) NSString *status;//未知
@property (nonatomic, copy) NSString *file_path;//未知
@property (nonatomic, copy) NSString *imgs;//轮播图、逗号分隔
@property (nonatomic, copy) NSString *name;//作者
@property (nonatomic, copy) NSString *head_url;//作者头像

@property (nonatomic, assign) NSInteger praizeFlag;//是否点赞
@property (nonatomic, assign) NSInteger collectFlag;//是否收藏过

@property (nonatomic, copy) NSString *collectCount;//收藏数
@property (nonatomic, copy) NSString *commentCount;//评论数
@property (nonatomic, copy) NSString *praizeCount;//点赞数











@end
