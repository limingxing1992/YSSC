//
//  MallCollectionViewCell.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallCollectionViewCell.h"

@interface MallCollectionViewCell ()
@property (nonatomic, strong) UIImageView *headIv;//商品缩略图
@property (nonatomic, strong) UILabel *titleLb;//商品标题
@property (nonatomic, strong) UILabel *priceLb;//商品价格
@property (nonatomic, strong) UILabel *soldNumLB;//已售数量


@end

@implementation MallCollectionViewCell
#pragma mark ---------初始化

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.headIv];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.priceLb];
        [self.contentView addSubview:self.soldNumLB];
        
        self.headIv.sd_layout
        .topSpaceToView(self.contentView, 0)
        .leftSpaceToView(self.contentView, 0)
        .widthRatioToView(self.contentView, 1)
        .heightIs(170);
        
        self.titleLb.sd_layout
        .topSpaceToView(self.headIv, 9)
        .leftSpaceToView(self.contentView, 0)
        .widthRatioToView(self.contentView, 1)
        .autoHeightRatio(0);
        [self.titleLb setMaxNumberOfLinesToShow:2];
        
        self.soldNumLB.sd_layout
        .bottomSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .autoHeightRatio(0);
        [self.soldNumLB setSingleLineAutoResizeWithMaxWidth:100];
        
        self.priceLb.sd_layout
        .bottomSpaceToView(self.contentView, 0)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.soldNumLB, 25)
        .heightIs(17);
        [self.priceLb setMaxNumberOfLinesToShow:1];

    }
    return self;
}

- (void)updateInfoWith:(STL_GoodsItemModel *)model{
    _titleLb.text = model.goodsName;
    _priceLb.text = [NSString stringWithFormat:@"¥ %@",model.minPrice];
    [_headIv sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:PlaceholderImage];
    _soldNumLB.text = [NSString stringWithFormat:@"已售：%@",model.orderCount];
}

#pragma mark ---------实例化

- (UIImageView *)headIv
{
    if (_headIv == nil) {
        _headIv = [[UIImageView alloc] init];
        _headIv.image = PlaceholderImage;
    }
    return _headIv;
}

- (UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.font = FONT(14);
        _titleLb.numberOfLines = 0;
        _titleLb.text = @"红烧肉和酱牛肉一包";
    }
    return _titleLb;
}

- (UILabel *)priceLb
{
    if (_priceLb == nil) {
        _priceLb = [[UILabel alloc] init];
        _priceLb.textColor = MALLColor;
        _priceLb.font = FONT(17);
        _priceLb.text = @"¥ 20.00";
    }
    return _priceLb;
}

- (UILabel *)soldNumLB
{
    if (_soldNumLB == nil) {
        _soldNumLB = [[UILabel alloc] init];
        _soldNumLB.textColor = BLACKTEXTCOLOR;
        _soldNumLB.font = FONT(12);
        _soldNumLB.text = @"已售：99";
    }
    return _soldNumLB;

}

@end
