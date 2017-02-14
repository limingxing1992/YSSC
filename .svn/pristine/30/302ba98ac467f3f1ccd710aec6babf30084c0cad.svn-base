//
//  SettingTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/20.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SettingTableViewCell.h"

@interface SettingTableViewCell ()

@property (nonatomic, strong) UILabel *titleLb;//标题
@property (nonatomic, strong) UILabel *valueLb;//数值


@end

@implementation SettingTableViewCell

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
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.valueLb];
        self.titleLb.sd_layout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.titleLb setSingleLineAutoResizeWithMaxWidth:300];
        
        self.valueLb.sd_layout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.valueLb setSingleLineAutoResizeWithMaxWidth:300];
    }
    return self;
}

#pragma mark ----------------gengixn

- (void)updateWithTitle:(NSString *)title value:(NSString *)value{
    self.titleLb.text = title;
    self.valueLb.text = value;
}


#pragma mark ----------------实例化

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font=  FONT(14);
        _titleLb.textColor = BLACKTEXTCOLOR;
    }
    return _titleLb;
}

- (UILabel *)valueLb{
    if (_valueLb == nil) {
        _valueLb = [[UILabel alloc] init];
        _valueLb.font = FONT(14);
        _valueLb.textColor = SHENTEXTCOLOR;
    }
    return _valueLb;
}

@end
