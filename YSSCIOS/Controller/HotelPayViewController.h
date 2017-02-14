//
//  HotelPayViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HotelOrderObject;

@interface HotelPayViewController : UIViewController


/**订单模型*/
@property (nonatomic, strong) HotelOrderObject *orderModel;
/**宾馆名称*/
@property (nonatomic, strong) NSString *hotelName;

@end
