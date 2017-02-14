//
//  BaseProcessor.m
//  YSSCIOS
//
//  Created by 张永亮 on 16/8/8.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "BaseProcessor.h"
#import <AFNetworking.h>

@implementation BaseProcessor

- (void)afHTTPSessionManagerToServerInteractionWithInterface:(NSString *)interface
                                                   parameter:(NSDictionary *)parameters
                                                     success:(void (^)(id responseObject))success
                                                     failure:(void (^)(NSError *error))failure
{
    [self afHTTPSessionManagerToServerInteractionWithUrlString:[NSString stringWithFormat:@"%@%@",[YSSUserDefault objectForKey:@"currentAPI"],interface]
                                                     parameter:parameters
                                                       success:success
                                                       failure:failure];
    
}

- (void)afHTTPSessionManagerToServerInteractionWithUrlString:(NSString *)urlString
                                                   parameter:(NSDictionary *)parameters
                                                     success:(void (^)(id responseObject))success
                                                     failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:urlString
       parameters:parameters
         progress:^(NSProgress *uploadProgress){
//             NSLog(@"uploadProgress:%f",uploadProgress.fractionCompleted);
         }
          success:^(NSURLSessionDataTask *task, id responseObject){
//              NSLog(@"success:%@",responseObject);
              success(responseObject);
          }
          failure:^(NSURLSessionDataTask *task, NSError *error){
//              NSLog(@"failure:%@",error);
              failure(error);
          }];
    
}



@end
