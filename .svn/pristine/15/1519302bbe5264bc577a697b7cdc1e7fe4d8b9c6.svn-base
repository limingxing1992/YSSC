//
//  UserOrderBottomCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderBottomCell.h"
#import "UserHotelOrderObject.h"
#import "UserGoodsOrderObject.h"

@interface UserOrderBottomCell ()

/**订单按钮状态字典*/
@property (nonatomic, strong) NSDictionary *userHotelOrderButtonStatusDict;
@property (nonatomic, strong) NSDictionary *goodsOrderBUttonStatusDict;
/**提示语*/
@property (nonatomic, strong) UILabel *noticeLabel;

@end

@implementation UserOrderBottomCell

- (YSSGreenBorderButton *)cancelBtn{
    if (_cancelBtn == nil) {
        _cancelBtn = [[YSSGreenBorderButton alloc] init];
        _cancelBtn.titleLabel.font = FONT(12);
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn.layer setBorderColor:SHENTEXTCOLOR.CGColor];
        [_cancelBtn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
    }
    return _cancelBtn;
}
- (YSSGreenBorderButton *)nextBtn{
    if (_nextBtn == nil) {
        _nextBtn = [[YSSGreenBorderButton alloc] init];
        _nextBtn.titleLabel.font = FONT(12);
    }
    return _nextBtn;
}

- (YSSGreenBorderButton *)serviceBtn{
    if (_serviceBtn == nil) {
        _serviceBtn = [[YSSGreenBorderButton alloc] init];
        _serviceBtn.titleLabel.font = FONT(12);
        [_serviceBtn setTitle:@"售后" forState:UIControlStateNormal];
        _serviceBtn.hidden = YES;
    }
    return _serviceBtn;
}

- (UILabel *)noticeLabel{
    if (_noticeLabel == nil) {
        _noticeLabel = [[UILabel alloc] init];
        _noticeLabel.font = FONT(12);
        _noticeLabel.textColor = SHENTEXTCOLOR;
        _noticeLabel.text = @"超过时长，不能取消";
        _noticeLabel.hidden = YES;
    }
    return _noticeLabel;
}

- (NSDictionary *)userHotelOrderButtonStatusDict{
    if (_userHotelOrderButtonStatusDict == nil) {
        _userHotelOrderButtonStatusDict = @{@"10":@"去付款",
                                            @"20":@"待入住",
                                            @"30":@"待退房",
                                            @"40":@"去评价",
                                            @"50":@"已完结",
                                            @"400":@"已取消",
                                            @"200":@"待退款",
                                            @"230":@"已退款"};
    }
    return _userHotelOrderButtonStatusDict;
}

- (NSDictionary *)goodsOrderBUttonStatusDict{
    if (_goodsOrderBUttonStatusDict == nil) {
        _goodsOrderBUttonStatusDict = @{@"10":@"待付款",
                                        @"20":@"待发货",
                                        @"30":@"去收货",
                                        @"40":@"去评价",
                                        @"50":@"已完结",
                                        @"200":@"待退款",
                                        @"210":@"买家填单",
                                        @"220":@"卖家收货",
                                        @"230":@"已退款",
                                        @"400":@"已取消",
                                        @"404":@"超时取消",
                                        @"600":@"买家删除"};;
    }
    return _goodsOrderBUttonStatusDict;
}

#pragma mark --------- 生命周期

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.cancelBtn];
    [self.contentView addSubview:self.nextBtn];
    [self.contentView addSubview:self.serviceBtn];
    [self.contentView addSubview:self.noticeLabel];
    
    self.nextBtn.sd_layout
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 5)
    .widthIs(68)
    .heightIs(24);
    
    self.cancelBtn.sd_layout
    .rightSpaceToView(self.nextBtn, 8)
    .topSpaceToView(self.contentView, 5)
    .heightIs(24)
    .widthIs(68);
    
    self.serviceBtn.sd_layout
    .rightSpaceToView(self.nextBtn, 8)
    .topSpaceToView(self.contentView, 5)
    .heightIs(24)
    .widthIs(68);
    
    self.noticeLabel.sd_layout
    .rightSpaceToView(self.contentView, 8)
    .centerYEqualToView(self.contentView)
    .autoHeightRatio(0);
    [self.noticeLabel setSingleLineAutoResizeWithMaxWidth:150];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = GRAYCOLOR;
    [self.contentView addSubview:lineView];
    lineView.sd_layout
    .bottomSpaceToView(self.contentView, 0)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);
    
    [self setupAutoHeightWithBottomView:self.nextBtn bottomMargin:5];
}

- (void)setModel:(UserHotelOrderDataObject *)model{
    _model = model;
    [_nextBtn setTitle:self.userHotelOrderButtonStatusDict[_model.status] forState:UIControlStateNormal];
    
    if (_model.status.integerValue == 600) {//已删除
        self.nextBtn.hidden = YES;
    }else{
        self.nextBtn.hidden = NO;
    }
    
    if (_model.status.integerValue == 20) {//待入住
       
        if (_model.is_cancel.integerValue == 1) {
            
            self.serviceBtn.hidden = NO;
            self.nextBtn.hidden = YES;
            self.noticeLabel.hidden = YES;
        }else{
            self.serviceBtn.hidden = YES;
            self.noticeLabel.hidden = NO;
            self.nextBtn.hidden = YES;
        }
    }else{
        self.nextBtn.hidden = YES;
        self.noticeLabel.hidden = YES;
        self.serviceBtn.hidden = YES;
    }
    
    if (_model.status.integerValue == 10) {//待付款
        self.cancelBtn.hidden = NO;
        self.nextBtn.hidden = NO;
    }else{
        self.cancelBtn.hidden = YES;
    }
    
    if (_model.status.integerValue == 40) {//待评价
        
        self.nextBtn.hidden = NO;
    }else{
        
    }
    
    
    self.serviceBtn.sd_layout
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 5)
    .widthIs(68)
    .heightIs(24);
//    self.serviceBtn.layer.borderColor = SHENTEXTCOLOR.CGColor;
//    [self.serviceBtn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
    [self.serviceBtn setTitle:@"取消订房" forState:UIControlStateNormal];
    
}

- (void)setGoodsModel:(UserGoodsOrderDataObject *)goodsModel{
    _goodsModel = goodsModel;
    
    [_nextBtn setTitle:self.goodsOrderBUttonStatusDict[_goodsModel.status] forState:UIControlStateNormal];
    if (_goodsModel.status.integerValue == 10) {
        self.cancelBtn.hidden = NO;
    }else{
        self.cancelBtn.hidden = YES;
    }
    self.nextBtn.hidden = NO;
    
    if (_goodsModel.status.integerValue == 30) {//待付款状态 申请售后
        self.serviceBtn.hidden = NO;
        
    }else{
        self.serviceBtn.hidden = YES;
    }
    
    
}

#pragma mark --------- 更新数据
- (void)setNextBtnTitle:(NSString *)string{
    [self.nextBtn setTitle:string forState:UIControlStateNormal];
}




@end
