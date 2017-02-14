//
//  TravelDiaryTopView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelDiaryTopView.h"

@interface TravelDiaryTopView ()

@property (nonatomic, strong) UILabel *titleLb;//标题

@property (nonatomic, strong) UIButton *searchBtn;//搜索标

@property (nonatomic, strong) UIButton *editBtn;//编辑标



@end

@implementation TravelDiaryTopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLb];
        [self addSubview:self.searchBtn];
        [self addSubview:self.editBtn];
        
        self.titleLb.sd_layout
        .centerXEqualToView(self)
        .bottomSpaceToView(self, 10)
        .heightIs(12);
        [self.titleLb setSingleLineAutoResizeWithMaxWidth:CGRectGetWidth(self.frame)];
        
        self.searchBtn.sd_layout
        .heightRatioToView(self.titleLb, 1)
        .bottomEqualToView(self.titleLb)
        .rightSpaceToView(self, 10)
        .widthEqualToHeight();
        
        self.editBtn.sd_layout
        .rightSpaceToView(self.searchBtn, 5)
        .bottomEqualToView(self.titleLb)
        .heightRatioToView(self.searchBtn, 1)
        .widthEqualToHeight();
        
    }
    return self;
}


#pragma mark ----------------点击事件

- (void)onClickSearch{
    if (_searchBlock) {
        _searchBlock();
    }
}

- (void)onClickEdit{
    if (_editBlock) {
        _editBlock();
    }
}


#pragma mark ----------------实例化

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.text = @"游记";
        _titleLb.textColor = [UIColor blackColor];
        _titleLb.font = FONT(12);
    }
    return _titleLb;
}

- (UIButton *)searchBtn{
    if (_searchBtn == nil) {
        _searchBtn = [[UIButton alloc] init];
        _searchBtn.backgroundColor = [UIColor greenColor];
        [_searchBtn addTarget:self action:@selector(onClickSearch) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}

- (UIButton *)editBtn{
    if (_editBtn == nil) {
        _editBtn = [[UIButton alloc] init];
        _editBtn.backgroundColor = [UIColor redColor];
        [_editBtn addTarget:self action:@selector(onClickEdit) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBtn;
}

@end
