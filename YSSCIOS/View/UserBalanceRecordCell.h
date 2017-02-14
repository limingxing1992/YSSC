//
//  UserBalanceRecordCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserBalanceDataDetailObject;

@interface UserBalanceRecordCell : UITableViewCell

- (void)setTitle:(NSString *)title time:(NSString *)time money:(CGFloat)money;

/**model*/
@property (nonatomic, strong) UserBalanceDataDetailObject *model;

@end
