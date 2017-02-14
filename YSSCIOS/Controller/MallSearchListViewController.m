//
//  MallSearchListViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallSearchListViewController.h"

@interface MallSearchListViewController ()
<
    MallBussTopViewDelegate,
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) MallBussTopView *topView;

@property (nonatomic, strong) UITableView *historyTableView;//搜索历史

@property (nonatomic, strong) NSMutableArray *historyData;//搜索历史数据源

@end

@implementation MallSearchListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.historyTableView];
    _historyData = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    [_historyData removeAllObjects];
    NSArray *hisData = [YSSUserDefault objectForKey:@"historyMallSearch"];
    [_historyData addObjectsFromArray:hisData];
    [_historyTableView reloadData];
}

#pragma mark ----------------tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _historyData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MallSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"history"];
    [cell updateText:_historyData[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 41.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (!_historyData.count) {
        return 0.001;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (!_historyData.count) {
        return 0.001;
    }

    return 50;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!_historyData.count) {
        return nil;
    }
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    headView.backgroundColor = GRAYCOLOR;
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = WHITECOLOR;
    [headView addSubview:lineView];
    UILabel *titleLb = [[UILabel alloc] init];
    titleLb.font = FONT(14);
    titleLb.textColor = LIGHTTEXTCOLOR;
    titleLb.text = @"搜索历史";
    [headView addSubview:titleLb];
    titleLb.sd_layout
    .centerYEqualToView(headView)
    .leftSpaceToView(headView, 15)
    .rightSpaceToView(headView, 15)
    .autoHeightRatio(0);
    
    
    return headView;


}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (!_historyData.count) {
        return nil;
    }
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    footerView.backgroundColor = GRAYCOLOR;
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundColor:GRAYCOLOR];
    [btn setTitleColor:MALLColor forState:UIControlStateNormal];
    [btn setTitle:@"清除搜索记录" forState:UIControlStateNormal];
    btn.titleLabel.font = FONT(14);
    btn.layer.borderColor = MALLColor.CGColor;
    btn.layer.cornerRadius = 5;
    btn.layer.borderWidth = 0.5;
    [btn addTarget:self action:@selector(clearHistorySearchAction) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:btn];
    
    btn.sd_layout
    .topSpaceToView(footerView, 19)
    .centerXEqualToView(footerView)
    .heightIs(31);
    [btn setupAutoSizeWithHorizontalPadding:15 buttonHeight:31];
    
    
    return footerView;

}

#pragma mark ----------------清除和点击

- (void)clearHistorySearchAction{
    [YSSUserDefault removeObjectForKey:@"historyMallSearch"];
    [_historyData removeAllObjects];
    [self.historyTableView reloadData];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MallShopGoodsListViewController *shopList = [[MallShopGoodsListViewController alloc] init];
    shopList.keyWord = _historyData[indexPath.row];
    [self.navigationController pushViewController:shopList animated:YES];
}


#pragma mark ----------------MallBussTopDelegate

- (void)backToLast{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)searchWithText:(NSString *)text{
    [_topView.searchBar resignFirstResponder];
    BOOL flag = YES;
    for (NSString *str in _historyData) {
        if ([str isEqualToString:text]) {
            flag = NO;
        }
    }
    if (flag) {
        [_historyData addObject:text];
        [YSSUserDefault setObject:_historyData forKey:@"historyMallSearch"];
    }
    
    _topView.searchBar.text = @"";
    MallShopGoodsListViewController *shopList = [[MallShopGoodsListViewController alloc] init];
    shopList.keyWord = text;
    [self.navigationController pushViewController:shopList animated:YES];

}
//取消。返回
- (void)enterPeopleHome{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark ----------------实例化

- (UITableView *)historyTableView{
    if (_historyTableView == nil) {
        _historyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
        _historyTableView.delegate = self;
        _historyTableView.backgroundColor = GRAYCOLOR;
        _historyTableView.dataSource = self;
        _historyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_historyTableView registerClass:[MallSearchTableViewCell class] forCellReuseIdentifier:@"history"];
    }
    return _historyTableView;


}

- (MallBussTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallBussTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64) ret:YES];
        _topView.delegate = self;
    }
    return _topView;


}


@end
