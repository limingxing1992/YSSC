//
//  UserIconCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserInfoObject;

typedef void(^buttonDidClick)(UIButton *button);

@interface UserIconCell : UITableViewCell

@property (nonatomic, copy) buttonDidClick block;

- (void)buttonDidClick:(buttonDidClick)block;

/**用户模型*/
@property (nonatomic, strong) UserInfoObject *userModel;

@end
