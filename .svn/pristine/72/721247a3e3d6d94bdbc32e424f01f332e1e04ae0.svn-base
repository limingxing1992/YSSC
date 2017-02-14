//
//  BusinessManager.m
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BusinessManager.h"
#import "BusinessFactory.h"

@implementation BusinessManager

static BusinessManager *shareBusinessManager = nil;
+ (instancetype)shareBusinessManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareBusinessManager = [[self alloc] init];
    });
    return shareBusinessManager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [shareBusinessManager initBusiness];
        shareBusinessManager = [super allocWithZone:zone];
    });
    return shareBusinessManager;
}

- (instancetype)init
{
    if (self = [super init]) {
        [shareBusinessManager initBusiness];
    }
    return self;
}

- (void)initBusiness {
    @autoreleasepool {
        BusinessFactory  *factory = [[BusinessFactory alloc] init];
        _userManager = [factory createUserManager];
        _mallManager = [factory createMallManager];
        _loginManger = [factory creatLoginManager];
        _hotelManger = [factory creatHotelManager];
        _arroundAreaManager = [factory createArroundingManager];
        _travelManager = [factory createTravelManager];
    }
}

@end
