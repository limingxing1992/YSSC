//
//  UserHotelOrderDetailCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserHotelOrderDetailCell.h"
#import "UserHotelOrderDetailObject.h"
#import "NSDate+Formater.h"

@interface UserHotelOrderDetailCell  ()
/**图片*/
@property (nonatomic, strong) UIImageView *icon;
/**名称*/
@property (nonatomic, strong) UILabel *nameLabel;
/**规格*/
@property (nonatomic, strong) UILabel *houseTypeLabel;
/**时间*/
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation UserHotelOrderDetailCell

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = GRAYCOLOR;
    }
    return _icon;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT(14);
        _nameLabel.textColor = BLACKTEXTCOLOR;
        
    }
    return _nameLabel;
}

- (UILabel *)houseTypeLabel{
    if (_houseTypeLabel == nil) {
        _houseTypeLabel = [[UILabel alloc] init];
        _houseTypeLabel.font = FONT(12);
        _houseTypeLabel.textColor = SHENTEXTCOLOR;
    }
    return _houseTypeLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = FONT(12);
        _timeLabel.textColor = SHENTEXTCOLOR;
    }
    return _timeLabel;
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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.houseTypeLabel];
    [self.contentView addSubview:self.timeLabel];

    
    self.icon.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10)
    .widthIs(70)
    .heightIs(70);
    
    self.nameLabel.sd_layout
    .leftSpaceToView(self.icon, 13)
    .topEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.nameLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.houseTypeLabel.sd_layout
    .leftSpaceToView(self.icon, 13)
    .centerYEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.houseTypeLabel setSingleLineAutoResizeWithMaxWidth:300];
    
    self.timeLabel.sd_layout
    .leftSpaceToView(self.icon, 13)
    .bottomEqualToView(self.icon)
    .autoHeightRatio(0);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH - 110];
    

    
    [self setupAutoHeightWithBottomView:self.icon bottomMargin:10];
    
    
}

- (void)setModel:(UserHotelOrderDetailObject *)model{
    _model = model;
    //测试
    self.nameLabel.text = _model.data.hotel_name;
   
    self.houseTypeLabel.text = [NSString stringWithFormat: @"房型：%@ 1间",_model.data.room_name];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *comeDate = [dateFormatter dateFromString:_model.data.come_time];
    NSDate *leaveTime = [dateFormatter dateFromString:_model.data.leave_time];
    
    NSInteger days = [NSDate getDaysFrom:comeDate To:leaveTime];
    
    self.timeLabel.text = [NSString stringWithFormat:@"入住：%@ 退房：%@ %zd晚",_model.data.come_time,_model.data.leave_time,days];
    [self.icon sd_setImageWithURL:_model.data.pic placeholderImage:IMAGE(@"placeholder_loading")];
}

#pragma mark --------- cell增加分割线

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 0.5;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}
@end
