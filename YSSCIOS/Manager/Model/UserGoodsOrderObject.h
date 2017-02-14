//
//  UserGoodsOrderObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/19.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseObject.h"

@interface UserGoodsOrderObject : BaseObject

/**data*/
@property (nonatomic, strong) NSMutableArray *data;

@end


@interface UserGoodsOrderDataObject : NSObject

/**mdf*/
@property (nonatomic, strong) NSString *mdf;
/**订单号*/
@property (nonatomic, strong) NSString *order_number;
/**订单时间*/
@property (nonatomic, strong) NSString *order_time;
/**总价格*/
@property (nonatomic, strong) NSString *totalprice;
/**订单状态*/
@property (nonatomic, strong) NSString *status;
/**运费*/
@property (nonatomic, strong) NSString *express_money;
/**店铺名称*/
@property (nonatomic, strong) NSString *shop_name;
/**goods*/
@property (nonatomic, strong) NSMutableArray *goods;

@end


@interface UserGoodsObject : NSObject

/**子id*/
@property (nonatomic, strong) NSString *subOrderid;
/**子MDF*/
@property (nonatomic, strong) NSString *subgoods_mdf;
/**商品名称*/
@property (nonatomic, strong) NSString *goodsname;
/**原件*/
@property (nonatomic, strong) NSString *price;
/**促销价格*/
@property (nonatomic, strong) NSString *promotion_price;
/**数量*/
@property (nonatomic, strong) NSString *quantity;
/**总价*/
@property (nonatomic, strong) NSString *total_money;
/**属性名称*/
@property (nonatomic, strong) NSString *attr_name;
/**属性值*/
@property (nonatomic, strong) NSString *avalue;
/**图片*/
@property (nonatomic, strong) NSURL *pic;

@end