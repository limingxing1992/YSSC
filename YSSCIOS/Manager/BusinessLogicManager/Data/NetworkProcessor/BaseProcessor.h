//
//  BaseProcessor.h
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseProcessor : NSObject

/*********************************************************************
 函数名称 : afHTTPSessionManagerToServerInteractionWithInterface:
 函数描述 : AFHTTPSessionManager响应请求
 输入参数 :
 输出参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)afHTTPSessionManagerToServerInteractionWithInterface:(NSString *)interface
                                                   parameter:(NSDictionary *)parameters
                                                     success:(void (^)(id responseObject))success
                                                     failure:(void (^)(NSError *error))failure;

@end
