//
//  STL_ClassifyModel.h
//  LSDevModel3
//
//  Created by 李明星 on 16/9/5.
//  Copyright © 2016年 sen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STL_ClassifyModel : BaseObject

@property (nonatomic, strong) NSArray *data;//储存

@end


@interface STL_ClassifyItemModel : NSObject

@property (nonatomic, copy) NSString *cname;//名字

@property (nonatomic, copy) NSString *ID;//id

@property (nonatomic, copy) NSString *img;//图片


@end