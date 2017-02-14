//
//  HotelTableViewADCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/10/11.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelTableViewADCell.h"
#import "HotelObject.h"

@interface HotelTableViewADCell ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *scrollView;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *hotelNameLabel;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *pageLabel;

@end

@implementation HotelTableViewADCell

- (SDCycleScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[SDCycleScrollView alloc] init];
        _scrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
        _scrollView.showPageControl = NO;
        _scrollView.delegate = self;
        _scrollView.autoScrollTimeInterval = 4;
    }
    return _scrollView;
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

- (UILabel *)pageLabel{
    if (_pageLabel == nil) {
        _pageLabel = [[UILabel alloc] init];
        _pageLabel.textColor = [UIColor whiteColor];
    }
    return _pageLabel;
}

- (UILabel *)hotelNameLabel{
    if (_hotelNameLabel == nil) {
        _hotelNameLabel = [[UILabel alloc] init];
        _hotelNameLabel.font = [UIFont boldSystemFontOfSize:30];
        _hotelNameLabel.textColor = [UIColor whiteColor];
        _hotelNameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hotelNameLabel;
}

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor whiteColor];
        _icon.image = IMAGE(@"placeholder_head");
    }
    return _icon;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setModel:(HotelObject *)model{
    _model = model;
    NSMutableArray *urlArray = [NSMutableArray array];
    NSMutableArray *iconUrlArray = [NSMutableArray array];
    for (HotelDataObject *dataObject in model.data) {
        [urlArray addObject:[dataObject.thumb_pic absoluteString]];
        [iconUrlArray addObject:[dataObject.logo_pic absoluteString]];
    }
    self.scrollView.imageURLStringsGroup = urlArray;
    self.scrollView.iconImageURLStringGroup = iconUrlArray;
    HotelDataObject *hotelDataObject = [_model.data objectAtIndex:0];
    
    if (hotelDataObject.price == nil) {
       
        self.priceLabel.hidden = YES;
    }else{
        self.priceLabel.hidden = NO;
        self.priceLabel.attributedText = [self convertStringToAttributedString:[NSString stringWithFormat:@"%@",hotelDataObject.price]];
    }
    
    self.pageLabel.text = [NSString stringWithFormat:@"1/%zd",_model.data.count];
    self.hotelNameLabel.text = hotelDataObject.hotel_name;
}

- (void)setupUI{
    
    [self.contentView addSubview:self.scrollView];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.pageLabel];
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.hotelNameLabel];
    
    self.scrollView.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .rightEqualToView(self.contentView);
    
    self.priceLabel.sd_layout
    .bottomEqualToView(self.contentView)
    .centerXEqualToView(self.contentView)
    .heightIs(39)
    .widthIs(92);
    
    self.pageLabel.sd_layout
    .bottomSpaceToView(self.contentView, 5)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.pageLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.hotelNameLabel.sd_layout
    .bottomSpaceToView(self.priceLabel, 10)
    .centerXEqualToView(self.contentView)
    .autoHeightRatio(0);
    [self.hotelNameLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];

}

//价格字符串转换
- (NSMutableAttributedString *)convertStringToAttributedString:(NSString *)str{
    NSInteger length = str.length;
    NSString *string = [NSString stringWithFormat:@"¥%@/晚",str];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeStr setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24]} range:NSMakeRange(1, length)];
    return attributeStr;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    HotelDataObject *hotelDataObject = [_model.data objectAtIndex:index];
    
    self.priceLabel.attributedText = [self convertStringToAttributedString:[NSString stringWithFormat:@"%@",hotelDataObject.price]];
    self.pageLabel.text = [NSString stringWithFormat:@"%zd/%zd",index + 1,_model.data.count];
    self.hotelNameLabel.text = hotelDataObject.hotel_name;
}

#pragma mark - 轮播图代理

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    HotelDataObject *hotelDataObject = [_model.data objectAtIndex:index];
    
    if ([self.delegate respondsToSelector:@selector(hotelTableViewADCell:didSelectAtIndex:model:)]) {
        [self.delegate hotelTableViewADCell:self didSelectAtIndex:index model:hotelDataObject];
    }
}

#pragma mark - cell增加分割线

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 0.5;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}

@end
