//
//  DatePickerViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "DatePickerViewController.h"
//#import "DatePickerCell.h"
#import "MallTopView.h"
#import "YSSChooseDateButton.h"
#import "DatePickView.h"


@interface DatePickerViewController ()<DatePickerViewDelegate>

///tableView
@property (nonatomic, strong) UITableView *tableView;
///底部确认选择按钮
@property (nonatomic, strong) UIButton *makeSureButton;
///顶部选择日期按钮
@property (nonatomic, strong) YSSChooseDateButton *dateButton;
///自定义导航栏
@property (nonatomic, strong) YSSNavView *navBar;
/**日期选择页*/
@property (nonatomic, strong) DatePickView *datePickView;
/**选中的日期*/
@property (nonatomic, strong) NSMutableArray *selectedArray;

@end

@implementation DatePickerViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    
    self.view.backgroundColor = BACKGROUNDCOLOR;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.dateButton];
    [self.view addSubview:self.makeSureButton];
    [self.view addSubview:self.datePickView];
    
    self.dateButton.sd_layout
    .topSpaceToView(self.navBar, 15)
    .centerXEqualToView(self.view)
    .widthRatioToView(self.view , 0.92)
    .heightIs(65);
    
    self.datePickView.sd_layout
    .topSpaceToView(self.dateButton, 45)
    .widthRatioToView(self.view, 1)
    .bottomSpaceToView(self.view, 49);
    
    self.makeSureButton.sd_layout
    .topSpaceToView(self.datePickView, 0)
    .widthRatioToView(self.view, 1)
    .bottomSpaceToView(self.view, 0);
    
    NSArray *weekArr = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    for (int i = 0; i < 7 ; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = weekArr[i];
        label.textColor = SHENTEXTCOLOR;
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(SCREEN_WIDTH / 7 * i , 170, SCREEN_WIDTH / 7, 18);
        [self.view addSubview:label];
    }
}

#pragma mark - 监听点击事件
- (void)topButtonDidClick{
    
}
#pragma mark - 重置日期
- (void)reSetDate{
    [self.datePickView reSetDate];
    [self.selectedArray removeAllObjects];
    [self.dateButton setCheckInDate:@"请选择日期" CheckoutDate:@"-"];
    [SVProgressHUD showSuccessWithStatus:@"日期已经重置"];
}

- (void)bottonButtonDidClick{
    
    if (self.selectedArray.count < 2) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请选择日期" message:@"请选择入住和退房日期" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alertView show];
        
    }else{
    
        if ([self.delegate respondsToSelector:@selector(datePickerVCSelectedDate:)]) {
            [self.delegate datePickerVCSelectedDate:self.selectedArray];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    
    }
    
    
}
#pragma mark - 日期选择View代理

- (void)datePickerViewDidSelectDate:(NSMutableArray *)dateArr{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSString *str in dateArr) {
        
        NSString *year = [str substringWithRange:NSMakeRange(0, 4)];
        NSString *month = [str substringWithRange:NSMakeRange(4, 2)];
        NSString *day = [str substringWithRange:NSMakeRange(6, 2)];
        NSString *formatStr = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
        [arr addObject:formatStr];
    }
    
    self.selectedArray = arr;
    
    if (self.selectedArray.count == 1) {
       [self.dateButton setCheckInDate:arr.firstObject CheckoutDate:@"-"];
    }else if(self.selectedArray.count > 1){
        
        [self.dateButton setCheckInDate:arr.firstObject CheckoutDate:arr.lastObject];
    }else{
        [self.dateButton setCheckInDate:@"请选择日期" CheckoutDate:@"-"];
    }

}

#pragma mark - 懒加载
- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] init];
        _navBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        YSSCWeakObj(self);
        [_navBar setLeftTitle:@"取消"];
        [_navBar setTitletext:@"日期选择"];
        [_navBar setRightBtnTitle:@"重置" target:self action:@selector(reSetDate)];
        _navBar.block = ^{
            [weakself dismissViewControllerAnimated:YES completion:nil];
        };
    }
    return _navBar;
}

- (DatePickView *)datePickView{
    if (_datePickView == nil) {
        _datePickView = [[DatePickView alloc] init];
        _datePickView.pickDelegate = self;
    }
    return _datePickView;
}

- (YSSChooseDateButton *)dateButton{
    if (_dateButton == nil) {
        _dateButton = [YSSChooseDateButton buttonWithType:UIButtonTypeCustom];
        
    }
    return _dateButton;
}

-(UIButton *)makeSureButton{
    if (_makeSureButton == nil) {
        
        
        _makeSureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_makeSureButton addTarget:self action:@selector(bottonButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [_makeSureButton setTitle:@"提交选择" forState:UIControlStateNormal];
        _makeSureButton.backgroundColor = MALLColor;
    }
    return _makeSureButton;
}


@end
