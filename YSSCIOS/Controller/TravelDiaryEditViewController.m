//
//  TravelDiaryEditViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelDiaryEditViewController.h"
#import "HX_AddPhotoView.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import "MBProgressHUD.h"

@interface TravelDiaryEditViewController ()
<
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate,
    UITextViewDelegate,
    HX_AddPhotoViewDelegate,
    UITextFieldDelegate
>
{
    HX_AddPhotoView *addPhotoView;
}
@property (nonatomic, strong) MallTopView *topView;//

@property (nonatomic, strong) UIView *titleView;//承载标题输入框

@property (nonatomic, strong) UILabel *titleLb;//编辑标题

@property (nonatomic, strong) UITextField *titleTf;//编辑标题

@property (nonatomic, strong) UIView *textView;//承载编辑框

@property (nonatomic, strong) UITextView *textTf;//编辑内容



@property (nonatomic, strong) UIButton *sendBtn;//发布按钮

@property (nonatomic, assign) BOOL isChanged;

@property (nonatomic, strong) UIButton *clearBtn;//清除内容输入

@property (nonatomic, strong) NSMutableArray *imageAry;


@end

@implementation TravelDiaryEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.sendBtn];
    
    [self createPhotoView];//创建图片选择器
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
    
    self.titleView.sd_layout
    .topSpaceToView(self.topView, 10)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(45);
    
    self.titleLb.sd_layout
    .centerYEqualToView(self.titleView)
    .leftSpaceToView(self.titleView, 15)
    .autoHeightRatio(0);
    [self.titleLb setSingleLineAutoResizeWithMaxWidth:300];
    
    self.titleTf.sd_layout
    .centerYEqualToView(self.titleView)
    .rightSpaceToView(self.titleView, 15)
    .leftSpaceToView(self.titleLb, 15)
    .heightIs(30);
    
    
    self.textView.sd_layout
    .topSpaceToView(self.titleView, 1)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(275);
    
    self.textTf.sd_layout
    .topSpaceToView(self.textView, 20)
    .leftSpaceToView(self.textView, 12)
    .rightSpaceToView(self.textView, 15)
    .bottomSpaceToView(self.textView, 20);
    
}

#pragma mark ----------------图片选择模块

- (void)createPhotoView{
    YSSCWeakObj(self);
    if (!_imageAry) {
        _imageAry = [NSMutableArray array];
    }
    addPhotoView = [[HX_AddPhotoView alloc] initWithMaxPhotoNum:4 WithSelectType:SelectPhoto];
    // 每行最大个数  不设置默认为4
    addPhotoView.lineNum = 4;
    
    // collectionView 距离顶部的距离  底部与顶部一样  不设置,默认为0
    addPhotoView.margin_Top = 12;
    
    // 距离左边的距离  右边与左边一样  不设置,默认为0
    addPhotoView.margin_Left = 15;
    
    // 每个item间隔的距离  如果最小不能小于5   不设置,默认为5
    addPhotoView.lineSpacing = 10;
    
    // 录制视频时最大多少秒   默认为60;
    addPhotoView.videoMaximumDuration = 60.f;
    
    addPhotoView.delegate = self;
    addPhotoView.backgroundColor = [UIColor whiteColor];
    addPhotoView.frame = CGRectMake(0, 404, SCREEN_WIDTH, 93);
    [self.view addSubview:addPhotoView];
    
//    addPhotoView.selectNum;
    
    [addPhotoView setSelectPhotos:^(NSArray *photos, BOOL iforiginal) {
//        NSLog(@"photo - %@",photos);
        [weakself.imageAry removeAllObjects];
        
        [photos enumerateObjectsUsingBlock:^(ALAsset *asset, NSUInteger idx, BOOL * _Nonnull stop) {
            UIImage *img;
            
            if (iforiginal) {
                //原图
                CGImageRef fullImage = [[asset defaultRepresentation] fullResolutionImage];
                img = [UIImage imageWithCGImage:fullImage];
            }else{
                img = [UIImage imageWithCGImage:[asset aspectRatioThumbnail]];
            }
            [weakself.imageAry addObject:img];
            // 缩略图
            //            UIImage *image = [UIImage imageWithCGImage:[asset aspectRatioThumbnail]];
            
            // 原图
            //            CGImageRef fullImage = [[asset defaultRepresentation] fullResolutionImage];
            
            // url
            //            NSURL *url = [[asset defaultRepresentation] url];
            
        }];
    }];

}


#pragma mark ----------------点击事件

//发布动作
- (void)travelEditInfoSendAction{
    [self.view endEditing:YES];
    
    if (!_titleTf.text.length || !_isChanged || !_textTf.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入标题或内容"];
        return;
    }
    if (!_imageAry.count) {
        [SVProgressHUD showErrorWithStatus:@"请至少上传一张图片"];
        return;
    }
    
    
    [SVProgressHUD showWithStatus:@"正在上传"];
    YSSCWeakObj(self);
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if ([_titleTf.text isEqualToString:@"游记标题"]) {
        [SVProgressHUD showErrorWithStatus:@"请输入内容或标题"];
        return;
    }else{
        [dict setValue:@0 forKey:@"type"];
        [dict setValue:_titleTf.text forKey:@"title"];
        [dict setValue:_textTf.text forKey:@"publishingText"];
    }
    
    [YSSCShareBusinessManager.travelManager upLoadImageWith:_imageAry parameters:dict urlString:@"app/record/publish.do" success:^(id responObject) {
        [SVProgressHUD showSuccessWithStatus:@"上传成功"];
        [YSSCNotificationCenter postNotificationName:@"updateTravelList" object:nil];
        [weakself.navigationController popViewControllerAnimated:YES];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:errorMsg];
    }];


}

- (void)clearTextTf{
    _isChanged = YES;
    _textTf.text = @"";

}

#pragma mark ----------------文本输入代理

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (!_isChanged) {
        textView.text = @"";
        _isChanged = YES;
    }
    [_textView addSubview:self.clearBtn];
    self.clearBtn.sd_layout
    .bottomSpaceToView(self.textView, 15)
    .rightSpaceToView(self.textView, 15)
    .heightIs(15)
    .widthIs(15);


}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [_clearBtn removeFromSuperview];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [_textTf becomeFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    
    
    if ([[[UITextInputMode currentInputMode] primaryLanguage]isEqualToString:@"emoji"]) {
        [SVProgressHUD showErrorWithStatus:@"暂不支持表情符号，请重新输入"];
        return NO;
    }

    return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([[[UITextInputMode currentInputMode] primaryLanguage]isEqualToString:@"emoji"]) {
        [SVProgressHUD showErrorWithStatus:@"暂不支持表情符号，请重新输入"];
        return NO;
        
    }
    
    return YES;
}
#pragma mark ----------------退回首页

- (void)backToRootTravel{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissKeyBoard{
    [self.textTf resignFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"写游记" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc] init];
        _titleView.backgroundColor = WHITECOLOR;
        [_titleView addSubview:self.titleLb];
        [_titleView addSubview:self.titleTf];
    }
    return _titleView;
}

- (UITextField *)titleTf{
    if (_titleTf == nil) {
        _titleTf = [[UITextField alloc] init];
        _titleTf.clearButtonMode = UITextFieldViewModeWhileEditing;
        _titleTf.font = FONT(14);
        _titleTf.textColor = BLACKTEXTCOLOR;
        _titleTf.delegate = self;
        _titleTf.returnKeyType = UIReturnKeyNext;
    
    }
    return _titleTf;



}

- (UIView *)textView{
    if (_textView == nil) {
        _textView = [[UIView alloc] init];
        _textView.backgroundColor = WHITECOLOR;
        [_textView addSubview:self.textTf];
    }
    return _textView;

}

- (UITextView *)textTf{
    if (_textTf == nil) {
        _textTf = [[UITextView alloc] init];
        _textTf.font = FONT(14);
        _textTf.text = @"记录感动你的一刻";
        _textTf.textColor = LIGHTTEXTCOLOR;
        _textTf.delegate = self;
        UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 40)];
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
        NSArray * buttonsArray = [NSArray arrayWithObjects:flexSpace,doneButton,nil];
        [topView setItems:buttonsArray];
        [_textTf setInputAccessoryView:topView];
    }
    return _textTf;
}

- (UIButton *)sendBtn{
    if (_sendBtn == nil) {
        _sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 45, SCREEN_WIDTH, 45)];
        _sendBtn.backgroundColor = MALLColor;
        [_sendBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_sendBtn setTitle:@"发布" forState:UIControlStateNormal];
        _sendBtn.titleLabel.font = FONT(14);
        [_sendBtn addTarget:self action:@selector(travelEditInfoSendAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendBtn;

}

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(14);
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.text = @"游记标题";
    }
    return _titleLb;
}

- (UIButton *)clearBtn{
    if (_clearBtn == nil) {
        _clearBtn = [[UIButton alloc] init];
        [_clearBtn setBackgroundImage:IMAGE(@"classify18") forState:UIControlStateNormal];
        [_clearBtn addTarget:self action:@selector(clearTextTf) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearBtn;
}
@end
