//
//  UserChangeNameViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^callBack)(NSString *str);

@interface UserChangeNameViewController : UIViewController


/**name*/
@property (nonatomic, strong) NSString *name;
/**传值block*/
@property (nonatomic, copy) callBack callBack;

- (void)callBack:(callBack)block;

@end
