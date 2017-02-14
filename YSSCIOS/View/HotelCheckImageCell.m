//
//  HotelCheckImageCell.m
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelCheckImageCell.h"

@interface HotelCheckImageCell ()<SDCycleScrollViewDelegate>

/**sdScrollView*/
@property (nonatomic, strong) SDCycleScrollView *scrollView;

@property (nonatomic, strong) UILabel *pageLabel;
/**name*/
@property (nonatomic, strong) UILabel *nameLabel;
/**价格*/
@property (nonatomic, strong) UILabel *priceLabel;

/**picCount*/
@property (nonatomic, assign) NSInteger picCount;

@end

#define kScaleY  SCREEN_HEIGHT / 667
@implementation HotelCheckImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.scrollView];
        [self.contentView addSubview:self.pageLabel];
        
        self.scrollView.sd_layout
        .topEqualToView(self.contentView)
        .leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .heightIs(200 * kScaleY);
        
        self.nameLabel.sd_layout
        .topSpaceToView(self.scrollView, 15)
        .leftSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.nameLabel setSingleLineAutoResizeWithMaxWidth:250];
        
        self.priceLabel.sd_layout
        .rightSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.nameLabel)
        .widthIs(92)
        .heightIs(39);
        
        self.pageLabel.sd_layout
        .bottomSpaceToView(self.contentView, 55)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.pageLabel setSingleLineAutoResizeWithMaxWidth:100];
        
        [self setupAutoHeightWithBottomView:self.priceLabel bottomMargin:15];
        
        
    }
    return self;
}

//价格字符串转换
- (NSMutableAttributedString *)convertStringToAttributedString:(NSString *)str{
    NSInteger length = str.length;
    NSString *string = [NSString stringWithFormat:@"¥%@/晚",str];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeStr setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24]} range:NSMakeRange(1, length)];
    return attributeStr;
}

#pragma mark --------- 刷新数据

-(void)setImage:(NSMutableArray *)urls name:(NSString *)name price:(NSNumber *)price{
    
    NSMutableArray *urlArr = [[NSMutableArray alloc] init];
    [urls enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dict = (NSDictionary *)obj;
        NSString *urlStr = [dict objectForKey:@"res_url"];
        [urlArr addObject:urlStr];
    }];
    self.scrollView.imageURLStringsGroup = urlArr;
    self.nameLabel.text = name;
    self.priceLabel.attributedText = [self convertStringToAttributedString:price.stringValue];
    self.picCount = urlArr.count;
    self.pageLabel.text = [NSString stringWithFormat:@"1/%zd",urlArr.count];
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{

    self.pageLabel.text = [NSString stringWithFormat:@"%zd/%zd",index + 1,self.picCount];
    
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

#pragma mark - Setter&Getter

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT(17);
        _nameLabel.textColor = SHENTEXTCOLOR;
    }
    return _nameLabel;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = FONT(17);
        _priceLabel.textColor = MALLColor;
        _priceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _priceLabel;
}
- (SDCycleScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[SDCycleScrollView alloc] init];
        _scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
        _scrollView.delegate = self;
        _scrollView.autoScrollTimeInterval = 2.5;
    }
    return _scrollView;
}

- (UILabel *)pageLabel{
    if (_pageLabel == nil) {
        _pageLabel = [[UILabel alloc] init];
        _pageLabel.textColor = [UIColor whiteColor];
    }
    return _pageLabel;
}


@end
