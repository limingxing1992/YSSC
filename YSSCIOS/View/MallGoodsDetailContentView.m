//
//  MallGoodsDetailContentView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallGoodsDetailContentView.h"

@interface MallGoodsDetailContentView ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UILabel *nameLb;//商品名称

@property (nonatomic, strong) UILabel *priceLb;//商品单价

@property (nonatomic, strong) UIView *firstSingleLineView;//第一条切割线

@property (nonatomic, strong) UILabel *parameterLb;//商品参数

@property (nonatomic, strong) UIButton *selectParameBtn;//选择参数按钮

@property (nonatomic, strong) UIView *secondSingleLineView;//第二条切割线

@property (nonatomic, strong) UILabel *rankLb;//商品选择规格

@property (nonatomic, strong) UIButton *selectRankBtn;//选择规格按钮

@property (nonatomic, strong) UIView *thirdSingleLineView;//第三条切割线

@property (nonatomic, strong) UITableView *jugeTableView;//评论列表

@property (nonatomic, strong) NSMutableArray *jugeData;//评论数据


@end


static NSString *const jugeCell = @"cell";

@implementation MallGoodsDetailContentView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.nameLb];
        [self addSubview:self.priceLb];
        [self addSubview:self.firstSingleLineView];
        [self addSubview:self.parameterLb];
        [self addSubview:self.selectParameBtn];
        [self addSubview:self.secondSingleLineView];
        [self addSubview:self.rankLb];
        [self addSubview:self.selectRankBtn];
        [self addSubview:self.thirdSingleLineView];
        [self addSubview:self.jugeTableView];
        
        self.jugeData = [NSMutableArray array];
        
        self.nameLb.sd_layout
        .topSpaceToView(self, 9)
        .leftSpaceToView(self, 15)
        .autoHeightRatio(0);
        [self.nameLb setSingleLineAutoResizeWithMaxWidth:300];
        
        self.priceLb.sd_layout
        .topSpaceToView(self.nameLb, 18)
        .leftEqualToView(self.nameLb)
        .autoHeightRatio(0);
        [self.priceLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.firstSingleLineView.sd_layout
        .topSpaceToView(self.priceLb, 9)
        .leftSpaceToView(self, 0)
        .widthRatioToView(self, 1)
        .heightIs(10);
        
        
        self.parameterLb.sd_layout
        .topSpaceToView(self.firstSingleLineView, 15)
        .leftEqualToView(self.priceLb)
        .autoHeightRatio(0);
        [self.parameterLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.selectParameBtn.sd_layout
        .topEqualToView(self.parameterLb)
        .bottomEqualToView(self.parameterLb)
        .rightSpaceToView(self, 15)
        .widthIs(10);
        
        self.secondSingleLineView.sd_layout
        .topSpaceToView(self.parameterLb, 15)
        .leftEqualToView(self.parameterLb)
        .rightSpaceToView(self, 0)
        .heightIs(0.5);
        
        self.rankLb.sd_layout
        .topSpaceToView(self.secondSingleLineView, 15)
        .leftEqualToView(self.parameterLb)
        .heightRatioToView(self.parameterLb, 1);
        [self.rankLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.selectRankBtn.sd_layout
        .topEqualToView(self.rankLb)
        .leftEqualToView(self.selectParameBtn)
        .widthRatioToView(self.selectParameBtn, 1)
        .heightRatioToView(self.selectParameBtn,1);
        
        self.thirdSingleLineView.sd_layout
        .topSpaceToView(self.rankLb, 15)
        .leftSpaceToView(self, 0)
        .widthRatioToView(self, 1)
        .heightIs(10);
        
        self.jugeTableView.sd_layout
        .topSpaceToView(self.thirdSingleLineView, 0)
        .leftSpaceToView(self, 0)
        .widthRatioToView(self, 1)
        .heightIs([self.jugeTableView cellsTotalHeight] + 90);
        
        [self setupAutoHeightWithBottomView:self.jugeTableView bottomMargin:0];
    }
    return self;





}


#pragma mark ----------------数据刷新

- (void)updateInfoWith:(STL_GoodsDetailBaseInfoModel *)model{
    self.nameLb.text = model.goodsName;
    STL_GoodsDetailBaseSubItemModel *firItemModel = model.subList.firstObject;//获取第一个子商品
    self.priceLb.text = [NSString stringWithFormat:@"¥: %@",firItemModel.promotion_price];
}


#pragma mark ----------------点击事件

- (void)selectParameAction{
    if (self.delegate) {
        [self.delegate selectedParame];
    }
}

- (void)selectRankAction{
    if (self.delegate) {
        [self.delegate selectedRank];
    }
}


#pragma mark ----------------TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_jugeData.count >= 2) {
        return 2;//最多显示两个评论
    }else{
        return _jugeData.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MallJugeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:jugeCell];
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];//缓存frame
    return cell;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = GRAYCOLOR;
    [headView addSubview:lineView];

    UILabel *headLb = [[UILabel alloc] init];
    headLb.font = FONT(14);
    headLb.textColor = LIGHTTEXTCOLOR;
    headLb.text = @"评价（220条）";
    [headView addSubview:headLb];
    headLb.sd_layout
    .centerYEqualToView(headView)
    .leftSpaceToView(headView, 15)
    .autoHeightRatio(0);
    [headLb setSingleLineAutoResizeWithMaxWidth:200];
    return headView;


}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = GRAYCOLOR;
    [footerView addSubview:lineView];
    UIButton *footerBtn = [[UIButton alloc] init];
    [footerBtn setTitleColor:MALLColor forState:UIControlStateNormal];
    [footerBtn setTitle:@"查看更多" forState:UIControlStateNormal];
    footerBtn.titleLabel.font = FONT(14);
    [footerView addSubview:footerBtn];
    footerBtn.sd_layout
    .centerXEqualToView(footerView)
    .centerYEqualToView(footerView)
    .heightIs(14);
    [footerBtn setupAutoSizeWithHorizontalPadding:0 buttonHeight:14];
    
    UIImageView *moreIv = [[UIImageView alloc] initWithImage:IMAGE(@"classify61")];
    [footerView addSubview:moreIv];
    moreIv.sd_layout
    .centerYEqualToView(footerView)
    .leftSpaceToView(footerBtn, 7)
    .widthIs(15)
    .heightIs(10);
    
    return footerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.jugeTableView cellHeightForIndexPath:indexPath model:nil keyPath:nil cellClass:[MallJugeTableViewCell class] contentViewWidth:SCREEN_WIDTH];

}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 45;
}

#pragma mark ----------------实例化

- (UILabel *)nameLb{
    if (_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.textColor = BLACKTEXTCOLOR;
        _nameLb.text = @"知味观绿豆糕抹茶味XXXXXXX";
        _nameLb.font = FONT(17);
    }
    return _nameLb;


}

- (UILabel *)priceLb{
    if (_priceLb == nil) {
        _priceLb = [[UILabel alloc] init];
        _priceLb.textColor = MALLColor;
        _priceLb.text = @"¥: 29.00";
        _priceLb.font = FONT(17);
    }
    return _priceLb;


}

- (UIView *)firstSingleLineView{
    if (_firstSingleLineView == nil) {
        _firstSingleLineView = [[UIView alloc] init];
        _firstSingleLineView.backgroundColor = GRAYCOLOR;
    }
    return _firstSingleLineView;


}

- (UILabel *)parameterLb{
    if (_parameterLb == nil) {
        _parameterLb = [[UILabel alloc] init];
        _parameterLb.textColor = BLACKTEXTCOLOR;
        _parameterLb.text = @"产品参数";
        _parameterLb.font = FONT(14);
    }
    return _parameterLb;


}

- (UIButton *)selectParameBtn{
    if (_selectParameBtn == nil) {
        _selectParameBtn = [[UIButton alloc] init];
        [_selectParameBtn setBackgroundImage:IMAGE(@"classify141") forState:UIControlStateNormal];
        [_selectParameBtn addTarget:self action:@selector(selectParameAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectParameBtn;

}

- (UIView *)secondSingleLineView{
    if (_secondSingleLineView == nil) {
        _secondSingleLineView = [[UIView alloc] init];
        _secondSingleLineView.backgroundColor = GRAYCOLOR;
    }
    return _secondSingleLineView;


}

- (UILabel *)rankLb{
    if (_rankLb == nil) {
        _rankLb = [[UILabel alloc] init];
        _rankLb.textColor = BLACKTEXTCOLOR;
        _rankLb.text = @"选择规格： 228kg";
        _rankLb.font = FONT(14);
    }
    return _rankLb;


}

- (UIButton *)selectRankBtn{
    if (_selectRankBtn == nil) {
        _selectRankBtn = [[UIButton alloc] init];
        [_selectRankBtn setBackgroundImage:IMAGE(@"classify141") forState:UIControlStateNormal];
        [_selectRankBtn addTarget:self action:@selector(selectRankAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectRankBtn;

}

- (UIView *)thirdSingleLineView{
    if (_thirdSingleLineView == nil) {
        _thirdSingleLineView = [[UIView alloc] init];
        _thirdSingleLineView.backgroundColor = GRAYCOLOR;
    }
    return _thirdSingleLineView;

}


- (UITableView *)jugeTableView{
    if (_jugeTableView == nil) {
        _jugeTableView = [[UITableView alloc] init];
        _jugeTableView.delegate = self;
        _jugeTableView.dataSource = self;
        _jugeTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _jugeTableView.separatorColor = GRAYCOLOR;
        _jugeTableView.backgroundColor = WHITECOLOR;
        [_jugeTableView registerClass:[MallJugeTableViewCell class] forCellReuseIdentifier:jugeCell];
    }
    return _jugeTableView;


}


@end
