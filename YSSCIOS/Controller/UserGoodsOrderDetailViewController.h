//
//  UserGoodsOrderDetailViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PayStatus) {
    PayStatusWaitMoney = 0,// 待付款
    PayStatusWaitDelivery,// 待发货
    PayStatusWaitReceive,// 待收货
    PayStatusWaitJudge,// 待评价
    PayStatusFinish// 已完成
};

@interface UserGoodsOrderDetailViewController : UIViewController

- (instancetype)initWithStatus:(PayStatus)status;

/**订单mdf*/
@property (nonatomic, strong) NSString *orderMdfString;
///**用户余额*/
//@property (nonatomic, strong) NSString *userBalance;
/**订单号*/
//@property (nonatomic, strong) NSString *orderNumber;

@end
