//
//  TravelJugeViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelJugeViewController.h"

@interface TravelJugeViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) MallTopView *topView;//头部视图

@property (nonatomic, strong) UITableView *tableView;//评论列表

@property (nonatomic, strong) NSMutableArray *data;;


@property (nonatomic, assign) NSInteger page;//页数



@end

@implementation TravelJugeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WHITECOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    _data = [NSMutableArray array];
    [self loadInfoWith:YES];
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
    
    self.tableView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
}

#pragma mark ----------------数据请求

- (void)loadInfoWith:(BOOL)ret{
    if (ret) {
        _page = 1;
    }else{
        _page += 1;
    }
    
    if (!_Id) {
        [SVProgressHUD showErrorWithStatus:@"信息错误"];
        return;
    }
    NSDictionary *dic = @{@"page":[NSNumber numberWithInteger:_page], @"pageSize":@8, @"id":_Id};
    [YSSCShareBusinessManager.travelManager getTravelCommentListWithParameters:dic
                                                                       success:^(id responObject) {
                                                                           NSArray *ary = responObject;
                                                                           if (ret) {
                                                                               [_data removeAllObjects];
                                                                           }
                                                                           [_data addObjectsFromArray:ary];
                                                                           [_tableView reloadData];
                        
                                                                           if (ret) {
                                                                               if (ary.count  < 8) {
                                                                                   _tableView.mj_footer.hidden = YES;
                                                                               }else{
                                                                                   _tableView.mj_footer.hidden = NO;
                                                                                   [_tableView.mj_footer setState:MJRefreshStateIdle];
                                                                               }
                                                                               
                                                                               [_tableView.mj_header endRefreshing];
                                                                           }else{
                                                                               if (ary.count < 8) {
                                                                                   [_tableView.mj_footer endRefreshingWithNoMoreData];
                                                                               }else{
                                                                                   [_tableView.mj_footer endRefreshing];
                                                                               }
                                                                           }
                                                                       } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                           [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                           if (ret) {
                                                                               [_tableView.mj_header endRefreshing];
                                                                           }else{
                                                                               [_tableView.mj_footer endRefreshing];
                                                                           }

                                                                       }];

}
#pragma mark ----------------代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    headView.backgroundColor = WHITECOLOR;
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, SCREEN_WIDTH, 0.5)];
//    lineView.backgroundColor = GRAYCOLOR;
//    [headView addSubview:lineView];
    
    UILabel *commentLb = [[UILabel alloc] init];
    commentLb.font = FONT(15);
    commentLb.textColor = BLACKTEXTCOLOR;
    commentLb.text = [NSString stringWithFormat:@"评价 (%ld)", _totalJugeCount];
    [headView addSubview:commentLb];
    
    commentLb.sd_layout
    .centerYIs(20)
    .leftSpaceToView(headView, 15)
    .autoHeightRatio(0);
    [commentLb setSingleLineAutoResizeWithMaxWidth:400];
    
    
    return headView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelJugeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    TravelCommentModel *model = _data[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelCommentModel *model = _data[indexPath.row];

    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[TravelJugeTableViewCell class] contentViewWidth:SCREEN_WIDTH];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"评价" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = WHITECOLOR;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[TravelJugeTableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.separatorColor = GRAYCOLOR;
        YSSCWeakObj(self);
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself loadInfoWith:YES];
        }];
        
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself loadInfoWith:NO];
        }];
        _tableView.mj_footer.automaticallyHidden = YES;
    }
    return _tableView;

}
@end
