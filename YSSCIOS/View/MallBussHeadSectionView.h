//
//  MallBussHeadSectionView.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MallBussHeadSectionView : UITableViewHeaderFooterView

@property (nonatomic, strong) MallTabButton *bussHomeBtn;//商家首页

@property (nonatomic, strong) MallTabButton *allGoodsBtn;//全部宝贝

@property (nonatomic, strong) MallTabButton *bussMessBtn;//商家动态

- (void)addAction:(NSArray *)actionArys target:(id)target;

@end
