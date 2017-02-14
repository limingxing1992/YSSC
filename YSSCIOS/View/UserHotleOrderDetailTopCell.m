//
//  UserHotleOrderDetailTopCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserHotleOrderDetailTopCell.h"
#import "UserHotelOrderDetailObject.h"

@interface UserHotleOrderDetailTopCell ()

/**订单编号*/
@property (nonatomic, strong) UILabel *orderNumLabel;
/**订单状态*/
@property (nonatomic, strong) UILabel *orderStatusLabel;
/**状态详情*/
@property (nonatomic, strong) UILabel *statusDetailLabel;

/**状态字典*/
@property (nonatomic, strong) NSDictionary *userHotelOrderStatusDict;
/**标题状态字典*/
@property (nonatomic, strong) NSDictionary *userHotelOrderTitleDict;

/**分割线*/
@property (nonatomic, strong) UIView *lineView;

@end

@implementation UserHotleOrderDetailTopCell

- (UILabel *)orderNumLabel{
    if (_orderNumLabel == nil) {
        _orderNumLabel = [[UILabel alloc] init];
        _orderNumLabel.font = FONT(12);
        _orderNumLabel.textColor = BLACKTEXTCOLOR;
    }
    return _orderNumLabel;
}

- (UILabel *)orderStatusLabel{
    if (_orderStatusLabel == nil) {
        _orderStatusLabel = [[UILabel alloc] init];
        _orderStatusLabel.font = FONT(14);
        _orderStatusLabel.textColor = YSSCRGBColor(242, 101, 79);
        
    }
    return _orderStatusLabel;
}

- (UILabel *)statusDetailLabel{
    if (_statusDetailLabel == nil) {
        _statusDetailLabel = [[UILabel alloc] init];
        _statusDetailLabel.font = FONT(14);
        _statusDetailLabel.textColor = BLACKTEXTCOLOR;
    }
    return _statusDetailLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (NSDictionary *)userHotelOrderStatusDict{
    if (_userHotelOrderStatusDict == nil) {
        _userHotelOrderStatusDict = @{@"10":@"去付款",
                                      @"20":@"待入住",
                                      @"30":@"待退房",
                                      @"40":@"去评价",
                                      @"50":@"已完结",
                                      @"400":@"已取消",
                                      @"200":@"待退款",
                                      @"230":@"已退款"};
    }
    return _userHotelOrderStatusDict;
}

- (NSDictionary *)userHotelOrderTitleDict{
    if (_userHotelOrderTitleDict == nil) {
        _userHotelOrderTitleDict = @{@"10":@"等待买家付款",
                                      @"20":@"您已预定成功！请在约定时间到乡宿办理入住手续",
                                      @"30":@"待退房",
                                      @"40":@"等待评价",
                                      @"50":@"交易已完成"};
    }
    return _userHotelOrderTitleDict;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.orderNumLabel];
    [self.contentView addSubview:self.orderStatusLabel];
    [self.contentView addSubview:self.statusDetailLabel];
    [self.contentView addSubview:self.lineView];
    
    self.orderNumLabel.sd_layout
    .topSpaceToView(self.contentView, 15)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.orderNumLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH - 30)];
    
    self.orderStatusLabel.sd_layout
    .topSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.orderStatusLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.lineView.sd_layout
    .topSpaceToView(self.contentView, 45)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);
    
    self.statusDetailLabel.sd_layout
    .topSpaceToView(self.lineView, 15)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.statusDetailLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH - 30)];
    
    [self setupAutoHeightWithBottomView:self.statusDetailLabel bottomMargin:15];
    
}

- (void)setModel:(UserHotelOrderDetailObject *)model{
    _model = model;
    self.orderNumLabel.text = [NSString stringWithFormat:@"订单编号：%@",_model.data.order_number];
    self.orderStatusLabel.text = self.userHotelOrderStatusDict[_model.data.status];
    
    
    self.statusDetailLabel.text = self.userHotelOrderTitleDict[_model.data.status];
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
