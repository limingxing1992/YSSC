//
//  UserAddressObject.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/14.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserAddressObject.h"

@implementation UserAddressObject

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"data":@"UserAddressDataObject"
             };
}


@end


@implementation UserAddressDataObject

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}


@end