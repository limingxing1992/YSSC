//
//  UserMessageListViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserMessageListViewController.h"
#import "UserMessageCell.h"
#import "UserPushMessageObject.h"
#import "UserMessageDetailViewController.h"

@interface UserMessageListViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**系统消息数组*/
@property (nonatomic, strong) NSMutableArray *messageArray;

/**title*/
@property (nonatomic, strong) NSString *messageTitle;

/**page*/
@property (nonatomic, assign) NSInteger page;
/**是否系统消息*/
@property (nonatomic, assign) BOOL is_sys;


@end

@implementation UserMessageListViewController


- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:self.messageTitle];
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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        YSSCWeakObj(self);
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            if (_is_sys) {
               [weakself requestPushList];
            }else{
                [weakself requestOrderList];
            }
            [_tableView.mj_footer endRefreshing];
        }];
    }
    return _tableView;
}

- (NSMutableArray *)messageArray{
    if (_messageArray == nil) {
        _messageArray = [[NSMutableArray alloc] init];
    }
    return _messageArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.page = 1;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.page = 1;
    [self.tableView.mj_footer beginRefreshing];
    
    
}

- (instancetype)initPush
{
    self = [super init];
    if (self) {
        _is_sys = YES;
        
    }
    return self;
}

- (instancetype)initOrder
{
    self = [super init];
    if (self) {
        _is_sys = NO;
        
    }
    return self;
}

- (void)requestPushList{
    self.messageTitle = @"系统提示";
    [_navBar setTitletext:self.messageTitle];
    NSDictionary *dict = @{@"page":[NSString stringWithFormat:@"%zd",_page],
                           @"pageSize":@"10"};
    
    [YSSCShareBusinessManager.userManager getPushMessageWithDictionary:dict success:^(id object) {
        if (object) {
            UserPushMessageObject *pushObject = object;
            if (self.page == 1) {
                [self.messageArray removeAllObjects];
            }
            if (pushObject.data.count < 10) {
                self.tableView.mj_footer.hidden = YES;
            }else{
                self.tableView.mj_footer.hidden = NO;
            }
            if (pushObject.data.count > 0) {
                
                [self.messageArray addObjectsFromArray:pushObject.data];
                self.page ++;
                [self.tableView reloadData];
                
            }
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

- (void)requestOrderList{
    self.messageTitle = @"订单消息";
    [_navBar setTitletext:self.messageTitle];
    NSDictionary *dict = @{@"page":[NSString stringWithFormat:@"%zd",_page],
                           @"pageSize":@"10"};
    
    [YSSCShareBusinessManager.userManager getOrderMessageWithDictionary:dict success:^(id object) {
        if (object) {
            UserPushMessageObject *pushObject = object;
            if (self.page == 1) {
                [self.messageArray removeAllObjects];
            }
            if (pushObject.data.count < 10) {
                self.tableView.mj_footer.hidden = YES;
            }else{
                self.tableView.mj_footer.hidden = NO;
            }
            if (pushObject.data.count > 0) {
                
                [self.messageArray addObjectsFromArray:pushObject.data];
                self.page ++;
                
                [self.tableView reloadData];
            }
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UserPushMessageDataObject *messageDataObject = self.messageArray[indexPath.row];
        NSDictionary *dict =@{@"msgIds":messageDataObject.ID
                              ,@"status":@"2"};
        
        [YSSCShareBusinessManager.userManager readOrDeleteOrderMessage:dict success:^(id object) {
                                                                             
                                                                         } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                             
                                                                         }];
        [self.messageArray removeObjectAtIndex:indexPath.row];

        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [tableView reloadData];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath*)indexpath {
    return @"删除";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userMessageCell"];
    if (cell == nil) {
        cell = [[UserMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userMessageCell"];
    }
    
    UserPushMessageDataObject *messageDataObject = self.messageArray[indexPath.row];
    if ([messageDataObject.flag isEqualToString:@"0"]) {
        [cell setTitle:_messageTitle subTitle:messageDataObject.title messageCount:@"1"];

    }else{
        [cell setTitle:_messageTitle subTitle:messageDataObject.title messageCount:@"0"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 99;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UserPushMessageDataObject *messageDataObject = self.messageArray[indexPath.row];

    if ([self.messageTitle isEqualToString:@"系统提示"] ) {
        UserMessageDetailViewController *messageVC = [[UserMessageDetailViewController alloc] initWithPushMessage];
        messageVC.messageID = messageDataObject.ID;
        
        [self.navigationController pushViewController:messageVC animated:YES];
    }else{
        UserMessageDetailViewController *messageVC = [[UserMessageDetailViewController alloc] initWithOrderMessage];
        messageVC.messageID = messageDataObject.ID;
        [self.navigationController pushViewController:messageVC animated:YES];
    }
    
}

@end
