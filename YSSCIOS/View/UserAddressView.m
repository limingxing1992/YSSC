//
//  UserAddressView.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/14.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserAddressView.h"

@interface UserAddressView ()


/**line*/
@property (nonatomic, strong) UIView *lineView;

@end

@implementation UserAddressView

- (UILabel *)headLabel{
    if (_headLabel == nil) {
        _headLabel = [[UILabel alloc] init];
        _headLabel.textColor = SHENTEXTCOLOR;
        _headLabel.font = FONT(14);
    }
    return _headLabel;
}

- (UITextField *)textField{
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.textColor = LIGHTTEXTCOLOR;
        _textField.font = FONT(14);
    }
    return _textField;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.headLabel];
    [self addSubview:self.textField];
    [self addSubview:self.lineView];
    
    
    self.headLabel.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self, 15)
    .widthIs(62)
    .autoHeightRatio(0);

    
    self.textField.sd_layout
    .topSpaceToView(self, 15)
    .rightSpaceToView(self, 15)
    .leftSpaceToView(self.headLabel, 30)
    .heightIs(15);
    
    self.lineView.sd_layout
    .bottomSpaceToView(self, 0)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(0.5);
    
}

@end
