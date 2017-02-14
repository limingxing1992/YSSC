//
//  HotelViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelViewController.h"
#import "HotelTableviewCell.h"
#import "HotelChooseCell.h"
#import "DatePickerViewController.h"
#import "HotelDetailViewController.h"
#import "CityPickerViewController.h"
#import "YSSNavView.h"
#import "HotelManager.h"
#import "HotelObject.h"
#import "HotelIndexCityObject.h"
#import "HotelTableViewADCell.h"
#import "HotelClassifyObject.h"

@interface HotelViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    HotelTableviewCellDelegate,
    DatePickerViewControllerDelegate,
    HotelTableViewADCellDelegate
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) YSSNavView *navBar;
/**chooseCell*/
@property (nonatomic, strong) HotelChooseCell *hotelChooseCell;
/**乡宿模型数组*/
@property (nonatomic, strong) NSArray *hotelObjectArr;
/**推荐乡宿*/
@property (nonatomic, strong) HotelObject *hotelAdObject;
/**日期--默认是今天和明天*/
@property (nonatomic, strong) NSMutableArray *dateArray;
/**网络请求参数字典*/
@property (nonatomic, strong) NSMutableDictionary *ParameterDict;
/**网络请求page*/
@property (nonatomic, assign) NSInteger page;

@end

static NSString *const kHotelCell = @"kHotelCell";
static NSString *const kHotelADCell = @"kHotelADCell";

@implementation HotelViewController

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
        _tableView.backgroundColor = BACKGROUNDCOLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[HotelTableviewCell class] forCellReuseIdentifier:kHotelCell];
        [_tableView registerClass:[HotelTableViewADCell class]forCellReuseIdentifier:kHotelADCell];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        YSSCWeakObj(self);
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself requestHotelList];
            [_tableView.mj_footer endRefreshing];
        }];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakself.page = 1;
            [weakself requestHotelList];
            [_tableView.mj_header endRefreshing];
        }];
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
        [_navBar setTitletext:@"乡宿"];
    }
    return _navBar;
}

- (NSMutableArray *)dateArray{
    if (_dateArray == nil) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *today = [dateFormatter stringFromDate:[NSDate date]];
        NSString *tomorrow = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:86400]];
        _dateArray = [NSMutableArray arrayWithObjects:today, tomorrow, nil];
    }
    return _dateArray;
}

- (NSMutableDictionary *)ParameterDict{
    if (_ParameterDict == nil) {
        _ParameterDict = [[NSMutableDictionary alloc] init];
    }
    return _ParameterDict;
}

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navBar];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.tableView.mj_header beginRefreshing];
    [self requestRecommendationHotel];
}

- (void)requestHotelList{
    //    is_index：是否推荐    // 可选 1:推荐 0:不推荐 默认全部
    //    classifyId: 主题Id   // 可选
    //    keywords: 搜索关键词  // 可选
    //    lng：当前位置经度      // 可选
    //    lat：当前位置纬度      // 可选
    //    cityName:城市名称     // 可选
    //    page：当前页          // 默认1
    //    pageSize:每页记录数   // 默认15条
    [self.ParameterDict setObject:[NSString stringWithFormat:@"%zd",self.page] forKey:@"page"];
    [self.ParameterDict setObject:@"0" forKey:@"is_index"];
    if (_is_sys) {
        [self.ParameterDict setObject:self.areaId forKey:@"classifyId"];
    }else{
        [self.ParameterDict setObject:self.areaId forKey:@"cityId"];
    }
//    NSLog(@"民宿列表%@",self.ParameterDict);
    
    [[BusinessManager shareBusinessManager].hotelManger getHotelListWithDictionary:self.ParameterDict success:^(id object) {
            if (object) {
                HotelObject *hotelDataObject = object;
                    if (hotelDataObject.data.count > 0) {
                        self.hotelObjectArr = hotelDataObject.data;
                        [self.tableView reloadData];
                        self.page += 1;
                    }
                
               
                if (self.hotelObjectArr.count <=  2) {
                    
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.mj_footer.hidden = NO;
                    [_tableView.mj_footer setState:MJRefreshStateIdle];
                }
                
                if (hotelDataObject.data.count < 15) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
                
                
                
                if (self.page == 1 && hotelDataObject.data.count == 0) {//这个城市没有开通
                    [SVProgressHUD showErrorWithStatus:@"暂未开通更多乡宿"];
                    
                }
                }
            }
        failure:^(NSInteger errCode, NSString *errorMsg) {
             NSLog(@"乡宿列表获取失败%@",errorMsg);
         }];
}


#pragma mark - 请求轮播图数据
- (void)requestRecommendationHotel{
    
    NSString *areaId = self.areaId ? self.areaId : @"";
    NSMutableDictionary *recommendationDict = [@{@"is_index":@"1",
                                                } mutableCopy];
    if (_is_sys) {
        [recommendationDict setValue:areaId forKey:@"classifyId"];
    }else{
        [recommendationDict setValue:areaId forKey:@"cityId"];
    }
    NSLog(@"轮播图%@",recommendationDict);
    [[BusinessManager shareBusinessManager].hotelManger getHotelListWithDictionary:recommendationDict success:^(id object) {
        if (object) {
            HotelObject *hotelDataObject = object;
            if (hotelDataObject.data.count > 0) {
                self.hotelAdObject = hotelDataObject;
                [self.tableView reloadData];
            }
            if (hotelDataObject.data.count == 0) {//这个城市没有开通
                [SVProgressHUD showErrorWithStatus:@"暂时没有更多推荐"];
            }
            
        }
    }
       failure:^(NSInteger errCode, NSString *errorMsg) {
           NSLog(@"乡宿列表获取失败%@",errorMsg);
       }];
}

#pragma mark - tableView代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 ) {//日期选择
        return 93;
    }else if (indexPath.row == 1){//轮播图
        return 300;
    }else{
        return 327;//cell的正常高度 + 分隔线的高度
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.hotelObjectArr.count + 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {//日期选择和乡宿类型选择
        HotelChooseCell *cell = [[HotelChooseCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
        self.hotelChooseCell = cell;
        [self.hotelChooseCell.choseBtn setCheckInDate:self.dateArray.firstObject CheckoutDate:self.dateArray.lastObject];
        [cell chooseDateButtonClick:^(UIButton *button) {
            DatePickerViewController *datePickerVC = [[DatePickerViewController alloc] init];
            [self presentViewController:datePickerVC animated:YES completion:nil];
            datePickerVC.delegate = self;
        }];

        return cell;
        
    }else if (indexPath.row == 1){
        HotelTableViewADCell *cell = [tableView dequeueReusableCellWithIdentifier:kHotelADCell];
        cell.delegate = self;
        cell.model = self.hotelAdObject;
        return cell;
    }else{
        HotelTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHotelCell];
        cell.delegate = self;
        cell.model = [self.hotelObjectArr objectAtIndex:indexPath.row - 2];
        return cell;
    }

}

#pragma mark - 日期选择控制器Delegate
- (void)datePickerVCSelectedDate:(NSMutableArray *)dateArray{
    [self.hotelChooseCell.choseBtn setCheckInDate:dateArray.firstObject CheckoutDate:dateArray.lastObject];
    [self.dateArray removeAllObjects];
    self.dateArray = dateArray;
}

#pragma mark - hotelTableviewCellDelegate
-(void)hotelTableViewCell:(HotelTableviewCell *)cell imageViewDidClick:(NSString*)ID name:(NSString *)name{
    HotelDetailViewController *hotelDetailVC = [[HotelDetailViewController alloc] init];
    hotelDetailVC.hotelID = ID;
    hotelDetailVC.hotelName = name;
    hotelDetailVC.dateArray = [self.dateArray mutableCopy];
    [self.navigationController pushViewController:hotelDetailVC animated:YES];
}


#pragma mark - 轮播图cell代理

- (void)hotelTableViewADCell:(HotelTableViewADCell *)cell didSelectAtIndex:(NSInteger)index model:(HotelDataObject *)model{
    HotelDetailViewController *hotelDetailVC = [[HotelDetailViewController alloc] init];
    hotelDetailVC.hotelID = model.ID;
    hotelDetailVC.hotelName = model.hotel_name;
    hotelDetailVC.dateArray = self.dateArray;
    [self.navigationController pushViewController:hotelDetailVC animated:YES];
 
}

@end
