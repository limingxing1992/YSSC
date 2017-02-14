//
//  UserFavoriteObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/20.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@interface UserFavoriteObject : BaseObject

/**data*/
@property (nonatomic, strong) NSMutableArray *data;

@end


@interface UserFavoriteDataObject : NSObject

/**id*/
@property (nonatomic, strong) NSString *ID;
/**link_id*/
@property (nonatomic, strong) NSString *link_id;
/**创建时间*/
@property (nonatomic, strong) NSString *collect_time;
/**类型*/
@property (nonatomic, strong) NSString *collect_type;
/**title*/
@property (nonatomic, strong) NSString *title;
/**url*/
@property (nonatomic, strong) NSURL *url;
/**keyWord*/
@property (nonatomic, strong) NSString *keyWord;
/**address*/
@property (nonatomic, strong) NSString *address;
/**content*/
@property (nonatomic, strong) NSString *content;
/**score*/
@property (nonatomic, strong) NSNumber *score;
/**用户名*/
@property (nonatomic, strong) NSString *username;
/**电话号码 跳转到店铺详情用到*/
@property (nonatomic, strong) NSString *phone;


@end
