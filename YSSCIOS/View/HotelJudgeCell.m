//
//  HotelJudgeCell.m
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelJudgeCell.h"
#import "HotelCommentObject.h"
#import "YSSStarView.h"


@interface HotelJudgeCell ()

/**评论*/
@property (nonatomic, strong) UILabel *judgeTitle;
/**分隔线*/
@property (nonatomic, strong) UIView *lineView;
/**头像*/
@property (nonatomic, strong) UIImageView *icon;
/**名字*/
@property (nonatomic, strong) UILabel *nameLabel;
/**时间*/
@property (nonatomic, strong) UILabel *dateLabel;
/**评论内容*/
@property (nonatomic, strong) UILabel *judgeContentLabel;
/**查看更多*/
@property (nonatomic, strong) UIButton *checkMoreBtn;
/**星星*/
@property (nonatomic, strong) YSSStarView *starView;

@end


@implementation HotelJudgeCell

#pragma mark -------- 懒加载

- (UILabel *)judgeTitle{
    if (_judgeTitle == nil) {
        _judgeTitle = [[UILabel alloc] init];
        _judgeTitle.font = FONT(14);
        _judgeTitle.textColor = SHENTEXTCOLOR;
    }
    return _judgeTitle;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.image = IMAGE(@"head1");
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

-(UIButton *)checkMoreBtn{
    if (_checkMoreBtn == nil) {
        _checkMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkMoreBtn.titleLabel.textColor = MALLColor;
        _checkMoreBtn.titleLabel.font = FONT(12);
        [_checkMoreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
        [_checkMoreBtn setTitleColor:MALLColor forState:UIControlStateNormal];
        [_checkMoreBtn addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _checkMoreBtn;
}

- (YSSStarView *)starView{
    if (_starView == nil) {
        _starView = [[YSSStarView alloc] init];
    }
    return _starView;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.judgeTitle];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.judgeContentLabel];
        [self.contentView addSubview:self.checkMoreBtn];
        [self.contentView addSubview:self.starView];
        
        self.judgeTitle.sd_layout
        .topSpaceToView(self.contentView, 15)
        .leftSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.judgeTitle setSingleLineAutoResizeWithMaxWidth:300];
        
        self.starView.sd_layout
        .leftSpaceToView(self.judgeTitle, 5)
        .centerYEqualToView(self.judgeTitle)
        .heightIs(10);
        
        self.lineView.sd_layout
        .topSpaceToView(self.judgeTitle, 15)
        .centerXEqualToView(self.contentView)
        .widthRatioToView(self.contentView, 1)
        .heightIs(0.5);
        
        self.icon.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.lineView, 13)
        .heightIs(40)
        .widthIs(40);
        [self.icon setSd_cornerRadiusFromWidthRatio:@0.5];
        
        self.nameLabel.sd_layout
        .topSpaceToView(self.lineView, 20)
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
        
        self.checkMoreBtn.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.judgeContentLabel, 15)
        .heightIs(15)
        .widthIs(50);
        
        [self setupAutoHeightWithBottomView:self.checkMoreBtn bottomMargin:15];
        
    }
    return self;
}

- (void)starHidden{
    self.starView.hidden = YES;
}

- (void)cellHidden{
    self.icon.hidden = YES;
    self.nameLabel.hidden = YES;
    self.checkMoreBtn.hidden = YES;
    self.dateLabel.hidden = YES;
    self.judgeContentLabel.hidden = YES;
    [self setupAutoHeightWithBottomView:self.lineView bottomMargin:0];
}

- (void)setCommentModel:(CommentObject *)commentModel{
    _commentModel = commentModel;
    if (commentModel.name == nil) {
        self.nameLabel.text = @"未命名";
    }else{
        self.nameLabel.text = commentModel.name;
    }

    self.dateLabel.text = commentModel.create_time;
    
    self.judgeContentLabel.text = commentModel.content;
        [self.icon sd_setImageWithURL:commentModel.head_url placeholderImage:IMAGE(@"head1")];
    
    
    self.icon.hidden = NO;
    self.nameLabel.hidden = NO;
    self.checkMoreBtn.hidden = NO;
    self.dateLabel.hidden = NO;
    self.judgeContentLabel.hidden = NO;
    [self setupAutoHeightWithBottomView:self.checkMoreBtn bottomMargin:15];
}

- (void)setCommentCount:(NSInteger)count score:(NSInteger)score{
    self.judgeTitle.text = [NSString stringWithFormat:@"评论（%ld）",count];
    [self.starView setImageCount:score];
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

#pragma mark --------- 更多评论-点击事件处理

- (void)touchAction:(id)sender{
    if (_block) {
        _block(sender);
    }
}

- (void)addTargetBlock:(TouchMoreInfoButton)touchButtonBlock{
    _block = touchButtonBlock;
}

@end
