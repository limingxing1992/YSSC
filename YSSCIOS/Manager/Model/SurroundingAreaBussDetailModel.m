//
//  SurroundingAreaBussDetailModel.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/13.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SurroundingAreaBussDetailModel.h"

@implementation SurroundingAreaBussDetailModel


+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"commentList": @"SurroundingAreaBussDetailCommentItemModel"};
}

@end


@implementation SurroundingAreaBussDetailCommentItemModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}


@end