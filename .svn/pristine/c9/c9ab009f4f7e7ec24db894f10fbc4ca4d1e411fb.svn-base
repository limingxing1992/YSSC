//
//  TravelDiaryTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelDiaryTableViewCell.h"

@interface TravelDiaryTableViewCell ()

@property (nonatomic, strong) UIImageView *contentIv;//缩略图

@property (nonatomic, strong) UILabel *titleLb;//标题

@property (nonatomic, strong) UILabel *shortContentLb;//简短介绍

@property (nonatomic, strong) UIImageView *headIv;//用户头像

@property (nonatomic, strong) UILabel *nameLb;//用户名字

@property (nonatomic, strong) UILabel *timeLb;//发表日期

@property (nonatomic, strong) UIView *singleLineView;//切割线

@property (nonatomic, strong) UIView *actionView;//图标承载图

@property (nonatomic, strong) UIImageView *favoriteIv;//收藏

@property (nonatomic, strong) UILabel *favoriteLb;//收藏数量

@property (nonatomic, strong) UIImageView *reconmendIv;//点赞

@property (nonatomic, strong) UILabel *reconmendLb;//点赞数量

@property (nonatomic, strong) UIImageView *commentIv;//评论

@property (nonatomic, strong) UILabel *commentLb;//评论数量

@property (nonatomic, strong) UIView *bottomLineView;//底部分割









@end

@implementation TravelDiaryTableViewCell

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
        self.backgroundColor = WHITECOLOR;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.contentIv];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.shortContentLb];
        [self.contentView addSubview:self.headIv];
        [self.contentView addSubview:self.nameLb];
        [self.contentView addSubview:self.timeLb];
        [self.contentView addSubview:self.singleLineView];
        [self.contentView addSubview:self.actionView];
        
        [self setFrameAutoSubViews];
    }
    return self;
}

- (void)setFrameAutoSubViews{
    self.contentIv.sd_layout
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, 0)
    .widthRatioToView(self.contentView, 1)
    .heightIs(200);
    
    self.titleLb.sd_layout
    .centerYIs(227)
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(17);
    
    [self.titleLb setMaxNumberOfLinesToShow:1];
    
    self.shortContentLb.isAttributedContent = YES;
    self.shortContentLb.sd_layout
    .topSpaceToView(self.contentIv, 44)
    .leftEqualToView(self.titleLb)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(47);
    
    self.headIv.sd_layout
    .topSpaceToView(self.shortContentLb, 10)
    .leftEqualToView(self.shortContentLb)
    .heightIs(35)
    .widthIs(35);
    [self.headIv setSd_cornerRadiusFromHeightRatio:@0.5];
    
    self.nameLb.sd_layout
    .topSpaceToView(self.shortContentLb, 12)
    .leftSpaceToView(self.headIv, 15)
    .autoHeightRatio(0);
    [self.nameLb setSingleLineAutoResizeWithMaxWidth:400];
    
    self.timeLb.sd_layout
    .topSpaceToView(self.nameLb, 3.5)
    .leftEqualToView(self.nameLb)
    .autoHeightRatio(0);
    [self.timeLb setSingleLineAutoResizeWithMaxWidth:400];
    
    self.singleLineView.sd_layout
    .widthRatioToView(self.contentView, 1)
    .heightIs(0.5)
    .leftSpaceToView(self.contentView, 0)
    .topSpaceToView(self.headIv, 15);
    
    
    self.actionView.sd_layout
    .topSpaceToView(self.singleLineView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(45);

    [self setActionViewSubViewsFrame];
    
}

- (void)setActionViewSubViewsFrame{
    
    
    self.commentIv.sd_layout
    .centerYEqualToView(self.actionView)
    .rightSpaceToView(self.actionView, 38)
    .widthIs(17)
    .heightIs(15);
    
    self.commentLb.sd_layout
    .centerYEqualToView(self.commentIv)
    .leftSpaceToView(self.commentIv, 5)
    .autoHeightRatio(0);
    [self.commentLb setSingleLineAutoResizeWithMaxWidth:200];
    
    
    
    self.reconmendIv.sd_layout
    .topEqualToView(self.commentIv)
    .rightSpaceToView(self.commentIv, 38)
    .widthRatioToView(self.commentIv, 1)
    .heightRatioToView(self.commentIv, 1);
    
    self.reconmendLb.sd_layout
    .centerYEqualToView(self.commentIv)
    .leftSpaceToView(self.reconmendIv, 5)
    .autoHeightRatio(0);
    [self.reconmendLb setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.favoriteIv.sd_layout
    .topEqualToView(self.commentIv)
    .rightSpaceToView(self.reconmendIv, 38)
    .widthRatioToView(self.commentIv, 1)
    .heightRatioToView(self.commentIv, 1);
    
    self.favoriteLb.sd_layout
    .centerYEqualToView(self.commentIv)
    .leftSpaceToView(self.favoriteIv, 5)
    .autoHeightRatio(0);
    [self.favoriteLb setSingleLineAutoResizeWithMaxWidth:200];
    
}

#pragma mark ----------------数据刷新
- (void)updateInfoWithModel:(TravelItemModel *)model{
    NSArray *picAry = [model.imgs componentsSeparatedByString:@","];
    if (picAry.count) {
        [_contentIv sd_setImageWithURL:[NSURL URLWithString:picAry.firstObject] placeholderImage:PlaceholderImage];
    }else{
        [_contentIv setImage:PlaceholderImage];
    }
    _titleLb.text = model.title;
    _shortContentLb.attributedText = [self replaceChangeStr:model.content];
    [_headIv sd_setImageWithURL:[NSURL URLWithString:model.head_url] placeholderImage:PlaceholderHeadImage];
    _nameLb.text = model.name;
    _timeLb.text = model.add_time;
    _reconmendLb.text = model.praizeCount;
    _commentLb.text  = model.commentCount;
    _favoriteLb.text = model.collectCount;
}
#pragma mark ----------------富文本转化

- (NSMutableAttributedString *)replaceChangeStr:(NSString *)string{
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:10];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:FONT(12), NSForegroundColorAttributeName:SHENTEXTCOLOR, NSParagraphStyleAttributeName:style}];
    
    return str;
}


#pragma mark ----------------实例化

- (UIImageView *)contentIv{
    if (_contentIv == nil) {
        _contentIv = [[UIImageView alloc] init];
        _contentIv.image = PlaceholderImage;
    }
    return _contentIv;
}

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(17);
        _titleLb.backgroundColor = WHITECOLOR;
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.text = @"阳光正带走衰老的今天---四川12天行走寄记";
    }
    return _titleLb;
}

- (UILabel *)shortContentLb{
    if (_shortContentLb == nil) {
        _shortContentLb = [[UILabel alloc] init];
        _shortContentLb.textColor = SHENTEXTCOLOR;
        _shortContentLb.font = FONT(12);
        _shortContentLb.numberOfLines = 2;
        _shortContentLb.lineBreakMode = NSLineBreakByTruncatingMiddle;
//        _shortContentLb.
//        _shortContentLb.backgroundColor = [UIColor redColor];
//        _shortContentLb.attributedText = [self replaceChangeStr:@"ffsfasfafafafafafafafasfdafdfdsafsdfadsfasfsdfsafsdafasdfdsfasdfasfasfadfdasfasf"];
    }
    return _shortContentLb;
}

- (UIImageView *)headIv{
    if (_headIv == nil) {
        _headIv = [[UIImageView alloc] init];
        _headIv.image = PlaceholderHeadImage;
        _headIv.layer.borderWidth = 0.5;
        _headIv.layer.borderColor = GRAYCOLOR.CGColor;
    }
    return _headIv;
}

- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.textColor = BLACKTEXTCOLOR;
        _nameLb.font = FONT(14);
        _nameLb.text = @"一颗小白菜";
    }
    return _nameLb;
}

- (UILabel *)timeLb{
    if (_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.textColor = LIGHTTEXTCOLOR;
        _timeLb.font = FONT(13);
        _timeLb.text = @"07-12 21:40";
    }
    return _timeLb;
}

- (UIView *)singleLineView{
    if (_singleLineView == nil) {
        _singleLineView = [[UIView alloc] init];
        _singleLineView.backgroundColor = GRAYCOLOR;
    }
    return _singleLineView;
}

- (UIImageView *)favoriteIv{
    if (_favoriteIv == nil) {
        _favoriteIv = [[UIImageView alloc] init];
        _favoriteIv.image = IMAGE(@"classify94");
    }
    return _favoriteIv;
}

- (UILabel *)favoriteLb{
    if (_favoriteLb == nil) {
        _favoriteLb = [[UILabel alloc] init];
        _favoriteLb.font = FONT(10);
        _favoriteLb.textColor = LIGHTTEXTCOLOR;
        _favoriteLb.text = @"22";
    }
    return _favoriteLb;
}

- (UIImageView *)reconmendIv{
    if (_reconmendIv == nil) {
        _reconmendIv = [[UIImageView alloc] init];
        _reconmendIv.image = IMAGE(@"classify93");
    }
    return _reconmendIv;
}

- (UILabel *)reconmendLb{
    if (_reconmendLb == nil) {
        _reconmendLb = [[UILabel alloc] init];
        _reconmendLb.font = FONT(10);
        _reconmendLb.textColor = LIGHTTEXTCOLOR;
        _reconmendLb.text = @"0";
    }
    return _reconmendLb;
}

- (UIImageView *)commentIv{
    if (_commentIv == nil) {
        _commentIv = [[UIImageView alloc] init];
        _commentIv.image = IMAGE(@"classify95");
    }
    return _commentIv;
}

- (UILabel *)commentLb{
    if (_commentLb == nil) {
        _commentLb = [[UILabel alloc] init];
        _commentLb.font = FONT(10);
        _commentLb.textColor = LIGHTTEXTCOLOR;
        _commentLb.text = @"0";
    }
    return _commentLb;
}


- (UIView *)actionView{
    if (_actionView == nil) {
        _actionView = [[UIView alloc] init];
        _actionView.backgroundColor = WHITECOLOR;
        [_actionView addSubview:self.favoriteIv];
        [_actionView addSubview:self.favoriteLb];
        [_actionView addSubview:self.reconmendIv];
        [_actionView addSubview:self.reconmendLb];
        [_actionView addSubview:self.commentIv];
        [_actionView addSubview:self.commentLb];
    }
    return _actionView;
}

- (UIView *)bottomLineView{
    if (_bottomLineView == nil) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = GRAYCOLOR;
    }
    return _bottomLineView;
}
@end
