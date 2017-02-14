//
//  HotelDetailCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickBlock)(UIButton *button);

@class RoomTypeDataObject;

@interface HotelDetailCell : UITableViewCell


@property (nonatomic, copy) ButtonClickBlock buttonClickBlock;

- (void)buttonDidClick:(ButtonClickBlock)block;

/**model*/
@property (nonatomic, strong) RoomTypeDataObject *model;

@end
