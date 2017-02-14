//
//  UserOrderTopCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderTopCell.h"

@interface UserOrderTopCell ()

/**顶部标题*/
@property (nonatomic, strong) UILabel *titleLabel;
/**订单状态*/
@property (nonatomic, strong) UILabel *orderStatusLabel;
/**icon*/
@property (nonatomic, strong) UIImageView *icon;

@end

@implementation UserOrderTopCell

#pragma mark --------- 懒加载
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT(12);
        _titleLabel.textColor = SHENTEXTCOLOR;
        
    }
    return _titleLabel;
}

- (UILabel *)orderStatusLabel{
    if (_orderStatusLabel == nil) {
        _orderStatusLabel = [[UILabel alloc] init];
        _orderStatusLabel.font = FONT(12);
        _orderStatusLabel.textColor = YSSCRGBColor(252, 89, 40);
    }
    return _orderStatusLabel;
}

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.image = IMAGE(@"user_orderTitle");
    }
    return _icon;
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
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.orderStatusLabel];
    [self.contentView addSubview:self.icon];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = GRAYCOLOR;
    lineView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
    [self.contentView addSubview:lineView];
    
    self.icon.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 12)
    .widthIs(10)
    .widthIs(10);
    
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.icon, 5)
    .topSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.orderStatusLabel.sd_layout
    .rightSpaceToView(self.contentView, 10)
    .centerYEqualToView(self.contentView)
    .autoHeightRatio(0);
    [self.orderStatusLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    [self setupAutoHeightWithBottomView:self.titleLabel bottomMargin:10];
}
#pragma mark --------- 更新数据
- (void)setTitle:(NSString *)title status:(NSString *)status{
    self.titleLabel.text = title;
    self.orderStatusLabel.text = status;
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
