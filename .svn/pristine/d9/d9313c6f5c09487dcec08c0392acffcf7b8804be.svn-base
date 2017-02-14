//
//  HotelSubmitOrderCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelSubmitOrderCell.h"

@interface HotelSubmitOrderCell ()

/**icon*/
@property (nonatomic, strong) UIImageView *icon;
/**乡宿名称*/
@property (nonatomic, strong) UILabel *hotelNameLabel;
/**房型*/
@property (nonatomic, strong) UILabel *roomTypeLabel;
/**入住*/
@property (nonatomic, strong) UILabel *inTimeTitleLabel;
/**入住时间*/
@property (nonatomic, strong) UILabel *inTimeLabel;
/**离店*/
@property (nonatomic, strong) UILabel *outTimeTitleLabel;
/**离店时间*/
@property (nonatomic, strong) UILabel *outTimeLabel;




@end

@implementation HotelSubmitOrderCell

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.image = IMAGE(@"placeholder_head");
    }
    return _icon;
}

- (UILabel *)hotelNameLabel{
    if (_hotelNameLabel == nil) {
        _hotelNameLabel = [UILabel new];
        _hotelNameLabel.font = FONT(14);
        _hotelNameLabel.textColor = SHENTEXTCOLOR;
    }
    return _hotelNameLabel;
}

- (UILabel *)roomTypeLabel{
    if (_roomTypeLabel == nil) {
        _roomTypeLabel = [UILabel new];
        _roomTypeLabel.font = FONT(12);
        _roomTypeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _roomTypeLabel;
}

- (UILabel *)inTimeTitleLabel{
    if (_inTimeTitleLabel == nil) {
        _inTimeTitleLabel = [UILabel new];
        _inTimeTitleLabel.font = FONT(12);
        _inTimeTitleLabel.textColor = LIGHTTEXTCOLOR;
        _inTimeTitleLabel.text = @"入住";
    }
    return _inTimeTitleLabel;
}

- (UILabel *)inTimeLabel{
    if (_inTimeLabel == nil) {
        _inTimeLabel = [UILabel new];
        _inTimeLabel.font = FONT(12);
        _inTimeLabel.textColor = SHENTEXTCOLOR;
    }
    return _inTimeLabel;
}

- (UILabel *)outTimeTitleLabel{
    if (_outTimeTitleLabel == nil) {
        _outTimeTitleLabel = [UILabel new];
        _outTimeTitleLabel.font = FONT(12);
        _outTimeTitleLabel.textColor = LIGHTTEXTCOLOR;
        _outTimeTitleLabel.text = @"离店";
    }
    return _outTimeTitleLabel;
}

- (UILabel *)outTimeLabel{
    if (_outTimeLabel == nil) {
        _outTimeLabel = [UILabel new];
        _outTimeLabel.font = FONT(12);
        _outTimeLabel.textColor = SHENTEXTCOLOR;
    }
    return _outTimeLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.hotelNameLabel];
    [self.contentView addSubview:self.roomTypeLabel];
    [self.contentView addSubview:self.inTimeTitleLabel];
    [self.contentView addSubview:self.inTimeLabel];
    [self.contentView addSubview:self.outTimeTitleLabel];
    [self.contentView addSubview:self.outTimeLabel];
    
    self.icon.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 15)
    .heightIs(70)
    .widthIs(70);
    
    self.hotelNameLabel.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.icon, 15)
    .autoHeightRatio(0);
    [self.hotelNameLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.roomTypeLabel.sd_layout
    .leftSpaceToView(self.icon, 15)
    .centerYEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.roomTypeLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.inTimeTitleLabel.sd_layout
    .leftSpaceToView(self.icon, 15)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.inTimeTitleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.inTimeLabel.sd_layout
    .leftSpaceToView(self.inTimeTitleLabel, 5)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.inTimeLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.outTimeTitleLabel.sd_layout
    .leftSpaceToView(self.inTimeLabel, 5)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.outTimeTitleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.outTimeLabel.sd_layout
    .leftSpaceToView(self.outTimeTitleLabel, 5)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.outTimeLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = GRAYCOLOR;

    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = GRAYCOLOR;
    [self.contentView addSubview:lineView];
    [self.contentView addSubview:lineView1];
    
    lineView.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);
    
    lineView1.sd_layout
    .bottomEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);


}

- (void)setHotelName:(NSString *)hotelName icon:(NSURL *)iconURL type:(NSString *)type setDateArray:(NSMutableArray *)array{
    NSString *fromDay = array.firstObject;
    NSString *toDay = array.lastObject;
    self.inTimeLabel.text = [NSString stringWithFormat:@"%@月%@日",[fromDay substringWithRange:NSMakeRange(5, 2)],[fromDay substringWithRange:NSMakeRange(8, 2)]];
    self.outTimeLabel.text = [NSString stringWithFormat:@"%@月%@日 %ld晚",[toDay substringWithRange:NSMakeRange(5, 2)],[toDay substringWithRange:NSMakeRange(8, 2)],array.count - 1];
    self.hotelNameLabel.text = hotelName;
    self.roomTypeLabel.text = [NSString stringWithFormat:@"房型：%@",type];
    [self.icon sd_setImageWithURL:iconURL];
    
}




@end
