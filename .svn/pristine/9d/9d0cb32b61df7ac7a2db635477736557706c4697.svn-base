//
//  CityPickerViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "CityPickerViewController.h"
#import "CityPickerHotCityCell.h"
#import "CityPickerCurrentCityCell.h"
#import "CitySearchResultTableViewController.h"
#import "HotelHotCityObject.h"
#import "AllCityListObject.h"


@interface CityPickerViewController ()

#define BUTTON_WIDTH (SCREEN_WIDTH - 125) / 4
#define BUTTON_HEIGHT 30
<
UITableViewDelegate,
UITableViewDataSource,
UISearchBarDelegate
>

{
    //    UITableView *_tableView;
    //    UISearchBar *_searchBar;
    // UISearchDisplayController *_displayController;
    
    NSMutableArray *cities;
    NSMutableArray *titleArray;
    NSMutableArray *resultArray;
}

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**搜索框*/
@property (nonatomic, strong) UISearchBar *citySearchBar;
///**城市字典*/
//@property (nonatomic, strong) NSMutableDictionary *cityDictionary;
/**蒙版*/
@property (nonatomic, strong) UIView *coverView;
/**搜索结果*/
@property (nonatomic, strong) CitySearchResultTableViewController *searchResultVC;
/**hotCitys模型*/
@property (nonatomic, strong) NSArray *hotCitysArray;
/**hotCities字符串属猪*/
@property (nonatomic, strong) NSMutableArray *hotCities;
/**hotCityObject*/
@property (nonatomic, strong) HotelHotCityObject *hotCityObject;


@end

@implementation CityPickerViewController




#pragma mark - 生命周期


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self setupUI];
    [self requestHotCity];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.citySearchBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.coverView];
    [self.view addSubview:self.searchResultVC.view];
    [self addChildViewController:self.searchResultVC];
    
    self.coverView.sd_layout
    .topEqualToView(self.tableView)
    .leftEqualToView(self.tableView)
    .bottomEqualToView(self.tableView)
    .rightEqualToView(self.tableView);
    
    self.searchResultVC.view.sd_layout
    .topEqualToView(self.tableView)
    .leftEqualToView(self.tableView)
    .bottomEqualToView(self.tableView)
    .rightEqualToView(self.tableView);
}

#pragma mark - 请求热门城市
- (void)requestHotCity{
    [YSSCShareBusinessManager.hotelManger getHotelHotCitySuccess:^(id object) {
        HotelHotCityObject *hotCityObject = object;
        if (hotCityObject.errorCode.integerValue == SeverStateSuccess) {
            self.hotCityObject = hotCityObject;
            [self.tableView reloadData];
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}

#pragma mark - tableView 代理

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 28 + 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 28)];
    headerView.backgroundColor = BACKGROUNDCOLOR;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 15, 28)];
    label.font = [UIFont systemFontOfSize:14.0];
    label.textColor = BLACKTEXTCOLOR;
    [headerView addSubview:label];
    
    if (section == 0) { //当前位置
        label.text = @"当前位置";
    }else if (section == 1){
        label.text = @"热门目的地";
    }else {
        label.text = [titleArray objectAtIndex:section - 2];
    }
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section > 1) {
//        NSString *cityKey = [titleArray objectAtIndex:section - 2];
//        NSArray *array = [self.cityDictionary objectForKey:cityKey];
        
        LetterList *letterListObject = [_model.data.allCityList objectAtIndex:section - 2];
        
        return letterListObject.cityList.count;
       // return [array count];
    }else{
        return 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        CityPickerCurrentCityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityPickerCurrentCityCell"];
        if (cell == nil) {
            cell = [[CityPickerCurrentCityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cityPickerCurrentCityCell"];
        }
        [cell buttonWhenClick:^(UIButton *button) {
            NSString *currentCityStr = button.currentTitle;
            
            NSString *tempAreaId = @"";
            for ( LetterList *cityListObject in self.model.data.allCityList) {
                for (City *city in cityListObject.cityList) {
                    if ([currentCityStr containsString:city.aname]) {
                        tempAreaId = city.areaId;
                    }
                }
            }
            if (tempAreaId.length > 0) {
                HotelViewController *hotelVC = [[HotelViewController alloc] init];
                hotelVC.areaId = tempAreaId;
                [self.navigationController pushViewController:hotelVC animated:YES];
            }else{
                [SVProgressHUD showErrorWithStatus:@"此城市暂未开通乡宿"];
            }
        }];
        
        return cell;
    }else if (indexPath.section == 1){
        CityPickerHotCityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityPickerHotCityCell"];
        if (cell == nil) {
            cell = [[CityPickerHotCityCell alloc] initWithModel:self.hotCityObject reuseIdentifier:@"cityPickerHotCityCell"];
        }
        cell.model = self.hotCityObject;
        [cell buttonWhenClick:^(UIButton *button) {
            HotelViewController *hotelVC = [[HotelViewController alloc] init];
            hotelVC.areaId = [NSString stringWithFormat:@"%zd",button.tag];
            [self.navigationController pushViewController:hotelVC animated:YES];
        }];
        NSMutableArray *cityArr = [NSMutableArray array];
        for (HotelHotCityDataObject *city in self.hotCities) {
            [cityArr addObject:city.aname];
        }
        
        return cell;
    }else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cityCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            NSString *cityKey = [titleArray objectAtIndex:indexPath.section - 2];
            LetterList *letterListObject = [_model.data.allCityList objectAtIndex:indexPath.section - 2];
            City *city = letterListObject.cityList[indexPath.row];
//            
////            NSArray *array = [self.cityDictionary objectForKey:cityKey];
            cell.textLabel.font = FONT(12);
            cell.textLabel.textColor = BLACKTEXTCOLOR;
//            cell.textLabel.text = array[indexPath.row];
            cell.textLabel.text = city.aname;
        }
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section > 1) {
        LetterList *letterListObject = [_model.data.allCityList objectAtIndex:indexPath.section - 2];
        City *city = letterListObject.cityList[indexPath.row];
        HotelViewController *hotelVC = [[HotelViewController alloc] init];
        hotelVC.areaId = city.areaId;
        [self.navigationController pushViewController:hotelVC animated:YES];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 44;
    }
    
    if (indexPath.section == 1) {
        return ceil((float)[self.hotCityObject.data count] / 4) * (BUTTON_HEIGHT + 8) + 8;
    }else {
        return 35;
    }
    
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return titleArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return titleArray.count + 2;
}

#pragma mark - 初始化数据

- (void)initData{
    cities = [[NSMutableArray alloc] init];
//    NSArray *allCityKeys = [self.cityDictionary allKeys];
//    for (int i = 0; i < [self.cityDictionary count]; i++) {
//        [cities addObjectsFromArray:[self.cityDictionary objectForKey:[allCityKeys objectAtIndex:i]]];
//    }
//    NSLog(@"===%@",cities);
    
    for ( LetterList *cityListObject in self.model.data.allCityList) {
        for (City *city in cityListObject.cityList) {
            [cities addObject:city.aname];
        }
    }
    titleArray = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 26; i++) {
//        if (i == 8 || i == 14 || i == 20 || i== 21) {
//            continue;
//        }
//        NSString *cityKey = [NSString stringWithFormat:@"%c",i+65];
//        [titleArray addObject:cityKey];
//    }
    
    
    for ( LetterList *cityListObject in self.model.data.allCityList) {
        [titleArray addObject:cityListObject.key];
    }
    
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    self.coverView.hidden = NO;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    self.coverView.hidden = YES;
}



- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length) {
        _searchResultVC.view.hidden = NO;
        NSMutableArray *searchResults = [NSMutableArray array];
        for (int i = 0; i < cities.count; i ++) {
            NSRange titleResult=[cities[i] rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
            if (titleResult.length>0) {
                [searchResults addObject:cities[i]];
            }
        }
        self.searchResultVC.citysArr = searchResults;
    } else{
        _searchResultVC.view.hidden = YES;
    }

}

#pragma mark - 蒙版点击事件处理

- (void)coverViewClick{
    self.coverView.hidden = YES;
    self.citySearchBar.text = nil;
    [self.citySearchBar resignFirstResponder];
}


#pragma mark - 懒加载

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"选择城市"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            //            [weakself dismissViewControllerAnimated:YES completion:nil];
            [weakself.navigationController  popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (UISearchBar *)citySearchBar{
    if (_citySearchBar == nil) {
        _citySearchBar = [[UISearchBar alloc] init];
        _citySearchBar.searchBarStyle = UISearchBarStyleMinimal;
        _citySearchBar.frame = CGRectMake(0, 64, SCREEN_WIDTH, 44);
        _citySearchBar.placeholder = @"城市/行政区/拼音";
        [_citySearchBar setBackgroundImage:[UIImage new]];
        // _citySearchBar.barTintColor = [UIColor redColor];//搜索框背景色
        _citySearchBar.tintColor = [UIColor blackColor];//搜索光标色
        [_citySearchBar setImage:IMAGE(@"a1") forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [_citySearchBar setContentMode:UIViewContentModeLeft];
        _citySearchBar.delegate = self;
    }
    return _citySearchBar;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT - 108)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        [_tableView registerClass:[CityPickerCurrentCityCell class] forCellReuseIdentifier:@"cityPickerCurrentCityCell"];
        
    }
    return _tableView;
}

//- (NSMutableDictionary*)cityDictionary{
//    if (_cityDictionary == nil) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
//        _cityDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
//    }
//    return _cityDictionary;
//}

- (UIView *)coverView{
    if (_coverView == nil) {
        _coverView = [[UIView alloc] init];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.5;
        _coverView.hidden = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverViewClick)];
        [_coverView addGestureRecognizer:tap];
    }
    return _coverView;
}

- (CitySearchResultTableViewController *)searchResultVC{
    if (_searchResultVC == nil) {
        _searchResultVC = [[CitySearchResultTableViewController alloc] init];
        
        _searchResultVC.view.hidden = YES;
    }
    return _searchResultVC;
}
- (NSMutableArray *)hotCities{
    if (_hotCities == nil) {
        _hotCities = [NSMutableArray array];
    }
    return _hotCities;
}

@end
