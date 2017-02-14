//
//  YSSStarView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/19.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "YSSStarView.h"


@interface YSSStarView ()

@property (nonatomic, strong) UILabel *numLabel;

@end

@implementation YSSStarView

- (UILabel *)numLabel{
    if (_numLabel == nil) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.font = FONT(12);
        _numLabel.textColor = ORANGE_COLOR; //黄色
        
    }
    return _numLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}


- (void)setup {
    
    for ( NSInteger i = 0; i < 5; i++) {
        UIImageView * imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
    }

    [self addSubview:self.numLabel];
    
}

- (void)setSelectedImageCount:(CGFloat)count {
    
    for ( NSInteger i = 0; i < self.subviews.count; i++) {
        UIImageView * imageView = self.subviews[i];
        
        if ([imageView isKindOfClass:[UIImageView class]]) {
            if (i >= count) {
                imageView.image = [UIImage imageNamed:@"classify0_1"];
            }else {
                imageView.image = [UIImage imageNamed:@"classify4"];
            }
        }
        
    }
    
    self.numLabel.text = [NSString stringWithFormat:@"%.1f分",count];
    
}

- (void)setImageCount:(CGFloat)count {
    
    for ( NSInteger i = 0; i < self.subviews.count; i++) {
        UIImageView * imageView = self.subviews[i];
        
        if ([imageView isKindOfClass:[UIImageView class]]) {
            if (i >= count) {
                imageView.image = [UIImage imageNamed:@"classify0_1"];
            }else {
                imageView.image = [UIImage imageNamed:@"classify4"];
            }
        }
        
    }
    
    self.numLabel.text = @"";
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat imageWH = 10;
    CGFloat blank = 2;
    for ( NSInteger i = 0; i < self.subviews.count ; i++) {
        
        UIImageView * imageView = self.subviews[i];
        
        if ([imageView isKindOfClass:[UIImageView class]]) {
            imageView.frame = CGRectMake(i * (imageWH + blank), 0, imageWH, imageWH);
        }
        
    }

    self.numLabel.frame = CGRectMake(62, -1.5, 30, 13);
    
    
    
}

@end

