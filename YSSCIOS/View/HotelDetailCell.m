//
//  HotelDetailCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelDetailCell.h"
#import "YSSGreenBorderButton.h"
#import "RoomTypeObject.h"

@interface HotelDetailCell ()

//房间图片
@property (nonatomic, strong) UIImageView *roomImageView;

//房间类型
@property (nonatomic, strong) UILabel *roomTypeLabel;

//房间价格
@property (nonatomic, strong) UILabel *roomPriceLabel;

//预定
@property (nonatomic, strong) YSSGreenBorderButton *presetButton;

@end

@implementation HotelDetailCell

- (UIImageView *)roomImageView{
    if (_roomImageView == nil) {
        _roomImageView = [[UIImageView alloc] init];
        _roomImageView.image = IMAGE(@"placeholder_loading");
        
    }
    return _roomImageView;
}

- (UILabel *)roomTypeLabel{
    if (_roomTypeLabel == nil) {
        _roomTypeLabel = [[UILabel alloc] init];
        _roomTypeLabel.textColor = SHENTEXTCOLOR;
        _roomTypeLabel.font = FONT(14);
        
    }
    return _roomTypeLabel;
}

- (UILabel *)roomPriceLabel{
    if (_roomPriceLabel == nil) {
        _roomPriceLabel = [[UILabel alloc] init];
        _roomPriceLabel.textColor = MALLColor;
        _roomPriceLabel.font = FONT(13);
        
    }
    return _roomPriceLabel;
}

- (YSSGreenBorderButton *)presetButton{
    if (_presetButton == nil) {
        _presetButton = [YSSGreenBorderButton buttonWithType:UIButtonTypeCustom];
        _presetButton.titleLabel.font = FONT(12);
        [_presetButton setTitle:@"预定" forState:UIControlStateNormal];
        [_presetButton setTitle:@"客满" forState:UIControlStateDisabled];
        [_presetButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _presetButton;
}



- (void)setModel:(RoomTypeDataObject *)model{
    _model = model;
    [self.roomImageView sd_setImageWithURL:model.thumb_pic];
    self.roomTypeLabel.text = model.room_name;
    self.roomPriceLabel.text = [NSString stringWithFormat:@"¥%@",model.price];
    if (model.room_full) {
        self.presetButton.enabled = NO;
        self.presetButton.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
    }else{
        self.presetButton.enabled = YES;
        self.presetButton.layer.borderColor = MALLColor.CGColor;
    }
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]){
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI{
    
    [self.contentView addSubview:self.presetButton];
    [self.contentView addSubview:self.roomImageView];
    [self.contentView addSubview:self.roomTypeLabel];
    [self.contentView addSubview:self.roomPriceLabel];
    
    self.roomImageView.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10)
    .bottomSpaceToView(self.contentView, 10)
    .widthEqualToHeight(self);
    
    
    
    self.roomTypeLabel.sd_layout
    .topEqualToView(self.roomImageView)
    .leftSpaceToView(self.roomImageView, 10)
    .autoHeightRatio(0);
    [self.roomTypeLabel setSingleLineAutoResizeWithMaxWidth:(216)];
    
    self.roomPriceLabel.sd_layout
    .bottomEqualToView(self.roomImageView)
    .leftSpaceToView(self.roomImageView, 10)
    .autoHeightRatio(0);
    [self.roomPriceLabel setSingleLineAutoResizeWithMaxWidth:(300)];
    
    self.presetButton.sd_layout
    .rightSpaceToView(self.contentView, 10)
    .centerYEqualToView(self.contentView)
    .widthIs(50)// 测试，应该根据宽高比传值
    .heightIs(20);
    
    
}
#pragma mark --------- 预定按钮点击

- (void)buttonClick:(UIButton *)button{
    if (_buttonClickBlock) {
        _buttonClickBlock(button);
    }
}

- (void)buttonDidClick:(ButtonClickBlock)block{
    _buttonClickBlock = block;
}

#pragma mark --------- cell增加分割线

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 1;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}


@end
