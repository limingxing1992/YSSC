//
//  UserBalanceObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@class UserBalanceDataObject;

@interface UserBalanceObject : BaseObject

/**data*/
@property (nonatomic, strong) UserBalanceDataObject *data;

@end


@interface UserBalanceDataObject : NSObject

/**detail*/
@property (nonatomic, strong) NSMutableArray *detail;

/**余额*/
@property (nonatomic, strong) NSString *balacne;

@end


@interface UserBalanceDataDetailObject : NSObject

/**类型*/
@property (nonatomic, strong) NSNumber *type;
/**创建时间*/
@property (nonatomic, strong) NSString *create_time;
/**金额*/
@property (nonatomic, strong) NSString *amount;
/**房间名称*/
@property (nonatomic, strong) NSString *room_name;
/**商品名称*/
@property (nonatomic, strong) NSString *good_name;


@end