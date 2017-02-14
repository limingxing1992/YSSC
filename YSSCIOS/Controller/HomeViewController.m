//
//  HomeViewController.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HomeViewController.h"
#import "HotelViewController.h" // 乡宿页面
#import "YSSCycleScrollView.h"
#import "HotelTableviewCell.h"
#import "HotelManager.h"
#import "HotelClassifyObject.h"
#import "AdObject.h"
#import "HotelAdObject.h"
#import "HotelIndexCityObject.h"
#import "HotelObject.h"
#import "HomeAdWebViewController.h"
#import "CityPickerViewController.h"
#import "AllCityListObject.h"
#import "HotelHotCityObject.h"

@interface HomeViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UISearchBarDelegate,
HotelTableviewCellDelegate
>

/**主列表视图*/
@property (nonatomic, strong) UITableView *tabView;
/**顶部搜索框承载视图*/
@property (nonatomic, strong) UIView *topView;
/**搜索框*/
@property (nonatomic, strong) UISearchBar *searchBar;
/**首页类别模型数组*/
@property (nonatomic, strong) NSMutableArray *classifyObjectArray;
/**首页自营模型数组*/
@property (nonatomic, strong) NSMutableArray *indexVillageArray;
/**首页乡宿模型数组*/
@property (nonatomic, strong) NSMutableArray *hotelListArray;
/**请求乡宿的页数*/
@property (nonatomic, assign) NSInteger page;
/**导航栏城市选择*/
@property (nonatomic, strong) UIButton *cityPickBtn;
/**所有城市列表*/
@property (nonatomic, strong) AllCityListObject *allCityListObject;


@end

static  NSString *const homeCell = @"homeCell";
static  NSString *const hotelCell = @"hotelCell";

@implementation HomeViewController

#define kHomeTableViewCellHeight (SCREEN_HEIGHT - 49) * 0.5

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [SVProgressHUD showWithStatus:@"正在加载数据" ];
    self.page = 1;
    
    [self.tabView.mj_header beginRefreshing];
    [self.tabView.mj_footer beginRefreshing];
    
}

- (void)setupUI{
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.tabView];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.cityPickBtn];
    
    self.searchBar.sd_layout
    .topSpaceToView(self.view, 26)
    .leftSpaceToView(self.view, 14)
    .rightSpaceToView(self.cityPickBtn, 13)
    .heightIs(32.5);
    
    self.cityPickBtn.sd_layout
    .centerYEqualToView(self.searchBar)
    .widthIs(20.5)
    .rightSpaceToView(self.view, 14)
    .heightIs(24.5);
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

#pragma mark - 网络请求

- (void)requestHotelListWithkeyWords:(NSString *)keyWords{
    //    is_index：是否推荐 // 可选 1:推荐 0:不推荐 默认全部
    //classifyId: 主题Id // 可选
    //keywords: 搜索关键词 // 可选
    //    lng：当前位置经度 // 可选
    //    lat：当前位置纬度 // 可选
    //cityName:城市名称 // 可选
    //    page：当前页 // 默认1
    //pageSize:每页记录数 // 默认15条
    
    NSString *pageStr = [NSString stringWithFormat:@"%zd",self.page];
    if (keyWords == nil) {
        keyWords = @"";
    }
    
    
    NSDictionary *dict = @{@"is_index":@"1",
                           @"page":pageStr,
                           @"pageSize":@"10",
                           @"keywords":keyWords};
    
    YSSCWeakObj(self);
    [[BusinessManager shareBusinessManager].hotelManger getHotelListWithDictionary:dict success:^(id object) {
        [SVProgressHUD dismiss];
        if (object) {
             [_tabView.mj_footer endRefreshing];
            HotelObject *hotelObject = object;
            if (hotelObject.data.count > 0) {
                [weakself.hotelListArray addObjectsFromArray:hotelObject.data];
                self.page = self.page + 1;
                [self.tabView reloadData];
            }
//            if (hotelObject.data.count == 0) {
//                [SVProgressHUD showSuccessWithStatus:@"没有更多"];
//            }
            self.searchBar.text = nil;
        }
    }
   failure:^(NSInteger errCode, NSString *errorMsg) {
        [_tabView.mj_footer endRefreshing];
       [SVProgressHUD showErrorWithStatus:@"请检查网络连接"];
   }];

}


//请求推荐城市
- (void)requestClassify{

    [YSSCShareBusinessManager.hotelManger getHomePageCityListSuccess:^(id object) {
        HotelIndexCityObject *indexCityObject = object;
        if (indexCityObject.errorCode.integerValue == SeverStateSuccess) {
            if (indexCityObject.data.indexCityList.count > 0) {
                 [_tabView.mj_header endRefreshing];
                self.classifyObjectArray = indexCityObject.data.indexCityList;
                self.indexVillageArray = indexCityObject.data.indexVillageClassifyList;
                [self.tabView reloadData];
            }else{
                [SVProgressHUD showErrorWithStatus:@"暂无数据，请检查网络"];
            }
        }else{
            [SVProgressHUD showErrorWithStatus:@"请检查网络"];
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [_tabView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"请检查网络连接"];
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.searchBar resignFirstResponder];
}

#pragma mark - 请求所有城市列表
- (void)requestAllCityList{
    [YSSCShareBusinessManager.hotelManger getAllCityListSuccess:^(id object) {
        AllCityListObject *allCityObject = object;
        if (allCityObject.errorCode.integerValue == SeverStateSuccess) {
            self.allCityListObject = allCityObject;
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
//        [SVProgressHUD showErrorWithStatus:errorMsg];
    }];
}




#pragma mark - tableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.classifyObjectArray.count + self.indexVillageArray.count) {
        return kHomeTableViewCellHeight;
    }else{
        return 327;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.classifyObjectArray.count + self.hotelListArray.count + self.indexVillageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row < self.classifyObjectArray.count + self.indexVillageArray.count) {
        if (self.indexVillageArray.count > 0) {
            if (indexPath.row == 0) {
//                HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCell];
//                cell.model = self.classifyObjectArray[indexPath.row];
                HomeTableViewCell *cell = [[HomeTableViewCell alloc] init];
                cell.villageModel = self.indexVillageArray[0];
                return cell;
            }else{
                HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCell];
                cell.model = self.classifyObjectArray[indexPath.row - 1];
                
                return cell;
            }
        }else{
            HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCell];
            cell.model = self.classifyObjectArray[indexPath.row];
        
            return cell;
        }
    }else{
        HotelTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:hotelCell];
        
        HotelDataObject *hotelData = [self.hotelListArray objectAtIndex:(indexPath.row - self.classifyObjectArray.count - self.indexVillageArray.count)];
        cell.delegate = self;
        cell.model = hotelData;
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row < self.classifyObjectArray.count + self.indexVillageArray.count) {
        HotelViewController *hotelVC = [[HotelViewController alloc] init];
        if (self.indexVillageArray.count > 0 && indexPath.row == 0) {
            hotelVC.is_sys = YES;
            IndexVillage *object = self.indexVillageArray[0];
            hotelVC.areaId = object.ID;
        }else{
            IndexCity *object = self.classifyObjectArray[indexPath.row - 1];
            hotelVC.areaId = object.areaId;
        }
        [self.navigationController pushViewController:hotelVC animated:YES];
    }
    
}

#pragma mark - 顶部搜索框代理


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [self requestHotelListWithkeyWords:searchBar.text];
    [searchBar resignFirstResponder];
    
}

#pragma mark - 乡宿Cell代理

-(void)hotelTableViewCell:(HotelTableviewCell *)cell imageViewDidClick:(NSString*)ID name:(NSString *)name{
    
    HotelDetailViewController *hotelDetailVC = [[HotelDetailViewController alloc] init];
    hotelDetailVC.hotelID = ID;
    hotelDetailVC.hotelName = name;
    [self.navigationController pushViewController:hotelDetailVC animated:YES];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    y = (y - 100) / 200.0;
    if (y > 0.5) {
        y = 0.5;
    }else if (y < 0){
        y = 0;
    }
    _topView.alpha = y;
}

#pragma mark - 城市选择
- (void)pickCity{
    CityPickerViewController *cityPickVC = [[CityPickerViewController alloc] init];
    cityPickVC.model = self.allCityListObject;
    [self.navigationController pushViewController:cityPickVC animated:YES];
}

#pragma mark - 懒加载
- (UIView *)topView{
    if (_topView == nil) {
        _topView = [[UIView alloc] init];
        _topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        _topView.alpha = 0.0;
        _topView.backgroundColor = [UIColor blackColor];
        // [_topView addSubview:self.searchBar];
    }
    return _topView;
    
}

- (UITableView *)tabView{
    if (_tabView == nil) {
        _tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 48 ) style:UITableViewStyleGrouped];
        
        _tabView.backgroundColor = [UIColor whiteColor];
        [_tabView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:homeCell];
        [_tabView registerClass:[HotelTableviewCell class] forCellReuseIdentifier:hotelCell];
        _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tabView.delegate = self;
        _tabView.dataSource = self;
        
        YSSCWeakObj(self);
        _tabView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself requestHotelListWithkeyWords:nil];
           
        }];
        _tabView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    
            [weakself requestAllCityList];
            [weakself requestClassify];
            [self.hotelListArray removeAllObjects];
            self.page = 1;
            [_tabView.mj_header endRefreshing];
        }];
        
        
    }
    return _tabView;
}



- (UISearchBar *)searchBar{
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.placeholder = @"输入关键词搜索乡宿";
        [_searchBar setBackgroundImage:[UIImage new]];
        _searchBar.barTintColor = [UIColor whiteColor];//搜索框背景色
        _searchBar.tintColor = MALLColor;//搜索光标色
        [_searchBar setImage:IMAGE(@"classify1") forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [_searchBar setContentMode:UIViewContentModeLeft];
        _searchBar.delegate = self;
    }
    return _searchBar;
}

- (UIButton *)cityPickBtn{
    if (_cityPickBtn == nil) {
        _cityPickBtn = [[UIButton alloc] init];
        [_cityPickBtn setImage:[UIImage imageNamed:@"home_location"] forState:UIControlStateNormal];
        [_cityPickBtn addTarget:self action:@selector(pickCity) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cityPickBtn;
}

- (NSMutableArray *)classifyObjectArray{
    if (_classifyObjectArray == nil) {
        _classifyObjectArray = [NSMutableArray array];
    }
    return _classifyObjectArray;
}

- (NSMutableArray *)hotelListArray{
    if (_hotelListArray == nil) {
        _hotelListArray = [NSMutableArray array];
    }
    return _hotelListArray;
}

- (NSMutableArray *)indexVillageArray{
    if (_indexVillageArray == nil) {
        _indexVillageArray = [[NSMutableArray alloc] init];
    }
    return _indexVillageArray;
}
@end

