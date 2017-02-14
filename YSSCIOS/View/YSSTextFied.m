//
//  YSSTextFied.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "YSSTextFied.h"

@interface YSSTextFied ()

@property (nonatomic, strong) UIView *lineView;


@end

@implementation YSSTextFied

- (instancetype)init{
    self = [super init];
    if (self) {
        self.font = FONT(14);
        self.textColor = BLACKTEXTCOLOR;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:self.lineView];
        _lineView.sd_layout
        .bottomSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .rightSpaceToView(self, 0)
        .heightIs(0.5);
    }
    return self;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

@end
