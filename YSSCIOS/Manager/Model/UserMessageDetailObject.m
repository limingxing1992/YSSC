//
//  UserMessageDetailObject.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserMessageDetailObject.h"

@implementation UserMessageDetailObject

@end


@implementation UserMessageDetailDataObject

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end