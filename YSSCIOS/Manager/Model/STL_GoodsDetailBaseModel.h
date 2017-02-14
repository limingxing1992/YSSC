//
//  STL_GoodsDetailBaseModel.h
//  LSDevModel3
//
//  Created by 李明星 on 16/9/6.
//  Copyright © 2016年 sen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STL_GoodsDetailBaseInfoModel;

@interface STL_GoodsDetailBaseModel : BaseObject

@property (nonatomic, strong) STL_GoodsDetailBaseInfoModel *data;

@end

@interface STL_GoodsDetailBaseInfoModel : NSObject

@property (nonatomic, copy) NSString *phone;                     //商家电话
@property (nonatomic, copy) NSString *mainGoodsPic;              //主商品图片
@property (nonatomic, copy) NSString *roundPic;                  //商品轮播图,以逗号分隔
@property (nonatomic, copy) NSString *goodsNumber;               //商品编号
@property (nonatomic, copy) NSString *isself;                   //未知属性
@property (nonatomic, strong) NSArray *attrValue;               //商品规格
@property (nonatomic, copy) NSString *orderCount;               //销量
@property (nonatomic, copy) NSString *Id;                       //商品ID
@property (nonatomic, copy) NSString *mainGoodsMdf;             //主商品mdf
@property (nonatomic, assign) NSInteger flag;                     //是否被收藏
@property (nonatomic, copy) NSString *price;                    //价格区间
@property (nonatomic, copy) NSString *shopId;                   //店铺Id
@property (nonatomic, copy) NSString *shopName;                 //店铺名字
@property (nonatomic, copy) NSString *logo_pic;                 //店铺logo
@property (nonatomic, strong) NSArray *subList;                 //子商品
@property (nonatomic, copy) NSString *qq;                       //店铺QQ
@property (nonatomic, copy) NSString *goodsName;                //商品名称


@end

@interface STL_GoodsDetailBaseAttrItemModel : NSObject

@property (nonatomic, copy) NSString *attrName;
@property (nonatomic, copy) NSString *attrValue;

@end



@interface STL_GoodsDetailBaseSubItemModel : NSObject
/*
 "mdf": "0f64f712c4cc41b196468b3004163458",// 子商品mdf
 "quantity": 1,
 "price": 500, // 价格
 "promotion_price": 100, //促销价
 "cargo_number": "1323", // 商品编号
 "amount": 50, // 库存
 "attr_id": 235, // 规格id
 "attr_name":"颜色", // 规格名称
 "avalue": "CX彩色", // 规格值
 "pic": "http://115.236.69.110:8458/xx.png"

 */

/*
 "shopId": 0,
 "shopName": null,
 "attr_name": "颜色", // 规格名称
 "avalue": "CXB-1黑色", // 规格值
 "cartId": 192,//购物车id
 "goodsId": 42,//主商品id
 "mainGoodsMdf"://主商品mdf "a0f9df2e79de45e894a18861ad8faf48",
 "subGoodsMdf": "215244f0f4354160a45aaaa5f9f15ca1",// 子商品mdf
 "gstandard": "CX彩色",//品牌
 "goodsName": "月饼",//商品名称
 "img": "http://115.236.69.110:8458/c.jpg",
 "goodsprice": 80,//商品价格  ------------------
 "userid": 755,
 "quantity": 5,//商品数量  -------------------
 "amount": 60, //库存
 "create_time": "2016-09-02 10:10:31" // 创建时间
 */


@property (nonatomic, copy) NSString *mdf;                  //子商品mdf
@property (nonatomic, copy) NSString *quantity;             //数量
@property (nonatomic, copy) NSString *price;                //市场价
@property (nonatomic, copy) NSString *promotion_price;      //折扣价
@property (nonatomic, copy) NSString *cargo_number;         //编号
@property (nonatomic, copy) NSString *amount;               //库存
@property (nonatomic, copy) NSString *attr_id;              //属性ID
@property (nonatomic, copy) NSString *attr_name;            //属性名称
@property (nonatomic, copy) NSString *avalue;               //属性值
@property (nonatomic, copy) NSString *pic;                  //图片
@property (nonatomic, copy) NSString *goodsName;            //商品名字
@property (nonatomic, copy) NSString *cartId;               //购物车ID

/**购物车中的状态 是否被选中*/
@property (nonatomic, assign) BOOL isSelected;


@end


