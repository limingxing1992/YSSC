//
//  UserViewController.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserViewController.h"
#import "UserRankViewController.h"
#import "UserAccountMangeViewController.h"
#import "UserFavoriteViewController.h"
#import "UserOrderViewController.h" //订单页面
#import "UserIconCell.h"
#import "UserOrderCell.h"
#import "UserGoodsOrderDetailViewController.h"//商品订单详情
#import "UserHotelOrderDetailViewController.h"//乡宿订单详情
#import "UserInviteFriendViewController.h"//邀请好友
#import "UserPresentViewController.h"//我的礼物
#import "LoginViewController.h"
#import "UserShopCarViewController.h"
#import "UserOrderSubViewController.h"
#import "UserHotelCollectionViewController.h"
#import "UserMessageViewController.h"
#import "UserBalanceViewController.h"

#import "UserInfoObject.h"

@interface UserViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSourceArr;
/**用户模型*/
@property (nonatomic, strong) UserInfoObject *userInfoObject;
/**消息按钮*/
@property (nonatomic, strong) UIButton *messageButton;
/**网络是否可达*/
@property (nonatomic, assign) BOOL hostReachable;

@end

static NSString *const kUserCell = @"kUserCell";

@implementation UserViewController

#pragma mark --------- 懒加载

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 45) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        //  _tableView.bounces = NO;
        _tableView.backgroundColor = BACKGROUNDCOLOR;
    }
    return _tableView;
}

- (UIButton *)messageButton{
    if (_messageButton == nil) {
        _messageButton = [[UIButton alloc] init];
        [_messageButton setBackgroundImage:IMAGE(@"notice") forState:UIControlStateNormal];
        _messageButton.frame = CGRectMake(SCREEN_WIDTH - 40, 25, 20, 20);
        [_messageButton addTarget:self action:@selector(messageButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageButton;
}

#pragma mark --------- 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)login{
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
    
}

- (void)setupUI{
    
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView addSubview:self.messageButton];
    // self.tableView.separatorInset = UIEdgeInsetsMake(-20, 0, 0, 0);
}


- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
    [self refreshUI];
}

- (void)refreshUI{
    self.userInfoObject = nil;
    
    [YSSCShareBusinessManager.userManager getUserInfoSuccess:^(id object) {
        if (object) {
            UserInfoObject *userInfoObject = object;
            if (userInfoObject.errorCode.integerValue == SeverStateSuccess) {
                self.userInfoObject = userInfoObject;
                _hostReachable = YES;
            }
            [self.tableView reloadData];
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
    
}

#pragma mark --------- tableView代理

//处理cell分割线
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 2;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
        return height;
    }else if (indexPath.section == 2 && indexPath.row == 1){
        return 82.5;
    }
    return 48;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kUserCell];
    
    cell.imageView.image = [UIImage imageNamed:@"home选择"];
    cell.accessoryView = [[UIImageView alloc] initWithImage:IMAGE(@"right8")];//设置指示图
    cell.textLabel.textColor = BLACKTEXTCOLOR;
    cell.textLabel.font = FONT(14);
    
    
    YSSCWeakObj(self);
    if (indexPath.section == 0) {
        UserIconCell *iconCell = [[UserIconCell alloc] init];
        iconCell.userModel = self.userInfoObject;
        
        [iconCell buttonDidClick:^(UIButton *button) {//想住 住过 收藏
            [weakself userHistory:button];
        }];
        return iconCell;
    }else if (indexPath.section == 1) {
        cell.textLabel.text = @"我的游记";
        cell.imageView.image = IMAGE(@"classify121");
    }else if (indexPath.section == 2 && indexPath.row == 0) {
        cell.textLabel.text = @"我的订单";
        cell.imageView.image = IMAGE(@"classify122");
    }else if (indexPath.section == 2 && indexPath.row == 1) {
        UserOrderCell *orderCell = [[UserOrderCell alloc] init];
        [orderCell buttonDidClick:^(UIButton *button) {
            [weakself userOrder:button];
        }];
        return orderCell;
        
    }else if (indexPath.section == 3) {
        cell.textLabel.text = @"我的礼物";
        cell.imageView.image = IMAGE(@"classify127");
    }else if (indexPath.section == 4) {
        cell.textLabel.text = @"购物车";
        cell.detailTextLabel.textColor = MALLColor;
        cell.imageView.image = IMAGE(@"classify108");
        cell.detailTextLabel.text = self.userInfoObject.data.shop_cart_num;
        
    }else if (indexPath.section == 5){
        cell.textLabel.text = @"五云铢";
        cell.imageView.image = IMAGE(@"Group-19");
    }else if (indexPath.section == 6) {
        cell.textLabel.text = @"邀请好友注册";
        cell.imageView.image = IMAGE(@"inviteFriend");
        
    }else if (indexPath.section == 7) {
        cell.textLabel.text = @"设置";
        cell.imageView.image = IMAGE(@"classify128");
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if ([YSSCShareBusinessManager.loginManger isLogin] && _hostReachable == YES) {
        
        
        if (indexPath.section == 1) {//我的游记
            TravelDiaryViewController *travelVc = [[TravelDiaryViewController alloc] init];
            travelVc.isUserList = YES;
            [self.navigationController pushViewController:travelVc animated:YES];
        }
        
        if (indexPath.section == 3) {//礼物
            UserPresentViewController *presentVC = [[UserPresentViewController alloc] init];
            [self.navigationController pushViewController:presentVC animated:YES];
        }
        if (indexPath.section == 4) {//购物车
            UserShopCarViewController *shopCarVC = [[UserShopCarViewController alloc] init];
            [self.navigationController pushViewController:shopCarVC animated:YES];
        }
        
        if (indexPath.section == 2 && indexPath.row == 0) { // 我的订单
            UserOrderViewController *orderVC = [[UserOrderViewController alloc] init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:orderVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
        
        if (indexPath.section == 5) {//五云珠
            UserBalanceViewController *balanceVC = [[UserBalanceViewController alloc] init];
            
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:balanceVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
        
        if (indexPath.section == 6) { // 邀请好友
            UserInviteFriendViewController *inviteFriendVC = [[UserInviteFriendViewController alloc] init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:inviteFriendVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
        
        if (indexPath.section == 7){//设置
            SettingViewController *setVc = [[SettingViewController alloc] init];
            [self.navigationController pushViewController:setVc animated:YES];
        }
    }
    else{//未登录
        
        if (indexPath.section == 7){
            SettingViewController *setVc = [[SettingViewController alloc] init];
            [self.navigationController pushViewController:setVc animated:YES];
        }else{
            [self login];
        }
        
    }
    
}


//跳转到订单相关页面 待付款 待发货 待收货 待评价
- (void)userOrder:(UIButton *)button{
    
    if ([YSSCShareBusinessManager.loginManger isLogin] && _hostReachable == YES) {
        UserOrderSubViewController *goodsOrderVC = [[UserOrderSubViewController alloc] initWithNav];
        
        if (button.tag == 0) {//待付款
            [goodsOrderVC.goodsParameterDict setObject:@"10" forKey:@"status"];
        }
        if (button.tag == 1) {//待发货
            [goodsOrderVC.goodsParameterDict setObject:@"20" forKey:@"status"];
        }
        if (button.tag == 2) {//待收货
            [goodsOrderVC.goodsParameterDict setObject:@"30" forKey:@"status"];
        }
        if (button.tag == 3) {//待评价
            [goodsOrderVC.goodsParameterDict setObject:@"40" forKey:@"status"];
        }
        
        [self.navigationController pushViewController:goodsOrderVC animated:YES];
    }else{
        [self login];
    }
    
    
}
//跳转到想住 住过 收藏 用户等级
- (void)userHistory:(UIButton *)button{
    
    
    if ([YSSCShareBusinessManager.loginManger isLogin] && _hostReachable == YES) {
        if (button.tag == 301) { //跳转到会员等级界面
            UserRankViewController *rankVC = [[UserRankViewController alloc] init];
            rankVC.model = self.userInfoObject;
            [self presentViewController:rankVC animated:YES completion:nil];
        }
        if (button.tag == 302) { //点击了用户名 跳转到账号管理
            UserAccountMangeViewController *accountVC = [[UserAccountMangeViewController alloc] init];
            accountVC.userModel = self.userInfoObject;
            [self.navigationController pushViewController:accountVC animated:YES];
            
        }
        if (button.tag == 303) {//想住
            UserHotelCollectionViewController *hotelVC = [[UserHotelCollectionViewController alloc] initWithFlag:0];
            [self.navigationController pushViewController:hotelVC animated:YES];
        }
        if (button.tag == 304) {//住过
            UserHotelCollectionViewController *hotelVC = [[UserHotelCollectionViewController alloc] initWithFlag:1];
            
            [self.navigationController pushViewController:hotelVC animated:YES];
        }
        
        if (button.tag == 305) {//点击了收藏 跳转到收藏
            UserFavoriteViewController *favoriteVC = [[UserFavoriteViewController alloc] init];
            [self.navigationController pushViewController:favoriteVC animated:YES];
            
        }
    }else{
        [self login];
    }
    
}

#pragma mark --------- 跳转到消息
- (void)messageButtonClick{
    if ([YSSCShareBusinessManager.loginManger isLogin] && _hostReachable == YES) {
        UserMessageViewController *userMessageVc =[[UserMessageViewController alloc] init];
        [self.navigationController pushViewController:userMessageVc animated:YES];
    }else{
        [self login];
    }
}



@end

