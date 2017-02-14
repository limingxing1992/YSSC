//
//  MallBussInfoTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussInfoTableViewCell.h"

@interface MallBussInfoTableViewCell ()

@property (nonatomic, strong) UIImageView *headIv;//商家头像
@property (nonatomic, strong) UILabel *nameLb;//商家姓名
@property (nonatomic, strong) UILabel *fansNumLb;//粉丝数量
@property (nonatomic, strong) UIButton *favoriteBtn;//收藏按钮
@property (nonatomic, copy) NSString *shopID;//商家id


@end

@implementation MallBussInfoTableViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headIv];
        [self addSubview:self.nameLb];
        [self addSubview:self.fansNumLb];
        [self addSubview:self.favoriteBtn];
        
        self.headIv.sd_layout
        .centerYEqualToView(self)
        .leftSpaceToView(self, 15)
        .heightIs(75)
        .widthEqualToHeight();
        [self.headIv setSd_cornerRadiusFromWidthRatio:@0.5];
        
        
        self.fansNumLb.sd_layout
        .topSpaceToView(self.nameLb, 21.5)
        .leftEqualToView(self.nameLb)
        .autoHeightRatio(0);
        [self.fansNumLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.favoriteBtn.sd_layout
        .centerYEqualToView(self)
        .rightSpaceToView(self, 15)
        .widthIs(85)
        .heightIs(30);
        [self.favoriteBtn setSd_cornerRadius:@5];
        
        self.nameLb.sd_layout
        .topSpaceToView(self, 27)
        .leftSpaceToView(self.headIv, 15)
        .rightSpaceToView(self.favoriteBtn, 0)
        .autoHeightRatio(0);

    }
    return self;
}
#pragma mark ----------------数据刷新

- (void)updateInfoWith:(NSDictionary *)dict{
    [_headIv sd_setImageWithURL:[NSURL URLWithString:dict[@"logo_pic"]] placeholderImage:PlaceholderImage];
    _nameLb.text = dict[@"name"];
    _fansNumLb.text = [NSString stringWithFormat:@"粉丝数: %@", dict[@"collect_num"]];
    [_favoriteBtn setSelected:[dict[@"iscollect"] integerValue]];
    if (_favoriteBtn.isSelected) {
        _favoriteBtn.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
    }else{
        _favoriteBtn.layer.borderColor = MALLColor.CGColor;
    }
    _shopID = dict[@"id"];
    
}

#pragma mark ----------------收藏动作

- (void)mallBussFavoriteAction:(UIButton *)btn{
    
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return;
    }
    
    
    
    [SVProgressHUD showWithStatus:@"发送中"];
    if (!_shopID) {
        [SVProgressHUD showErrorWithStatus:@"信息错误"];
        return;
    }
    if (btn.isSelected) {
        btn.selected = NO;
        btn.layer.borderColor = MALLColor.CGColor;
    }else{
        btn.selected = YES;
        btn.layer.borderColor = LIGHTTEXTCOLOR.CGColor;
    }
    [YSSCShareBusinessManager.travelManager getFavoriteTravelWithParameters:@{@"linkId":_shopID, @"collectType":@60}
                                                                    success:^(id responObject) {
                                                                        [SVProgressHUD showSuccessWithStatus:responObject];
                                                                        [YSSCNotificationCenter postNotificationName:@"upFavorite" object:nil];
                                                                    } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                        [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                    }];
}


#pragma mark ----------------实例化

- (UIImageView *)headIv{
    if (_headIv == nil) {
        _headIv = [[UIImageView alloc] init];
        _headIv.backgroundColor = [UIColor redColor];
    }
    return _headIv;
}

- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = FONT(14);
        _nameLb.textColor = BLACKTEXTCOLOR;
        _nameLb.text = @"李明星";
    }
    return _nameLb;
}

- (UILabel *)fansNumLb{
    if (_fansNumLb == nil) {
        _fansNumLb = [[UILabel alloc] init];
        _fansNumLb.font = FONT(11);
        _fansNumLb.textColor = SHENTEXTCOLOR;
        _fansNumLb.text = @"粉丝数：128万";
    }
    return _fansNumLb;
}

- (UIButton *)favoriteBtn{
    if (_favoriteBtn == nil) {
        _favoriteBtn = [[UIButton alloc] init];
        _favoriteBtn.titleLabel.font = FONT(14);
        [_favoriteBtn setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateSelected];
        [_favoriteBtn setTitleColor:MALLColor forState:UIControlStateNormal];
        [_favoriteBtn setTitle:@"已收藏" forState:UIControlStateSelected];
        [_favoriteBtn setTitle:@"收藏" forState:UIControlStateNormal];
        _favoriteBtn.layer.borderColor = MALLColor.CGColor;
        _favoriteBtn.layer.borderWidth = 0.5;
        [_favoriteBtn addTarget:self action:@selector(mallBussFavoriteAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _favoriteBtn;
}

@end
