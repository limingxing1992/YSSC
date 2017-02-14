//
//  MallJugeTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallJugeTableViewCell.h"

@interface MallJugeTableViewCell ()

@property (nonatomic, strong) UIImageView *headUserIv;//头像
@property (nonatomic, strong) UILabel *nameLb;//名字
@property (nonatomic, strong) UILabel *timeLb;//评论时间
@property (nonatomic, strong) MallJugeStarView *starView;//星级图
@property (nonatomic, strong) UILabel *jugeContentLb;//评价内容
@property (nonatomic, strong) UILabel *rankLb;//购买规格

@end

@implementation MallJugeTableViewCell

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
        self.backgroundColor = WHITECOLOR;
        [self.contentView addSubview:self.headUserIv];
        [self.contentView addSubview:self.nameLb];
        [self.contentView addSubview:self.timeLb];
        [self.contentView addSubview:self.starView];
        [self.contentView addSubview:self.jugeContentLb];
        [self.contentView addSubview:self.rankLb];
        
        self.headUserIv.sd_layout
        .topSpaceToView(self.contentView, 13)
        .leftSpaceToView(self.contentView,15)
        .widthIs(40)
        .heightIs(40);
        [self.headUserIv setSd_cornerRadiusFromWidthRatio:@0.5];
        
        self.nameLb.sd_layout
        .topSpaceToView(self.contentView, 18.5)
        .leftSpaceToView(self.headUserIv, 15)
        .autoHeightRatio(0);
        [self.nameLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.timeLb.sd_layout
        .topEqualToView(self.nameLb)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.timeLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.starView.sd_layout
        .topSpaceToView(self.nameLb, 7)
        .leftEqualToView(self.nameLb)
        .heightIs(12);
        
        self.jugeContentLb.sd_layout
        .topSpaceToView(self.headUserIv, 13)
        .leftEqualToView(self.headUserIv)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        
        self.rankLb.sd_layout
        .topSpaceToView(self.jugeContentLb, 13)
        .leftEqualToView(self.headUserIv)
        .autoHeightRatio(0);
        
        [self.rankLb setSingleLineAutoResizeWithMaxWidth:200];
        
        [self setupAutoHeightWithBottomView:_rankLb bottomMargin:10];
        
    }
    return self;
}


#pragma mark ----------------数据刷新

- (void)setModel:(MallJugeInfoItemModel *)model{
    [_headUserIv sd_setImageWithURL:[NSURL URLWithString:model.head_url] placeholderImage:PlaceholderHeadImage];
    _nameLb.text = model.name;
    _timeLb.text = model.commTime;
    [_starView updateInfoWith:model.grade.integerValue];
    _jugeContentLb.text = model.content;
    _rankLb.text = [NSString stringWithFormat:@"规格: %@",model.avalue];
    
}

#pragma mark ----------------实例化

- (UIImageView *)headUserIv{
    if (_headUserIv == nil) {
        _headUserIv = [[UIImageView alloc] init];
        _headUserIv.image = PlaceholderHeadImage;
        _headUserIv.layer.borderWidth = 0.5;
        _headUserIv.layer.borderColor = GRAYCOLOR.CGColor;
    }
    return _headUserIv;
}

- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.textColor = LIGHTTEXTCOLOR;
        _nameLb.font = FONT(12);
        _nameLb.text = @"未知";
    }
    return _nameLb;
}

- (UILabel *)timeLb{
    if (_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT(12);
        _timeLb.textColor = LIGHTTEXTCOLOR;
        _timeLb.text = @"2016-08-16 10:11";
    }
    return _timeLb;
}

- (MallJugeStarView *)starView{
    if (_starView == nil) {
        _starView = [[MallJugeStarView alloc] init];
    }
    return _starView;
}

- (UILabel *)jugeContentLb{
    if (_jugeContentLb == nil) {
        _jugeContentLb = [[UILabel alloc] init];
        _jugeContentLb.numberOfLines = 0;
        _jugeContentLb.font = FONT(14);
        _jugeContentLb.textColor = BLACKTEXTCOLOR;
        _jugeContentLb.text = @"不错";
    }
    return _jugeContentLb;
}

- (UILabel *)rankLb{
    if (_rankLb == nil) {
        _rankLb = [[UILabel alloc] init];
        _rankLb.font = FONT(12);
        _rankLb.textColor = LIGHTTEXTCOLOR;
        _rankLb.text = @"规格： 黑色";
    }
    return _rankLb;
}

@end
