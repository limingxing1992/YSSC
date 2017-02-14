//
//  UserMessageViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserMessageViewController.h"
#import "UserMessageCell.h"
#import "UserAllMessageObject.h"
#import "UserMessageListViewController.h"

@interface UserMessageViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>


/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**消息*/
@property (nonatomic, strong) UserAllMessageObject *allMessage;

/**tableView*/
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation UserMessageViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"我的消息"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navBar;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self.tableView registerClass:[UserMessageCell class] forCellReuseIdentifier:@"userMessageCell"];
     
}

- (void)setupUI{
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = GRAYCOLOR;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
  //  self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.hidden = YES;
   // self.tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    [self requestMessage];
}

- (void)requestMessage{
    [YSSCShareBusinessManager.userManager getAllMessageWithDictionary:nil success:^(id object) {
        if (object) {
            UserAllMessageObject *messageObject = object;
            if (messageObject.errorCode.integerValue == SeverStateSuccess) {
                self.allMessage = messageObject;
            }
            [self.tableView reloadData];
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userMessageCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [cell setTitle:@"系统消息" subTitle:_allMessage.data.push_title messageCount:_allMessage.data.pushMsgNum];
    }else{
        [cell setTitle:@"订单消息" subTitle:_allMessage.data.order_title messageCount:_allMessage.data.orderMsgNum];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UserMessageListViewController *messListVC = [[UserMessageListViewController alloc] initPush];
        [self.navigationController pushViewController:messListVC animated:YES];
    }else{
        UserMessageListViewController *messListVC = [[UserMessageListViewController alloc] initOrder];
        [self.navigationController pushViewController:messListVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 99;
}

@end
