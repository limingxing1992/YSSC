//
//  HotelMapCell.h
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelMapCell : UITableViewCell

/**model*/
@property (nonatomic, strong) HotelDetailDataObject *model;

@property (nonatomic, copy) ButtonClickBlock buttonClickBlock;

- (void)buttonDidClick:(ButtonClickBlock)block;

@end