//
//  LookForPassWordViewController.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "LookForPassWordViewController.h"

@interface LookForPassWordViewController ()

@property (nonatomic, strong) UILabel *messageLb;
@property (nonatomic, strong) UITextField *testWordTf;
@property (nonatomic, strong) UIButton *testWordBtn;
@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation LookForPassWordViewController

#pragma mark ---------生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.messageLb];
    [self.view addSubview:self.testWordTf];
    [self.view addSubview:self.testWordBtn];
    [self.view addSubview:self.nextBtn];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"找回密码";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark ---------重新获取----下一步

- (void)getTestWordAction{
    
}

- (void)nextStepAction{
    ReplaceTestWordViewController *replaceTestVc = [[ReplaceTestWordViewController alloc] init];
    [self.navigationController pushViewController:replaceTestVc animated:YES];
}


#pragma mark ---------实例化

- (UILabel *)messageLb{
    if (_messageLb == nil) {
        _messageLb = [[UILabel alloc] init];
        _messageLb.frame  = CGRectMake(50, 100, CGRectGetWidth(self.view.frame) - 100, 20);
        _messageLb.textColor = [UIColor blackColor];
        _messageLb.text = @"验证码已发送到158****8788的手机上";
        _messageLb.font = FONT(15);
    }
    return _messageLb;
}

- (UITextField *)testWordTf{
    if (_testWordTf == nil) {
        _testWordTf = [[UITextField alloc] init];
        _testWordTf.frame = CGRectMake(50, 150, 200, 30);
        _testWordTf.borderStyle = UITextBorderStyleLine;
        _testWordTf.layer.borderColor = [UIColor grayColor].CGColor;
    }
    return _testWordTf;
}

- (UIButton *)testWordBtn{
    if (_testWordBtn == nil) {
        _testWordBtn = [[UIButton alloc] initWithFrame:CGRectMake(260, 150, 100, 30)];
        _testWordBtn.backgroundColor = [UIColor blueColor];
        [_testWordBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        [_testWordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_testWordBtn addTarget:self action:@selector(getTestWordAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testWordBtn;
}

- (UIButton *)nextBtn{
    if (_nextBtn == nil) {
        _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, CGRectGetWidth(self.view.frame) - 100, 30)];
        _nextBtn.layer.borderWidth = 1;
        _nextBtn.layer.cornerRadius = 10;
        _nextBtn.layer.borderColor = [UIColor blackColor].CGColor;
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

@end
