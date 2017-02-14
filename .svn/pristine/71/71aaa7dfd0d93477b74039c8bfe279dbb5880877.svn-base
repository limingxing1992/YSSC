//
//  HotelCommentObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@class HotelCommentDataObject;

@interface HotelCommentObject : BaseObject

/**data*/
@property (nonatomic, strong) HotelCommentDataObject *data;

@end

@interface HotelCommentDataObject : NSObject

/**评论总数*/
@property (nonatomic, strong) NSNumber *totalNum;
/**平均分*/
@property (nonatomic, strong) NSNumber *total_score;
/**评论数组*/
@property (nonatomic, strong) NSMutableArray *commentList;


@end

@interface CommentObject : NSObject

/**id*/
@property (nonatomic, strong) NSString *ID;
///**评分*/
//@property (nonatomic, strong) NSString *score;
/**评论内容*/
@property (nonatomic, strong) NSString *content;
/**用户名字*/
@property (nonatomic, strong) NSString *name;
/**头像*/
@property (nonatomic, strong) NSURL *head_url;
/**评论时间*/
@property (nonatomic, strong) NSString *create_time;


@end
