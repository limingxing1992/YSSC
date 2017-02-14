//
//  UserMessageCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/20.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserMessageCell.h"

@interface UserMessageCell ()

/**图片*/
@property (nonatomic, strong) UIImageView *icon;
/**红圆点*/
@property (nonatomic, strong) UIImageView *redPoint;
/**顶部label*/
@property (nonatomic, strong) UILabel *topLabel;
/**底部label*/
@property (nonatomic, strong) UILabel *bottomLabel;
/**消息数量*/
@property (nonatomic, strong) UILabel *countLabel;
/**lineView*/
@property (nonatomic, strong) UIView *lineView;


@end

@implementation UserMessageCell

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
    }
    return _icon;
}

- (UIImageView *)redPoint{
    if (_redPoint == nil) {
        _redPoint = [[UIImageView alloc] init];
        _redPoint.image = IMAGE(@"user_redpoint");
        _redPoint.hidden = YES;
    }
    return _redPoint;
}

- (UILabel *)topLabel{
    if (_topLabel == nil) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.font = FONT(14);
        _topLabel.textColor = SHENTEXTCOLOR;
    }
    return _topLabel;
}

- (UILabel *)bottomLabel{
    if (_bottomLabel == nil) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.font = FONT(12);
        _bottomLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _bottomLabel;
}

- (UILabel *)countLabel{
    if (_countLabel == nil) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.font = FONT(10);
        _countLabel.textColor = WHITECOLOR;
    }
    return _countLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.topLabel];
    [self.contentView addSubview:self.bottomLabel];
    [self.contentView addSubview:self.redPoint];
    [self.redPoint addSubview:self.countLabel];
    [self.contentView addSubview:self.lineView];
    
    self.icon.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(45)
    .heightIs(45);
    
    self.topLabel.sd_layout
    .topEqualToView(self.icon)
    .leftSpaceToView(self.icon, 15)
    .autoHeightRatio(0);
    [self.topLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.bottomLabel.sd_layout
    .bottomEqualToView(self.icon)
    .leftSpaceToView(self.icon, 15)
    .autoHeightRatio(0);
    [self.bottomLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH - 90];
    
    self.redPoint.sd_layout
    .centerXIs(60)
    .centerYIs(27)
    .widthIs(16)
    .heightIs(16);
    
    self.countLabel.sd_layout
    .centerXEqualToView(self.redPoint)
    .centerYEqualToView(self.redPoint)
    .autoHeightRatio(0);
    [self.countLabel setSingleLineAutoResizeWithMaxWidth:15];
    
    self.lineView. sd_layout
    .leftEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);
    
    
}

- (void)setTitle:(NSString *)title subTitle:(NSString *)subTitle messageCount:(NSString *)count{
    self.topLabel.text = title;
    self.bottomLabel.text = subTitle;
    if (count.integerValue > 0) {
       self.countLabel.text = count;
        self.redPoint.hidden = NO;
    }else{
        self.redPoint.hidden = YES;
    }
    if ([title containsString:@"系统"]) {
        self.icon.image = IMAGE(@"user_sysMessage");
        
    }else{
        self.icon.image = IMAGE(@"user_orderMessage");
    }
    
}

@end
