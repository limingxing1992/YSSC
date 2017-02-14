//
//  HotelImpressCell.m
//  YSSCIOS
//
//  Created by Rock on 16/8/20.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelImpressCell.h"
#import "HotelDetailObject.h"

@interface HotelImpressCell ()<UIWebViewDelegate>

/**乡宿印象*/
@property (nonatomic, strong) UILabel *impressLabel;
/**分隔线*/
@property (nonatomic, strong) UIView *lineView;
/**内容*/
@property (nonatomic, strong) UILabel *describeLabel;
/**image*/
@property (nonatomic, strong) UIImageView *bigImgView;
/**webView*/
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation HotelImpressCell

#pragma mark ------- 懒加载

- (UILabel *)impressLabel{
    if (_impressLabel == nil) {
        _impressLabel = [[UILabel alloc] init];
        _impressLabel.font = FONT(14);
        _impressLabel.textColor = SHENTEXTCOLOR;
        _impressLabel.text = @"乡宿印象";
    }
    return _impressLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
        
    }
    return _lineView;
}

- (UILabel *)describeLabel{
    if (_describeLabel == nil) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.font = FONT(14);
        _describeLabel.textColor = LIGHTTEXTCOLOR;
        
    }
    return _describeLabel;
}

- (UIImageView *)bigImgView{
    if (_bigImgView == nil) {
        _bigImgView = [[UIImageView alloc] init];
        
    }
    return _bigImgView;
}

- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] init];
        _webView.backgroundColor = [UIColor orangeColor];
        _webView.delegate = self;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.scrollView.scrollEnabled = NO;
        [_webView sizeToFit];
    }
    return _webView;
}

- (void)setModel:(HotelDetailDataObject *)model{
    _model = model;
    self.describeLabel.text = model.impress;

    NSString * htmlcontent = [NSString stringWithFormat:@"<div id=\"webview_content_wrapper\">%@</div>", self.model.impress];
    [self.webView loadHTMLString:htmlcontent baseURL:nil];
   

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    self.backgroundColor = GRAYCOLOR;
    [self.contentView addSubview:self.impressLabel];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.webView];
    
    self.impressLabel.frame = CGRectMake(15, 15, 300, 15);
    self.lineView.frame = CGRectMake(0, 45, SCREEN_WIDTH, 0.5);
    
    self.webView.sd_layout
    .topSpaceToView(self.lineView, 5)
    .leftEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .rightEqualToView(self.contentView);

}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{

//    //获取页面高度（像素）
//    NSString * clientheight_str = [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
//    float clientheight = [clientheight_str floatValue];
//    //设置到WebView上
//    webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, clientheight);
//    //获取WebView最佳尺寸（点）
//    CGSize frame = [webView sizeThatFits:webView.frame.size];
//    //获取内容实际高度（像素）
//    NSString * height_str= [webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('webview_content_wrapper').offsetHeight + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-top'))  + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-bottom'))"];
//    float height = [height_str floatValue];
//    //内容实际高度（像素）* 点和像素的比
//    height = height * frame.height / clientheight;
//    //再次设置WebView高度（点）
//    NSLog(@"--------%f",height);
//    webView.frame = CGRectMake(0, 45, SCREEN_WIDTH, height);
    
    
}

#pragma mark --------- cell增加分割线

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 10;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}



@end
