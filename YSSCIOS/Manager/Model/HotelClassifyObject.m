//
//  HotelClassifyObject.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelClassifyObject.h"
#import <MJExtension/MJExtension.h>

@implementation HotelClassifyObject

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"data":@"HotelClassifyDataObject"
             };
}

@end



@implementation HotelClassifyDataObject


+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}
@end
