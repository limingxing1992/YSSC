//
//  HotelStarView.m
//  YSSCIOS
//
//  Created by Rock on 16/8/19.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelStarView.h"


@interface HotelStarView ()

/**left*/
@property (nonatomic, strong) UILabel *locationLabel;
/**star*/
@property (nonatomic, strong) UIView *starView;
/**testla*/
@property (nonatomic, strong) UILabel *scoreLabel;
/**评价*/
@property (nonatomic, strong) UILabel *judeLabel;

@end


@implementation HotelStarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.locationLabel];
        [self addSubview:self.starView];
        [self addSubview:self.scoreLabel];
        [self addSubview:self.judeLabel];
        
        
        self.locationLabel.sd_layout
        .topSpaceToView(self, 0)
        .leftEqualToView(self)
        .bottomEqualToView(self);
        [self.locationLabel setSingleLineAutoResizeWithMaxWidth:(300)];
        
        self.starView.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self.locationLabel, 9)
        .bottomEqualToView(self)
        .widthIs(115 * 0.5);
        
        NSMutableArray *starArray = [NSMutableArray array];
        for ( NSInteger i = 0; i < 5; i++) {
            UIImageView * imageView = [[UIImageView alloc]init];
            [self.starView addSubview:imageView];
            imageView.sd_layout.autoHeightRatio(1);
            [starArray addObject:imageView];
        }
        
        [self.starView setupAutoWidthFlowItems:starArray withPerRowItemsCount:5 verticalMargin:0 horizontalMargin:2 verticalEdgeInset:0 horizontalEdgeInset:0];
        
        
        self.scoreLabel.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self.starView, 5)
        .bottomEqualToView(self);
        [self.scoreLabel setSingleLineAutoResizeWithMaxWidth:300];
        
        self.judeLabel.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self.scoreLabel, 5)
        .bottomEqualToView(self);
        [self.judeLabel setSingleLineAutoResizeWithMaxWidth:(300)];
        
        [self setupAutoWidthWithRightView:self.judeLabel rightMargin:0];
    }
    return self;
}

- (UILabel *)scoreLabel{
    if (_scoreLabel == nil) {
        _scoreLabel = [UILabel new];
        _scoreLabel.textColor = YSSCRGBColor(255, 123, 0);
        _scoreLabel.font = FONT(12);
        _scoreLabel.text = @"5分";
    }
    return _scoreLabel;
}

- (UILabel *)locationLabel{
    if (_locationLabel == nil) {
        _locationLabel = [UILabel new];
        _locationLabel.font = FONT(12);
        _locationLabel.textColor = SHENTEXTCOLOR;
        _locationLabel.text = @"浙江·杭州";
     
    }
    return _locationLabel;
}


- (UIView *)starView{
    if (_starView == nil) {
        _starView = [UIView new];
   
    }
    return _starView;
}

- (UILabel *)judeLabel{
    if (_judeLabel == nil) {
        _judeLabel = [UILabel new];
        _judeLabel.font = FONT(12);
        _judeLabel.textColor = SHENTEXTCOLOR;
        _judeLabel.text = @"23条";
    }
    return _judeLabel;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    
}

- (void)setLocation:(NSString *)location score:(NSNumber *)score commentsCount:(NSNumber *)count{
    
    for ( int i = 0; i < 5; i++) {
        UIImageView * imageView = self.starView.subviews[i];
        if (i >= score.intValue) {
            imageView.image = [UIImage imageNamed:@"classify0_1"];
        }else {
            imageView.image = [UIImage imageNamed:@"classify4"];
        }
    }
    self.locationLabel.text = location;
    self.scoreLabel.text = [NSString stringWithFormat:@"%.1f分",score.floatValue];
    self.judeLabel.text = [NSString stringWithFormat:@"/%d评价",count.intValue];

}


@end
