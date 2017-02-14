//
//  SurroundingAreaCommentListViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SurroundingAreaCommentListViewController.h"

@interface SurroundingAreaCommentListViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) MallTopView *topView;//

@property (nonatomic, strong) UITableView *tableView;//商品评论列表


@property (nonatomic, assign) NSInteger page;
@end

@implementation SurroundingAreaCommentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.topView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(64);
    
}


#pragma mark ----------------TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SurroundingAreaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    SurroundingAreaBussDetailCommentItemModel *itemModel = _data[indexPath.row];
    cell.model = itemModel;
    return cell;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    headView.backgroundColor = WHITECOLOR;
    
    UILabel *headLb = [[UILabel alloc] init];
    headLb.font = FONT(14);
    headLb.textColor = LIGHTTEXTCOLOR;
    headLb.text = [NSString stringWithFormat:@"评价(%ld)", _data.count];
    [headView addSubview:headLb];
    headLb.sd_layout
    .topSpaceToView(headView, 22)
    .leftSpaceToView(headView, 15)
    .autoHeightRatio(0);
    [headLb setSingleLineAutoResizeWithMaxWidth:200];
    
    MallJugeStarView *star = [[MallJugeStarView alloc] init];
    [star updateInfoWith:_score.integerValue];
    [star.starNumLb removeFromSuperview];
    [headView addSubview:star];
    
    star.sd_layout
    .topSpaceToView(headLb, 9)
    .leftEqualToView(headLb)
    .heightIs(12);
    
    
    return headView;
    
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SurroundingAreaBussDetailCommentItemModel *itemModel = _data[indexPath.row];
    
    return [self.tableView cellHeightForIndexPath:indexPath model:itemModel keyPath:@"model" cellClass:[SurroundingAreaTableViewCell class] contentViewWidth:SCREEN_WIDTH];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}



#pragma mark ----------------实例化



- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"商户评论" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;

}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource= self;
        _tableView.separatorColor = GRAYCOLOR;
        [_tableView registerClass:[SurroundingAreaTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;

}

@end
