//
//  UserOrderCommentViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserGoodsOrderDetailObject,UserHotelOrderDetailObject;

@interface UserOrderCommentViewController : UIViewController

/**model*/
@property (nonatomic, strong) UserGoodsOrderDetailObject *model;

@property (nonatomic, strong) UserHotelOrderDetailObject *hotelModel;

/**是否是民宿订单*/
@property (nonatomic, assign) BOOL isHotelOrder;

@end
