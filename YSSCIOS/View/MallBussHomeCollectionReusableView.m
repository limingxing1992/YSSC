//
//  MallBussHomeCollectionReusableView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussHomeCollectionReusableView.h"

@interface MallBussHomeCollectionReusableView ()
<
    SDCycleScrollViewDelegate
>


@end

@implementation MallBussHomeCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = GRAYCOLOR;
        [self addSubview:self.bannerScr];
        self.bannerScr.sd_layout
        .bottomSpaceToView(self, 10)
        .topSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .rightSpaceToView(self, 0);
    }
    return self;
}


#pragma mark ----------------BannerDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}


#pragma mark ----------------s实例化

- (SDCycleScrollView *)bannerScr{
    if (_bannerScr == nil) {
        _bannerScr = [[SDCycleScrollView alloc] init];
        _bannerScr.delegate = self;
        _bannerScr.placeholderImage = PlaceholderImage;
    }
    return _bannerScr;
}


@end
