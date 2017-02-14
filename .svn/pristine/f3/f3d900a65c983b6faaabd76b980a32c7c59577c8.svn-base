//
//  MallGoodsDetailParameView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallGoodsDetailParameView.h"

@interface MallGoodsDetailParameView ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;//参数列表
@property (nonatomic, strong) UIButton *sureBtn;//完成按钮
@property (nonatomic, strong) NSMutableArray *titleData;//标题
@property (nonatomic, strong) UIView *bgView;//空白背景区域


@end

static NSString *const tableCell = @"cell";

@implementation MallGoodsDetailParameView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleData = [NSMutableArray array];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        [self addSubview:self.tableView];
        [self addSubview:self.sureBtn];
        [self addSubview:self.bgView];
        self.sureBtn.sd_layout
        .bottomSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .widthRatioToView(self, 1)
        .heightIs(50);
        
        self.tableView.sd_layout
        .bottomSpaceToView(self.sureBtn, 0)
        .leftSpaceToView(self, 0)
        .widthRatioToView(self, 1)
        .heightIs(self.titleData.count *45 + 45);
        
        self.bgView.sd_layout
        .bottomSpaceToView(self.tableView, 0)
        .leftSpaceToView(self, 0)
        .topSpaceToView(self, 0)
        .rightSpaceToView(self, 0);
        
    }
    return self;
}


#pragma mark ----------------刷新数据

- (void)updateInfoWithAry:(NSArray *)ary{
    [self.titleData removeAllObjects];
    [self.titleData addObjectsFromArray:ary];
    self.tableView.sd_layout
    .heightIs(self.titleData.count *45 + 45);
    [self.tableView reloadData];
}


#pragma mark ----------------点击事件

- (void)sureAction{
    [self removeFromSuperview];
    self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
}


#pragma mark ----------------tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MallGoodsDetailParameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCell];
    STL_GoodsDetailBaseAttrItemModel *model = _titleData[indexPath.row];
    [cell updateTitleWithTitle:model.attrName name:model.attrValue];
    return cell;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = GRAYCOLOR;
    [headView addSubview:lineView];
    UILabel *titleLb = [[UILabel alloc] init];
    titleLb.font = FONT(15);
    titleLb.textColor = LIGHTTEXTCOLOR;
    titleLb.text = @"产品参数";
    [headView addSubview:titleLb];
    titleLb.sd_layout
    .centerYEqualToView(headView)
    .leftSpaceToView(headView, 15)
    .autoHeightRatio(0);
    [titleLb setSingleLineAutoResizeWithMaxWidth:200];
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}

#pragma mark ----------------实例化

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = GRAYCOLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.rowHeight = 45;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MallGoodsDetailParameTableViewCell class] forCellReuseIdentifier:tableCell];
    }
    return _tableView;
}

- (UIButton *)sureBtn{
    if (_sureBtn == nil) {
        _sureBtn = [[UIButton alloc] init];
        _sureBtn.backgroundColor = MALLColor;
        _sureBtn.titleLabel.font = FONT(15);
        [_sureBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}

- (UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sureAction)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}
@end
