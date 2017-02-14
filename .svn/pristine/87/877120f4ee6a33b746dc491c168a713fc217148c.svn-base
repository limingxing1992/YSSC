//
//  MallCreateOrderTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallCreateOrderTableViewCell.h"

@interface MallCreateOrderTableViewCell ()

@property (nonatomic, strong) UIImageView *goodsIv;//商品图片
@property (nonatomic, strong) UILabel *goodsTitleLb;//商品名称
@property (nonatomic, strong) UILabel *goodsRankLb;//商品规格
@property (nonatomic, strong) UILabel *goodsPriceLb;//商品价格
@property (nonatomic, strong) UIImageView *goodsNumIv;//X图片
@property (nonatomic, strong) UILabel *goodsNumLb;//数量


@end

@implementation MallCreateOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = WHITECOLOR;
        [self.contentView sd_addSubviews:@[self.goodsIv,
                                           self.goodsTitleLb,
                                           self.goodsRankLb,
                                           self.goodsPriceLb,
                                           self.goodsNumIv,
                                           self.goodsNumLb]];
        
        [self autoLayoutcontentViewSubViews];
    }
    return self;
}

- (void)autoLayoutcontentViewSubViews{
    self.goodsIv.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, 15)
    .heightIs(70)
    .widthEqualToHeight();
    
    self.goodsTitleLb.sd_layout
    .topEqualToView(self.goodsIv)
    .leftSpaceToView(self.goodsIv, 15)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.goodsTitleLb setMaxNumberOfLinesToShow:1];
    

    self.goodsRankLb.sd_layout
    .centerYEqualToView(self.goodsIv)
    .leftEqualToView(self.goodsTitleLb)
    .autoHeightRatio(0);
    [self.goodsRankLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.goodsPriceLb.sd_layout
    .bottomEqualToView(self.goodsIv)
    .leftEqualToView(self.goodsRankLb)
    .autoHeightRatio(0);
    [self.goodsPriceLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.goodsNumLb.sd_layout
    .centerYEqualToView(self.goodsIv)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.goodsNumLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.goodsNumIv.sd_layout
    .centerYEqualToView(self.goodsIv)
    .rightSpaceToView(self.goodsNumLb, 8)
    .heightIs(8)
    .widthEqualToHeight();
}

#pragma mark ----------------刷新页面

- (void)updateInfo:(STL_GoodsDetailBaseSubItemModel *)model{
    
    [_goodsIv sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:PlaceholderImage];
    _goodsTitleLb.text = model.goodsName;
    _goodsRankLb.text = [NSString stringWithFormat:@"%@: %@",model.attr_name, model.avalue];
    _goodsPriceLb.text = [NSString stringWithFormat:@"¥ %@",model.promotion_price];
    _goodsNumLb.text = model.quantity;
}


#pragma mark ----------------实例化



- (UIImageView *)goodsIv{
    if (_goodsIv == nil) {
        _goodsIv = [[UIImageView alloc] init];
        _goodsIv.image = PlaceholderImage;
    }
    return _goodsIv;
}

- (UILabel *)goodsTitleLb{
    if (_goodsTitleLb == nil) {
        _goodsTitleLb = [[UILabel alloc] init];
        _goodsTitleLb.font = FONT(14);
        _goodsTitleLb.textColor = BLACKTEXTCOLOR;
        _goodsTitleLb.text = @"知味观蛋黄酥月饼";
    }
    return _goodsTitleLb;
}

- (UILabel *)goodsRankLb{
    if (_goodsRankLb == nil) {
        _goodsRankLb = [[UILabel alloc] init];
        _goodsRankLb.font = FONT(12);
        _goodsRankLb.textColor = LIGHTTEXTCOLOR;
        _goodsRankLb.text = @"规格: 1060g";
    }
    return _goodsRankLb;
}

- (UILabel *)goodsPriceLb{
    if (_goodsPriceLb == nil) {
        _goodsPriceLb = [[UILabel alloc] init];
        _goodsPriceLb.font = FONT(12);
        _goodsPriceLb.textColor = MALLColor;
        _goodsPriceLb.text = @"¥46.00";
    }
    return _goodsPriceLb;
}

- (UIImageView *)goodsNumIv{
    if (_goodsNumIv == nil) {
        _goodsNumIv = [[UIImageView alloc] init];
        _goodsNumIv.image = IMAGE(@"classify71");
    }
    return _goodsNumIv;
}

- (UILabel *)goodsNumLb{
    if (_goodsNumLb == nil) {
        _goodsNumLb = [[UILabel alloc] init];
        _goodsNumLb.font = FONT(15);
        _goodsNumLb.textColor = LIGHTTEXTCOLOR;
        _goodsNumLb.text = @"1";
    }
    return _goodsNumLb;
}



@end
