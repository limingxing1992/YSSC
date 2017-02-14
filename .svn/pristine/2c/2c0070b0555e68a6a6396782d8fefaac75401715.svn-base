//
//  SurroundingAreaTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SurroundingAreaTableViewCell.h"

@interface SurroundingAreaTableViewCell ()

@property (nonatomic, strong) UIImageView *headUserIv;//头像
@property (nonatomic, strong) UILabel *nameLb;//名字
@property (nonatomic, strong) MallJugeStarView *starView;//星级图
@property (nonatomic, strong) UILabel *jugeContentLb;//评价内容


@end

@implementation SurroundingAreaTableViewCell

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
        [self.contentView addSubview:self.starView];
        [self.contentView addSubview:self.jugeContentLb];
        
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
        
        self.starView.sd_layout
        .topSpaceToView(self.nameLb, 7)
        .leftEqualToView(self.nameLb)
        .heightIs(12);
        
        self.jugeContentLb.sd_layout
        .topSpaceToView(self.headUserIv, 13)
        .leftEqualToView(self.headUserIv)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        
        [self setupAutoHeightWithBottomView:_jugeContentLb bottomMargin:13];
        
    }
    return self;
    
}


#pragma mark ----------------更新

- (void)setModel:(SurroundingAreaBussDetailCommentItemModel *)model{
    [self.headUserIv sd_setImageWithURL:[NSURL URLWithString:model.head_url] placeholderImage:PlaceholderHeadImage];
    self.nameLb.text = model.user_name;
    [self.starView updateInfoWith:model.score.integerValue];
    self.jugeContentLb.text = model.comment_text;

}

#pragma mark ----------------实例化

- (UIImageView *)headUserIv{
    if (_headUserIv == nil) {
        _headUserIv = [[UIImageView alloc] init];
        _headUserIv.image = PlaceholderHeadImage;
        _headUserIv.layer.borderColor = GRAYCOLOR.CGColor;
        _headUserIv.layer.borderWidth = 0.5;
        
    }
    return _headUserIv;
}

- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.textColor = LIGHTTEXTCOLOR;
        _nameLb.font = FONT(12);
        _nameLb.text = @"李明星";
    }
    return _nameLb;
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
        _jugeContentLb.text = @"不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错不错";
    }
    return _jugeContentLb;
}


@end
