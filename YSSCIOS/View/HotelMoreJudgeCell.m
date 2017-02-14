//
//  HotelMoreJudgeCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelMoreJudgeCell.h"
#import "HotelCommentObject.h"

@interface HotelMoreJudgeCell ()

/**头像*/
@property (nonatomic, strong) UIImageView *icon;
/**名字*/
@property (nonatomic, strong) UILabel *nameLabel;
/**时间*/
@property (nonatomic, strong) UILabel *dateLabel;
/**评论内容*/
@property (nonatomic, strong) UILabel *judgeContentLabel;

@end

@implementation HotelMoreJudgeCell

#pragma mark --------- 懒加载

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.image = IMAGE(@"placeholder_head");
    }
    return _icon;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = LIGHTTEXTCOLOR;
        _nameLabel.font = FONT(12);
        
    }
    return _nameLabel;
}

- (UILabel *)dateLabel{
    if (_dateLabel == nil) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textColor = LIGHTTEXTCOLOR;
        _dateLabel.font = FONT(12);
    }
    return _dateLabel;
}

- (UILabel *)judgeContentLabel{
    if (_judgeContentLabel == nil) {
        _judgeContentLabel = [[UILabel alloc] init];
        _judgeContentLabel.textColor = SHENTEXTCOLOR;
        _judgeContentLabel.font = FONT(14);
    }
    return _judgeContentLabel;
}

#pragma mark --------- 生命周期

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.judgeContentLabel];
        
        self.icon.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 15)
        .heightIs(40)
        .widthIs(40);
        [self.icon setSd_cornerRadiusFromWidthRatio:@0.5];
        
        self.nameLabel.sd_layout
        .topSpaceToView(self.contentView, 20)
        .leftSpaceToView(self.icon, 15)
        .autoHeightRatio(0);
        [self.nameLabel setSingleLineAutoResizeWithMaxWidth:300];
        
        self.dateLabel.sd_layout
        .topSpaceToView(self.nameLabel, 6)
        .leftSpaceToView(self.icon, 15)
        .autoHeightRatio(0);
        [self.dateLabel setSingleLineAutoResizeWithMaxWidth:300];
        
        self.judgeContentLabel.sd_layout
        .topSpaceToView(self.icon, 13)
        .leftSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.judgeContentLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH - 30)];
        
        [self setupAutoHeightWithBottomView:self.judgeContentLabel bottomMargin:15];
        
        
        
        
    }
    return self;
}

- (void)setModel:(CommentObject *)model{
    _model = model;
    self.nameLabel.text = _model.name;
    self.dateLabel.text = _model.create_time;
    self.judgeContentLabel.text = _model.content;
    [self.icon sd_setImageWithURL:_model.head_url placeholderImage:IMAGE(@"head1")];
}

@end
