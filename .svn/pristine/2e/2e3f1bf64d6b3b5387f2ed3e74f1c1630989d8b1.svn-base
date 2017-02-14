//
//  YSSCMJExtensionConfig.m
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "YSSCMJExtensionConfig.h"
#import <MJExtension/MJExtension.h>

@implementation YSSCMJExtensionConfig

+ (void)load
{
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"errorCode":@"status",
                 @"errorMsg":@"showMessage"};
    }];
}

@end
