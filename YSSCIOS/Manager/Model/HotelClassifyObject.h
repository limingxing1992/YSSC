//
//  HotelClassifyObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@class HotelClassifyDataObject;

@interface HotelClassifyObject : BaseObject


/**data*/
@property (nonatomic, strong) NSMutableArray *data;

@end


@interface HotelClassifyDataObject : NSObject

/**id*/
@property (nonatomic, strong) NSNumber *ID;
/**标题*/
@property (nonatomic, strong) NSString *name;
/**副标题*/
@property (nonatomic, strong) NSString *remark;
/**酒店总数*/
@property (nonatomic, strong) NSString *total_num;
/**logo*/
@property (nonatomic, strong) NSString *logo;
/**图片地址*/
@property (nonatomic, strong) NSURL *pic_url;


@end