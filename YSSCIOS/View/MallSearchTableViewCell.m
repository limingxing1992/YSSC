//
//  MallSearchTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallSearchTableViewCell.h"

@interface MallSearchTableViewCell ()

@property (nonatomic, strong) UIImageView *historyIV;//图标
@property (nonatomic, strong) UIImageView *rightIV;//箭头
@property (nonatomic, strong) UILabel *textLB;//文字

@property (nonatomic, strong) UIView *bottomLineView;



@end

@implementation MallSearchTableViewCell

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
        [self.contentView addSubview:self.historyIV];
        [self.contentView addSubview:self.rightIV];
        [self.contentView addSubview:self.textLB];
        [self.contentView addSubview:self.bottomLineView];
        
        self.historyIV.sd_layout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, 15)
        .heightIs(15)
        .widthEqualToHeight();
        
        self.rightIV.sd_layout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, 15)
        .widthIs(8)
        .heightIs(15);
        
        self.textLB.sd_layout
        .centerYEqualToView(self.historyIV)
        .leftSpaceToView(self.historyIV, 7.5)
        .rightSpaceToView(self.rightIV, 7.5)
        .autoHeightRatio(0);
        [self.textLB setMaxNumberOfLinesToShow:1];
        
        self.bottomLineView.sd_layout
        .bottomSpaceToView(self.contentView, 0)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .heightIs(0.5);
        
    }
    return self;
}


#pragma mark ----------------数据刷新

- (void)updateText:(NSString *)text{
    self.textLB.text = text;
}

#pragma mark ----------------实例化

- (UIImageView *)historyIV{
    if (_historyIV == nil) {
        _historyIV = [[UIImageView alloc] init];
        _historyIV.image = IMAGE(@"classify345");
    }
    return _historyIV;
}

- (UIImageView *)rightIV{
    if (_rightIV == nil) {
        _rightIV = [[UIImageView alloc] init];
        _rightIV.image = IMAGE(@"classify141");
    }
    return _rightIV;
}

- (UILabel *)textLB{
    if (_textLB == nil) {
        _textLB = [[UILabel alloc] init];
        _textLB.font = FONT(14);
        _textLB.textColor = BLACKTEXTCOLOR;
        _textLB.text = @"";
    }
    return _textLB;
}

- (UIView *)bottomLineView{
    if (_bottomLineView == nil) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = GRAYCOLOR;
    }
    return _bottomLineView;
}
@end
