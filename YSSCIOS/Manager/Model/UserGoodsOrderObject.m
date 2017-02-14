//
//  UserGoodsOrderObject.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/19.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserGoodsOrderObject.h"

@implementation UserGoodsOrderObject

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"data":@"UserGoodsOrderDataObject"
             };
}


@end


@implementation UserGoodsOrderDataObject

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"goods":@"UserGoodsObject"
             };
}

@end

@implementation UserGoodsObject



@end