//
//  BaseManager.m
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseManager.h"

@implementation BaseManager

- (NSString *)analyticalHttpErrorDescription:(NSError *)error
{
    __weak NSDictionary *userInfo = error.userInfo;
    if (userInfo.count > 0) {
        return [self stringForValue:[userInfo objectForKey:@"NSLocalizedDescription"]];
    }
    return error.description;
}

- (NSString *)stringForValue:(id)obj
{
    if (obj == nil||
        obj == NULL||
        [obj isKindOfClass:[NSNull class]]) {
        return @"";
    }
    else if ([obj isKindOfClass:[NSString class]])
    {
        return obj;
    }
    else if ([obj isKindOfClass:[NSNumber class]])
    {
        return [obj stringValue];
    }
    
    return @"";
}

@end
