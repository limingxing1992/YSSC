//
//  MallBussTopView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussTopView.h"

@interface MallBussTopView ()
<
    UISearchBarDelegate
>
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIView *leftView;


@end

@implementation MallBussTopView

- (instancetype)initWithFrame:(CGRect)frame ret:(BOOL)ret{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WHITECOLOR;
        [self addSubview:self.searchBar];
        [self addSubview:self.peopleHomeBtn];
        [self addSubview:self.lineView];
        
        self.peopleHomeBtn.sd_layout
        .centerYIs(42)
        .rightSpaceToView(self, 0)
        .heightIs(20);
        [self.peopleHomeBtn setupAutoSizeWithHorizontalPadding:15 buttonHeight:20];

        
        self.searchBar.sd_layout
        .centerYIs(42)
        .leftSpaceToView(self, 15)
        .rightSpaceToView(self.peopleHomeBtn, 0)
        .heightIs(30);
        self.searchBar.layer.cornerRadius = 15;
        self.searchBar.clipsToBounds = YES;
        
        self.lineView.sd_layout
        .bottomSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .rightSpaceToView(self, 0)
        .heightIs(0.5);
        
        [self.peopleHomeBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.searchBar setPlaceholder:@"输入关键词"];
        
    }
    return self;

}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WHITECOLOR;
        [self addSubview:self.leftView];
        [self addSubview:self.searchBar];
        [self addSubview:self.peopleHomeBtn];
        
        self.leftView.sd_layout
        .centerYIs(42)
        .leftSpaceToView(self, 0)
        .widthIs(35)
        .heightIs(30);
        
        
        self.backBtn.sd_layout
        .centerYEqualToView(self.leftView)
        .leftSpaceToView(self.leftView, 10)
        .widthIs(10)
        .heightIs(18);
        
        
        
        self.peopleHomeBtn.sd_layout
        .centerYIs(42)
        .rightSpaceToView(self, 0)
        .heightIs(27);
        [self.peopleHomeBtn setupAutoSizeWithHorizontalPadding:10 buttonHeight:27];
        
        self.searchBar.sd_layout
        .centerYIs(42)
        .leftSpaceToView(self.backBtn, 0)
        .rightSpaceToView(self.peopleHomeBtn, 0)
        .heightIs(27);
        
    }
    return self;
}


#pragma mark ----------------点击事件

- (void)backAction{
    if (self.delegate) {
        [self.delegate backToLast];
    }
}

- (void)enterPeopleHomeAction{
    if (self.delegate) {
        [self.delegate enterPeopleHome];
    }
}


#pragma mark ----------------searchDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if (self.delegate) {
        [self.delegate searchWithText:searchBar.text];
        [searchBar resignFirstResponder];
    }
}


#pragma mark ----------------实例化

- (UIImageView *)backBtn{
    if (_backBtn == nil) {
        _backBtn = [[UIImageView alloc] init];
        _backBtn.image = IMAGE(@"classify15");
    }
    return _backBtn;
}

- (UISearchBar *)searchBar{
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.center = CGPointMake(42, SCREEN_WIDTH/ 2);
        _searchBar.placeholder = @"搜索店铺内宝贝";
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchBar.tintColor = MALLColor;
        _searchBar.delegate = self;
    }
    return _searchBar;
}

- (UIButton *)peopleHomeBtn{
    if (_peopleHomeBtn == nil) {
        _peopleHomeBtn = [[UIButton alloc] init];
        [_peopleHomeBtn setTitleColor:MALLColor forState:UIControlStateNormal];
        [_peopleHomeBtn setTitle:@"乡宿" forState:UIControlStateNormal];
        [_peopleHomeBtn addTarget:self action:@selector(enterPeopleHomeAction) forControlEvents:UIControlEventTouchUpInside];
        _peopleHomeBtn.titleLabel.font = FONT(17);
    }
    return _peopleHomeBtn;
}
- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (UIView *)leftView{
    if (_leftView == nil) {
        _leftView = [[UIView alloc] init];
        _leftView.backgroundColor = WHITECOLOR;
        [_leftView addSubview:self.backBtn];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction)];
        [_leftView addGestureRecognizer:tap];
    }
    return _leftView;
}
@end
