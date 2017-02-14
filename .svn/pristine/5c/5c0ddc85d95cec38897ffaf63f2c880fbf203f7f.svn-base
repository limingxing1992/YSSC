//
//  MallBussTopTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussTopTableViewCell.h"

@interface MallBussTopTableViewCell ()

@property (nonatomic, strong) UIImageView *bannerIv;//首页图

@property (nonatomic, strong) UIView *headView;//头像承载图

@property (nonatomic, strong) UIImageView *headIv;//商家头像

@property (nonatomic, strong) UILabel *nameLb;//商家姓名

@property (nonatomic, strong) MallTabButton *favoriteBtn;//收藏按钮

@property (nonatomic, strong) NSString *shopId;

@end

@implementation MallBussTopTableViewCell

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
        self.backgroundColor = WHITECOLOR;
        [self addSubview:self.bannerIv];
        [self addSubview:self.headView];
        [self addSubview:self.nameLb];
        [self addSubview:self.favoriteBtn];
        
        self.bannerIv.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .rightSpaceToView(self, 0)
        .heightIs(150);
        
        self.headView.sd_layout
        .topSpaceToView(self.bannerIv, - 15)
        .leftSpaceToView(self, 5)
        .widthIs(75)
        .heightEqualToWidth();
        [self.headView setSd_cornerRadiusFromWidthRatio:@0.5];
        
        self.headIv.sd_layout
        .topSpaceToView(self.headView, 5)
        .bottomSpaceToView(self.headView, 5)
        .rightSpaceToView(self.headView, 5)
        .leftSpaceToView(self.headView, 5);
        [self.headIv setSd_cornerRadiusFromWidthRatio:@0.5];
        
        self.nameLb.sd_layout
        .topSpaceToView(self.bannerIv, 12)
        .leftSpaceToView(self.headView, 5)
        .autoHeightRatio(0);
        [self.nameLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.favoriteBtn.sd_layout
        .topSpaceToView(self.bannerIv, 15)
        .rightSpaceToView(self, 12)
        .heightIs(30)
        .widthIs(25);
        
    }
    return self;

}


#pragma mark ----------------数据刷新

- (void)updateInfoWith:(NSDictionary *)dict{
    [self.bannerIv sd_setImageWithURL:[NSURL URLWithString:dict[@"shop_banner"]] placeholderImage:PlaceholderImage];
    self.nameLb.text = dict[@"name"];
    [self.headIv sd_setImageWithURL:[NSURL URLWithString:dict[@"logo_pic"]] placeholderImage:PlaceholderHeadImage];
    _shopId = dict[@"id"];
    if ([dict[@"iscollect"] isEqualToNumber:@1]) {
        //
        [self.favoriteBtn setSelected:YES];
        self.favoriteBtn.tabIv.image  = IMAGE(@"classify81");
        self.favoriteBtn.tabLb.textColor = MALLColor;
    }else{
        [self.favoriteBtn setSelected:NO];
        self.favoriteBtn.tabLb.textColor = BLACKTEXTCOLOR;
        self.favoriteBtn.tabIv.image = IMAGE(@"classify77");
    }
}


#pragma mark ----------------点击收藏

- (void)favoriteAciton:(MallTabButton *)btn{
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return;
    }
    
    [SVProgressHUD showWithStatus:@"发送中"];

    if (btn.isSelected) {
        btn.selected = NO;
        btn.tabIv.image = IMAGE(@"classify77");
        btn.tabLb.textColor = BLACKTEXTCOLOR;
    }else{
        btn.selected = YES;
        btn.tabIv.image = IMAGE(@"classify81");
        btn.tabLb.textColor = MALLColor;
    }
    [YSSCShareBusinessManager.travelManager getFavoriteTravelWithParameters:@{@"linkId":_shopId, @"collectType":@60}
                                                                    success:^(id responObject) {
                                                                        [SVProgressHUD showSuccessWithStatus:responObject];
                                                                        [YSSCNotificationCenter postNotificationName:@"upFavorite" object:nil];
                                                                    }
                                                                    failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                        [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                    }];
    
    
}


#pragma mark ----------------实例化

- (UIImageView *)bannerIv{
    if (_bannerIv == nil) {
        _bannerIv = [[UIImageView alloc] init];
        _bannerIv.image = PlaceholderImage;
    }
    return _bannerIv;

}

- (UIView *)headView{
    if (_headView == nil) {
        _headView = [[UIView alloc] init];
        _headView.backgroundColor = WHITECOLOR;
        [_headView addSubview:self.headIv];
    }
    return _headView;

}

- (UIImageView *)headIv{
    if (_headIv == nil) {
        _headIv = [[UIImageView alloc] init];
        _headIv.image = PlaceholderHeadImage;
        _headIv.layer.borderColor = GRAYCOLOR.CGColor;
        _headIv.layer.borderWidth = 0.5;
        _headIv.clipsToBounds = YES;
    }
    return _headIv;

}

- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = FONT(15);
        _nameLb.textColor = BLACKTEXTCOLOR;
        _nameLb.text = @"周黑鸭";
    }
    return _nameLb;
}

- (MallTabButton *)favoriteBtn{
    if (_favoriteBtn == nil) {
        _favoriteBtn = [[MallTabButton alloc] init];
        [_favoriteBtn.singleLineView removeFromSuperview];
        [_favoriteBtn setTitleText:@"收藏" image:IMAGE(@"classify77")];
        [_favoriteBtn addTarget:self action:@selector(favoriteAciton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _favoriteBtn;
}

@end
