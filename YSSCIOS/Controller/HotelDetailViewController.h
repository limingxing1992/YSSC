//
//  HotelDetailViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelDetailViewController : UIViewController

/**乡宿ID*/
@property (nonatomic, strong) NSString *hotelID;
/**HotelName*/
@property (nonatomic, strong) NSString *hotelName;
/**入住日期*/
@property (nonatomic, strong) NSMutableArray *dateArray;

@end
