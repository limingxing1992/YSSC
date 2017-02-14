//
//  UserAllMessageObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/20.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@class UserAllMessageDataObject;

@interface UserAllMessageObject : BaseObject

/**data*/
@property (nonatomic, strong) UserAllMessageDataObject *data;

@end


@interface UserAllMessageDataObject : NSObject

/**系统消息未读总数*/
@property (nonatomic, strong) NSString *pushMsgNum;
/**系统最新消息标题*/
@property (nonatomic, strong) NSString *push_title;
/**订单消息未读总数*/
@property (nonatomic, strong) NSString *orderMsgNum;
/**订单最新消息标题*/
@property (nonatomic, strong) NSString *order_title;

@end