//
//  UserOrderMoneyCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderMoneyCell.h"

@interface UserOrderMoneyCell ()

/**订单金额标题*/
@property (nonatomic, strong) UILabel *sumLabel;
/**订单金额*/
@property (nonatomic, strong) UILabel *moneyLabel;


@end

@implementation UserOrderMoneyCell

- (UILabel *)sumLabel{
    if (_sumLabel == nil) {
        _sumLabel = [[UILabel alloc] init];
        _sumLabel.font = FONT(12);
        _sumLabel.textColor = SHENTEXTCOLOR;
        _sumLabel.text = @"订单金额";
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


#pragma mark --------- 生命周期

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
    
    self.moneyLabel.sd_layout
    .rightSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    [self.moneyLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.sumLabel.sd_layout
    .rightSpaceToView(self.moneyLabel, 10)
    .topEqualToView(self.moneyLabel)
    .autoHeightRatio(0);
    [self.sumLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    [self setupAutoHeightWithBottomView:self.sumLabel bottomMargin:10];
  
}

- (void)setMoney:(NSString *)money{
    self.moneyLabel.text = [NSString stringWithFormat:@"¥ %@",money];
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
