//
//  MallBussIntroTableViewCell.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MallBussIntroTableViewCell : UIView

@property (nonatomic, strong) UILabel *titleLb;//标题

//@property (nonatomic, strong) UILabel *contentLb;//实际内容

- (void)updateInfoWith:(NSDictionary *)dict;

@end
