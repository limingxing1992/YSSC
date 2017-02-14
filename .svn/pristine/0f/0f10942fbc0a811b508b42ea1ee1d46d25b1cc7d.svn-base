//
//  UserMessageDetailViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserMessageDetailViewController.h"
#import "UserMessageDetailObject.h"

@interface UserMessageDetailViewController () <UIWebViewDelegate>
/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**消息标题*/
@property (nonatomic, strong) UILabel *messageTitleLabel;
/**消息时间*/
@property (nonatomic, strong) UILabel *timeLabel;
/**分割线*/
@property (nonatomic, strong) UIView *lineView;
/**消息内容*/
@property (nonatomic, strong) UIWebView *messageWebView;


/**flag*/
@property (nonatomic, assign) BOOL flag;

@end

@implementation UserMessageDetailViewController

#pragma mark --------- 懒加载

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"消息"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navBar;
}

- (UILabel *)messageTitleLabel{
    if (_messageTitleLabel == nil) {
        _messageTitleLabel = [[UILabel alloc] init];
        _messageTitleLabel.font = FONT(16);
        _messageTitleLabel.textColor = SHENTEXTCOLOR;
    }
    return _messageTitleLabel;
}
- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = FONT(12);
        _timeLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _timeLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (UIWebView *)messageWebView{
    if (_messageWebView == nil) {
        _messageWebView = [[UIWebView alloc] init];
    }
    return _messageWebView;
}


#pragma mark --------- 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    [self setRead];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.flag) {
        [self requestPushMessage];
    }else{
        [self requestOrderMessage];
    }
}

- (instancetype)initWithPushMessage
{
    self = [super init];
    if (self) {
        self.flag = YES;
    }
    return self;
}

- (instancetype)initWithOrderMessage
{
    self = [super init];
    if (self) {
        self.flag = NO;
    }
    return self;
}

- (void)requestOrderMessage{

    [YSSCShareBusinessManager.userManager getOrderMessageDetailWithDictionary:@{@"mid":self.messageID} success:^(id object) {
        if (object) {
            UserMessageDetailObject *messageObject = object;
            if (messageObject.errorCode.integerValue == SeverStateSuccess) {
                
                [self setTitlel:messageObject.data.title content:messageObject.data.content time:messageObject.data.pushTime];
            }
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

- (void)requestPushMessage{
    [YSSCShareBusinessManager.userManager getPushMessageDetailWithDictionary:@{@"pushMsgId":self.messageID} success:^(id object) {
        if (object) {
            UserMessageDetailObject *messageObject = object;
            if (messageObject.errorCode.integerValue == SeverStateSuccess) {
                
                [self setTitlel:messageObject.data.title content:messageObject.data.content time:messageObject.data.pushTime];
            }
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

- (void)setRead{
    [YSSCShareBusinessManager.userManager readOrDeleteOrderMessage:@{@"msgIds":self.messageID
                                                                     ,@"status":@"1"} success:^(id object) {
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
      
    }];
}


- (void)setupUI{
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.messageTitleLabel];
    [self.view addSubview:self.timeLabel];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.messageWebView];
    
    self.messageTitleLabel.sd_layout
    .topSpaceToView(self.navBar, 15)
    .leftSpaceToView(self.view, 15)
    .autoHeightRatio(0);
    [self.messageTitleLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH - 30)];
    
    self.timeLabel.sd_layout
    .topSpaceToView(self.messageTitleLabel, 14)
    .leftSpaceToView(self.view, 15)
    .autoHeightRatio(0);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH - 30)];
    
    self.lineView.sd_layout
    .topSpaceToView(self.view, 64+75)
    .leftSpaceToView(self.view, 15)
    .rightSpaceToView(self.view, 0)
    .heightIs(0.5);
    
    self.messageWebView.sd_layout
    .topSpaceToView(self.lineView, 16)
    .leftSpaceToView(self.view, 15)
    .rightSpaceToView(self.view, 15)
    .bottomSpaceToView(self.view, 0);

}

- (void)setTitlel:(NSString *)title content:(NSString *)content time:(NSString *)time{
    self.messageTitleLabel.text = title;
    self.timeLabel.text = time;

    [self.messageWebView loadHTMLString:content baseURL:nil];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}

@end
