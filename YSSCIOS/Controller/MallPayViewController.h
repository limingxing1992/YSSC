//
//  MallPayViewController.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MallPayViewController : UIViewController

@property (nonatomic, copy) NSString *orderNum;//订单号

@property (nonatomic, copy) NSString *totalPrice;//总价

@property (nonatomic, copy) NSString *blancePrice;//余额 五云珠

/** 从订单中心进入传时间*/
@property (nonatomic, copy) NSString *orderCreateTime;


@end
