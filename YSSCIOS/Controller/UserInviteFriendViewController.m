//
//  UserInviteFriendViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserInviteFriendViewController.h"
#import "UserInviteCodeObject.h"

@interface UserInviteFriendViewController ()

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**顶部视图*/
@property (nonatomic, strong) UIImageView *topView;
/**中间的说明*/
@property (nonatomic, strong) UILabel *messageLabel;
/**邀请码视图*/
@property (nonatomic, strong) UIImageView *codeImgView;
/**我的专属邀请吗*/
@property (nonatomic, strong) UILabel *codeTitleLabel;
/**邀请码*/
@property (nonatomic, strong) UILabel *codeLabel;
/**复制按钮*/
@property (nonatomic, strong) UIButton *dupBtn;
/**分享按钮*/
@property (nonatomic, strong) UIButton *shareBtn;



@end

@implementation UserInviteFriendViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"邀请好友注册"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navBar;
}

- (UIImageView *)topView{
    if (_topView == nil) {
        _topView = [[UIImageView alloc] init];
        _topView.image = IMAGE(@"user_inviteFriend");
    }
    return _topView;
}

- (UILabel *)messageLabel{
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = FONT(14);
        _messageLabel.textColor = SHENTEXTCOLOR;
        
        NSString *textStr = @"每邀请一个好友成功注册，就能一直获得他在平台交易的分润";
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textStr];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:8];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [textStr length])];
        _messageLabel.attributedText = attributedString;
    }
    return _messageLabel;
}

- (UIImageView *)codeImgView{
    if (_codeImgView == nil) {
        _codeImgView = [[UIImageView alloc] init];
        _codeImgView.userInteractionEnabled = YES;
        _codeImgView.backgroundColor = YSSCRGBColor(241, 241, 243);
    }
    return _codeImgView;
}

- (UILabel *)codeTitleLabel{
    if (_codeTitleLabel == nil) {
        _codeTitleLabel = [[UILabel alloc] init];
        _codeTitleLabel.font = FONT(17);
        _codeTitleLabel.textColor = ORANGE_COLOR;
        _codeTitleLabel.text = @"我的专属邀请码";
    }
    return _codeTitleLabel;
}

- (UILabel *)codeLabel{
    if (_codeLabel == nil) {
        _codeLabel = [[UILabel alloc] init];
        _codeLabel.font = FONT(17);
        _codeLabel.textColor = SHENTEXTCOLOR;
    }
    return _codeLabel;
}

- (UIButton *)dupBtn{
    if (_dupBtn == nil) {
        _dupBtn = [[UIButton alloc] init];
        [_dupBtn setTitle:@"复制" forState:UIControlStateNormal];
        [_dupBtn setTitleColor:YSSCRGBColor(170, 198, 74) forState:UIControlStateNormal];
        [_dupBtn setBackgroundImage:[UIImage imageWithColor:YSSCRGBColor(241, 241, 243)] forState:UIControlStateNormal];
        _dupBtn.titleLabel.font = FONT(15);
        [_dupBtn addTarget:self action:@selector(dupInviteCode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dupBtn;
}

- (UIButton *)shareBtn{
    if (_shareBtn == nil) {
        _shareBtn = [[UIButton alloc] init];
        [_shareBtn setTitle:@"分享至社交媒体" forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = FONT(15);
     
        _shareBtn.backgroundColor = ORANGE_COLOR;
        [_shareBtn setBackgroundImage:[UIImage imageWithColor:ORANGE_COLOR] forState:UIControlStateNormal];
        _shareBtn.layer.cornerRadius = 2.5;
        
        [_shareBtn addTarget:self action:@selector(shareInviteCode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestInviteCode];
}

- (void)requestInviteCode{
    [YSSCShareBusinessManager.userManager getInviteCodeWithDictionary:nil success:^(id object) {
        if (object) {
            UserInviteCodeObject *inviteCodeObject = object;
            if (inviteCodeObject.errorCode.integerValue == SeverStateSuccess) {
                
                self.codeLabel.text = inviteCodeObject.data;
            }
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}



- (void)setupUI{
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.messageLabel];
    [self.view addSubview:self.codeImgView];
    [self.codeImgView addSubview:self.codeTitleLabel];
    [self.codeImgView addSubview:self.codeLabel];
    [self.codeImgView addSubview:self.dupBtn];
    [self.view addSubview:self.shareBtn];
    
    self.topView.sd_layout
    .topSpaceToView(self.navBar, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(188);
    
    self.messageLabel.sd_layout
    .topSpaceToView(self.topView, 12)
    .leftSpaceToView(self.view, 15)
    .widthIs(SCREEN_WIDTH - 30)
    .heightIs(60);
    [self.messageLabel setNumberOfLines:2];
  //  [self.messageLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH - 30)];
    
    self.codeImgView.sd_layout
    .topSpaceToView(self.messageLabel, 10)
    .leftSpaceToView(self.view, 15)
    .rightSpaceToView(self.view, 15)
    .heightIs(84.5);
    
    self.codeTitleLabel.sd_layout
    .topSpaceToView(self.codeImgView, 18)
    .centerXEqualToView(self.codeImgView)
    .autoHeightRatio(0);
    [self.codeTitleLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.codeLabel.sd_layout
    .topSpaceToView(self.codeTitleLabel, 21)
    .centerXEqualToView(self.codeImgView)
    .autoHeightRatio(0);
    [self.codeLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.dupBtn.sd_layout
    .rightSpaceToView(self.codeImgView, 28.5)
    .centerYEqualToView(self.codeLabel)
    .widthIs(35)
    .heightIs(16);
    
    self.shareBtn.sd_layout
    .topSpaceToView(self.codeImgView, 13.5)
    .leftSpaceToView(self.view, 15)
    .rightSpaceToView(self.view, 15)
    .heightIs(44.5);
    
  
}

#pragma mark --------- 点击事件处理

//复制邀请码
- (void)dupInviteCode{
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if (self.codeLabel.text.length > 0) {
       pasteboard.string = self.codeLabel.text; 
    }
    
    STL_SVProgessHUD(@"已复制");
    
}
//分享
- (void)shareInviteCode{
    [YSSCShareBusinessManager.travelManager shareWithParameters:nil target:self];
}

@end
