//
//  UserPresentViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserPresentViewController.h"
#import "UserPresentTopCell.h"
#import "UserPresentCell.h"
#import "UserGiftObject.h"

@interface UserPresentViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**giftArray*/
@property (nonatomic, strong) NSMutableArray *giftArray;

@end

@implementation UserPresentViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"我的礼物"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navBar;
}
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
        _tableView.backgroundColor = GRAYCOLOR;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UserPresentTopCell class] forCellReuseIdentifier:@"userPresentTopCell"];
        [_tableView registerClass:[UserPresentCell class] forCellReuseIdentifier:@"userPresentCell"];
    }
    return _tableView;
}

- (NSMutableArray *)giftArray{
    if (_giftArray == nil) {
        _giftArray = [[NSMutableArray alloc] init];
    }
    return _giftArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [self requestGiftList];
}

- (void)requestGiftList{
    [YSSCShareBusinessManager.userManager getUserGiftWithDictionary:nil success:^(id object) {
        if (object) {
            UserGiftObject *giftObject = object;
            if (giftObject.errorCode.integerValue == SeverStateSuccess) {
                self.giftArray = giftObject.data;
                [self.tableView reloadData];
            }
        }
        
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

#pragma mark --------- tableView代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.giftArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UserPresentTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userPresentTopCell"];
        UserGiftDataObject *dataObject = self.giftArray[indexPath.section];
        [cell setTitle:dataObject.shop_name];
        return cell;
    }else{
        UserPresentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userPresentCell"];
        cell.model = self.giftArray[indexPath.section];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
    return height + 0.5;
}


@end
