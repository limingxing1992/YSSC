//
//  NSString+Hashing.h
//  TreatNew
//
//  Created by bsetech on 16/3/21.
//  Copyright © 2016年 StarLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hashing)

//MD5加密
- (NSString *)MD5Hash;

//邮箱验证
- (BOOL) validateEmail;

//手机号验证
- (BOOL) validateMobile;
//数字验证

- (BOOL)validateNumber;
//获取时间戳
+ (NSString *)getSecret;

//七牛key
+ (NSString *)getDateTimeString;

//富文本字体转化
- (NSAttributedString *)attributeStrWithAttributes:(NSDictionary *)attributes range:(NSRange)range;

@end
