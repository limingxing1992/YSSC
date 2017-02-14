//
//  UserIconCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserIconCell.h"
#import "YSSBlockUserButton.h"
#import "UserInfoObject.h"

@interface UserIconCell ()

//头像
@property (nonatomic, strong) UIImageView *iconImageView;
//名字
@property (nonatomic, strong) UIButton *nameButton;
//会员View
@property (nonatomic, strong) UIButton *rankButton;
//底部按钮容器视图
@property (nonatomic, strong) UIView *btnContentView;
//想住
@property (nonatomic, strong) YSSBlockUserButton *wishButton;
//住过
@property (nonatomic, strong) YSSBlockUserButton *alreadyButton;
//收藏
@property (nonatomic, strong) YSSBlockUserButton *favoriteButton;
/**等级字典*/
@property (nonatomic, strong) NSDictionary *rankDict;

@end

@implementation UserIconCell

#pragma mark --------- 懒加载

- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = 33.5;
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.borderWidth = 1.5;
        _iconImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _iconImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headimgClick)];
        [_iconImageView addGestureRecognizer:tap];
        
    }
    return _iconImageView;
}

- (UIButton *)nameButton{
    if (_nameButton == nil) {
        _nameButton = [[UIButton alloc] init];
        [_nameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _nameButton.titleLabel.font = FONT(17);
        [_nameButton setTitle:@"请点击登录" forState:UIControlStateNormal];
        [_nameButton addTarget:self action:@selector(userButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _nameButton.tag = 302;
    }
    return _nameButton;
}

- (UIButton *)rankButton{
    if (_rankButton == nil) {
        _rankButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rankButton.layer.cornerRadius = 12.5;
        [_rankButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _rankButton.backgroundColor = YSSCRGBColor(74, 170, 147);
        [_rankButton setImage:IMAGE(@"classify113") forState:UIControlStateNormal];
        [_rankButton addTarget:self action:@selector(userButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _rankButton.titleLabel.font = FONT(14);
        [_rankButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        _rankButton.tag = 301;
        [_rankButton setTitle:@"未登录" forState:UIControlStateNormal];
    }
    return _rankButton;
}

- (UIView *)btnContentView{
    if (_btnContentView == nil) {
        _btnContentView = [[UIView alloc] init];
        _btnContentView.backgroundColor = GRAYCOLOR;
    }
    return _btnContentView;
}


- (YSSBlockUserButton *)wishButton{
    if (_wishButton == nil) {
        _wishButton = [[YSSBlockUserButton alloc] init];
        _wishButton.backgroundColor = [UIColor whiteColor];
        [_wishButton setImageEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
        [_wishButton setTitle:@"想住" forState:UIControlStateNormal];
        _wishButton.titleLabel.font = FONT(14);
        [_wishButton setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        _wishButton.tag = 303;
        [_wishButton setImage:[UIImage imageNamed:@"classify116"] forState:UIControlStateNormal];
    }
    return _wishButton;
}
- (YSSBlockUserButton *)alreadyButton{
    if (_alreadyButton == nil) {
        _alreadyButton = [[YSSBlockUserButton alloc] init];
        _alreadyButton.backgroundColor = [UIColor whiteColor];
        [_alreadyButton setTitle:@"住过" forState:UIControlStateNormal];
        _alreadyButton.titleLabel.font = FONT(14);
        [_alreadyButton setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        _alreadyButton.tag = 304;
        [_alreadyButton setImage:[UIImage imageNamed:@"classify117"] forState:UIControlStateNormal];
    }
    return _alreadyButton;
}
- (YSSBlockUserButton *)favoriteButton{
    if (_favoriteButton == nil) {
        _favoriteButton = [[YSSBlockUserButton alloc] init];
        _favoriteButton.backgroundColor = [UIColor whiteColor];
        [_favoriteButton setTitle:@"收藏" forState:UIControlStateNormal];
        _favoriteButton.titleLabel.font = FONT(14);
        [_favoriteButton setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        _favoriteButton.tag = 305;
        [_favoriteButton setImage:[UIImage imageNamed:@"classify119"] forState:UIControlStateNormal];
    }
    return _favoriteButton;
}

- (NSDictionary *)rankDict{
    if (_rankDict == nil) {
        _rankDict = @{@"2":@"普通会员",
                      @"20":@"白金会员",
                      @"21":@"钻石会员",
                      @"22":@"黑金会员"};
    }
    return _rankDict;
}

#pragma mark --------- 生命周期


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = MALLColor;
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.nameButton];
        [self.contentView addSubview:self.rankButton];
        [self.contentView addSubview:self.btnContentView];
        
        
        [self.btnContentView addSubview:self.wishButton];
        YSSCWeakObj(self)
        [_wishButton addTargetBlock:^(YSSBlockUserButton *button) {
            if (weakself.block) {
                weakself.block(button);
            }
        }];
        [self.btnContentView addSubview:self.alreadyButton];
        [_alreadyButton addTargetBlock:^(YSSBlockUserButton *button) {
            if (weakself.block) {
                weakself.block(button);
            }
        }];
        [self.btnContentView addSubview:self.favoriteButton];
        [_favoriteButton addTargetBlock:^(YSSBlockUserButton *button) {
            if (weakself.block) {
                weakself.block(button);
            }
        }];
        
        
        _iconImageView.sd_layout
        .topSpaceToView(self.contentView, 45)
        .centerXEqualToView(self.contentView)
        .heightIs(67)
        .widthIs(67);
        
        
        self.nameButton.sd_layout
        .topSpaceToView(self.iconImageView, 12.5)
        .centerXEqualToView(self.contentView)
        .heightIs(18)
        .widthIs(300);
        
        self.rankButton.sd_layout
        .topSpaceToView(self.nameButton, 12.5)
        .centerXEqualToView(self.contentView)
        .widthIs(103)
        .heightIs(25);
        
        self.btnContentView.sd_layout
        .topSpaceToView(self.rankButton, 19.5)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .heightIs(86.5);
        
        _wishButton.sd_layout
        .topSpaceToView(self.btnContentView, 0)
        .leftSpaceToView(self.btnContentView, 0)
        .widthIs((SCREEN_WIDTH/3) - 1)
        .heightRatioToView(self.btnContentView, 1);
        
        _alreadyButton.sd_layout
        .topSpaceToView(self.btnContentView, 0)
        .leftSpaceToView(self.wishButton, 0.5)
        .widthIs((SCREEN_WIDTH/3) - 1)
        .heightRatioToView(self.btnContentView, 1);
        
        _favoriteButton.sd_layout
        .topSpaceToView(self.btnContentView, 0)
        .leftSpaceToView(self.alreadyButton, 0.5)
        .widthIs((SCREEN_WIDTH/3) - 1)
        .heightRatioToView(self.btnContentView, 1);
        
        [_wishButton setImageEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
        
        [self setupAutoHeightWithBottomView:self.btnContentView bottomMargin:0];
        
    }
    return self;
}

- (void)setUserModel:(UserInfoObject *)userModel{
    _userModel = userModel;
    if (_userModel) {
        if (_userModel.data.nickname.length > 0) {
            [self.nameButton setTitle:_userModel.data.nickname forState:UIControlStateNormal];
        }else{
            [self.nameButton setTitle:_userModel.data.phone forState:UIControlStateNormal];
        }
//        if (_userModel.data.type.integerValue == 20) {
//            [self.rankButton setTitle:@"付费会员" forState:UIControlStateNormal];
//        }else{
//            [self.rankButton setTitle:@"普通会员" forState:UIControlStateNormal];
//        }
        [self.rankButton setTitle:[self.rankDict objectForKey:_userModel.data.type] forState:UIControlStateNormal];
        
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:_userModel.data.head_img] placeholderImage:IMAGE(@"head1")];
    }else{
        
        NSString *nameStr = [YSSUserDefault objectForKey:@"nickname"];
        if (nameStr.length > 0) {
           
            [self.nameButton setTitle:nameStr forState:UIControlStateNormal];
        }else{
            [self.nameButton setTitle:[YSSUserDefault objectForKey:@"phone"] forState:UIControlStateNormal];
        }
        
        [self.rankButton setTitle:@"普通会员" forState:UIControlStateNormal];
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:_userModel.data.head_img] placeholderImage:IMAGE(@"head1")];
    }
    
    
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        [self.nameButton setTitle:@"请点击登录" forState:UIControlStateNormal];
        [self.rankButton setTitle:@"未登录" forState:UIControlStateNormal];
    }
}

- (void)headimgClick{
    UIButton *btn = [[UIButton alloc] init];
    btn.tag = 302;
    [self userButtonClick:btn];
}

- (void)buttonDidClick:(buttonDidClick)block{
    _block = block;
}


- (void)userButtonClick:(UIButton *)button{
    if (_block) {
        _block(button);
    }
    
}


@end
