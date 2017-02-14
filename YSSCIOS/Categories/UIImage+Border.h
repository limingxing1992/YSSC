//
//  UIImage+Border.h
//  d501test3
//
//  Created by Rock on 16/5/1.
//  Copyright © 2016年 Garlic Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Border)
+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image;
@end
