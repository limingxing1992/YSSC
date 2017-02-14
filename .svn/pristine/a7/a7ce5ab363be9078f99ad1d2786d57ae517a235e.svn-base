//
//  UserRankViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//  会员等级

#import "UserRankViewController.h"
#import "UserRankTopView.h"
#import "UserRankHeaderView.h"
#import "YSSNavView.h"
#import "UserInfoObject.h"

@interface UserRankViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**顶部视图*/
@property (nonatomic, strong) UserRankTopView *topView;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**立即咨询*/
@property (nonatomic, strong) UIButton *consultButton;
/**tableViewHeader*/
@property (nonatomic, strong) UserRankHeaderView *headerView;
/**会员等级字典*/
@property (nonatomic, strong) NSDictionary *rankDict;


@end

@implementation UserRankViewController


- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor clearColor];
        _navBar.coverView.backgroundColor = [UIColor blackColor];
        _navBar.coverView.alpha = 0;
        [_navBar setLeftImage:IMAGE(@"classify148")];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself dismissViewControllerAnimated:YES completion:nil];
        };
        [_navBar hideShadow];
    }
    return _navBar;
}

- (UserRankTopView *)topView{
    if (_topView == nil) {
        _topView = [[UserRankTopView alloc] init];
    }
    return _topView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        // _tableView.style =
        _tableView.bounces = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UIButton *)consultButton{
    if (_consultButton == nil) {
        _consultButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_consultButton setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
        [_consultButton setTitle:@"立即咨询" forState:UIControlStateNormal];
        [_consultButton addTarget:self action:@selector(consultBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _consultButton;
}

- (UserRankHeaderView *)headerView{
    if (_headerView == nil) {
        _headerView = [[UserRankHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 74)];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (NSDictionary *)rankDict{
    if (_rankDict == nil) {
        _rankDict = @{@"2":@"普通会员",
                      @"20":@"白金会员",
                      @"21":@"钻石会员",
                      @"22":@"黑金会员"};
    }
    return _rankDict;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI{
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.consultButton];
    [self.view addSubview:self.navBar];
    
    self.topView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(246.5);
    
    self.tableView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomSpaceToView(self.view, 50);
    
    self.consultButton.sd_layout
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(50);
    
}

- (void)setModel:(UserInfoObject *)model{
    _model = model;
    [self.topView setName:_model.data.username rank:[self.rankDict objectForKey:_model.data.type]];
}

#pragma mark - tableView数据源

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 74;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    

    NSString *detailStr = [NSString stringWithFormat:@"(当前为%@)",[self.rankDict objectForKey:_model.data.type]];
    [self.headerView setTitle:@"我的特权" detail:detailStr];
    return self.headerView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.row == 0) {
        cell.imageView.image = IMAGE(@"classify118");
        cell.textLabel.text = @"高级股东特权";
        cell.detailTextLabel.text = @"付费股东将获得精美礼品";
    }
    if (indexPath.row == 1) {
        cell.imageView.image = IMAGE(@"classify120");
        cell.textLabel.text = @"售后运费优惠";
        cell.detailTextLabel.text = @"付费股东享受售后服务（退货、换货）免费";
    }
    if (indexPath.row == 2) {
        cell.imageView.image = IMAGE(@"classify114");
        cell.textLabel.text = @"贵宾服务热线";
        cell.detailTextLabel.text = @"贵宾服务热线只有付费股东才享有";
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 79;
}

#pragma mark - 点击事件

- (void)consultBtnClick{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"4000909010"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}


@end
