//
//  HotelDetailViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelDetailViewController.h"
#import "HotelDetailJudgeViewController.h"
#import "HotelCheckHouseViewController.h"
#import "HotelDetailTopView.h"
#import "HotelDetailChooseView.h"
#import "HotelDetailCell.h"
#import "HotelImpressCell.h"
#import "HotelJudgeCell.h"
#import "HotelMapCell.h"
#import "YSSNavView.h" //导航栏
#import "HotelManager.h"
#import "HotelDetailObject.h"
#import "DatePickerViewController.h"
#import "HotelCommentObject.h"
#import "UIImage+Image.h"

#import "HotelDetailTopCell.h"


@interface HotelDetailViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UIWebViewDelegate,
DatePickerViewControllerDelegate
>

@property (nonatomic, strong) YSSNavView *navBar;
/**页面主要tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**顶部视图*/
//@property (nonatomic, strong) HotelDetailTopView *topView;
/**选择View*/
@property (nonatomic, strong) HotelDetailChooseView *chooseView;
/**确认按钮*/
@property (nonatomic, strong) UIButton *makeSureButton;
/**乡宿印象与预订房型选择flag*/
@property (nonatomic, assign) NSInteger pageFlag;//0：民俗印象 1：预定房型
/**model*/
@property (nonatomic, strong) HotelDetailDataObject *model;
/**乡宿房型模型数组*/
@property (nonatomic, strong) NSMutableArray *roomListArr;
/**乡宿评论模型*/
@property (nonatomic, strong) HotelCommentDataObject *hotelCommentData;
//为了计算impress cell 高度
/**webView*/
@property (nonatomic, strong) UIWebView *webView;
/**impress高度*/
@property (nonatomic, assign) NSInteger impressCellHeight;

@end

@implementation HotelDetailViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [SVProgressHUD showWithStatus:@"正在加载数据" ];
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self requestHotelDetail];
    [self requestRoomList];
    [self requestCommentList];
}

- (void)setupUI{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.makeSureButton];
    [self.view addSubview:self.navBar];
    [self.chooseView setdateArray:self.dateArray];
    [self.chooseView buttonDidClick:^(UIButton *button) {
        switch (button.tag) {
            case 201://乡宿印象 评价 地图
                self.pageFlag = 0;
            {
                [UIView animateWithDuration:0.5 animations:^{
                    self.makeSureButton.frame = CGRectMake(0, SCREEN_HEIGHT - 45, SCREEN_WIDTH, 45);
                }];
            }
                self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 45);
                break;
            case 202://预订房型
                self.pageFlag = 2;
                
            {
                [UIView animateWithDuration:0.5 animations:^{
                    self.makeSureButton.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 45);
                }];
            }
                self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                break;
            case 203://选择日期
                [self datePick];
                
            default:
                break;
        }
        [self.tableView reloadData];
    }];
    
}

#pragma mark - 网络请求
- (void)requestHotelDetail{
    [[BusinessManager shareBusinessManager].hotelManger getHotelDetailWithDictionary:@{@"villageId":self.hotelID} success:^(id object) {
        if (object) {
            self.model = object;
            [self.navBar setTitletext:self.model.hotel_name];
            NSString * htmlcontent = [NSString stringWithFormat:@"<div id=\"webview_content_wrapper\">%@</div>", self.model.impress];
            [self.webView loadHTMLString:htmlcontent baseURL:nil];
            [self.tableView reloadData];
            [SVProgressHUD dismiss];
            [self setupUI];
        }
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}
- (void)requestRoomList{
    NSDictionary *dict = @{@"villageId":self.hotelID,
                           @"comeTime":self.dateArray.firstObject,
                           @"leaveTime":self.dateArray.lastObject};
    [YSSCShareBusinessManager.hotelManger getRoomListWithDictionary:dict success:^(id object) {
        
        [self.roomListArr removeAllObjects];
        [self.roomListArr addObjectsFromArray:object];
        [self.tableView reloadData];
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
    
}
- (void)requestCommentList{
    NSDictionary *dict = @{@"villageId":self.hotelID};
    [YSSCShareBusinessManager.hotelManger getHotelCommentWithDictionary:dict success:^(id object) {
        if (object) {
            HotelCommentObject *commentObj = object;
            if (commentObj.errorCode.integerValue == SeverStateSuccess) {
                self.hotelCommentData = commentObj.data;
                [self.tableView reloadData];
            }
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
    
}

#pragma mark - tableView 代理

//房型信息tableView数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 0;
            break;
        case 1:
            if (self.pageFlag == 0) {
                return 45.5;
            }else{
                return 91.5;
            }
            break;
        case 2:
            break;
        default:
            break;
    }
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }else if (section == 1){
        return 10;
    }else{
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return nil;
            break;
        case 1:
            return self.chooseView;
            break;
        case 2:
            break;
        default:
            break;
    }
    return nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 0;
            break;
        case 2:
            
            if (self.pageFlag == 0) {
                return 3;
            }else{
                return self.roomListArr.count;
            }
            break;
            
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        HotelDetailTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotelDetailTopCell"];
        
        [cell.wantButton addTarget:self action:@selector(wantLive:) forControlEvents:UIControlEventTouchUpInside];
        [cell.alreadyButton addTarget:self action:@selector(lived:) forControlEvents:UIControlEventTouchUpInside];
        [cell.comeInShop addTarget:self action:@selector(mall) forControlEvents:UIControlEventTouchUpInside];
        cell.model = self.model;
        return cell;
    }
    
    if (self.pageFlag == 0 &&indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            HotelImpressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"impressCell"];
            if (cell == nil) {
                cell = [[HotelImpressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"impressCell"];
            }
            cell.backgroundColor = [UIColor whiteColor];
            cell.model = self.model;
            return cell;
        }
        if (indexPath.row == 1) {
            HotelJudgeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"judgeCell"];
            if (cell == nil) {
                cell = [[HotelJudgeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"judgeCell"];
                //只显示第一条评论
                [cell starHidden];
                if (self.hotelCommentData.commentList.count > 0) {
                    cell.commentModel = [self.hotelCommentData.commentList objectAtIndex:0];
                }else{
                    [cell cellHidden];
                }
                //设置cell的Title
                [cell setCommentCount:self.hotelCommentData.totalNum.integerValue score:0];
                cell.backgroundColor = [UIColor whiteColor];
                [cell addTargetBlock:^(UIButton *button) {
                  
                    HotelDetailJudgeViewController *judgeVC = [[HotelDetailJudgeViewController alloc] init];
                    judgeVC.model = self.hotelCommentData;
                    [self.navigationController pushViewController:judgeVC animated:YES];
                }];
            }
            return cell;
        }else {
            HotelMapCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mapCell"];
            if (cell == nil) {
                cell = [[HotelMapCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mapCell"];
                cell.model = self.model;
            }
            [cell buttonDidClick:^(UIButton *button) {
//                SurroundingAreaViewController *surrounVC = [[SurroundingAreaViewController alloc] init];
//                [self.navigationController pushViewController:surrounVC animated:YES];
            }];
            return cell;
        }
        
        
    }else{
        HotelDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotelDetailCell"];
        cell.model = [self.roomListArr objectAtIndex:indexPath.row];
        [cell buttonDidClick:^(UIButton *button) {//预定房型
            
            HotelCheckHouseViewController * checkVC = [[HotelCheckHouseViewController alloc] init];
            checkVC.dateArray = self.dateArray;//传入需要入住的时间
            checkVC.roomTypeModel = cell.model;
            checkVC.hotelName = self.model.hotel_name;
            
            [self.navigationController pushViewController:checkVC animated:YES];
        }];
        return cell;
        
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.pageFlag == 2) {
        HotelCheckHouseViewController * checkVC = [[HotelCheckHouseViewController alloc] init];
        checkVC.dateArray = self.dateArray;//传入需要入住的时间
        checkVC.roomTypeModel = [self.roomListArr objectAtIndex:indexPath.row];
        checkVC.hotelName = self.model.hotel_name;
        [self.navigationController pushViewController:checkVC animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
        return height ;
    }
    
    if (self.pageFlag == 0 &&indexPath.section == 2) {
        if (indexPath.row == 0) {
            if (self.impressCellHeight > 0) {//为了解决跳转到查看房型界面后会返回房型详情页面，乡宿印象cell高度变大的问题
                return self.impressCellHeight;
            }
            if (_webView.frame.size.height < 55) {
                return 55;
            }
            self.impressCellHeight = _webView.frame.size.height;
            return _webView.frame.size.height ;
            
        }
        
        CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
        return height + 10;
        
    }else{
        return 88;
    }
}

#pragma mark - webView 代理
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //获取页面高度（像素）
    NSString * clientheight_str = [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
    float clientheight = [clientheight_str floatValue];
    //设置到WebView上
    webView.frame = CGRectMake(0, 0, self.view.frame.size.width, clientheight);
    //获取WebView最佳尺寸（点）
    CGSize frame = [webView sizeThatFits:webView.frame.size];
    //获取内容实际高度（像素）
    NSString * height_str= [webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('webview_content_wrapper').offsetHeight + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-top'))  + parseInt(window.getComputedStyle(document.getElementsByTagName('body')[0]).getPropertyValue('margin-bottom'))"];
    float height = [height_str floatValue];
    //内容实际高度（像素）* 点和像素的比
    height = height * frame.height / clientheight;
    //再次设置WebView高度（点）
    webView.frame = CGRectMake(0, 0, self.view.frame.size.width, height + 55);
    [self.tableView reloadData];
}

#pragma mark - DatePickerViewController 代理

//更新数组,重新请求roomList
- (void)datePickerVCSelectedDate:(NSMutableArray *)dateArray{
    [self.dateArray removeAllObjects];
    self.dateArray = dateArray;
    [self.chooseView setdateArray:dateArray];
    [self requestRoomList];
}


#pragma mark - 跳转到日期选择
- (void)datePick{
    DatePickerViewController *datePickVC = [[DatePickerViewController alloc] init];
    datePickVC.delegate = self;
    [self presentViewController:datePickVC animated:YES completion:nil];
}

#pragma mark - 导航栏事件处理

//转发
- (void)transmit{
    [YSSCShareBusinessManager.travelManager shareWithParameters:nil target:self];
}
//商城
- (void)mall{
    
    if (self.model.shop_id.length > 0) {
        MallBussViewController *mallVC = [[MallBussViewController alloc] init];
        mallVC.Id = self.model.shop_id;
        [self.navigationController pushViewController:mallVC animated:YES];
    }else{
        [SVProgressHUD showSuccessWithStatus:@"房东暂未开通店铺"];
    }
    
}
#pragma mark - 想住住过点击处理
//想住
- (void)wantLive:(YSSGreenBorderButton *)button{
    
    if ([YSSCShareBusinessManager.loginManger isLogin]) {
        NSDictionary *dict = @{@"linkId":self.model.ID,
                               @"collectType":@"50"};
        [YSSCShareBusinessManager.travelManager getFavoriteTravelWithParameters:dict success:^(id responObject) {
            [SVProgressHUD showSuccessWithStatus:(NSString *)responObject];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self requestHotelDetail];
            });
            
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            
        }];
    }else{
        [SVProgressHUD showErrorWithStatus:@"未登录"];
    }

}
//住过
- (void)lived:(YSSGreenBorderButton *)button{
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    CGFloat delta = (y - 100) / 200.0;
        if (delta > 0.45){
            [_navBar setTitleText:_hotelName imageArrays:@[IMAGE(@"classify45")] selecterArys:@[@"transmit"] target:self isShowLeftBtn:YES];
            [_navBar setLeftImage:IMAGE(@"classify15")];
            [_navBar displayShadow];
            
        }else{
            [_navBar setTitleText:self.hotelName imageArrays:@[IMAGE(@"classify35")] selecterArys:@[@"transmit"] target:self isShowLeftBtn:YES];
            [_navBar setLeftImage:IMAGE(@"classify36")];
            [_navBar hideShadow];
        }
    
    if (delta > 0.95) {
        delta = 0.95;
        
    }else if (delta < 0){
        delta = 0;
    }
    _navBar.coverView.alpha = delta;
}

#pragma mark - 立即预定
- (void)makeSureButtonClick{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"makeSureSchedule" object:nil];
}


#pragma mark - 懒加载
- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor clearColor];
        _navBar.coverView.backgroundColor = [UIColor whiteColor];
        [_navBar hideShadow];
        
        _navBar.coverView.alpha = 0.0;
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
        
        [_navBar setTitleText:self.hotelName imageArrays:@[IMAGE(@"classify35")] selecterArys:@[@"transmit"] target:self isShowLeftBtn:YES];
        [_navBar setLeftImage:IMAGE(@"classify36")];
    }
    return _navBar;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 45) style:UITableViewStylePlain];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = BACKGROUNDCOLOR;
        
        
        [_tableView registerClass:[HotelDetailCell class] forCellReuseIdentifier:@"hotelDetailCell"];
        [_tableView registerClass:[HotelDetailTopCell class] forCellReuseIdentifier:@"hotelDetailTopCell"];
    }
    return _tableView;
}

//- (HotelDetailTopView *)topView{
//    if (_topView == nil) {
//        _topView = [[HotelDetailTopView alloc] init];
//        [_topView.wantButton addTarget:self action:@selector(wantLive:) forControlEvents:UIControlEventTouchUpInside];
//        [_topView.alreadyButton addTarget:self action:@selector(lived:) forControlEvents:UIControlEventTouchUpInside];
//        [_topView.comeInShop addTarget:self action:@selector(mall) forControlEvents:UIControlEventTouchUpInside];
//        
//    }
//    return _topView;
//}

- (HotelDetailChooseView *)chooseView{
    if (_chooseView == nil) {
        _chooseView = [[HotelDetailChooseView alloc] init];
    }
    return _chooseView;
}

- (UIButton *)makeSureButton{
    if (_makeSureButton == nil) {
        _makeSureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _makeSureButton.frame = CGRectMake(0, SCREEN_HEIGHT - 45, SCREEN_WIDTH, 45);
        [_makeSureButton setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
        [_makeSureButton setTitle:@"立即预订" forState:UIControlStateNormal];
        [_makeSureButton addTarget:self action:@selector(makeSureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _makeSureButton;
}

- (NSMutableArray *)roomListArr{
    if (_roomListArr == nil) {
        _roomListArr = [NSMutableArray array];
    }
    return _roomListArr;
}
- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.scrollView.scrollEnabled = NO;
        [_webView sizeToFit];
    }
    return _webView;
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

@end
