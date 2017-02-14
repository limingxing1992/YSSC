//
//  MallPayTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallPayTableViewCell.h"

@interface MallPayTableViewCell ()
@property (nonatomic, strong) UIImageView *payIv;//支付方式图标
@property (nonatomic, strong) UILabel *payTitleLb;//支付方式标题
@property (nonatomic, strong) UILabel *payNoticeLb;//支付提醒
@property (nonatomic, strong) UIButton *paySelectedBtn;//支付选择

@property (nonatomic, strong) UIView *bgView;//黑色图层、、并且阻止任何响应时间


@end


@implementation MallPayTableViewCell

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
        self.contentView.backgroundColor = WHITECOLOR;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.payIv];
        [self.contentView addSubview:self.payTitleLb];
        [self.contentView addSubview:self.payNoticeLb];
        [self.contentView addSubview:self.paySelectedBtn];
        
        self.payIv.sd_layout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, 15)
        .widthIs(40)
        .heightEqualToWidth();
        
        self.payTitleLb.sd_layout
        .centerYIs(20)
        .leftSpaceToView(self.payIv, 15)
        .autoHeightRatio(0);
        [self.payTitleLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.payNoticeLb.sd_layout
        .centerYIs(40)
        .leftEqualToView(self.payTitleLb)
        .autoHeightRatio(0);
        [self.payNoticeLb setSingleLineAutoResizeWithMaxWidth:400];
        
        self.paySelectedBtn.sd_layout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(20)//原高度20 暂时隐藏此按钮
        .widthEqualToHeight();
            //暂时屏蔽此动作
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(paySelectAction)];
        [self.contentView addGestureRecognizer:tap];
        
        [YSSCNotificationCenter addObserver:self selector:@selector(cancelSelected:) name:@"payStyle" object:nil];
        [YSSCNotificationCenter addObserver:self selector:@selector(openPayStyleWith:) name:@"payNoti" object:nil];
    }
    return self;

}

- (void)setInfoWith:(NSString *)style{
    self.userInteractionEnabled = YES;
    self.paySelectedBtn.hidden = NO;
    self.payTitleLb.text = style;
    self.payNoticeLb.text = [NSString stringWithFormat:@"推荐已安装%@的用户使用",style];
//    self.payNoticeLb.text = @"暂未开通，敬请期待";
    if ([style isEqualToString:@"支付宝"]) {
        self.payIv.image = IMAGE(@"classify56");
        self.paySelectedBtn.selected = YES;
    }else if ([style isEqualToString:@"微信"]){
        self.payIv.image = IMAGE(@"classify59");
    }else if ([style isEqualToString:@"银联"]){
        self.payNoticeLb.text = @"暂未开通，敬请期待";
        self.payIv.image = IMAGE(@"bankCollection");
        self.paySelectedBtn.hidden = YES;
        self.userInteractionEnabled = NO;
    }
    
}


#pragma mark ----------------关闭支付和打开支付

- (void)openPayStyleWith:(NSNotification *)fication{
    NSDictionary *userInfo = fication.userInfo;
    BOOL ret = [userInfo[@"isOpen"] integerValue];
    if (ret) {
        //取消图层
        [self.bgView removeFromSuperview];
        self.contentView.userInteractionEnabled = YES;

    }else{
        //打开图层
        [self.contentView addSubview:self.bgView];
        self.contentView.userInteractionEnabled = NO;

        self.bgView.sd_layout
        .topSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .leftSpaceToView(self.contentView, 0)
        .bottomSpaceToView(self.contentView, 0);
    }
}


#pragma mark ----------------选择支付方式

- (void)cancelSelected:(NSNotification *)user{
    NSString *text = user.userInfo[@"status"];
    if ([text isEqualToString:self.payTitleLb.text]) {
        return;
    }else{
        self.paySelectedBtn.selected = NO;
    }
}

- (void)paySelectAction{
    if (_paySelectedBtn.isSelected) {
        //取消选中
        return;
    }else{
        //选中
        [YSSCNotificationCenter postNotificationName:@"payStyle" object:nil userInfo:@{@"status":self.payTitleLb.text}];//发送通知取消其他cell选中
        if (self.block) {
            self.block(self.payTitleLb.text);//传送被选中支付方式便于主页面统计支付信息
        }
    }
    
    _paySelectedBtn.selected = !_paySelectedBtn.isSelected;
}


- (void)dealloc{
    [YSSCNotificationCenter removeObserver:self];
}

#pragma mark ----------------实例化

- (UIImageView *)payIv{
    if (_payIv == nil) {
        _payIv = [[UIImageView alloc] init];
        _payIv.image = IMAGE(@"classify56");
    }
    return _payIv;

}

- (UILabel *)payTitleLb{
    if (_payTitleLb == nil) {
        _payTitleLb = [[UILabel alloc] init];
        _payTitleLb.font = FONT(14);
        _payTitleLb.textColor = BLACKTEXTCOLOR;
        _payTitleLb.text = @"支付宝";
    }
    return _payTitleLb;
}

- (UILabel *)payNoticeLb{
    if (_payNoticeLb == nil) {
        _payNoticeLb = [[UILabel alloc] init];
        _payNoticeLb.font = FONT(12);
        _payNoticeLb.textColor = LIGHTTEXTCOLOR;
        _payNoticeLb.text = @"推荐已安装支付宝的用户使用";
    }
    return _payNoticeLb;
}

- (UIButton *)paySelectedBtn{
    if (_paySelectedBtn == nil) {
        _paySelectedBtn = [[UIButton alloc] init];
        [_paySelectedBtn setBackgroundImage:IMAGE(@"classify57") forState:UIControlStateNormal];
        [_paySelectedBtn setBackgroundImage:IMAGE(@"classify58") forState:UIControlStateSelected];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(paySelectAction)];
        [_paySelectedBtn addGestureRecognizer:tap];

    }
    return _paySelectedBtn;
}


- (UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.5];
        _bgView.userInteractionEnabled= YES;
    }
    return _bgView;
}
@end
