//
//  HotelDetailJudgeViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelDetailJudgeViewController.h"
#import "HotelMoreJudgeCell.h"
#import "HotelJudegTopCell.h"
#import "YSSNavView.h"
#import "HotelCommentObject.h"

@interface HotelDetailJudgeViewController ()

<
    UITableViewDelegate,
    UITableViewDataSource
>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YSSNavView *navBar;

@end

static NSString *const kMoreJudgeCell = @"kMoreJudgeCell";
static NSString *const kMoreJudgeTopCell = @"kMoreJudgeTopCell";

@implementation HotelDetailJudgeViewController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navBar];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - tableView代理

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.model.commentList.count;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HotelJudegTopCell *cell = [tableView dequeueReusableCellWithIdentifier:kMoreJudgeTopCell];
        [cell setJudgeNum:self.model.totalNum.stringValue score:self.model.total_score.integerValue];
        return cell;
    }else{
        HotelMoreJudgeCell *cell = [tableView dequeueReusableCellWithIdentifier:kMoreJudgeCell];
        cell.model = self.model.commentList[indexPath.row];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
    return height;
    
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HotelMoreJudgeCell class] forCellReuseIdentifier:kMoreJudgeCell];
        [_tableView registerClass:[HotelJudegTopCell class] forCellReuseIdentifier:kMoreJudgeTopCell];
    }
    return _tableView;
}

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navBar;
}

@end
