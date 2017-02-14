//
//  NSDictionary+Log.m
//
//  Created by Rock on 16/5/13.
//  Copyright © 2016年 Garlic Studio. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)


//此方法为系统方法所以不需要引用头文件只需在项目中导入.m文件即可使用
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    
    
    // 1.定义一个可变的字符串, 保存拼接结果
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"{\n"];
    // 2.迭代字典中所有的key/value, 将这些值拼接到字符串中
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ : %@\n", key, obj];
    }];
    [strM appendString:@"}"];
    
//    // 删除最后一个逗号
//    if (self.allKeys.count > 0) {
//        NSRange range = [strM rangeOfString:@"," options:NSBackwardsSearch];
//        [strM deleteCharactersInRange:range];
//    }
    
    // 3.返回拼接好的字符串
    return strM;
}

@end


@implementation NSArray (Log)

-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    // 1.定义一个可变的字符串, 保存拼接结果
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"(\n"];
    // 2.迭代字典中所有的key/value, 将这些值拼接到字符串中
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    [strM appendString:@")\n"];
    
    // 删除最后一个逗号
    if (self.count > 0) {
        NSRange range = [strM rangeOfString:@"," options:NSBackwardsSearch];
        [strM deleteCharactersInRange:range];
    }
    
    // 3.返回拼接好的字符串
    return strM;
}
@end

