//
//  UserHotelCollectionViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/20.
//  Copyright © 2016年 zzz. All rights reserved.
//想住

#import "UserHotelCollectionViewController.h"
#import "HotelTableviewCell.h"
#import "HotelObject.h"


@interface UserHotelCollectionViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    HotelTableviewCellDelegate
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;

/**想住列表*/
@property (nonatomic, strong) NSMutableArray *hotelArray;

/**page*/
@property (nonatomic, assign) NSInteger page;

/**标记想住0或者住过1*/
@property (nonatomic, assign) NSInteger flag;

@end

@implementation UserHotelCollectionViewController

- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"选择城市"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController  popViewControllerAnimated:YES];
        };
        
    }
    return _navBar;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HotelTableviewCell class] forCellReuseIdentifier:@"hotelTableviewCell"];
        _tableView.backgroundColor = GRAYCOLOR;
        
        YSSCWeakObj(self);
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            if (self.flag == 0) {
                [_navBar setTitletext:@"想住"];
                [weakself requestHotelWantList];
            }else{
                [self requestHotelLivedList];
                [_navBar setTitletext:@"住过"];
            }
            
            
        }];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakself.page = 1;
           
            if (self.flag == 0) {
                [_navBar setTitletext:@"想住"];
                [weakself requestHotelWantList];
            }else{
                [self requestHotelLivedList];
                [_navBar setTitletext:@"住过"];
            }
            
            
        }];
    }
    return _tableView;
}
- (NSMutableArray *)hotelArray{
    if (_hotelArray == nil) {
        _hotelArray = [[NSMutableArray alloc] init];;
    }
    return _hotelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [self.tableView.mj_header beginRefreshing];
//    if (self.flag == 0) {
//        [self requestHotelWantList];
//        [_navBar setTitletext:@"想住"];
//
//    }
//    if (self.flag == 1) {
//        [self requestHotelLivedList];
//        [_navBar setTitletext:@"住过"];
//
//    }
}

- (instancetype)initWithFlag:(NSInteger)flag{
    self = [super init];
    if (self) {
        self.flag = flag;
    }
    return self;
}

- (void)setupUI{
    self.page = 1;
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
//想住
- (void)requestHotelWantList{
    if (_page == 1) {
        [self.hotelArray removeAllObjects];
    }
    
    
    NSDictionary *dict = @{@"page":[NSString stringWithFormat:@"%ld",_page],
                           @"pageSize":@"5"};
    [YSSCShareBusinessManager.userManager  getHotelCollectWithDictionary:dict success:^(id object) {
        if (object) {
            HotelObject *hotelObject = object;
            [_tableView.mj_footer endRefreshing];
            [self.tableView.mj_header endRefreshing];
            if (hotelObject.errorCode.integerValue == SeverStateSuccess) {
                if (hotelObject.data.count > 0) {
                    [self.hotelArray addObjectsFromArray:hotelObject.data];
                    [self.tableView reloadData];
                    _page ++;
                }
                
                if (hotelObject.data.count < 5) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
                NSInteger totalcell = SCREEN_HEIGHT - 64/337.5;
                if (self.hotelArray.count <=  totalcell) {
                 
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.mj_footer.hidden = NO;
                    [_tableView.mj_footer setState:MJRefreshStateIdle];
                }
             
                
                
            }
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [self.tableView.mj_header endRefreshing];
        [_tableView.mj_footer endRefreshing];
    }];
}
//住过
- (void)requestHotelLivedList{
    if (_page == 1) {
        [self.hotelArray removeAllObjects];
    }
    
    NSDictionary *dict = @{@"page":[NSString stringWithFormat:@"%ld",_page],
                           @"pageSize":@"5"};
    [YSSCShareBusinessManager.userManager getHotelLivedWithDictionary:dict success:^(id object) {
        if (object) {
            HotelObject *hotelObject = object;
            [_tableView.mj_footer endRefreshing];
            [self.tableView.mj_header endRefreshing];
            if (hotelObject.errorCode.integerValue == SeverStateSuccess) {
                if (hotelObject.data.count > 0) {
                    
                    [self.hotelArray addObjectsFromArray:hotelObject.data];
                    [self.tableView reloadData];
                    _page ++;
                }
                
                NSInteger totalcell = (SCREEN_HEIGHT - 64)/337.5;
                if (self.hotelArray.count <=  totalcell) {
                    
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.mj_footer.hidden = NO;
                    [_tableView.mj_footer setState:MJRefreshStateIdle];
                }
                
                if (hotelObject.data.count < 5) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshing];
                }
                
                
            }
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [self.tableView.mj_header endRefreshing];
        [_tableView.mj_footer endRefreshing];
    }];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.hotelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HotelTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotelTableviewCell"];
    
    cell.model = self.hotelArray[indexPath.row];
    cell.delegate = self;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 337.5;
}

- (void)hotelTableViewCell:(HotelTableviewCell *)cell imageViewDidClick:(NSString *)ID name:(NSString *)name{
    
    if (cell.model.business_status) {//如果是营业状态跳转到详情页
        HotelDetailViewController *hotelDetailVC = [[HotelDetailViewController alloc] init];
        hotelDetailVC.hotelID = ID;
        hotelDetailVC.hotelName = name;
        [self.navigationController pushViewController:hotelDetailVC animated:YES];
    }else{
        [SVProgressHUD showInfoWithStatus:@"抱歉，商家暂时未营业。"];
        
    }
    
}

@end
