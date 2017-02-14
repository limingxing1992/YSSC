//
//  HotelTableviewCell.m
//  YSSCIOS
//
//  Created by tsou on 16/8/11.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelTableviewCell.h"
#import "YSSStarView.h"
#import "HotelObject.h"
#import "UIImage+Border.h"
#import "YSSGreenBorderButton.h"


@interface HotelTableviewCell()

@property (nonatomic, strong) UIImageView *headImageView; // 顶部大图

@property (nonatomic, strong) UILabel *priceLabel; // 价格信息

@property (nonatomic, strong) UILabel *hotelNameLabel; // 乡宿店名

@property (nonatomic, strong) UILabel *locationLabel; // 位置信息

@property (nonatomic, strong) YSSStarView *starView; //评分信息

@property (nonatomic, strong) UILabel *judeCountLabel; //评价数量

@property (nonatomic, strong) UIImageView *icon; // 乡宿圆形图标

@property (nonatomic, strong) UIView *iconBackView;//圆形图标承载图

@property (nonatomic, strong) UIView *tagView; // 乡宿特点标签

///**lineView*/
//@property (nonatomic, strong) UIView *bottomLineView;




@end

@implementation HotelTableviewCell

#pragma mark --------- 懒加载

- (UIImageView *)headImageView{
    if (_headImageView == nil) {
        _headImageView = [[UIImageView alloc] init];
        [_headImageView addSubview:self.priceLabel];
        _headImageView.image = IMAGE(@"placeholder_loading");
        _headImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageViewDidClick:)];
        [_headImageView addGestureRecognizer:tap];
    }
    return _headImageView;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.textAlignment = NSTextAlignmentCenter;

    }
    return _priceLabel;
}



- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor whiteColor];
        _icon.image = IMAGE(@"placeholder_head");

    }
    return _icon;
}

- (UIView *)iconBackView{
    if (_iconBackView == nil) {
        _iconBackView = [[UIView alloc] init];
        _iconBackView.backgroundColor = [UIColor whiteColor];
    }
    return _iconBackView;
}


- (UILabel *)hotelNameLabel{
    if (_hotelNameLabel == nil) {
        _hotelNameLabel = [[UILabel alloc] init];
        _hotelNameLabel.font = [UIFont systemFontOfSize:15];

    }
    return _hotelNameLabel;
}

- (UILabel *)locationLabel{
    if (_locationLabel == nil) {
        _locationLabel = [[UILabel alloc] init];
        _locationLabel.font = FONT(12);
        _locationLabel.textColor = SHENTEXTCOLOR;
    }
    return _locationLabel;
}

- (YSSStarView *)starView{
    if (_starView == nil) {
        _starView = [[YSSStarView alloc] init];
     //   [_starView setSelectedImageCount:3.5];
    }
    return _starView;
}

- (UILabel *)judeCountLabel{
    if (_judeCountLabel == nil) {
        _judeCountLabel = [[UILabel alloc] init];
        _judeCountLabel.font = FONT(12);
        _judeCountLabel.textColor = SHENTEXTCOLOR;
        
    }
    return _judeCountLabel;
}



- (UIView *)tagView{
    if (_tagView == nil) {
        _tagView = [[UIView alloc] init];
    }
    return _tagView;
}

//- (UIView *)bottomLineView{
//    if (_bottomLineView == nil) {
//        _bottomLineView = [[UIView alloc] init];
//        _bottomLineView.backgroundColor = GRAYCOLOR;
//    }
//    return _bottomLineView;
//}

- (void)tagViewWithArr:(NSArray *)tagArr{


    for (UIView *view in _tagView.subviews) {
        [view removeFromSuperview];
    }
    
    for (NSString *tagString in tagArr) {
        YSSGreenBorderButton *tagBtn = [YSSGreenBorderButton buttonWithType:UIButtonTypeCustom];
        tagBtn.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
        [tagBtn setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateNormal];
        tagBtn.layer.cornerRadius = 2;
        tagBtn.titleLabel.font = FONT(10);
        [tagBtn setTitle:tagString forState:UIControlStateNormal];
        [tagBtn addTarget:self action:@selector(tagButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
        CGFloat width = tagString.length * 10 + 4;
        if (_tagView.subviews.count == 0) {
            tagBtn.frame = CGRectMake(0, 0, width, 14);
        }else{
            UIButton *btn = _tagView.subviews.lastObject;
            
           tagBtn.frame = CGRectMake(CGRectGetMaxX(btn.frame) + 5, 0, width, 14);
        }
        [_tagView addSubview:tagBtn];
    }

}




- (void)setModel:(HotelDataObject *)model{
    _model = model;
    [self.starView setSelectedImageCount:_model.score.floatValue];

    
    [self.headImageView sd_setImageWithURL:_model.thumb_pic placeholderImage:IMAGE(@"placeholderImage")];
    self.hotelNameLabel.text = _model.hotel_name;
    [self.icon sd_setImageWithURL:model.logo_pic placeholderImage:IMAGE(@"placeholder_head")];
    self.priceLabel.attributedText = [self convertStringToAttributedString:[NSString stringWithFormat:@"%@",_model.price]];
    self.judeCountLabel.text = [NSString stringWithFormat:@"/%@评论",model.comment_num];
    self.locationLabel.text = _model.aname;
    NSString *tagStr = model.tag;
    NSArray *tagArr = [tagStr componentsSeparatedByString:@","];
    [self tagViewWithArr:tagArr];
    
}

#pragma mark --------- 生命周期

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.hotelNameLabel];
    [self.contentView addSubview:self.locationLabel];
    [self.contentView addSubview:self.starView];
    [self.contentView addSubview:self.judeCountLabel];
    [self.contentView addSubview:self.iconBackView];
    [self.iconBackView addSubview:self.icon];
    [self.contentView addSubview:self.tagView];
    [self.contentView addSubview:self.priceLabel];
//    [self.contentView addSubview:self.bottomLineView];
    
    
    self.headImageView.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(250);
 
    self.hotelNameLabel.sd_layout
    .topSpaceToView(self.headImageView, 8)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.hotelNameLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    
    self.locationLabel.sd_layout
    .topSpaceToView(self.hotelNameLabel, 5)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.locationLabel setSingleLineAutoResizeWithMaxWidth:(300)];
 
    self.judeCountLabel.sd_layout
    .centerYEqualToView(self.locationLabel)
    .leftSpaceToView(self.locationLabel,106)
    .autoHeightRatio(0);
    [self.judeCountLabel setSingleLineAutoResizeWithMaxWidth:(100)];
    
    self.starView.sd_layout
    .centerYEqualToView(self.judeCountLabel)
    .leftSpaceToView(self.locationLabel, 9)
    .widthIs(95)
    .heightIs(10);
    
    self.iconBackView.sd_layout
    .topSpaceToView(self.headImageView, -32)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(64)
    .widthIs(64);
    [self.iconBackView setSd_cornerRadiusFromWidthRatio:@0.5];
    
    self.icon.sd_layout
    .centerXEqualToView(self.iconBackView)
    .centerYEqualToView(self.iconBackView)
    .heightIs(60)
    .widthIs(60);
    [self.icon setSd_cornerRadiusFromWidthRatio:@0.5];

    
    self.tagView.sd_layout
    .topSpaceToView(self.locationLabel, 8)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(SCREEN_WIDTH - 30)
    .heightIs(15);
    
    self.priceLabel.sd_layout
    .bottomEqualToView(self.headImageView)
    .leftSpaceToView(self.contentView, 15)
    .heightIs(39)
    .widthIs(92);
    
//    self.bottomLineView.sd_layout
//    .leftSpaceToView(self.contentView, 0)
//    .rightSpaceToView(self.contentView, 0)
//    .bottomSpaceToView(self.contentView, 0)
//    .heightIs(10);


}

//价格字符串转换
- (NSMutableAttributedString *)convertStringToAttributedString:(NSString *)str{
    NSInteger length = str.length;
    NSString *string = [NSString stringWithFormat:@"¥%@/晚",str];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeStr setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24]} range:NSMakeRange(1, length)];
    return attributeStr;
}

#pragma mark --------- 点击事件处理

//tagButton点击事件处理
- (void)tagButtonClick:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(hotelTableView:cellTagButtonDidClickSearchMessage:)]) {
        [self.delegate hotelTableView:self cellTagButtonDidClickSearchMessage:btn.currentTitle];
    }
}

//headImageView点击事件处理 传出酒店的ID
- (void)headImageViewDidClick:(UIImageView *)imageView{
    if ([self.delegate respondsToSelector:@selector(hotelTableViewCell:imageViewDidClick:name:)]) {
        [self.delegate hotelTableViewCell:self imageViewDidClick:self.model.ID name:self.model.hotel_name];
        
    }
}

@end
