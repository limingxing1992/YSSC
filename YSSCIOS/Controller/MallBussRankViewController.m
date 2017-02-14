//
//  MallBussRankViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussRankViewController.h"

@interface MallBussRankViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) MallTopView *topView;//

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *data;//数据源

@end

@implementation MallBussRankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.tableView];
    
    _data = [[NSMutableArray alloc] init];
    [self loadInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    
    self.tableView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
}


#pragma mark ----------------数据请求

- (void)loadInfo{
    YSSCWeakObj(self);
    [YSSCShareBusinessManager.mallManager getBaseMallClassSuccess:^(id responObject) {
        [weakself.data removeAllObjects];
        [weakself.data addObjectsFromArray:responObject];
        [_tableView reloadData];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}


#pragma mark ----------------tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return _data.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = WHITECOLOR;
    cell.textLabel.font = FONT(14);
    cell.textLabel.textColor = BLACKTEXTCOLOR;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.textLabel.text = @"全部产品";
    }else if (indexPath.section == 1){
        STL_ClassifyItemModel *itemModel = _data[indexPath.row];
        cell.textLabel.text = itemModel.cname;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //进入全部商品界面
        MallShopGoodsListViewController *shopListVc = [[MallShopGoodsListViewController alloc] init];
        shopListVc.shopId = self.shopId;
        [self.navigationController pushViewController:shopListVc animated:YES];
    }else{
        STL_ClassifyItemModel *itemModel = _data[indexPath.row];
        //弹出二级分类sheetView
        YSSCWeakObj(self);
        NSLog(@"123");
        [YSSCShareBusinessManager.mallManager getMallSecondClassWithDictonary:@{@"firstClaId":itemModel.ID} success:^(id responObject) {
            UIAlertController *aler = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *actionCancel  =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [aler addAction:actionCancel];
            
            NSArray *ary = responObject;
            if (ary.count == 0) {
                [SVProgressHUD showSuccessWithStatus:@"当前选择分类下无子类商品"];
            }else{
                for (NSInteger i = 0; i < ary.count; i ++) {
                    STL_ClassifyItemModel *itemSecModel = ary[i];
                    UIAlertAction *action = [UIAlertAction actionWithTitle:itemSecModel.cname style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        //跳入商品界面
                        MallShopGoodsListViewController *shopListVc = [[MallShopGoodsListViewController alloc] init];
                        shopListVc.shopId = weakself.shopId;
                        shopListVc.classId = itemSecModel.ID;
                        [weakself.navigationController pushViewController:shopListVc animated:YES];
                    }];
                    [aler addAction:action];
                }
                [weakself presentViewController:aler animated:YES completion:nil];
            }
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            
        }];
    }
}
#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"产品分类" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = GRAYCOLOR;
        _tableView.separatorColor = GRAYCOLOR;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
@end
