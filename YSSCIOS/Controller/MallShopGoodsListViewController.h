//
//  MallShopGoodsListViewController.h
//  YSSCIOS
//
//  Created by 李明星 on 16/9/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MallShopGoodsListViewController : UIViewController

@property (nonatomic, copy) NSString *shopId;//shopID
@property (nonatomic, copy) NSString *classId;//分类id。不传则为全部
@property (nonatomic, copy) NSString *keyWord;//关键词



@end
