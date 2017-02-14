//
//  AreaObject.m
//  YSSCIOS
//
//  Created by Rock on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "AreaObject.h"

@implementation AreaObject

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"data":@"AreaDataObject"
             };
}

@end


@implementation AreaDataObject

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end
