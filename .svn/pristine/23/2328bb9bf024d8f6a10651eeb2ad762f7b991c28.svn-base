//
//  HotelDetailTopView.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelDetailTopView.h"
#import "SDCycleScrollView.h"
#import "YSSGreenBorderButton.h"
#import "HotelDetailObject.h"
#import "HotelStarView.h"

@interface HotelDetailTopView ()
<
SDCycleScrollViewDelegate
>

//顶部滚动图片展示
@property (nonatomic, strong) SDCycleScrollView *topScrollView;

//价格标签
@property (nonatomic, strong) UILabel *priceLabel;

//轮播图片数
@property (nonatomic, strong) UILabel *imgCountLabel;

//乡宿名称
@property (nonatomic, strong) UILabel *hotelNameLabel;

//乡宿LOGO
@property (nonatomic, strong) UIImageView *icon;

//房东容器
@property (nonatomic, strong) UIView *ownerView;

//房东
@property (nonatomic, strong) UILabel *ownerTitle;

//房东
@property (nonatomic, strong) UILabel *ownerLabel;

@property (nonatomic, strong) UIView *tagView; // 乡宿特点标签

/**星星容器*/
@property (nonatomic, strong) HotelStarView *starView;

@end


@implementation HotelDetailTopView


#pragma mark - 设置界面数据

- (void)setModel:(HotelDetailDataObject *)model{
    _model = model;
    //设置价格
    self.priceLabel.attributedText = [self convertStringToAttributedString:model.price.stringValue];
    //设置乡宿名称
    self.hotelNameLabel.text = model.hotel_name;
    //设置评分 地区 评论数
    [self.starView setLocation:model.aname score:model.score commentsCount:model.comment_num];
    //设置logo
    [self.icon sd_setImageWithURL:model.logo_pic placeholderImage:IMAGE(@"placeholder_head")];
    //设置房东
    self.ownerLabel.text = model.name;
    //设置轮播图
    NSMutableArray *imgArr = [NSMutableArray array];
    for (HotelDetailDataScrollObject *obj in model.imgList) {
        [imgArr addObject:obj.res_url];
    }
    self.topScrollView.imageURLStringsGroup = imgArr;
    YSSCWeakObj(self);
    [self.topScrollView setItemDidScrollOperationBlock:^(NSInteger index) {
        weakself.imgCountLabel.text = [NSString stringWithFormat:@"%zd/%lu",index + 1,(unsigned long)model.imgList.count];
    }];
    [self.alreadyButton setTitle:[NSString stringWithFormat:@"住过 (%@)",model.lived_num] forState:UIControlStateNormal];
    [self.wantButton setTitle:[NSString stringWithFormat:@"想住 (%@)",model.collect_num] forState:UIControlStateNormal];
    NSString *tagStr = _model.tag;
    NSArray *tagArr = [tagStr componentsSeparatedByString:@","];
    [self tagViewWithArr:tagArr];
}


//价格字符串转换
- (NSMutableAttributedString *)convertStringToAttributedString:(NSString *)str{
    NSInteger length = str.length;
    NSString *string = [NSString stringWithFormat:@"¥%@/晚",str];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeStr setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24]} range:NSMakeRange(1, length)];
    return attributeStr;
}


#pragma mark --------- 生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.topScrollView];
        [self addSubview:self.imgCountLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.ownerView];
//        [self.ownerView addSubview:self.ownerTitle];
//        [self.ownerView addSubview:self.ownerLabel];
        
        [self addSubview:self.ownerTitle];
        [self addSubview:self.ownerLabel];
        [self addSubview:self.tagView];
        [self addSubview:self.hotelNameLabel];
        [self addSubview:self.icon];
        //  [self addSubview:self.ownerLabel];
        [self addSubview:self.wantButton];
        [self addSubview:self.alreadyButton];
        
        [self addSubview:self.starView];
        [self addSubview:self.comeInShop];
        
        self.topScrollView.sd_layout
        .topEqualToView(self)
        .leftEqualToView(self)
        .rightEqualToView(self)
        .heightIs(280);
        
        self.priceLabel.sd_layout
        .leftSpaceToView(self, 15)
        .bottomEqualToView(self.topScrollView)
        .heightIs(39)
        .widthIs(92);
        
        self.imgCountLabel.sd_layout
        .rightSpaceToView(self, 15)
        .centerYEqualToView(self.priceLabel)
        .autoHeightRatio(0);
        [self.imgCountLabel setSingleLineAutoResizeWithMaxWidth:300];
        
        self.hotelNameLabel.sd_layout
        .topSpaceToView(self.topScrollView, 16)
        .centerXEqualToView(self)
        .autoHeightRatio(0);
        [self.hotelNameLabel setSingleLineAutoResizeWithMaxWidth:300];
        
        //根据内容长度居中
        self.starView.sd_layout
        .topSpaceToView(self.hotelNameLabel, 13)
        .centerXEqualToView(self)
        .heightIs(10);
        // [self.starView setupAutoWidthWithRightView:self.starView.subviews.lastObject rightMargin:0];
        
        self.tagView.sd_layout
        .topSpaceToView(self.starView, 13)
        .centerXEqualToView(self)
        .heightIs(10);

        self.icon.sd_layout
        .bottomSpaceToView(self, 13)
        .leftSpaceToView(self, 18)
        .widthIs(60)
        .heightIs(60);
        
        //布局房东
        self.ownerLabel.sd_layout
        .bottomSpaceToView(self.icon, -24)
        .leftSpaceToView(self.icon, 10)
        .autoHeightRatio(0);
        [self.ownerTitle setSingleLineAutoResizeWithMaxWidth:300];
        

        
        self.ownerTitle.sd_layout
        .topSpaceToView(self.icon, -24)
        .leftSpaceToView(self.icon, 10)
        .autoHeightRatio(0);
        [self.ownerLabel setSingleLineAutoResizeWithMaxWidth:(300)];
        
//        self.ownerView.sd_layout
//        .topSpaceToView(self.icon, 10)
//        .centerXEqualToView(self)
//        .heightIs(14);
//        [self.ownerView setupAutoWidthWithRightView:self.ownerLabel rightMargin:0];
        self.comeInShop.sd_layout
        .centerYEqualToView(self.icon)
        .rightSpaceToView(self, 18)
        .widthIs(57)
        .heightIs(20);
        
        self.wantButton.sd_layout
        .topSpaceToView(self.tagView, 16)
        .leftSpaceToView(self, 18)
        .rightSpaceToView(self, SCREEN_WIDTH * 0.5 + 5)
        .heightIs(35);
        
        self.alreadyButton.sd_layout
        .topSpaceToView(self.tagView, 16)
        .rightSpaceToView(self, 18)
        .leftSpaceToView(self, SCREEN_WIDTH * 0.5 + 5)
        .heightIs(35);
        
        
        
        [self setupAutoHeightWithBottomView:self.icon bottomMargin:13];

    }
    return self;
}


- (void)tagViewWithArr:(NSArray *)tagArr{
    
    for (UIView *view in _tagView.subviews) {
        [view removeFromSuperview];
    }
    
    for (NSString *tagString in tagArr) {
        YSSGreenBorderButton *tagBtn = [YSSGreenBorderButton buttonWithType:UIButtonTypeCustom];
        tagBtn.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
        [tagBtn setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateNormal];
        tagBtn.layer.cornerRadius = 8;
        tagBtn.titleLabel.font = FONT(10);
        NSString *titleStr = [NSString stringWithFormat:@" %@ ",tagString];
        [tagBtn setTitle:titleStr forState:UIControlStateNormal];
        
        CGFloat width = titleStr.length * 10 + 4;
        if (_tagView.subviews.count == 0) {
            tagBtn.frame = CGRectMake(0, 0, width, 14);
        }else{
            UIButton *btn = _tagView.subviews.lastObject;
            tagBtn.frame = CGRectMake(CGRectGetMaxX(btn.frame) + 5, 0, width, 14);
        }
        [_tagView addSubview:tagBtn];
    }
    
    [self.tagView setupAutoWidthWithRightView:self.tagView.subviews.lastObject rightMargin:0];
    
}

#pragma mark - 想住 住过




#pragma mark - 懒加载

- (HotelStarView *)starView{
    if (_starView == nil) {
        _starView = [[HotelStarView alloc] init];
        
    }
    return _starView;
}

- (SDCycleScrollView *)topScrollView{
    if (_topScrollView == nil) {
        _topScrollView = [[SDCycleScrollView alloc] init];
        _topScrollView.placeholderImage = IMAGE(@"placeholder_loading");
        _topScrollView.delegate = self;
        _topScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
    }
    return _topScrollView;
}


- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.backgroundColor = [UIColor blackColor];
        _priceLabel.alpha = 0.6;
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.font = FONT(15);
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        
        //测试
        //   NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"¥998/晚"];
        //        [str setAttributes:@{NSFontAttributeName:FONT(23)} range:NSMakeRange(1, 3)];
        //        _priceLabel.attributedText = str;
    }
    return _priceLabel;
}

- (UILabel *)imgCountLabel{
    if (_imgCountLabel == nil) {
        _imgCountLabel = [[UILabel alloc] init];
        _imgCountLabel.font = FONT(12);
        _imgCountLabel.textColor = [UIColor whiteColor];
        //测试
        //        _imgCountLabel.text = @"0/0";
        
    }
    return _imgCountLabel;
}


- (UILabel *)hotelNameLabel{
    if (_hotelNameLabel == nil) {
        _hotelNameLabel = [[UILabel alloc] init];
        _hotelNameLabel.font = FONT(17);
        _hotelNameLabel.textColor = SHENTEXTCOLOR;
        //测试
        //        _hotelNameLabel.text = @"测试的酒店";
    }
    return _hotelNameLabel;
}

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor clearColor];
        _icon.layer.cornerRadius = 30;
        _icon.layer.masksToBounds = YES;
        _icon.image = IMAGE(@"placeholder_loading");
    }
    return _icon;
}

- (UIView *)ownerView{
    if (_ownerView == nil) {
        _ownerView = [[UIView alloc] init];
    }
    return _ownerView;
}

- (UILabel *)ownerTitle{
    if (_ownerTitle == nil) {
        _ownerTitle = [[UILabel alloc] init];
        _ownerTitle.backgroundColor = YSSCRGBColor(255, 123, 0);
        _ownerTitle.font = FONT(12);
        _ownerTitle.text = @"房东";
        _ownerTitle.textColor =[UIColor whiteColor];
        _ownerTitle.layer.cornerRadius = 1;
        
    }
    return _ownerTitle;
}


- (UILabel *)ownerLabel{
    if (_ownerLabel == nil) {
        _ownerLabel = [[UILabel alloc] init];
        _ownerLabel.font = FONT(12);
        _ownerLabel.textColor = SHENTEXTCOLOR;
        
    }
    return _ownerLabel;
}

- (YSSGreenBorderButton *)wantButton{
    if (_wantButton == nil) {
        _wantButton = [YSSGreenBorderButton buttonWithType:UIButtonTypeCustom];
        _wantButton.titleLabel.font = FONT(14);

        _wantButton.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
        [_wantButton setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateNormal];
        [_wantButton setTitleColor:MALLColor forState:UIControlStateSelected];
    }
    return _wantButton;
}

- (YSSGreenBorderButton *)alreadyButton{
    if (_alreadyButton == nil) {
        _alreadyButton = [YSSGreenBorderButton buttonWithType:UIButtonTypeCustom];
        _alreadyButton.titleLabel.font = FONT(14);

        _alreadyButton.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
        [_alreadyButton setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateNormal];
        [_alreadyButton setTitleColor:MALLColor forState:UIControlStateSelected];
    }
    return _alreadyButton;
}

- (UIView *)tagView{
    if (_tagView == nil) {
        _tagView = [[UIView alloc] init];
    }
    return _tagView;
}

- (YSSGreenBorderButton *)comeInShop{
    if (_comeInShop == nil) {
        _comeInShop = [[YSSGreenBorderButton alloc] init];
        [_comeInShop setTitle:@"进入店铺" forState:UIControlStateNormal];
        _comeInShop.titleLabel.font = FONT(10);
    }
    return _comeInShop;
}
@end
