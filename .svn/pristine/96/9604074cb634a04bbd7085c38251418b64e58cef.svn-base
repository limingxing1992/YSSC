//
//  GuideViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()
<
    UIScrollViewDelegate
>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIButton *goToHomeBtn;

@property (nonatomic, strong) UIPageControl *pageControl;


@end

@implementation GuideViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    NSArray *nameAry = @[@"loading1", @"loading2", @"loading3"];
    for (NSInteger i = 0; i < nameAry.count; i++) {
        CGRect frame = CGRectMake(SCREEN_WIDTH *i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        UIImageView *iv = [[UIImageView alloc] initWithFrame:frame];
        iv.image = IMAGE(nameAry[i]);
        if (i == nameAry.count - 1) {
            iv.userInteractionEnabled = YES;
            [iv addSubview:self.goToHomeBtn];
        }
        
        [self.scrollView addSubview:iv];
    }
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *nameAry.count, SCREEN_HEIGHT);

    [self.view addSubview:self.pageControl];
    _pageControl.numberOfPages = nameAry.count;

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
//    _pageControl.sd_layout
//    .bottomSpaceToView(self.scrollView, 20)
//    .centerXEqualToView(self.scrollView)
//    .heightIs(20)
//    .widthRatioToView(self.scrollView, 1);
}


#pragma mark ----------------scrollViewDelegate

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (scrollView.contentOffset.x > SCREEN_WIDTH *2) {
//        [self gotoHomeAction];
//    }
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _pageControl.currentPage = scrollView.contentOffset.x / SCREEN_WIDTH;
}

#pragma mark ----------------点击事件

- (void)gotoHomeAction{
    if (self.block) {
        self.block();
    }
}


#pragma mark ----------------实例化

- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];

    }
    return _scrollView;
}

- (UIButton *)goToHomeBtn{
    if (_goToHomeBtn == nil) {
        _goToHomeBtn = [[UIButton alloc] initWithFrame:CGRectMake(25, SCREEN_HEIGHT * 0.692, SCREEN_WIDTH - 50, 40)];
        _goToHomeBtn.titleLabel.font = FONT(16);
        _goToHomeBtn.layer.cornerRadius = 5;
        _goToHomeBtn.alpha = 0.8;
        _goToHomeBtn.backgroundColor = MALLColor;
        [_goToHomeBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        [_goToHomeBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_goToHomeBtn addTarget:self action:@selector(gotoHomeAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goToHomeBtn;
}

- (UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 30, SCREEN_WIDTH, 20)];
        _pageControl.tintColor = MALLColor;
        _pageControl.currentPage = 0;
        _pageControl.backgroundColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = GRAYCOLOR;
        _pageControl.currentPageIndicatorTintColor = MALLColor;
    }
    return _pageControl;
}
@end
