//
//  RoomAttr.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/31.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@interface RoomAttr : NSObject

/**id*/
@property (nonatomic, strong) NSString *ID;
/**图片*/
@property (nonatomic, strong) NSURL *icon;
/**名称*/
@property (nonatomic, strong) NSString *name;

@end
