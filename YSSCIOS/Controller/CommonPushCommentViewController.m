//
//  CommonPushCommentViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "CommonPushCommentViewController.h"

@interface CommonPushCommentViewController ()
<
    UITextViewDelegate
>

@property (nonatomic, strong) MallTopView *topView;//

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *pingfen;//评分二字

@property (nonatomic, strong) UITextView *textView;//评价内容

@property (nonatomic, strong) UIView *lineView;//切割线

@property (nonatomic, strong) UIView *sumbitView;//承载提交按钮视图

@property (nonatomic, strong) UIButton *sumbitBtn;//提交按钮

@property (nonatomic, assign) NSInteger currentTag;//当前点击

@property (nonatomic, strong) NSMutableArray *imgAry;//图片数组



@property (nonatomic, strong) UIImageView *firstStar;;
@property (nonatomic, strong) UIImageView *secondStar;;
@property (nonatomic, strong) UIImageView *thirdStar;;
@property (nonatomic, strong) UIImageView *fourthStar;;
@property (nonatomic, strong) UIImageView *fifthStar;;

@end

//classify4
@implementation CommonPushCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.sumbitView];
    _imgAry = [NSMutableArray arrayWithObjects:self.firstStar,self.secondStar, self.thirdStar, self.fourthStar, self.fifthStar, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.contentView.sd_layout
    .topSpaceToView(self.topView, 10)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(190);
    
    self.sumbitView.sd_layout
    .bottomSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(50);
    
    self.sumbitBtn.sd_layout
    .centerYEqualToView(self.sumbitView)
    .leftSpaceToView(self.sumbitView, 15)
    .rightSpaceToView(self.sumbitView, 15)
    .heightIs(37);
    [self.sumbitBtn setSd_cornerRadius:@5];
    
    
    self.pingfen.sd_layout
    .centerYIs(25)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    
    [self.pingfen setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.firstStar.sd_layout
    .centerYEqualToView(self.pingfen)
    .leftSpaceToView(self.pingfen, 14)
    .heightIs(22.5)
    .widthEqualToHeight();
    
    self.secondStar.sd_layout
    .centerYEqualToView(self.firstStar)
    .leftSpaceToView(self.firstStar, 5)
    .heightRatioToView(self.firstStar, 1)
    .widthEqualToHeight();
    
    self.thirdStar.sd_layout
    .centerYEqualToView(self.firstStar)
    .leftSpaceToView(self.secondStar, 5)
    .heightRatioToView(self.firstStar, 1)
    .widthEqualToHeight();
    
    self.fourthStar.sd_layout
    .centerYEqualToView(self.firstStar)
    .leftSpaceToView(self.thirdStar, 5)
    .heightRatioToView(self.firstStar, 1)
    .widthEqualToHeight();
    
    self.fifthStar.sd_layout
    .centerYEqualToView(self.firstStar)
    .leftSpaceToView(self.fourthStar, 5)
    .heightRatioToView(self.firstStar, 1)
    .widthEqualToHeight();

    self.lineView.sd_layout
    .topSpaceToView(self.contentView, 50)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(0.5);
    
    self.textView.sd_layout
    .topSpaceToView(self.lineView, 0)
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .bottomSpaceToView(self.contentView, 0);


}


#pragma mark ----------------提交评价

- (void)sumbitAction{
//    NSLog(@"提交评价");
//    NSLog(@"当前评分等级：%ld",_currentTag);
//    NSLog(@"当前评价内容:%@",_textView.text);
//    NSLog(@"当前评价商户:%@",_shopId);
    YSSCWeakObj(self);
    [SVProgressHUD showWithStatus:@"点评中"];
    
    [YSSCShareBusinessManager.arroundAreaManager getJugeSurroundingAreaBussWithParameter:@{@"businessId":_shopId, @"commentText":_textView.text, @"score":[NSNumber numberWithInteger:_currentTag]} success:^(id responObject) {
        [SVProgressHUD dismiss];
        [YSSCNotificationCenter postNotificationName:@"surroundingCommentListUpdate" object:nil];
        [weakself.navigationController popViewControllerAnimated:YES];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
        [SVProgressHUD showErrorWithStatus:errorMsg];
        
    }];
}


#pragma mark ----------------评分事件

- (void)jugeStar:(UITapGestureRecognizer *)tap{
    UIImageView *iv = (UIImageView *)tap.view;
    NSInteger tag = iv.tag;
    _currentTag = tag;//表示当前评分数
    for (NSInteger i = 0; i < _imgAry.count; i++) {
        UIImageView *iv = _imgAry[i];
        [iv setImage:IMAGE(@"classify0_1")];
    }

    for (NSInteger i = 0; i <tag; i++) {
        UIImageView *iv = _imgAry[i];
        [iv setImage:IMAGE(@"classify4")];
    }
}


#pragma mark ----------------textViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.textView.text = @"";
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([[[UITextInputMode currentInputMode] primaryLanguage]isEqualToString:@"emoji"]) {
        [SVProgressHUD showErrorWithStatus:@"暂不支持表情符号，请重新输入"];
        return NO;
        
    }
    
    return YES;
}

#pragma mark ----------------屏幕触摸放弃响应

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        [_topView setTitleText:@"提交评价" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
    
}

- (UIView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor  = WHITECOLOR;
        [_contentView sd_addSubviews:@[self.pingfen, self.firstStar, self.secondStar, self.thirdStar, self.fourthStar, self.fifthStar, self.lineView, self.textView]];
    }
    return _contentView;
}

- (UILabel *)pingfen{
    if (_pingfen == nil) {
        _pingfen = [[UILabel alloc] init];
        _pingfen.font = FONT(14);
        _pingfen.text = @"评分";
        _pingfen.textColor = LIGHTTEXTCOLOR;
    }
    return _pingfen;
}

- (UIImageView *)firstStar{
    if (_firstStar == nil) {
        _firstStar = [[UIImageView alloc] init];
        _firstStar.image = IMAGE(@"classify0_1");
        _firstStar.tag = 1;
        _firstStar.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jugeStar:)];
        [_firstStar addGestureRecognizer:tap];
    }
    return _firstStar;

}

- (UIImageView *)secondStar{
    if (_secondStar == nil) {
        _secondStar = [[UIImageView alloc] init];
        _secondStar.image = IMAGE(@"classify0_1");
        _secondStar.tag = 2;
        _secondStar.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jugeStar:)];
        [_secondStar addGestureRecognizer:tap];

    }
    return _secondStar;



}

- (UIImageView *)thirdStar{
    if (_thirdStar == nil) {
        _thirdStar = [[UIImageView alloc] init];
        _thirdStar.image = IMAGE(@"classify0_1");
        _thirdStar.tag = 3;
        _thirdStar.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jugeStar:)];
        [_thirdStar addGestureRecognizer:tap];

    }
    return _thirdStar;



}

- (UIImageView *)fourthStar{
    if (_fourthStar == nil) {
        _fourthStar = [[UIImageView alloc] init];
        _fourthStar.image = IMAGE(@"classify0_1");
        _fourthStar.tag = 4;
        _fourthStar.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jugeStar:)];
        [_fourthStar addGestureRecognizer:tap];

    }
    return _fourthStar;



}

- (UIImageView *)fifthStar{
    if (_fifthStar == nil) {
        _fifthStar = [[UIImageView alloc] init];
        _fifthStar.image = IMAGE(@"classify0_1");
        _fifthStar.tag = 5;
        _fifthStar.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jugeStar:)];
        [_fifthStar addGestureRecognizer:tap];

    }
    return _fifthStar;



}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (UITextView *)textView{
    if (_textView == nil) {
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = WHITECOLOR;
        _textView.textColor = LIGHTTEXTCOLOR;
        _textView.text = @"  您觉得这家店怎么样";
        _textView.delegate = self;
    }
    return _textView;

}

- (UIView *)sumbitView{
    if (_sumbitView == nil) {
        _sumbitView = [[UIView alloc] init];
        _sumbitView.backgroundColor = WHITECOLOR;
        [_sumbitView addSubview:self.sumbitBtn];
    }
    return _sumbitView;
}

- (UIButton *)sumbitBtn{
    if (_sumbitBtn == nil) {
        _sumbitBtn= [[UIButton alloc] init];
        _sumbitBtn.titleLabel.font = FONT(16);
        _sumbitBtn.backgroundColor = MALLColor;
        [_sumbitBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_sumbitBtn setTitle:@"提交评价" forState:UIControlStateNormal];
        [_sumbitBtn addTarget:self action:@selector(sumbitAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sumbitBtn;

}

@end
