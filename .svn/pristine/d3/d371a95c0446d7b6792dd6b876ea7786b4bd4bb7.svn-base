//
//  UserOrderDetailMoneyCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderDetailMoneyCell.h"

@interface UserOrderDetailMoneyCell ()

/**订单金额标题*/
@property (nonatomic, strong) UILabel *sumLabel;
/**订单金额*/
@property (nonatomic, strong) UILabel *moneyLabel;
/**运费标题*/
@property (nonatomic, strong) UILabel *mailTitleLabel;
/**运费金额*/
@property (nonatomic, strong) UILabel *mailMoneyLabel;
@end

@implementation UserOrderDetailMoneyCell

- (UILabel *)sumLabel{
    if (_sumLabel == nil) {
        _sumLabel = [[UILabel alloc] init];
        _sumLabel.font = FONT(12);
        _sumLabel.textColor = SHENTEXTCOLOR;
        _sumLabel.text = @"商品金额：";
    }
    return _sumLabel;
}
- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = FONT(12);
        _moneyLabel.textColor = MALLColor;
    }
    return _moneyLabel;
}

- (UILabel *)mailTitleLabel{
    if (_mailTitleLabel == nil) {
        _mailTitleLabel = [[UILabel alloc] init];
        _mailTitleLabel.font = FONT(12);
        _mailTitleLabel.textColor = SHENTEXTCOLOR;
        _mailTitleLabel.text = @"运费：";
    }
    return _mailTitleLabel;
}

- (UILabel *)mailMoneyLabel{
    if (_mailMoneyLabel == nil) {
        _mailMoneyLabel = [[UILabel alloc] init];
        _mailMoneyLabel.font = FONT(12);
        _mailMoneyLabel.textColor = MALLColor;
    }
    return _mailMoneyLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.sumLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.mailTitleLabel];
    [self.contentView addSubview:self.mailMoneyLabel];
    
    self.sumLabel.sd_layout
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    [self.sumLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.moneyLabel.sd_layout
    .rightSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.sumLabel)
    .autoHeightRatio(0);
    [self.moneyLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.mailTitleLabel.sd_layout
    .topSpaceToView(self.sumLabel,15)
    .leftSpaceToView(self.contentView,15)
    .autoHeightRatio(0);
    [self.mailTitleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.mailMoneyLabel.sd_layout
    .rightSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.mailTitleLabel)
    .autoHeightRatio(0);
    [self.mailMoneyLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    [self setupAutoHeightWithBottomView:self.mailTitleLabel bottomMargin:10];
    

    
}
#pragma mark --------- cell增加分割线

- (void)setMoney:(NSString *)money mailMoney:(NSString *)mailMoney{
    //测试
    self.moneyLabel.text = [NSString stringWithFormat:@"¥ %@",money];;
    self.mailMoneyLabel.text = [NSString stringWithFormat:@"¥ %@",mailMoney];
}

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 0.5;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}

@end
