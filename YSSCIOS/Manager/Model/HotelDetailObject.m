//
//  HotelDetailObject.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelDetailObject.h"


@implementation HotelDetailObject

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end


@implementation HotelDetailDataObject

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"imgList":@"HotelDetailDataScrollObject"
             };
}


+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id",
             @"impress":@"description"
             };
}

@end



@implementation HotelDetailDataScrollObject

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}

@end
