//
//  HotelCheckHouseViewController.m
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelCheckHouseViewController.h"
#import "HotelCheckImageCell.h"
#import "HotelCheckEstablishmentCell.h"
#import "HotelCheckMessageCell.h"
#import "YSSNavView.h"
#import "HotelSubmitOrderViewController.h"
#import "HotelManager.h"
#import "RoomDetailObject.h"
#import "RoomAttr.h"
#import "RoomTypeObject.h"
#import "HotelOrderObject.h"
#import "UIImage+Image.h"


#import "LoginViewController.h"


@interface HotelCheckHouseViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    UIWebViewDelegate
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**立即预订*/
@property (nonatomic, strong) UIButton *makeSureButton;
/**model*/
@property (nonatomic, strong) RoomDetailObject *roomDetailModel;
/**webView*/
@property (nonatomic, strong) UIWebView *webView;


@end

@implementation HotelCheckHouseViewController

#pragma mark - 懒加载
- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
    }
    return _webView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 45 - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = BACKGROUNDCOLOR;
        
    }
    return _tableView;
}
- (UIButton *)makeSureButton{
    if (_makeSureButton == nil) {
        _makeSureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _makeSureButton.frame = CGRectMake(0, SCREEN_HEIGHT - 45, SCREEN_WIDTH, 45);
        [_makeSureButton setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
        
        [_makeSureButton setTitle:@"立即预订" forState:UIControlStateNormal];
        [_makeSureButton addTarget:self action:@selector(toSubmitOrder) forControlEvents:UIControlEventTouchUpInside];
    }
    return _makeSureButton;
}
- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"查看房型"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navBar;
}
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.makeSureButton];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [YSSCShareBusinessManager.hotelManger getRoomDetailWithDictionary:@{@"roomId":self.roomTypeModel.ID} success:^(id object) {
        
        self.roomDetailModel = object;
        NSString * htmlcontent = [NSString stringWithFormat:@"<div id=\"webview_content_wrapper\">%@</div>", self.roomDetailModel.data.notice];
        [self.webView loadHTMLString:htmlcontent baseURL:nil];
//        [self.webView loadHTMLString:self.roomDetailModel.data.notice baseURL:nil];
        [self.tableView reloadData];
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}


#pragma mark - tableView 代理

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        HotelCheckImageCell *cell = [[HotelCheckImageCell alloc] init];
        [cell setImage:self.roomDetailModel.data.imgList name:self.roomDetailModel.data.room_name price:self.roomDetailModel.data.price];
        
        return cell;
    }else if(indexPath.row == 1){
        HotelCheckEstablishmentCell *cell = [[HotelCheckEstablishmentCell alloc] init];
        [cell setModel:self.roomDetailModel];
        return cell;
    }else{
        HotelCheckMessageCell *cell = [[HotelCheckMessageCell alloc] init];
     
        [cell setcontent:self.roomDetailModel.data.notice];
        return  cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        CGFloat height = self.webView.frame.size.height - 5;
//        NSLog(@"=====%@---%f",NSStringFromCGRect(_webView.frame), height);
        if (height > 55 && height < 58) {
            height = 45;
        }
        if (height < 0 ) {
            height = 0;
        }
        
        return height;
    }
    if (indexPath.row == 1) {
        NSInteger i = 1;
        if ((self.roomDetailModel.data.roomAttrList.count % 3) == 0) {
            i = 0;
        }
        CGFloat height = (((self.roomDetailModel.data.roomAttrList.count / 3 ) + i ) * 51) + 60;
        return height;
    }
    CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
    
    return height + 0.5;
    
}

#pragma mark - 点击事件 下订单页面

//roomId: 房间Id
//roomNum: 数量
//comeTime: 入住时间 // 格式：2016-08-10
//leaveTime: 退房时间 // 格式：2016-08-10
//bookPerson: 预定人
//telphone: 预定人手机号

- (void)toSubmitOrder{
    
    //判断是否登录
    if (!YSSCShareBusinessManager.loginManger.isLogin) {
        
        //如果没登录弹出登录界面
        [self alertViewWithTitle:@"未登录"];
    }else{
        
        HotelSubmitOrderViewController *submitOrderVC = [[HotelSubmitOrderViewController alloc] init];
        submitOrderVC.dateArray = self.dateArray;
        submitOrderVC.roomTypeModel = self.roomTypeModel;
        submitOrderVC.hotelName = self.hotelName;//这部如果改返回数据就可以省略
        float money = self.roomTypeModel.price.floatValue * (self.dateArray.count - 1);
        
        submitOrderVC.money = [NSString stringWithFormat:@"%f",money];
        [self.navigationController pushViewController:submitOrderVC animated:YES];
    }
    
}
    

- (void)alertViewWithTitle:(NSString *)str{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提醒" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVc dismissViewControllerAnimated:YES completion:nil];
        
        ///modal出登录界面
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [self presentViewController:loginVC animated:YES completion:nil];
    }];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 8.3) {
     //   [action setValue:MALLColor forKey:@"_titleTextColor"];
    }
    [alertVc addAction:action];
    [self presentViewController:alertVc animated:YES completion:nil];
    
}

#pragma mark - webView 代理
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//    //获取到webview的高度
//    CGRect frame = webView.frame;
//    frame.size.width = SCREEN_WIDTH;
//    frame.size.height = 1;
//    
//    //    wb.scrollView.scrollEnabled = NO;
//    webView.frame = frame;
//    
//    frame.size.height = webView.scrollView.contentSize.height;
//
//    webView.frame = frame;
//    NSLog(@"webwebweb:%@",NSStringFromCGRect(webView.frame));
//    [self.tableView reloadData];
    
    
    
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
    webView.frame = CGRectMake(0, 0, self.view.frame.size.width, height + 45);
//    NSLog(@"webwebweb:%@",NSStringFromCGRect(webView.frame));
    [self.tableView reloadData];
}

@end
