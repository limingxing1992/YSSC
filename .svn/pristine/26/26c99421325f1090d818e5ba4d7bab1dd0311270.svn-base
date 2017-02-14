//
//  UserChangePhoneNumViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^callBack)(NSString *str);

@interface UserChangePhoneNumViewController : UIViewController

/**phone*/
@property (nonatomic, strong) NSString *phone;
/**传值block*/
@property (nonatomic, copy) callBack callBack;

- (void)callBack:(callBack)block;

@end
