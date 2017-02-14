//
//  MallGoodsDetailParameTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallGoodsDetailParameTableViewCell.h"

@interface MallGoodsDetailParameTableViewCell ()

@property (nonatomic, strong) UILabel *titleLb;//标题

@property (nonatomic, strong) UILabel *nameLb;//内容

@end

@implementation MallGoodsDetailParameTableViewCell

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
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.nameLb];
        
        self.titleLb.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.contentView)
        .autoHeightRatio(0);
        [self.titleLb setSingleLineAutoResizeWithMaxWidth:100];
    
        self.nameLb.sd_layout
        .leftSpaceToView(self.titleLb, 7)
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, 10)
        .autoHeightRatio(0);
        
        [self.nameLb setMaxNumberOfLinesToShow:1];

    }
    return self;
}


#pragma mark ----------------界面更新

- (void)updateTitleWithTitle:(NSString *)title name:(NSString *)name{
    self.titleLb.text = title;
    self.nameLb.text = name;
}


#pragma mark ----------------实例化

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(14);
        _titleLb.textColor = SHENTEXTCOLOR;
    }
    return _titleLb;
}

- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = FONT(14);
        _nameLb.textColor = SHENTEXTCOLOR;
    }
    return _nameLb;
}

@end
