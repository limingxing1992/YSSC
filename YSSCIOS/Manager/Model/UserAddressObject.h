//
//  UserAddressObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/14.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@interface UserAddressObject : BaseObject

/**data*/
@property (nonatomic, strong) NSMutableArray *data;

@end


@interface UserAddressDataObject : NSObject

/**id*/
@property (nonatomic, strong) NSString *ID;
/**姓名*/
@property (nonatomic, strong) NSString *name;
/**地区*/
@property (nonatomic, strong) NSString *area;
/**邮编*/
@property (nonatomic, strong) NSString *postcode;
/**地址*/
@property (nonatomic, strong) NSString *address;
/**联系方式*/
@property (nonatomic, strong) NSString *cellphone;
/**是否默认*/
@property (nonatomic, assign) BOOL isdefault;
/**创建时间*/
@property (nonatomic, strong) NSString *create_time;

@end