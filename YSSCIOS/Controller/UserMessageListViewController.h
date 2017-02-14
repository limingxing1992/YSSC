//
//  UserMessageListViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserMessageListViewController : UIViewController
//系统消息
- (instancetype)initPush;
//订单消息
- (instancetype)initOrder;
@end
