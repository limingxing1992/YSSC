//
//  DatePickerButton.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "DatePickerButton.h"

@interface DatePickerButton ()

/**leftView*/
@property (nonatomic, strong) UIView *leftView;
/**rightView*/
@property (nonatomic, strong) UIView *rightView;

/**绿色圆点*/
@property (nonatomic, strong) UIView *roundView;

/**label*/
//@property (nonatomic, strong) UILabel *tagLabel;

@end

@implementation DatePickerButton

-(UIView *)leftView{
    if (_leftView == nil) {
        _leftView = [[UIView alloc] init];
        _leftView.backgroundColor = YSSCRGBColor(165, 219, 208);
        _leftView.hidden = YES;
        _leftView.alpha = 0.5;
        _leftView.userInteractionEnabled = NO;
        
    }
    return _leftView;
}

-(UIView *)rightView{
    if (_rightView == nil) {
        _rightView = [[UIView alloc] init];
        _rightView.backgroundColor = YSSCRGBColor(165, 219, 208);
        _rightView.hidden = YES;
        _rightView.alpha = 0.5;
        _rightView.userInteractionEnabled = NO;
    }
    return _rightView;
}


-(UIView *)roundView{
    if (_roundView == nil) {
        _roundView = [[UIView alloc] init];
        _roundView.backgroundColor = MALLColor;
        _roundView.layer.cornerRadius = 9;
        _roundView.hidden = YES;
        _roundView.userInteractionEnabled = NO;
    }
    return _roundView;
}

- (UILabel *)tagLabel{
    if (_tagLabel == nil) {
        _tagLabel = [[UILabel alloc] init];
        _tagLabel.textColor = LIGHTTEXTCOLOR;
        _tagLabel.font = FONT(12);
    }
    return _tagLabel;
}

- (void)setFlag:(ButtonState)flag{
    _flag = flag;
    
    switch (flag) {
        case ButtonStateFirst:
            self.rightView.hidden = NO;
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case ButtonStateMiddle:
            self.rightView.hidden = NO;
            self.leftView.hidden = NO;
           [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case ButtonStateLast:
            self.leftView.hidden = NO;
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            break;
        case ButtonStateNone:
            self.leftView.hidden = YES;
            self.rightView.hidden = YES;
            self.roundView.hidden = YES;
            self.tagLabel.text = @"";
            [self setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
            break;
        case ButtonStateSel:
            self.roundView.hidden = NO;
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        default:
            break;
    }

    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftView];
        [self addSubview:self.rightView];
        [self addSubview:self.roundView];
        [self addSubview:self.tagLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    CGFloat width = self.frame.size.width * 0.5;
//    CGFloat height = self.frame.size.height;
  //  self.leftView.frame = CGRectMake(0, 0, width, height);
    
    self.leftView.sd_layout
    .topSpaceToView(self, 0)
    .leftSpaceToView(self,0)
    .widthRatioToView(self, 0.5)
    .heightIs(26);
    
    self.rightView.sd_layout
    .topSpaceToView(self, 0)
    .rightSpaceToView(self,0)
    .widthRatioToView(self, 0.5)
    .heightIs(26);
    
    self.roundView.sd_layout
    .topSpaceToView(self, 0)
    .centerYEqualToView(self.leftView)
    .centerXEqualToView(self)
    .heightIs(26)
    .widthIs(26);
    [self.roundView setSd_cornerRadiusFromWidthRatio:@0.5];
    
    self.tagLabel.sd_layout
    .topSpaceToView(self.roundView,2)
    .centerXEqualToView(self.roundView)
    .autoHeightRatio(0);
    [self.tagLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    
    
  //  self.rightView.frame = CGRectMake(width, 0, width, height);
    
  //  self.roundView.frame = self.bounds;
}



@end
