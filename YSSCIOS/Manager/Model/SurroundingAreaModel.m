//
//  SurroundingAreaModel.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/13.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SurroundingAreaModel.h"

@implementation SurroundingAreaModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"data": @"SurroundingAreaItemModel"};
}

@end

@implementation SurroundingAreaItemModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end