    //
//  MallShopCommentModel.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallShopCommentModel.h"

@implementation MallShopCommentModel


+ (NSDictionary *)mj_objectClassInArray{
    return @{@"data":@"MallShopCommentItemModel"};
}
@end


@implementation MallShopCommentItemModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"Id":@"id"};
}

@end