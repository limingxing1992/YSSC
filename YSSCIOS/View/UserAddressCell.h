//
//  UserAddressCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>


@class UserAddressDataObject;

typedef void(^buttonDidClick)(UIButton *button);

@interface UserAddressCell : UITableViewCell

@property (nonatomic, copy) buttonDidClick block;

- (void)buttonDidClick:(buttonDidClick)block;

/**model*/
@property (nonatomic, strong) UserAddressDataObject *addressModel;

@end
