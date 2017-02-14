//
//  UserOrderCommentCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderCommentCell.h"

@interface UserOrderCommentCell ()<UITextViewDelegate>

/**icon*/
@property (nonatomic, strong) UIImageView *icon;

/**分割线1*/
@property (nonatomic, strong) UIView *lineViewOne;
/**分割线2*/
@property (nonatomic, strong) UIView *lineViewTwo;
/**ping分*/
@property (nonatomic, strong) UILabel *scoreTitle;

@property (nonatomic, strong) UIImageView *firstStar;
@property (nonatomic, strong) UIImageView *secondStar;
@property (nonatomic, strong) UIImageView *thirdStar;
@property (nonatomic, strong) UIImageView *fourthStar;
@property (nonatomic, strong) UIImageView *fifthStar;

/**imgarr*/
@property (nonatomic, strong) NSMutableArray *imgAry;


@end

@implementation UserOrderCommentCell

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        
    }
    return _icon;
}

- (UITextView *)commentTextView{
    if (_commentTextView == nil) {
        _commentTextView = [[UITextView alloc] init];
        _commentTextView.textColor = LIGHTTEXTCOLOR;
        _commentTextView.text = @"写下对商品的感受吧，对他人帮助很大哦！";
        _commentTextView.delegate = self;
    }
    return _commentTextView;
}

- (UILabel *)scoreTitle{
    if (_scoreTitle == nil) {
        _scoreTitle = [[UILabel alloc] init];
        _scoreTitle.font = FONT(14);
        _scoreTitle.textColor = LIGHTTEXTCOLOR;
        _scoreTitle.text = @"评价";
    }
    return _scoreTitle;
}

- (UIView *)lineViewOne{
    if (_lineViewOne == nil) {
        _lineViewOne = [[UIView alloc] init];
        _lineViewOne.backgroundColor = GRAYCOLOR;
        
    }
    return _lineViewOne;
}

- (UIView *)lineViewTwo{
    if (_lineViewTwo == nil) {
        _lineViewTwo = [[UIView alloc] init];
        _lineViewTwo.backgroundColor = GRAYCOLOR;
    }
    return _lineViewTwo;
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


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.commentTextView];
    [self.contentView addSubview:self.scoreTitle];
    [self.contentView addSubview:self.firstStar];
    [self.contentView addSubview:self.secondStar];
    [self.contentView addSubview:self.thirdStar];
    [self.contentView addSubview:self.fourthStar];
    [self.contentView addSubview:self.fifthStar];
    [self.contentView addSubview:self.lineViewOne];
    [self.contentView addSubview:self.lineViewTwo];
    _imgAry = [NSMutableArray arrayWithObjects:self.firstStar,self.secondStar, self.thirdStar, self.fourthStar, self.fifthStar, nil];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.icon.sd_layout
    .topSpaceToView(self.contentView, 15)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(69)
    .heightIs(69);
    self.icon.backgroundColor = GRAYCOLOR;
    
    
    self.commentTextView.sd_layout
    .topSpaceToView(self.contentView, 15)
    .leftSpaceToView(self.self.icon, 15)
    .heightIs(69)
    .rightSpaceToView(self.contentView,15);
    
    self.lineViewOne.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5)
    .topSpaceToView(self.icon, 15);
    
    self.scoreTitle.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.lineViewOne, 15)
    .autoHeightRatio(0);
    [self.scoreTitle setSingleLineAutoResizeWithMaxWidth:100];
    
    self.firstStar.sd_layout
    .centerYEqualToView(self.scoreTitle)
    .leftSpaceToView(self.scoreTitle, 14)
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

    self.lineViewTwo.sd_layout
    .topSpaceToView(self.scoreTitle, 15)
    .leftEqualToView(self.contentView)
    .heightIs(0.5)
    .rightEqualToView(self.contentView);
    
    [self setupAutoHeightWithBottomView:self.lineViewTwo bottomMargin:0];
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 40)];
    
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    NSArray * buttonsArray = [NSArray arrayWithObjects:doneButton,nil];
    [topView setItems:buttonsArray];
    [self.commentTextView setInputAccessoryView:topView];
}

#pragma mark --------- cell增加分割线

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 10;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}


- (void)setIconUrl:(NSURL *)url{
    [self.icon sd_setImageWithURL:url placeholderImage:nil];
}


#pragma mark - 评分事件

- (void)jugeStar:(UITapGestureRecognizer *)tap{
    UIImageView *iv = (UIImageView *)tap.view;
    NSInteger tag = iv.tag;
    self.currentTag = tag;//表示当前评分数
    for (NSInteger i = 0; i < _imgAry.count; i++) {
        UIImageView *iv = _imgAry[i];
        [iv setImage:IMAGE(@"classify0_1")];
    }
    
    for (NSInteger i = 0; i <tag; i++) {
        UIImageView *iv = _imgAry[i];
        [iv setImage:IMAGE(@"classify4")];
    }
    
    if ([self.delegate respondsToSelector:@selector(userOrderCommentCell:stars:comment:)]) {
        [self.delegate userOrderCommentCell:self stars:_currentTag comment:_commentTextView.text];
    }
   
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"写下对商品的感受吧，对他人帮助很大哦！"]) {
        textView.text = @"";
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{

    
    if ([self.delegate respondsToSelector:@selector(userOrderCommentCell:stars:comment:)]) {
        [self.delegate userOrderCommentCell:self stars:_currentTag comment:_commentTextView.text];
    }
}

- (void)dismissKeyBoard{
    [self endEditing:YES];
}
@end
