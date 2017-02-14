//
//  NSArray+Properties.h
//  TreatNew
//
//  Created by 李明星 on 16/4/28.
//  Copyright © 2016年 StarLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Properties)

//获取运行时类的所有属性
+ (instancetype)getProperties:(Class)cls;


@end
