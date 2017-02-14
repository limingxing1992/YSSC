//
//  UserChooseAddressViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserChooseAddressViewController.h"
#import "UserAddAddressViewController.h"
#import "UserEditAddressViewController.h"
#import "UserAddressCell.h"
#import "YSSNavView.h"
#import "UserAddressObject.h"

@interface UserChooseAddressViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**新增地址Btn*/
@property (nonatomic, strong) UIButton *addAddressBtn;
/**地址模型数组*/
@property (nonatomic, strong) NSMutableArray *addressArr;


@end

@implementation UserChooseAddressViewController

#pragma mark --------- 懒加载

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"选择送货地址"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.backgroundColor = GRAYCOLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UserAddressCell class] forCellReuseIdentifier:@"userAddressCell"];
    }
    return _tableView;
}

- (UIButton *)addAddressBtn{
    if (_addAddressBtn == nil) {
        _addAddressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addAddressBtn.backgroundColor = [UIColor whiteColor];
        _addAddressBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _addAddressBtn.imageEdgeInsets = UIEdgeInsetsMake(12, 12, 12, SCREEN_WIDTH - 35);
        _addAddressBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        _addAddressBtn.titleLabel.font = FONT(16);
        
        [_addAddressBtn setImage:IMAGE(@"classify103") forState:UIControlStateNormal];
        [_addAddressBtn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [_addAddressBtn setTitle:@"  新增地址" forState:UIControlStateNormal];
        [_addAddressBtn addTarget:self action:@selector(addAddress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addAddressBtn;
}

#pragma mark --------- 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestUserAddressList];
}

- (void)requestUserAddressList{ 
    
    [YSSCShareBusinessManager.userManager getUserAddressWithDictionary:nil success:^(id object) {
        
        if (object) {
            UserAddressObject *userAddressObject = object;
            if (userAddressObject.errorCode.integerValue == SeverStateSuccess) {
                self.addressArr = userAddressObject.data;
                [self.tableView reloadData];
            }
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

- (void)setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.addAddressBtn];
    [self.view addSubview:self.tableView];
    
    self.addAddressBtn.sd_layout
    .topSpaceToView(self.navBar, 10)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(48);
    
    self.tableView.sd_layout
    .topSpaceToView(self.addAddressBtn, 10)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
}


#pragma mark --------- tableView代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.addressArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userAddressCell"];
    cell.addressModel = [self.addressArr objectAtIndex:indexPath.row];
    [cell buttonDidClick:^(UIButton *button) {
        if (button.tag == 303) {
           
            UserEditAddressViewController *editVC = [[UserEditAddressViewController alloc] init];
            editVC.addressModel = [self.addressArr objectAtIndex:indexPath.row];
            
            [self.navigationController pushViewController:editVC animated:YES];
            
        }else if(button.tag == 304){
           
            UserAddressDataObject *object = [self.addressArr objectAtIndex:indexPath.row];
            [self alertViewWithID:object.ID];
        }else{
            [SVProgressHUD showWithStatus:@"正在设置默认地址"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self requestUserAddressList];
                [SVProgressHUD dismiss];
            });
            
        }
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(userChooseAddressViewControllerDidSelectAddress:)]) {
        [self.delegate userChooseAddressViewControllerDidSelectAddress:[self.addressArr objectAtIndex:indexPath.row]];
        [SVProgressHUD showWithStatus:@"选择地址成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
            [SVProgressHUD dismiss];
        });
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
    return height + 10;
    

}

#pragma mark --------- 点击事件处理

- (void)addAddress{
    UserAddAddressViewController *addAddressVC = [[UserAddAddressViewController alloc] init];
    
    [self.navigationController pushViewController:addAddressVC animated:YES];
    
}

#pragma mark --------- 删除地址

- (void)deleteAddressWithId:(NSString *)ID{
    //    addressId：地址id
    
    NSDictionary *dict = @{@"addressId":ID};
    [YSSCShareBusinessManager.userManager removeUserAddressWithDictionary:dict success:^(id object) {
        ServerStatusObject *severStatus = object;
        if (severStatus.errorCode.integerValue == SeverStateSuccess) {
            [SVProgressHUD showSuccessWithStatus:severStatus.errorMsg];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                [self.navigationController popViewControllerAnimated:YES];
            });
        }else{
            [SVProgressHUD showErrorWithStatus:severStatus.errorMsg];
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}



- (void)alertViewWithID:(NSString *)ID{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提醒" message:@"确定要删除地址吗" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *actiondel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
        [self deleteAddressWithId:ID];
        
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.0) {
        [action setValue:MALLColor forKey:@"_titleTextColor"];
    }
    
    [alertVc addAction:action];
    [alertVc addAction:actiondel];
    [self presentViewController:alertVc animated:YES completion:nil];
    
    
    
}


@end
