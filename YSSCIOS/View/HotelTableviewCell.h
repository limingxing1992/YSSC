//
//  HotelTableviewCell.h
//  YSSCIOS
//
//  Created by tsou on 16/8/11.
//  Copyright © 2016年 zzz. All rights reserved.
//


#import <UIKit/UIKit.h>

@class HotelTableviewCell;
@class HotelDataObject;

@protocol HotelTableviewCellDelegate <NSObject>

@optional
///标签点击事件
- (void)hotelTableView:(HotelTableviewCell *)cell cellTagButtonDidClickSearchMessage:(NSString *)message;
///imageView点击事件
- (void)hotelTableViewCell:(HotelTableviewCell *)cell imageViewDidClick:(NSString*)ID name:(NSString *)name;

@end

@interface HotelTableviewCell : UITableViewCell

@property (nonatomic, weak) id <HotelTableviewCellDelegate> delegate;

/**model*/
@property (nonatomic, strong) HotelDataObject *model;

@end
