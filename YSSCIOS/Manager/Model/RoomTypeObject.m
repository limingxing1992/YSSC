//
//  RoomTypeObject.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/31.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "RoomTypeObject.h"

#import <MJExtension/MJExtension.h>

@implementation RoomTypeObject

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"data":@"RoomTypeDataObject"
             };
}

@end



@implementation RoomTypeDataObject

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end