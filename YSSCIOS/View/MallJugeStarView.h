//
//  MallJugeStarView.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MallJugeStarView : UIView

@property (nonatomic, strong) UIImageView *firstStar;
@property (nonatomic, strong) UIImageView *secondStar;
@property (nonatomic, strong) UIImageView *thirdStar;
@property (nonatomic, strong) UIImageView *fourthStar;
@property (nonatomic, strong) UIImageView *fifthStar;
@property (nonatomic, strong) UILabel *starNumLb;

- (void)updateInfoWith:(NSInteger)level;


@end
