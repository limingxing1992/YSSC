//
//  UserChooseAddressViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserAddressDataObject;

@protocol UserChooseAddressViewControllerDelegate <NSObject>

@optional

/**选择地址*/
- (void)userChooseAddressViewControllerDidSelectAddress:(UserAddressDataObject *)model;

@end

@interface UserChooseAddressViewController : UIViewController

/**代理*/
@property (nonatomic, assign) id<UserChooseAddressViewControllerDelegate> delegate;


@end
