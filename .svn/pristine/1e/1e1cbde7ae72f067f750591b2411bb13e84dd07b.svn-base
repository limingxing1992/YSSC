//
//  HotelDetailChooseView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelDetailChooseView.h"
#import "HotelDetailDateView.h"


@interface HotelDetailChooseView ()

//上面的选择乡宿印象与预定房型选择
@property (nonatomic, strong) UIView *topView;
/**乡宿印象*/
@property (nonatomic, strong) UIButton *impressButton;
/**预订房型*/
@property (nonatomic, strong) UIButton *typeButton;
//下面的详细日期详细信息展示
@property (nonatomic, strong) UIView *dateInfoView;
//入住时间
@property (nonatomic, strong) HotelDetailDateView *fromDateView;
//退房事件
@property (nonatomic, strong) HotelDetailDateView *toDateView;
//选择日期按钮
@property (nonatomic, strong) UIButton *datePickerButton;
//跳转页面按钮
@property (nonatomic, strong) UIButton *jumpButton;
//住几天
@property (nonatomic, strong) UILabel *countLabel;
//斜杠
@property (nonatomic, strong) UILabel *lineLabel;

//被选中的按钮
@property (nonatomic, weak) UIButton *btnSelected;
//底部滑块
@property (nonatomic, strong) UIView *sliderView;

@end

@implementation HotelDetailChooseView



- (UIView *)topView{
    if (_topView == nil) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor whiteColor];
        
    }
    return _topView;
}

- (UIButton *)impressButton{
    if (_impressButton == nil) {
        _impressButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_impressButton setTitleColor:MALLColor forState:UIControlStateSelected];
        [_impressButton setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [_impressButton setTitle:@"乡宿印象" forState:UIControlStateNormal];
        [_impressButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _impressButton.tag = 201;
        _impressButton.titleLabel.font = FONT(13);
    }
    return _impressButton;
}

- (UIButton *)typeButton{
    if (_typeButton == nil) {
        _typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_typeButton setTitleColor:MALLColor forState:UIControlStateSelected];
        [_typeButton setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [_typeButton setTitle:@"预订房型" forState:UIControlStateNormal];
        [_typeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _typeButton.tag = 202;
        _typeButton.titleLabel.font = FONT(13);
    }
    return _typeButton;
}

- (HotelDetailDateView *)fromDateView{
    if (_fromDateView == nil) {
        _fromDateView = [[HotelDetailDateView alloc] init];
        
    }
    return _fromDateView;
}

- (HotelDetailDateView *)toDateView{
    if (_toDateView == nil) {
        _toDateView = [[HotelDetailDateView alloc] init];
    }
    return _toDateView;
}

- (UIButton *)datePickerButton{
    if (_datePickerButton == nil) {
        _datePickerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_datePickerButton setImage:IMAGE(@"classify38") forState:UIControlStateNormal];
    }
    return _datePickerButton;
}

- (UIButton *)jumpButton{
    if (_jumpButton == nil) {
        _jumpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_jumpButton setImage:IMAGE(@"classify15_0") forState:UIControlStateNormal];
        _jumpButton.tag = 203;
        [_jumpButton addTarget:self action:@selector(datePickBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton;
}

- (UILabel *)countLabel{
    if (_countLabel == nil) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.font = FONT(12);
        _countLabel.textColor = SHENTEXTCOLOR;
      
    }
    return _countLabel;
}

- (UILabel *)lineLabel{
    if (_lineLabel == nil) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.font = FONT(12);
        _lineLabel.textColor = SHENTEXTCOLOR;
        _lineLabel.text = @"/";
    }
    return _lineLabel;
}

- (UIView *)dateInfoView{
    if (_dateInfoView == nil) {
        _dateInfoView = [[UIView alloc] init];
        _dateInfoView.backgroundColor = [UIColor whiteColor];
 
        
    }
    return  _dateInfoView;
}

- (UIView *)sliderView{
    if (_sliderView == nil) {
        _sliderView = [[UIView alloc] init];
        _sliderView.backgroundColor = MALLColor;
    }
    return _sliderView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = GRAYCOLOR;
        [self addSubview:self.topView];
        [self addSubview:self.dateInfoView];
        [self.topView addSubview:self.impressButton];
        [self.topView addSubview:self.typeButton];
        [self.topView addSubview:self.sliderView];
        
        [self.dateInfoView addSubview:self.fromDateView];
        [self.dateInfoView addSubview:self.toDateView];
        [self.dateInfoView addSubview:self.datePickerButton];
        [self.dateInfoView addSubview:self.jumpButton];
        [self.dateInfoView addSubview:self.countLabel];
        [self.dateInfoView addSubview:self.lineLabel];
        //进入页面默认点击乡宿印象
        [self buttonClick:self.impressButton];

        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"住2天"];
        [str setAttributes:@{NSForegroundColorAttributeName:ORANGE_COLOR} range:NSMakeRange(1, 1)];
        self.countLabel.attributedText = str;
      
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(makesure) name:@"makeSureSchedule" object:nil];
    }
    return self;
}

//监听控制器
- (void)makesure{
    [self buttonClick:self.typeButton];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    // self.topView.frame = CGRectMake(0, 0, 20, 20);
    //        NSLog(@"%@",NSStringFromCGRect(self.frame));
    //        self.topView.sd_layout
    //        .topSpaceToView(self, 0)
    //        .rightSpaceToView(self,0)
    //        .leftSpaceToView(self,0)
    //        .bottomEqualToView(self);
    
    self.topView.frame = CGRectMake(0, 0.5, SCREEN_WIDTH, 45);
    self.dateInfoView.frame = CGRectMake(0, 46, SCREEN_WIDTH, 45);
    
    self.impressButton.sd_layout
    .leftSpaceToView(self.topView, 0)
    .topSpaceToView(self.topView, 0)
    .bottomSpaceToView(self.topView,0)
    .widthRatioToView(self.topView, 0.5);
    
    self.typeButton.sd_layout
    .leftSpaceToView(self.impressButton, 0)
    .topSpaceToView(self.topView, 0 )
    .bottomSpaceToView(self.topView, 0)
    .widthRatioToView(self.topView, 0.5);
    
    self.fromDateView.sd_layout
    .leftSpaceToView(self.dateInfoView, 80)
    .topSpaceToView(self.dateInfoView, 12)
    .widthIs(68)
    .heightIs(25);
    
    self.toDateView.sd_layout
    .rightSpaceToView(self.dateInfoView, 80)
    .topSpaceToView(self.dateInfoView, 12)
    .widthIs(68)
    .heightIs(25);
    
//    [self.fromDateView setupAutoWidthWithRightView:self.fromDateView.subviews.lastObject rightMargin:0 ];
    
    //self.fromDateView.frame = CGRectMake(0, 40, 30, 20);
    
    self.datePickerButton.sd_layout
    .leftSpaceToView(self.dateInfoView, 15)
    .centerYEqualToView(self.dateInfoView)
    .widthIs(20)
    .heightIs(20);
    
    self.jumpButton.sd_layout
    .rightSpaceToView(self.dateInfoView, 10)
    .centerYEqualToView(self.dateInfoView)
    .widthIs(40)
    .heightIs(25);
    
    self.countLabel.sd_layout
    .centerXEqualToView(self.dateInfoView)
    .topSpaceToView(self.dateInfoView, 5)
    .autoHeightRatio(0);
    [self.countLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.lineLabel.sd_layout
    .centerXEqualToView(self.dateInfoView)
    .bottomSpaceToView(self.dateInfoView, 10)
    .autoHeightRatio(0);
    [self.lineLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    
}

//乡宿印象和预定房型切换
- (void)buttonClick:(UIButton *)button{
    
    [self.btnSelected setSelected:NO];
    [button setSelected:YES];
    self.btnSelected = button;
    
    if (self.btnSelected.tag == 201) { //民宿印象
        self.dateInfoView.hidden = YES;
    }else{
        self.dateInfoView.hidden = NO;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.sliderView.sd_layout
        .bottomSpaceToView(self.topView, 0)
        .heightIs(2)
        .widthRatioToView(button, 0.6)
        .centerXEqualToView(button);
        [self.sliderView updateLayout];
    }];
    
    
    if (_buttonClickBlock) {
        _buttonClickBlock(button);
    }
}

//设置时间 
- (void)setdateArray:(NSMutableArray *)dateArr{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *indate = [dateFormatter dateFromString:dateArr.firstObject];
    NSDate *outdate = [dateFormatter dateFromString:dateArr.lastObject];
    [self.fromDateView setdate:indate];
    [self.toDateView setdate:outdate];
    self.countLabel.text = [NSString stringWithFormat:@"%ld天",dateArr.count - 1];
    
}

//日期时间点击
- (void)datePickBtnClick:(UIButton *)button{
    if (_buttonClickBlock) {
        _buttonClickBlock(button);
    }
}

- (void)buttonDidClick:(ButtonClickBlock)block{
    _buttonClickBlock = block;
}

@end