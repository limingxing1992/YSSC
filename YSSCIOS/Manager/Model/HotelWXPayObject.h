//
//  HotelWXPayObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@class HotelWXPayDataObject;

@interface HotelWXPayObject : BaseObject

/**data*/
@property (nonatomic, strong) HotelWXPayDataObject *data;

@end


@interface HotelWXPayDataObject : NSObject

/**appid*/
@property (nonatomic, strong) NSString *appid;
/**nonce_str*/
@property (nonatomic, strong) NSString *noncestr;
/**package*/
@property (nonatomic, strong) NSString *package;
/**partenerid*/
@property (nonatomic, strong) NSString *partnerid;
/**prepayid*/
@property (nonatomic, strong) NSString *prepayid;
/**sign*/
@property (nonatomic, strong) NSString *sign;
/**timestamp*/
@property (nonatomic, strong) NSString *timestamp;

@end