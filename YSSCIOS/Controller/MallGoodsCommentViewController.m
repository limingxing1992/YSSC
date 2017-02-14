//
//  MallGoodsCommentViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/13.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallGoodsCommentViewController.h"

@interface MallGoodsCommentViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) MallTopView *topView;//

@property (nonatomic, strong) UITableView *tableView;//商品评论列表


@property (nonatomic, strong) NSMutableArray *data;


@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) MallJugeInfoModel *model;


@end

@implementation MallGoodsCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [NSMutableArray array];

    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    [self loadInfoWithRet:YES];
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

#pragma mark ----------------数据请求

- (void)loadInfoWithRet:(BOOL)ret{
    
    if (ret) {
        _page = 1;
    }else{
        _page +=1;
    }
    
    
    YSSCWeakObj(self);
    [YSSCShareBusinessManager.mallManager getGoodsCommentWithParameters:@{@"mainGoodsMdf":_mdf,@"grade":@"0",@"page":[NSString stringWithFormat:@"%ld",_page],@"pageSize":@"10"} success:^(id responObject) {
        MallJugeInfoModel *model = (MallJugeInfoModel *)responObject;
        _model = model;
        if (ret) {
            [weakself.data removeAllObjects];
        }
        [weakself.data addObjectsFromArray:model.comments];
        [weakself.tableView reloadData];
        
        if (ret) {
            if (!weakself.data.count) {
                [SVProgressHUD showErrorWithStatus:@"暂无评价"];
            }
            
            NSInteger flag = (SCREEN_HEIGHT - 64) / 80;
            
            if (weakself.data.count < flag) {
                weakself.tableView.mj_footer.hidden = YES;
            }else{
                weakself.tableView.mj_footer.hidden = NO;
                [_tableView.mj_footer setState:MJRefreshStateIdle];

            }
            
            [weakself.tableView.mj_header endRefreshing];
        }else{
            if (model.comments.count < 10) {
                [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [weakself.tableView.mj_footer endRefreshing];
            }
        }
        
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:errorMsg];
        if (ret) {
            [weakself.tableView.mj_header endRefreshing];
        }else{
            [weakself.tableView.mj_footer endRefreshing];
        }

    }];

}


#pragma mark ----------------评论代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MallJugeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    MallJugeInfoItemModel *model = _data[indexPath.row];
    
    cell.model = model;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MallJugeInfoItemModel *model = _data[indexPath.row];
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[MallJugeTableViewCell class] contentViewWidth:SCREEN_WIDTH];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 79, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = GRAYCOLOR;
    [headView addSubview:lineView];
    
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
    
    [star updateInfoWith:_model.avgScore.integerValue];
    [star.starNumLb removeFromSuperview];
    [headView addSubview:star];
    
    star.sd_layout
    .topSpaceToView(headLb, 9)
    .leftEqualToView(headLb)
    .heightIs(12);
    
    
    return headView;
}




#pragma mark ----------------实例化



- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"商品评论" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _tableView.delegate = self;
        _tableView.dataSource= self;
        _tableView.separatorColor = GRAYCOLOR;
        [_tableView registerClass:[MallJugeTableViewCell class] forCellReuseIdentifier:@"cell"];
        YSSCWeakObj(self);
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself loadInfoWithRet:YES];
        }];
        
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself loadInfoWithRet:NO];
        }];
        _tableView.mj_footer.automaticallyHidden = YES;
    }
    return _tableView;
}

@end
