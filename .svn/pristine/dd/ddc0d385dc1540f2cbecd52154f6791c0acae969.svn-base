//
//  YSSBlockUserButton.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "YSSBlockUserButton.h"

@implementation YSSBlockUserButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self
                 action:@selector(touchAction:)
       forControlEvents:UIControlEventTouchUpInside];
       
        
        [self setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [self setTitleColor:MALLColor forState:UIControlStateSelected];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.imageView.sd_layout
        .topSpaceToView(self, 20)
        .centerXEqualToView(self)
        .widthIs(25)
        .heightIs(22.5);
        
        self.titleLabel.sd_layout
        .topSpaceToView(self.imageView, 5.5)
        .centerXEqualToView(self)
        .autoHeightRatio(0);
        [self.titleLabel setSingleLineAutoResizeWithMaxWidth:100];
        
        self.titleLabel.font = FONT(14);
    }
    return self;
}

- (void)touchAction:(id)sender{
    if (_block) {
        _block(sender);
    }   
}

- (void)addTargetBlock:(TouchButton)touchButtonBlock{
    _block = touchButtonBlock;
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    self.imageView.frame = CGRectMake( (self.frame.size.width - (self.frame.size.height * 0.7)) * 0.5,0, self.frame.size.height * 0.7, self.frame.size.height * 0.7);
//    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.frame.size.width, self.frame.size.height * 0.3);

    
}


@end
