//
//  TravelDetailViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelDetailViewController.h"

@interface TravelDetailViewController ()
<
    UITextFieldDelegate,
    SDCycleScrollViewDelegate
>

@property (nonatomic, strong) MallTopView *topView;
@property (nonatomic, strong) UIView *shareView;
@property (nonatomic, strong) UIView *favoriteView;
@property (nonatomic, strong) UIView *recomnView;
@property (nonatomic, strong) UIView *reportView;//举报



@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *favoriteBtn;
@property (nonatomic, strong) UIButton *recomndBtn;
//@property (nonatomic, strong) UIButton *reportBtn;//举报



@property (nonatomic, strong) TravelCommentView *commentView;//评论组件

@property (nonatomic, strong) UIScrollView *contentView;//内容

@property (nonatomic, strong) UILabel *recomnLb;//点赞数量


@property (nonatomic, strong) UILabel *titleLb;//游记标题

@property (nonatomic, strong) UIImageView *editorIv;//作者头像

@property (nonatomic, strong) UILabel *editorNameLb;//作者名字

@property (nonatomic, strong) UILabel *editTimeLb;//发表时间

@property (nonatomic, strong) SDCycleScrollView *bannerScr;//banner轮播图

@property (nonatomic, strong) UILabel *textView;//内容


@property (nonatomic, strong) UIScrollView *bigScroll;//查看图片点击放大


@end

@implementation TravelDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.commentView];
    [self.view addSubview:self.contentView];
    
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.editorIv];
    [self.contentView addSubview:self.editorNameLb];
    [self.contentView addSubview:self.editTimeLb];
    [self.contentView addSubview:self.bannerScr];
    [self.contentView addSubview:self.textView];
    
    [YSSCNotificationCenter addObserver:self selector:@selector(keyBoardShowAction:) name:UIKeyboardWillShowNotification object:nil];
    [YSSCNotificationCenter addObserver:self selector:@selector(keyBoardHideAction:) name:UIKeyboardWillHideNotification object:nil];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    self.topView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(64);

    self.shareView.sd_layout
    .centerYIs(42)
    .rightSpaceToView(self.topView, 0)
    .heightIs(40)
    .widthEqualToHeight();
    
    self.shareBtn.sd_layout
    .centerYEqualToView(self.shareView)
    .centerXEqualToView(self.shareView)
    .widthIs(20.5)
    .heightIs(4.5);
    
    
    self.favoriteView.sd_layout
    .centerYEqualToView(self.shareView)
    .rightSpaceToView(self.shareView, 0)
    .widthIs(40)
    .heightEqualToWidth();
    
    self.favoriteBtn.sd_layout
    .centerYEqualToView(self.favoriteView)
    .centerXEqualToView(self.favoriteView)
    .heightIs(18)
    .widthIs(20);

    
    self.recomnView.sd_layout
    .centerYIs(42)
    .rightSpaceToView(self.favoriteView, 0)
    .heightIs(40)
    .widthEqualToHeight();
    
    self.recomndBtn.sd_layout
    .centerYEqualToView(self.recomnView)
    .centerXEqualToView(self.recomnView)
    .heightIs(18)
    .widthEqualToHeight();

    self.recomnLb.sd_layout
    .topEqualToView(self.recomndBtn)
    .leftSpaceToView(self.recomndBtn, 1)
    .autoHeightRatio(0);
    [self.recomnLb setSingleLineAutoResizeWithMaxWidth:300];
    
//    self.reportView.sd_layout
//    .centerYIs(42)
//    .rightSpaceToView(self.recomnView, 0)
//    .heightIs(40)
//    .widthEqualToHeight();
    
//    self.reportBtn.sd_layout
//    .centerYEqualToView(self.reportView)
//    .centerXEqualToView(self.reportView)
//    .heightIs(20)
//    .widthEqualToHeight();
    
    
    
    self.contentView.sd_layout
    .topSpaceToView(self.topView, 0)
    .bottomSpaceToView(self.commentView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0);
    
    self.titleLb.sd_layout
    .topSpaceToView(self.contentView, 14)
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.titleLb setMaxNumberOfLinesToShow:1];
    
    self.editorIv.sd_layout
    .topSpaceToView(self.titleLb, 10)
    .leftEqualToView(self.titleLb)
    .heightIs(16)
    .widthEqualToHeight();
    [self.editorIv setSd_cornerRadiusFromHeightRatio:@0.5];
    
    self.editorNameLb.sd_layout
    .centerYEqualToView(self.editorIv)
    .leftSpaceToView(self.editorIv, 6)
    .autoHeightRatio(0);
    [self.editorNameLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.editTimeLb.sd_layout
    .bottomEqualToView(self.editorIv)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [self.editTimeLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.bannerScr.sd_layout
    .topSpaceToView(self.editorIv, 14)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(200);
    
    self.textView.isAttributedContent = YES;
    self.textView.sd_layout
    .topSpaceToView(self.bannerScr, 15)
    .leftEqualToView(self.titleLb)
    .rightEqualToView(self.editTimeLb)
    .autoHeightRatio(0);
    
    [self.contentView setupAutoContentSizeWithBottomView:_textView bottomMargin:15];




}

- (void)dealloc{
    [YSSCNotificationCenter removeObserver:self];
}

#pragma mark ----------------点击事件
//点赞
- (void)travelDetailReconmendAction{
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return;
    }
    
    
    NSInteger flag = _recomnLb.text.integerValue;
    
    if (_recomndBtn.isSelected) {
        _recomndBtn.selected = NO;
        //取消点赞
        flag -= 1;
        _recomnLb.textColor = BLACKTEXTCOLOR;
    }else{
        _recomndBtn.selected = YES;
        //选中点赞
        flag += 1;
        _recomnLb.textColor = MALLColor;
    }
    
    _recomnLb.text = [NSString stringWithFormat:@"%ld", flag];

    [SVProgressHUD showWithStatus:@"发送中"];
    [YSSCShareBusinessManager.travelManager getPraizeTravelWithParameters:@{@"id":_model.ID} success:^(id responObject) {
        [SVProgressHUD showSuccessWithStatus:responObject];
        [YSSCNotificationCenter postNotificationName:@"updateTravelList" object:nil];//点赞完成完成需要刷新游记列表
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:errorMsg];
    }];

}
//收藏
- (void)travelDetailFavoriteAction{
    
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return;
    }

    
    if (_favoriteBtn.isSelected) {
        _favoriteBtn.selected = NO;
        //取消收藏
//        NSLog(@"取消收藏");

    }else{
        _favoriteBtn.selected = YES;
        //选中手残
//        NSLog(@"收藏");
    }
    [SVProgressHUD showWithStatus:@"发送中"];
    [YSSCShareBusinessManager.travelManager getFavoriteTravelWithParameters:@{@"linkId":_model.ID,
                                                                              @"collectType":@70}
                                                                    success:^(id responObject) {
                                                                        [SVProgressHUD showSuccessWithStatus:responObject];
                                                                        [YSSCNotificationCenter postNotificationName:@"updateTravelList" object:nil];//收藏完成需要刷新游记列表
                                                                    }
                                                                    failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                        [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                    }];

}
//分享
- (void)travelDetailShareAction{
    YSSCWeakObj(self);

    UIAlertController *aler = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionCancel  =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [aler addAction:actionCancel];
    NSArray *ary= @[@"分享", @"举报", @"删除"];
    UIAlertAction *action_0 = [UIAlertAction actionWithTitle:ary[0] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [YSSCShareBusinessManager.travelManager shareWithParameters:nil target:self];
    }];
    
    UIAlertAction *action_1 = [UIAlertAction actionWithTitle:ary[1] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self reportAction];
    }];
    [aler addAction:action_0];
    [aler addAction:action_1];

    //判断用户标志
    if (_isUser || _model.selfFlag) {
        UIAlertAction *action_2 = [UIAlertAction actionWithTitle:ary[2] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [YSSCShareBusinessManager.travelManager deleteTravelWithParameters:@{@"id":_model.ID} success:^(id responObject) {
                [SVProgressHUD showSuccessWithStatus:responObject];
                [YSSCNotificationCenter postNotificationName:@"updateTravelList" object:nil];
            } failure:^(NSInteger errCode, NSString *errorMsg) {
                [SVProgressHUD showErrorWithStatus:errorMsg];
            }];
            
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakself.navigationController popViewControllerAnimated:YES];

            });
        }];
        
        [aler addAction:action_2];
    }
    
    
    
    [weakself presentViewController:aler animated:YES completion:nil];

}
//发送评价
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (![YSSCShareBusinessManager.loginManger isLogin]) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return NO;
    }
    YSSCWeakObj(self);
    if (textField.text.length) {
        //        NSLog(@"发送游记");
        [SVProgressHUD showWithStatus:@"发送中"];
        [YSSCShareBusinessManager.travelManager getJugeTravelWithParameters:@{@"id":_model.ID, @"content":textField.text} success:^(id responObject) {
            [SVProgressHUD showSuccessWithStatus:responObject];
            weakself.model.commentCount = [NSString stringWithFormat:@"%ld", weakself.model.commentCount.integerValue + 1];
            weakself.commentView.commentLb.text =  [NSString stringWithFormat:@"(%@)",_model.commentCount];
            [YSSCNotificationCenter postNotificationName:@"updateTravelList" object:nil];//评价完成需要刷新游记列表
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            [SVProgressHUD showErrorWithStatus:errorMsg];
        }];
        
        [_commentView.commentTf resignFirstResponder];
        _commentView.commentTf.text = @"";
        
        return YES;
    }else{
        [SVProgressHUD showErrorWithStatus:@"请输入有效内容"];
        return NO;
    }
}

- (void)reportAction{
    //举报
    YSSCWeakObj(self);
    UIAlertController *aler = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actionCancel  =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [aler addAction:actionCancel];
    NSArray *ary= @[@"政治违规", @"不健康图文", @"广告", @"其它"];
    for (NSInteger i = 0; i < ary.count; i ++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:ary[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [YSSCShareBusinessManager.travelManager reportTravelDiaryWithParameters:@{@"id":weakself.model.ID, @"type":[NSNumber numberWithInteger:i + 1]}
                                                                            success:^(id responObject) {
                                                                                [SVProgressHUD showSuccessWithStatus:responObject];

                                                                               [aler dismissViewControllerAnimated:YES completion:^{
                                                                               }];
                                                                            }
                                                                            failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                                [SVProgressHUD showErrorWithStatus:errorMsg];

                                                                                [aler dismissViewControllerAnimated:YES completion:^{
                                                                                }];
                                                                            }];
        }];
        [aler addAction:action];
    }
    [weakself presentViewController:aler animated:YES completion:nil];
}



#pragma mark ----------------banner代理

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [self.view addSubview:self.bigScroll];
    NSArray *ary = [_model.imgs componentsSeparatedByString:@","];
    self.bigScroll.contentSize = CGSizeMake(SCREEN_WIDTH *ary.count, SCREEN_HEIGHT);
    
    for (NSInteger i = 0; i < ary.count; i++) {
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH *i, 100, SCREEN_WIDTH, SCREEN_HEIGHT - 200)];
        [iv sd_setImageWithURL:[NSURL URLWithString:ary[i]] placeholderImage:PlaceholderImage];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        [self.bigScroll addSubview:iv];
    }
    
    [_bigScroll setContentOffset:CGPointMake(SCREEN_WIDTH *index, 0)];
}


- (void)touchScrollBack{
    [self.bigScroll removeFromSuperview];
}


#pragma mark ----------------监听输入框弹出和隐藏

- (void)keyBoardShowAction:(NSNotification *)fication{
    NSDictionary *info = [fication userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    YSSCWeakObj(self);
    [UIView animateWithDuration:0.15 animations:^{
        weakself.commentView.transform = CGAffineTransformMakeTranslation(0, -keyboardSize.height);
    }];

}

- (void)keyBoardHideAction:(NSNotification *)fication{
    YSSCWeakObj(self);

    [UIView animateWithDuration:0.15 animations:^{
        weakself.commentView.transform = CGAffineTransformIdentity;
    }];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [_commentView.commentTf resignFirstResponder];
    _commentView.commentTf.text = @"";
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([[[UITextInputMode currentInputMode] primaryLanguage]isEqualToString:@"emoji"]) {
        [SVProgressHUD showErrorWithStatus:@"暂不支持表情符号，请重新输入"];
        return NO;
        
    }
    
    return YES;
}

#pragma mark ----------------富文本转化

- (NSMutableAttributedString *)replaceChangeStr:(NSString *)string{
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:10];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:FONT(14), NSForegroundColorAttributeName:BLACKTEXTCOLOR, NSParagraphStyleAttributeName:style}];
    
    return str;

}

#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        [_topView setTitleText:nil imageArrays:nil selecterArys:nil target:self isShowLeftBtn:YES];
//        [_topView addSubview:self.recomnLb];
        [_topView addSubview:self.shareView];
        [_topView addSubview:self.favoriteView];
        [_topView addSubview:self.recomnView];
//        [_topView addSubview:self.reportView];
        }
    return _topView;
}

- (UIView *)shareView{
    if (_shareView == nil) {
        _shareView = [[UIView alloc] init];
        _shareView.backgroundColor = WHITECOLOR;
        [_shareView addSubview:self.shareBtn];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(travelDetailShareAction)];
        [_shareView addGestureRecognizer:tap];
    }
    return _shareView;
}

- (UIButton *)shareBtn{
    if (_shareBtn == nil) {
        _shareBtn = [[UIButton alloc] init];
        [_shareBtn setBackgroundImage:IMAGE(@"classify190") forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(travelDetailShareAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}

- (UIView *)favoriteView{
    if (_favoriteView == nil) {
        _favoriteView = [[UIView alloc] init];
        [_favoriteView addSubview:self.favoriteBtn];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(travelDetailFavoriteAction)];
        [_favoriteView addGestureRecognizer:tap];
    }
    return _favoriteView;
}

- (UIButton *)favoriteBtn{
    if (_favoriteBtn == nil) {
        _favoriteBtn = [[UIButton alloc] init];
        [_favoriteBtn setBackgroundImage:IMAGE(@"classify94") forState:UIControlStateNormal];
        [_favoriteBtn setBackgroundImage:IMAGE(@"classify63") forState:UIControlStateSelected];
        [_favoriteBtn addTarget:self action:@selector(travelDetailFavoriteAction) forControlEvents:UIControlEventTouchUpInside];
        _favoriteBtn.selected = _model.collectFlag;
    }
    return _favoriteBtn;
}

- (UIView *)recomnView{
    if (_recomnView == nil) {
        _recomnView = [[UIView alloc] init];
        _recomnView.backgroundColor = WHITECOLOR;
    
        [_recomnView addSubview:self.recomndBtn];
        [_recomnView addSubview:self.recomnLb];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(travelDetailReconmendAction)];
        [_recomnView addGestureRecognizer:tap];

    }
    return _recomnView;
}

- (UIButton *)recomndBtn{
    if (_recomndBtn == nil) {
        _recomndBtn = [[UIButton alloc] init];
        [_recomndBtn setBackgroundImage:IMAGE(@"classify93") forState:UIControlStateNormal];
        [_recomndBtn setBackgroundImage:IMAGE(@"classify89") forState:UIControlStateSelected];
        [_recomndBtn addTarget:self action:@selector(travelDetailReconmendAction) forControlEvents:UIControlEventTouchUpInside];
        _recomndBtn.selected = _model.praizeFlag;
    }
    return _recomndBtn;
}

//- (UIView *)reportView{
//    if (_reportView == nil) {
//        _reportView = [[UIView alloc] init];
//        _reportView.backgroundColor = WHITECOLOR;
//        [_reportView addSubview:self.reportBtn];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reportAction)];
//        [_reportView addGestureRecognizer:tap];
//    }
//    return _reportView;
//}

//- (UIButton *)reportBtn{
//    if (_reportBtn == nil) {
//        _reportBtn = [[UIButton alloc] init];
//        [_reportBtn setBackgroundImage:IMAGE(@"report") forState:UIControlStateNormal];
//        [_reportBtn addTarget:self action:@selector(reportAction) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _reportBtn;
//}

- (TravelCommentView *)commentView{
    if (_commentView == nil) {
        _commentView = [[TravelCommentView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
        _commentView.backgroundColor = WHITECOLOR;
        YSSCWeakObj(self);
        _commentView.block = ^(){
            TravelJugeViewController *jugeVc = [[TravelJugeViewController alloc] init];
            jugeVc.Id = weakself.model.ID;
            jugeVc.totalJugeCount = weakself.model.commentCount.integerValue;
            [weakself.navigationController pushViewController:jugeVc animated:YES];
        };
        
        _commentView.commentLb.text = [NSString stringWithFormat:@"(%@)",_model.commentCount];
        _commentView.commentTf.delegate  = self;
    }
    return _commentView;


}

- (UIScrollView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIScrollView alloc] init];
        _contentView.backgroundColor = WHITECOLOR;
    }
    return _contentView;
}

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(16);
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.text = _model.title;
    }
    return _titleLb;
}

- (UIImageView *)editorIv{
    if (_editorIv == nil) {
        _editorIv = [[UIImageView alloc] init];
        _editorIv.layer.borderColor = GRAYCOLOR.CGColor;
        _editorIv.layer.borderWidth = 0.5;
        [_editorIv sd_setImageWithURL:[NSURL URLWithString:_model.head_url] placeholderImage:PlaceholderHeadImage];
    }
    return _editorIv;

}

- (UILabel *)editorNameLb{
    if (_editorNameLb == nil) {
        _editorNameLb = [[UILabel alloc] init];
        _editorNameLb.font = FONT(12);
        _editorNameLb.textColor = MALLColor;
        _editorNameLb.text = _model.name;
    }
    return _editorNameLb;
}

- (UILabel *)editTimeLb{
    if (_editTimeLb == nil) {
        _editTimeLb = [[UILabel alloc] init];
        _editTimeLb.font = FONT(12);
        _editTimeLb.textColor = LIGHTTEXTCOLOR;
        _editTimeLb.text = _model.add_time;
    }
    return _editTimeLb;
}

- (SDCycleScrollView *)bannerScr{
    if (_bannerScr == nil) {
        _bannerScr = [[SDCycleScrollView alloc] init];
        _bannerScr.layer.borderWidth= 0.5;
        _bannerScr.backgroundColor = [UIColor redColor];
        _bannerScr.layer.borderColor= GRAYCOLOR.CGColor;
        _bannerScr.placeholderImage = PlaceholderImage;
        _bannerScr.delegate = self;
        _bannerScr.autoScroll = NO;
        NSArray *picAry = [_model.imgs componentsSeparatedByString:@","];
        if (picAry.count) {
            _bannerScr.imageURLStringsGroup = picAry;
        }
    }
    return _bannerScr;


}

- (UILabel *)textView{
    if (_textView == nil) {
        _textView = [[UILabel alloc] init];
        _textView.font = FONT(14);
        _textView.textColor = BLACKTEXTCOLOR;
        _textView.numberOfLines = 0;
        if (_model.content) {
            _textView.attributedText = [self replaceChangeStr:_model.content];
        }
    }
    return _textView;

}

- (UILabel *)recomnLb{
    if (_recomnLb == nil) {
        _recomnLb = [[UILabel alloc] init];
        _recomnLb.font = FONT(8);
        _recomnLb.textColor = BLACKTEXTCOLOR;
        _recomnLb.text = _model.praizeCount;
        if (_model.praizeFlag) {
            _recomnLb.textColor  = MALLColor;
        }else{
            _recomnLb.textColor = BLACKTEXTCOLOR;
        }
    }
    return _recomnLb;
}

- (UIScrollView *)bigScroll{
    if (_bigScroll == nil) {
        _bigScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bigScroll.showsVerticalScrollIndicator = NO;
        _bigScroll.showsHorizontalScrollIndicator = NO;
        _bigScroll.backgroundColor = [UIColor blackColor];
        _bigScroll.pagingEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchScrollBack)];
        [_bigScroll addGestureRecognizer:tap];
    }
    return _bigScroll;
}

@end
