//
//  YSSChooseDateButton.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "YSSChooseDateButton.h"

@interface YSSChooseDateButton ()

//入住
@property (nonatomic, strong) UILabel *leftTitle;
//退房
@property (nonatomic, strong) UILabel *rightTitle;
//入住日期
@property (nonatomic, strong) UILabel *checkInLabel;
//退房日期
@property (nonatomic, strong) UILabel *checkOutLabel;
//分割线
@property (nonatomic, strong) UIView *separatorLine;

@end

@implementation YSSChooseDateButton

#pragma mark --------- 懒加载

- (UILabel *)leftTitle{
    if (_leftTitle == nil) {
        _leftTitle = [[UILabel alloc] init];
        _leftTitle.text = @"入住";
        _leftTitle.font = FONT(12);
        _leftTitle.textAlignment = NSTextAlignmentCenter;
        _leftTitle.textColor = BLACKTEXTCOLOR;
        
    }
    return _leftTitle;
}

- (UILabel *)rightTitle{
    if (_rightTitle == nil) {
        _rightTitle = [[UILabel alloc] init];
        _rightTitle.text = @"退房";
        _rightTitle.font = FONT(12);
        _rightTitle.textAlignment = NSTextAlignmentCenter;
        _rightTitle.textColor = BLACKTEXTCOLOR;
        
        
    }
    return _rightTitle;
}

- (UILabel *)checkInLabel{
    if (_checkInLabel == nil) {
        _checkInLabel = [[UILabel alloc] init];
        _checkInLabel.font = FONT(12);
        //测试数据
        _checkInLabel.text = @"选择日期";
        _checkInLabel.textAlignment = NSTextAlignmentCenter;
        _checkInLabel.textColor = MALLColor;
    }
    return _checkInLabel;
}

- (UILabel *)checkOutLabel{
    if (_checkOutLabel == nil) {
        _checkOutLabel = [[UILabel alloc] init];
        _checkOutLabel.font = FONT(12);
        //测试数据
        _checkOutLabel.text = @"—";
        _checkOutLabel.textAlignment = NSTextAlignmentCenter;
        _checkOutLabel.textColor = BLACKTEXTCOLOR;
        
    }
    return _checkOutLabel;
}

- (UIView *)separatorLine{
    if (_separatorLine == nil) {
        _separatorLine = [[UIView alloc] init];
        _separatorLine.backgroundColor = GRAYCOLOR;
        
    }
    return _separatorLine;
}


- (void)setCheckInDate:(NSString *)inDate CheckoutDate:(NSString *)outDate{
    self.checkInLabel.text = inDate;
    self.checkOutLabel.text = outDate;
}

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
        
        [self.layer setCornerRadius:3];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 2.5;
        [self addSubview:self.leftTitle];
        [self addSubview:self.rightTitle];
        [self addSubview:self.checkOutLabel];
        [self addSubview:self.checkInLabel];
        [self addSubview:self.separatorLine];
        
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat W = self.frame.size.width;
    CGFloat H = self.frame.size.height;
    
    self.leftTitle.frame = CGRectMake(0, 0, W * 0.4, 20);
    self.leftTitle.center = CGPointMake(W * 0.25, H * 0.5 - 10);
    
    self.rightTitle.frame = CGRectMake(0, 0,W * 0.4, 20);
    self.rightTitle.center = CGPointMake(W * 0.738, H * 0.5 - 10);
    
    self.checkInLabel.frame = CGRectMake(0, 0, W * 0.4, 20);
    self.checkInLabel.center = CGPointMake(W * 0.25, H * 0.5 + 10);
    
    self.checkOutLabel.frame = CGRectMake(0, 0, W * 0.4, 20);
    self.checkOutLabel.center = CGPointMake(W * 0.738, H * 0.5 + 10);
    
    self.separatorLine.frame = CGRectMake(W * 0.5, H * 0.1,1 ,H * 0.8);
 
}

@end
