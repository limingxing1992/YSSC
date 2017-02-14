//
//  HotelCheckMessageCell.m
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelCheckMessageCell.h"

@interface HotelCheckMessageCell ()<UIWebViewDelegate >

/**入住须知*/
@property (nonatomic, strong) UILabel *messageTitle;
/**须知内容*/
@property (nonatomic, strong) UILabel *notice;
/**分隔线*/
@property (nonatomic, strong) UIView *lineView;

/**webView*/
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation HotelCheckMessageCell

- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        _webView.scrollView.scrollEnabled = NO;
        
    }
    return _webView;
}

- (UILabel *)messageTitle{
    if (_messageTitle == nil) {
        _messageTitle = [[UILabel alloc] init];
        _messageTitle.font = FONT(14);
        _messageTitle.textColor = SHENTEXTCOLOR;
        _messageTitle.text = @"入住须知";
    }
    return _messageTitle;
}

- (UILabel *)notice{
    if (_notice == nil) {
        _notice = [[UILabel alloc] init];
        _notice.textColor = LIGHTTEXTCOLOR;
        _notice.font = FONT(12);
        
    }
    return _notice;
}


- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
        
    }
    return _lineView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.messageTitle];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.webView];
        self.backgroundColor = [UIColor whiteColor];
        
        self.messageTitle.frame = CGRectMake(15, 15, 300, 15);
        self.lineView.frame = CGRectMake(0, 45, SCREEN_WIDTH, 0.5);
        
        self.webView.sd_layout
        .topSpaceToView(self.lineView, 5)
        .leftEqualToView(self.contentView)
        .bottomEqualToView(self.contentView)
        .rightEqualToView(self.contentView);
        
        self.webView.opaque = NO;
        self.webView.backgroundColor = [UIColor clearColor];
        
//        [self setupAutoHeightWithBottomView:self.notice bottomMargin:15];
        
    }
    return self;
}

- (void)setcontent:(NSString *)string{

    [self.webView loadHTMLString:string baseURL:nil];

}

- (void)webViewDidFinishLoad:(UIWebView *)wb
{

//    wb.scrollView.scrollEnabled = NO;
//    CGFloat height = [[self.webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
//    NSLog(@"height :%f",height);
//    wb.frame = CGRectMake(self.webView.frame.origin.x, 49, SCREEN_WIDTH, height + 20);
    
    
//    CGRect frame = wb.frame;
//    frame.size.width = SCREEN_WIDTH;
//    frame.size.height = 1;
//    
//    //    wb.scrollView.scrollEnabled = NO;
//    wb.frame = frame;
//    
//    frame.size.height = wb.scrollView.contentSize.height;
//    frame.origin.y = 49;
//    wb.frame = frame;
    
}


@end
