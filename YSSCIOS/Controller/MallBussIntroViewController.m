//
//  MallBussIntroViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussIntroViewController.h"

@interface MallBussIntroViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) MallTopView *topView;


@property (nonatomic, strong) UIScrollView *contentView;//背景滚动

@property (nonatomic, strong) UITableView *bussRankView;//商家参数

@property (nonatomic, strong) NSMutableArray *rankData;//参数信息

@property (nonatomic, strong) NSMutableArray *addressData;//地址信息


@property (nonatomic, strong) MallBussInfoTableViewCell *topInfoView;//头部信息

@property (nonatomic, strong) MallBussIntroTableViewCell *introView;//简介



@end

@implementation MallBussIntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.contentView];
    self.rankData = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"性质: %@",_info[@"shop_industry"]], [NSString stringWithFormat:@"行业: %@",_info[@"shop_nature"]],[NSString stringWithFormat:@"规模: %@",_info[@"shop_size"]], nil];
    self.addressData = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"服务电话: %@",_info[@"phone"]], [NSString stringWithFormat:@"地址: %@",_info[@"address"]], nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    self.topView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(64);
    
    self.topInfoView.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(100);
    
    self.introView.sd_layout
    .topSpaceToView(self.topInfoView, 10)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0);
    
    
    self.bussRankView.sd_layout
    .topSpaceToView(self.introView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(245);
    
    [self.contentView setupAutoContentSizeWithBottomView:_bussRankView bottomMargin:10];
}

#pragma mark ----------------数据请求

- (void)loadInfo{
    
}


#pragma mark ----------------tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return _rankData.count;
    }else if (section == 1){
        return _addressData.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MallBussRank"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = WHITECOLOR;
        cell.textLabel.font = FONT(14);
        cell.textLabel.textColor = BLACKTEXTCOLOR;
        cell.accessoryType = UITableViewCellAccessoryNone;
        if (indexPath.section == 0) {
            cell.textLabel.text = _rankData[indexPath.row];
        }else if (indexPath.section == 1){
            cell.textLabel.text = _addressData[indexPath.row];
        }
        return cell;


}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 44;
}

#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"商家简介" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UITableView *)bussRankView{
    if (_bussRankView == nil) {
        _bussRankView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _bussRankView.delegate = self;
        _bussRankView.dataSource = self;
        _bussRankView.backgroundColor = GRAYCOLOR;
        _bussRankView.separatorColor = GRAYCOLOR;
        _bussRankView.scrollEnabled = NO;
        [_bussRankView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MallBussRank"];
    }
    return _bussRankView;
}

- (MallBussInfoTableViewCell *)topInfoView{
    if (_topInfoView == nil) {
        _topInfoView = [[MallBussInfoTableViewCell alloc] init];
        _topInfoView.backgroundColor = WHITECOLOR;
        [_topInfoView updateInfoWith:_info];
    }
    return _topInfoView;

}

- (MallBussIntroTableViewCell *)introView{
    if (_introView == nil) {
        _introView = [[MallBussIntroTableViewCell alloc] init];
        _introView.backgroundColor = WHITECOLOR;
        [_introView updateInfoWith:_info];
    }
    return _introView;
}

- (UIScrollView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _contentView.backgroundColor = GRAYCOLOR;
        [_contentView addSubview:self.bussRankView];
        [_contentView addSubview:self.topInfoView];
        [_contentView addSubview:self.introView];
    }
    return _contentView;
}
@end
