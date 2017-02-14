//
//  SettingViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/9/19.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "APIChosseTableViewController.h"
#import <StoreKit/StoreKit.h>

@interface SettingViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    SKStoreProductViewControllerDelegate
>

@property (nonatomic, strong) MallTopView *topView;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}


#pragma mark ----------------代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //正式版改为2
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (indexPath.row == 0) {

            [cell updateWithTitle:@"当前版本" value:[NSString stringWithFormat:@"V%@",YSSC_VERSIONString]];
        }else if (indexPath.row == 1){
            NSUInteger intg = [[SDImageCache sharedImageCache] getSize];
            NSString * currentVolum = [NSString stringWithFormat:@"%@",[self fileSizeWithInterge:intg]];
            [cell updateWithTitle:@"清除缓存" value:currentVolum];
        }else if(indexPath.row == 2){
            NSString *currentAPI  = [YSSUserDefault objectForKey:@"currentAPI"];
            [cell updateWithTitle:@"API:" value:currentAPI];
        }
        return cell;
        
    }else if (indexPath.section == 1){
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        UILabel *exit = [[UILabel alloc] init];
        exit.font = FONT(16);
        exit.textColor = MALLColor;
        exit.text = @"退出登录";
        [cell.contentView addSubview:exit];
        
        exit.sd_layout
        .centerYEqualToView(cell.contentView)
        .centerXEqualToView(cell.contentView)
        .autoHeightRatio(0);
        [exit setSingleLineAutoResizeWithMaxWidth:400];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }else{
        return 20;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //跳转到AppStore
//            [SVProgressHUD showInfoWithStatus:@"正在跳转APPStore"];
////            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",APPLICATION_ID]]];
//            NSLog(@"itms-apps://itunes.apple.com/app/id%@",APPLICATION_ID);

//            [self openAppStore:APPLICATION_ID];
        }
        if (indexPath.row == 1) {
            [[SDImageCache sharedImageCache] clearDisk];
            [SVProgressHUD showWithStatus:@"正在清除"];
            YSSCWeakObj(self);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                [weakself.tableView reloadData];
            });
        }
        
        if (indexPath.row == 2) {
            //跳转测试服务器选择界面
            APIChosseTableViewController *chos = [[APIChosseTableViewController alloc] init];
            [self.navigationController pushViewController: chos animated:YES];
        }
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [self exitAction];
        }
    }
}

- (void)openAppStore:(NSString *)appid{
    [SVProgressHUD showWithStatus:@"正在加载..."];
    //初始化控制器
    SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc] init];
    //设置代理请求为当前控制器本身
    storeProductViewContorller.delegate = self;
    //加载一个新的视图展示
    [storeProductViewContorller loadProductWithParameters:
     //appId唯一的
     @{SKStoreProductParameterITunesItemIdentifier : appid} completionBlock:^(BOOL result, NSError *error) {
         [SVProgressHUD dismiss];
         //block回调
         if(error){
             NSLog(@"error %@ with userInfo %@",error,[error userInfo]);
             [SVProgressHUD showErrorWithStatus:error.description];
         }
         else
         {
             //模态弹出appstore
             [self presentViewController:storeProductViewContorller
                                animated:YES
                              completion:^{}];
         }
     }];
}

#pragma mark SKStoreProductViewControllerDelegate 取消按钮监听
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark ----------------退出登录

- (void)exitAction{
    [YSSCShareBusinessManager.loginManger quitLogin];
    [SVProgressHUD showWithStatus:@"正在退出"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [self.navigationController popViewControllerAnimated:YES];
    });

}


#pragma mark ----------------计算缓存大小

//计算出大小
- (NSString *)fileSizeWithInterge:(NSInteger)size{
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}



#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        YSSCWeakObj(self);
        _topView.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        [_topView setTitleText:@"更多设置" imageArrays:nil selecterArys:nil target:self isShowLeftBtn:YES];
    }
    return _topView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = GRAYCOLOR;
        _tableView.separatorColor = GRAYCOLOR;
        [_tableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

@end
