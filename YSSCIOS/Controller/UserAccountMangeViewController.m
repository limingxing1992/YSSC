//
//  UserAccountMangeViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserAccountMangeViewController.h"
#import "YSSNavView.h"
#import "UserAccountMangeCell.h"
#import "UserChangePassWordViewController.h"
#import "UserChangePhoneNumViewController.h"
#import "UserChangeNameViewController.h"
#import "UserChooseAddressViewController.h"
#import "UserBalanceViewController.h"
#import "UserInfoObject.h"

@interface UserAccountMangeViewController ()

<
UITableViewDelegate,
UITableViewDataSource,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**数据*/
@property (nonatomic, strong) NSArray *dataArr;
/**userDate*/
@property (nonatomic, strong) NSMutableDictionary *userData;
/**退出账号按钮*/
@property (nonatomic, strong) UIButton *quitButton;
/**icon*/
@property (nonatomic, strong) UIImageView *iconImageView;


@end


@implementation UserAccountMangeViewController

#pragma mark --------- 懒加载

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"账户信息"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (NSMutableDictionary *)userData{
    if (_userData == nil) {
        _userData = [NSMutableDictionary dictionary];
    }
    return _userData;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
    }
    return _tableView;
}

- (NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = @[@[@"头像",@"用户名",@"手机号码",@"送货地址"],@[@"重置密码"]];
    }
    return _dataArr;
}

- (UIButton *)quitButton{
    if (_quitButton == nil) {
        _quitButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 378, SCREEN_WIDTH, 48)];
        [_quitButton setTitle:@"退出当前账号" forState: UIControlStateNormal];
        _quitButton.backgroundColor = [UIColor whiteColor];
        [_quitButton setTitleColor:YSSCRGBColor(242, 101, 79) forState:UIControlStateNormal];
        [_quitButton addTarget:self action:@selector(accountQuit) forControlEvents:UIControlEventTouchUpInside];
    }
    return _quitButton;
}

#pragma mark --------- 生命周期


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    //测试数据
    //    self.userData = [NSMutableDictionary dictionaryWithObjectsAndKeys:self.userModel.data.name,@"name",self.userModel.data.phone,@"phoneNumber", nil];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.quitButton];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

#pragma mark --------- tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *arr = self.dataArr[section];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserAccountMangeCell *cell = [[UserAccountMangeCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"accountCell"];
    NSArray *arr = self.dataArr[indexPath.section];
    cell.textLabel.text = arr[indexPath.row];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        self.iconImageView = cell.iconView;
        if (self.userModel.data.head_img) {
            [cell.iconView sd_setImageWithURL:[NSURL URLWithString:self.userModel.data.head_img]];
        }
    }
    if (indexPath.section == 0 && indexPath.row == 1) {//用户名
        cell.detailTextLabel.text = self.userModel.data.nickname;

    }
    if (indexPath.section == 0 && indexPath.row == 2) {//电话号码
        cell.detailTextLabel.text = self.userModel.data.phone;
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {//头像
        [self selectImage];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {//用户名
        UserChangeNameViewController *nameVC = [[UserChangeNameViewController alloc] init];
        
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:nameVC animated:YES];
        nameVC.name = self.userModel.data.nickname;
        
        [nameVC callBack:^(NSString *str) {
            self.userModel.data.name = str;
            [self.tableView reloadData];
        }];
        self.hidesBottomBarWhenPushed = NO;
        
    }
    if (indexPath.section == 0 && indexPath.row == 2) {//电话号码
        UserChangePhoneNumViewController *phoneNumVC = [[UserChangePhoneNumViewController alloc] init];
        phoneNumVC.phone = self.userModel.data.phone;
        [self.navigationController pushViewController:phoneNumVC animated:YES];
        
    }
    if (indexPath.section == 0 && indexPath.row == 3) {//送货地址
        UserChooseAddressViewController *addressVC = [[UserChooseAddressViewController alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:addressVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
        
    }
    if (indexPath.section == 1 && indexPath.row == 0) {//重置密码
        UserChangePassWordViewController *passWordVC = [[UserChangePassWordViewController alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:passWordVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)accountQuit{
    [YSSCShareBusinessManager.loginManger quitLogin];
    [SVProgressHUD showWithStatus:@"正在退出"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [self.navigationController popViewControllerAnimated:YES];
    });
    
}


- (void)selectImage{
    
    
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    
    pickerController.allowsEditing = YES;
    pickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;//图片分组列表样式
    //UIImagePickerControllerSourceTypePhotoLibrary,直接全部呈现系统相册
    //UIImagePickerControllerSourceTypeCamera//调取摄像头
    pickerController.delegate = self;
    //使用模态呈现相册
    [self.navigationController presentViewController:pickerController animated:YES completion:^{
        
    }];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIButton *button = (UIButton *)[self.view viewWithTag:1004];
    UIImage *resultImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    [button setImage:[resultImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];//如果按钮创建时用的是系统风格UIButtonTypeSystem，需要在设置图片一栏设置渲染模式为"使用原图"
    
    //使用模态返回到软件界面
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    
    if (resultImage) {
        [YSSCShareBusinessManager.travelManager upLoadImageWith:@[resultImage] parameters:nil urlString:@"app/user/saveAvatar.do" success:^(id responObject) {
            
            [SVProgressHUD showSuccessWithStatus:responObject];
            
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            [SVProgressHUD showErrorWithStatus:errorMsg];
        }];
        self.iconImageView.image = resultImage;
        
    }else{
        [SVProgressHUD showErrorWithStatus:@"选择照片失败"];
        
    }
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
