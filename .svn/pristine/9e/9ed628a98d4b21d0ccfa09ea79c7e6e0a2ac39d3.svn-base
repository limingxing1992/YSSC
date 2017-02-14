//
//  MallBussMessInfoTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussMessInfoTableViewCell.h"

@interface MallBussMessInfoTableViewCell ()

@property (nonatomic, strong) UIImageView *headIv;//头像
@property (nonatomic, strong) UILabel *nameLb;//名称
@property (nonatomic, strong) UILabel *timeLb;//时间
@property (nonatomic, strong) UILabel *messLb;//动态

@property (nonatomic, strong) UIView *bannerView;//承载图片


@end

@implementation MallBussMessInfoTableViewCell

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
        [self.contentView addSubview:self.headIv];
        [self.contentView addSubview:self.nameLb];
        [self.contentView addSubview:self.timeLb];
        [self.contentView addSubview:self.messLb];
        [self.contentView addSubview:self.bannerView];
        self.headIv.sd_layout
        .topSpaceToView(self.contentView, 13)
        .leftSpaceToView(self.contentView, 15)
        .widthIs(40)
        .heightEqualToWidth();
        [self.headIv setSd_cornerRadiusFromHeightRatio:@0.5];
        
        self.nameLb.sd_layout
        .centerYEqualToView(self.headIv)
        .leftSpaceToView(self.headIv, 15)
        .autoHeightRatio(0);
        [self.nameLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.timeLb.sd_layout
        .centerYEqualToView(self.headIv)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.timeLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.messLb.sd_layout
        .topSpaceToView(self.headIv, 13)
        .leftEqualToView(self.headIv)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.messLb setMaxNumberOfLinesToShow:3];

        self.bannerView.sd_layout
        .topSpaceToView(self.messLb, 10)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .heightIs(0);
        
    }
    return self;
}

- (void)setModel:(MallShopCommentItemModel *)model{
    _messLb.text = model.content;
    _nameLb.text = model.name;
    [_headIv sd_setImageWithURL:[NSURL URLWithString:model.logo_pic] placeholderImage:PlaceholderHeadImage];
    _timeLb.text = model.create_time;
    NSArray *imgAry = model.imgList;

    NSInteger l = imgAry.count /4;
    NSInteger t = imgAry.count %4;
    if (t) {
        l+=1;
    }
    self.bannerView.sd_layout
    .heightIs(l *90);
    [self setupAutoHeightWithBottomView:_bannerView bottomMargin:0];

    for (NSInteger i = 0; i <imgAry.count; i++) {
        NSDictionary *imgDic = imgAry[i];
        NSInteger l = i / 5;
        NSInteger m = i % 5;
        CGFloat orY = l *85;
        CGFloat orX = 15 + m*85;
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(orX, orY, 80, 80)];
        iv.layer.borderWidth = 0.5;
        iv.layer.borderColor = GRAYCOLOR.CGColor;
        iv.backgroundColor = [UIColor redColor];
        iv.image = PlaceholderImage;
        [iv sd_setImageWithURL:[NSURL URLWithString:imgDic[@"res_url"]] placeholderImage:PlaceholderImage];
        [self.bannerView addSubview:iv];
    }
    
}


#pragma mark ----------------实例化

- (UIImageView *)headIv{
    if (_headIv == nil) {
        _headIv = [[UIImageView alloc] init];
        _headIv.image  = PlaceholderHeadImage;
        _headIv.layer.borderWidth = 0.5;
        _headIv.layer.borderColor = GRAYCOLOR.CGColor;
    }
    return _headIv;
}

- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = FONT(14);
        _nameLb.textColor = BLACKTEXTCOLOR;
        _nameLb.text = @"李明星";
    }
    return _nameLb;
}

- (UILabel *)timeLb{
    if (_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT(14);
        _timeLb.textColor = LIGHTTEXTCOLOR;
        _timeLb.text = @"2016-08-22 14:54";
    }
    return _timeLb;
}

- (UILabel *)messLb{
    if (_messLb == nil) {
        _messLb = [[UILabel alloc] init];
        _messLb.font = FONT(14);
        _messLb.textColor = BLACKTEXTCOLOR;
        _messLb.text = @"新品上市，分分钟卖光的节奏";
    }
    return _messLb;
}

- (UIView *)bannerView{
    if (_bannerView == nil) {
        _bannerView = [[UIView alloc] init];
//        _bannerView.backgroundColor = [UIColor redColor];
    }
    return _bannerView;
}
@end
