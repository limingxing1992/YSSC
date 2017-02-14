//
//  WithdrawDetailTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/10/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "WithdrawDetailTableViewCell.h"

@interface WithdrawDetailTableViewCell ()
/** 账号*/
@property (nonatomic, strong) UILabel *accountLb;
/** 方式*/
@property (nonatomic, strong) UILabel *styleLb;
/** 提现时间*/
@property (nonatomic, strong) UILabel *timeLb;
/** 提现金额*/
@property (nonatomic, strong) UILabel *moneyLb;


@end

@implementation WithdrawDetailTableViewCell

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
        
        [self.contentView sd_addSubviews:@[self.accountLb,
                                           self.styleLb,
                                           self.timeLb,
                                           self.moneyLb]];
        
        [self setContentViewSubViews];
    }
    return self;
}

- (void)setContentViewSubViews{
    _accountLb.sd_layout
    .topSpaceToView(self.contentView, 20)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [_accountLb setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    
    _timeLb.sd_layout
    .centerYEqualToView(_accountLb)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [_timeLb setSingleLineAutoResizeWithMaxWidth:400];
    
    self.styleLb.sd_layout
    .topSpaceToView(_accountLb, 12)
    .leftEqualToView(_accountLb)
    .autoHeightRatio(0);
    [_styleLb setSingleLineAutoResizeWithMaxWidth:400];
    
    _moneyLb.sd_layout
    .centerYEqualToView(_styleLb)
    .rightEqualToView(_timeLb)
    .autoHeightRatio(0);
    [_moneyLb setSingleLineAutoResizeWithMaxWidth:400];
}


#pragma mark ----------------数据

- (void)setModel:(NSDictionary *)model{
    NSString *type;
    if ([model[@"type"] isEqualToNumber:@10]) {
        type = @"支付宝";
    }else if ([model[@"type"] isEqualToNumber:@30]){
        type = @"银行卡";
    }else{
        type = @"微信";
    }
    
    _accountLb.text = [NSString stringWithFormat:@"%@账号: %@",type, model[@"account"]];
    _timeLb.text = model[@"createDate"];
    _moneyLb.text = [NSString stringWithFormat:@"%@",model[@"amount"]];
    NSInteger flag = [model[@"status"] integerValue];
    switch (flag) {
        case 10:
        {
            _styleLb.text  = @"提现中";
        }
            break;
        case 20:
        {
            _styleLb.text  = @"提现成功";
        }
            break;
        case 30:
        {
            _styleLb.text  = @"提现失败";
        }
            break;
        default:
            break;
    }
}


#pragma mark ----------------实例

- (UILabel *)accountLb{
    if (_accountLb == nil) {
        _accountLb = [[UILabel alloc] init];
        _accountLb.font = FONT(14);
        _accountLb.textColor = SHENTEXTCOLOR;
        _accountLb.text = @"提现账号：";
    }
    return _accountLb;
}

- (UILabel *)styleLb{
    if (_styleLb == nil) {
        _styleLb = [[UILabel alloc] init];
        _styleLb.font = FONT(14);
        _styleLb.textColor = LIGHTTEXTCOLOR;
        _styleLb.text = @"提现";
    }
    return _styleLb;
}

- (UILabel *)timeLb{
    if (_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT(12);
        _timeLb.textColor = LIGHTTEXTCOLOR;
        _timeLb.text = @"2016-10-12 19:00:00";
    }
    return _timeLb;
}

- (UILabel *)moneyLb{
    if (_moneyLb == nil) {
        _moneyLb = [[UILabel alloc] init];
        _moneyLb.font = FONT(14);
        _moneyLb.textColor = MALLColor;
        _moneyLb.text = @"32";
    }
    return _moneyLb;
}



@end
