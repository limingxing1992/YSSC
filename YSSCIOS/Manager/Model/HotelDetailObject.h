//
//  HotelDetailObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseProcessor.h"


@class HotelDetailDataObject;

@interface HotelDetailObject : BaseObject

/**Detaildata*/
@property (nonatomic, strong) HotelDetailDataObject *data;

@end

@interface HotelDetailDataObject : NSObject

/**id*/
@property (nonatomic, strong) NSNumber *ID;
/**店铺id*/
@property (nonatomic, strong) NSString *shop_id;
/**乡宿名称*/
@property (nonatomic, strong) NSString *hotel_name;
/**logo*/
@property (nonatomic, strong) NSURL *logo_pic;
/**价格*/
@property (nonatomic, strong) NSNumber *price;
/**经度*/
@property (nonatomic, strong) NSNumber *longitude;
/**纬度*/
@property (nonatomic, strong) NSNumber *latitude;
/**地址*/
@property (nonatomic, strong) NSString *address;
/**房东名字*/
@property (nonatomic, strong) NSString *name;
/**乡宿印象description*/
@property (nonatomic, strong) NSString *impress;
/**评论数*/
@property (nonatomic, strong) NSNumber *comment_num;
/**住过数量*/
@property (nonatomic, strong) NSNumber *lived_num;
/**想住数量*/
@property (nonatomic, strong) NSNumber *collect_num;
/**评分*/
@property (nonatomic, strong) NSNumber *score;
/**地区*/
@property (nonatomic, strong) NSString *aname;
/**轮播图*/
@property (nonatomic, strong) NSMutableArray *imgList;

@property (nonatomic, assign) CGFloat impressCellHeight;
/**特性标签*/
@property (nonatomic, strong) NSString *tag;
/**是否收藏*/
@property (nonatomic, assign) BOOL flag;


@end



@interface HotelDetailDataScrollObject : NSObject

/**轮播图id*/
@property (nonatomic, strong) NSNumber *ID;

/**轮播图地址*/
@property (nonatomic, strong) NSURL *res_url;

@end
