//
//  YSSCTypeDef.h
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NILBlock)(void);//空block

typedef void(^STRBlock)(NSString *str);//参数为字符串类型的block

typedef void(^OBJBlock)(id responObject);//参数为id类型的block

typedef void(^ERRORBlock)(NSError *error);//参数为error的block

typedef void (^ERRORCODEBlock)(NSInteger errCode,NSString *errorMsg);//参数为解析后error的block

typedef NS_ENUM(NSInteger, SeverState) {//错误码，(-1, "重新登录"),(0, "错误提示内容"), (1, "操作成功")
    SeverStateSuccess = 1,
    SeverStateFaile = -1,
    SeverStateFault = 0,
    SeverStateNoLogin = 401
};

typedef NS_ENUM(NSInteger, UserHotelOrderState) {
    UserHotelOrderStateReadyToPay = 10,//待付款
    UserHotelOrderStateReadyToCheckIn = 20,//待入住
    UserHotelOrderStateReadyToCheckOut = 30,//待退房
    UserHotelOrderStateReadyToComment = 40,//待评价
    UserHotelOrderStateDone = 50//已完结
};