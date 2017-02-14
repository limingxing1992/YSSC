//
//  UserOrderSubViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/19.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserOrderSubViewController : UIViewController

/**商品订单网络请求*/
@property (nonatomic, strong) NSMutableDictionary *goodsParameterDict;

- (instancetype)initWithNav;

@end
