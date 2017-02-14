//
//  HotelIndexCityObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/10/11.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@class HotelIndexCityDataObject;

@interface HotelIndexCityObject : BaseObject

@property (nonatomic,strong) HotelIndexCityDataObject *data;

@end

@interface HotelIndexCityDataObject : NSObject


/**推荐城市列表*/
@property (nonatomic, strong) NSMutableArray *indexCityList;

/**自营民宿*/
@property (nonatomic, strong) NSMutableArray *indexVillageClassifyList;



@end


@interface IndexCity : NSObject

@property (nonatomic,strong) NSString *ID;
@property (nonatomic,strong) NSString *areaId;
@property (nonatomic,strong) NSString *aname;
@property (nonatomic,strong) NSString *subtitle;
@property (nonatomic,strong) NSURL *backImage;

@end

@interface IndexVillage : NSObject

@property (nonatomic,strong) NSString *ID;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *remark;
@property (nonatomic,strong) NSURL *logo;
@property (nonatomic,strong) NSURL *pic_url;

@end
