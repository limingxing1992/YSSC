//
//  UserFavoriteObject.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/20.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserFavoriteObject.h"

@implementation UserFavoriteObject

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"data":@"UserFavoriteDataObject"
             };
}

@end


@implementation UserFavoriteDataObject

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end