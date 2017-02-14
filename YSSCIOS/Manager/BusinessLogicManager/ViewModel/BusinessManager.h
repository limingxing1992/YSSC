//
//  BusinessManager.h
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserManager;
@class MallManager;
@class LoginManager;
@class HotelManager;
@class ArroundingAreaManager;
@class TravelManager;

@interface BusinessManager : NSObject

@property(nonatomic,strong) UserManager      *userManager;
@property(nonatomic,strong) MallManager      *mallManager;
@property(nonatomic, strong) LoginManager    *loginManger;
@property (nonatomic, strong) HotelManager   *hotelManger;
@property (nonatomic, strong) TravelManager *travelManager;

@property (nonatomic, strong) ArroundingAreaManager *arroundAreaManager;

/*********************************************************************
 函数名称 : shareBusinessManager:
 函数描述 : 共享默认实例` BusinessManager `。
 输入参数 :
 输出参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
+ (instancetype)shareBusinessManager;

@end
