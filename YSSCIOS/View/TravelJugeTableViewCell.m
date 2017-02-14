//
//  TravelJugeTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelJugeTableViewCell.h"

@interface TravelJugeTableViewCell ()

@property (nonatomic, strong) UIImageView *headUserIv;//头像
@property (nonatomic, strong) UILabel *nameLb;//名字
@property (nonatomic, strong) UILabel *timeLb;//评论时间
@property (nonatomic, strong) UILabel *jugeContentLb;//评价内容


@end

@implementation TravelJugeTableViewCell

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
        [self.contentView addSubview:self.jugeContentLb];
        
        self.headUserIv.sd_layout
        .topSpaceToView(self.contentView, 13)
        .leftSpaceToView(self.contentView,15)
        .widthIs(40)
        .heightIs(40);
        [self.headUserIv setSd_cornerRadiusFromWidthRatio:@0.5];
        
        self.nameLb.sd_layout
        .centerYIs(23)
        .leftSpaceToView(self.headUserIv, 15)
        .autoHeightRatio(0);
        [self.nameLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.timeLb.sd_layout
        .centerYIs(43)
        .leftEqualToView(self.nameLb)
        .autoHeightRatio(0);
        [self.timeLb setSingleLineAutoResizeWithMaxWidth:400];
        
        self.jugeContentLb.sd_layout
        .topSpaceToView(self.headUserIv, 13)
        .leftEqualToView(self.headUserIv)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        
        
    }
    return self;
    
}

#pragma mark ----------------数据刷新

- (void)setModel:(TravelCommentModel *)model{
    [_headUserIv sd_setImageWithURL:[NSURL URLWithString:model.head_url] placeholderImage:PlaceholderHeadImage];
    _nameLb.text = model.name;
    _timeLb.text = model.add_time;
    _jugeContentLb.text = model.content;
    [self setupAutoHeightWithBottomView:_jugeContentLb bottomMargin:13];
}



#pragma mark ----------------实例化

- (UIImageView *)headUserIv{
    if (_headUserIv == nil) {
        _headUserIv = [[UIImageView alloc] init];
        _headUserIv.backgroundColor = [UIColor redColor];
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

- (UILabel *)timeLb{
    if (_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT(12);
        _timeLb.textColor = LIGHTTEXTCOLOR;
        _timeLb.text = @"2016-08-16 10:11";
    }
    return _timeLb;
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
