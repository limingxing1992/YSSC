//
//  HotelTableViewADCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/10/11.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HotelObject,HotelTableViewADCell;

@protocol HotelTableViewADCellDelegate <NSObject>
@optional
- (void)hotelTableViewADCell:(HotelTableViewADCell *)cell didSelectAtIndex:(NSInteger)index model:(HotelDataObject *)model;

@end

@interface HotelTableViewADCell : UITableViewCell

@property (nonatomic,strong) HotelObject *model;

/**delegate*/
@property (nonatomic, assign) id<HotelTableViewADCellDelegate> delegate;


@end
