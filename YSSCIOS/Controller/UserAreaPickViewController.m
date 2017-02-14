//
//  UserAreaPickViewController.m
//  YSSCIOS
//
//  Created by Rock on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserAreaPickViewController.h"
#import "AreaObject.h"

@interface UserAreaPickViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

/**省tableView*/
@property (nonatomic, strong) UITableView *provinceTableView;
/**城市tabView*/
@property (nonatomic, strong) UITableView *cityTableView;
/**区tableView*/
@property (nonatomic, strong) UITableView *districtTableView;
/**取消按钮*/
@property (nonatomic, strong) UIButton *cancelButton;

/**dict*/
@property (nonatomic, strong) NSMutableDictionary *parameterDict;
/**省array*/
@property (nonatomic, strong) NSMutableArray *provinceArray;
/**城市array*/
@property (nonatomic, strong) NSMutableArray *cityArray;
/**地区array*/
@property (nonatomic, strong) NSMutableArray *districtArray;

/**选中的城市行*/
@property (nonatomic, assign) NSInteger cityRow;
/**选中的省行*/
@property (nonatomic, assign) NSInteger provinceRow;

@end



@implementation UserAreaPickViewController

- (UITableView *)provinceTableView{
    if (_provinceTableView == nil) {
        _provinceTableView = [[UITableView alloc] init];
        _provinceTableView.frame = CGRectMake(0,44, SCREEN_WIDTH / 3, SCREEN_HEIGHT*0.382 - 44);
        _provinceTableView.delegate = self;
        _provinceTableView.dataSource = self;
        _provinceTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _provinceTableView;
}

- (UITableView *)cityTableView{
    if (_cityTableView == nil) {
        _cityTableView = [[UITableView alloc] init];
        _cityTableView.frame = CGRectMake(SCREEN_WIDTH/3, 44, SCREEN_WIDTH/3, SCREEN_HEIGHT*0.382 - 44);
        _cityTableView.delegate = self;
        _cityTableView.dataSource = self;
        _cityTableView.backgroundColor = GRAYCOLOR;
        _cityTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _cityTableView;
}

- (UITableView *)districtTableView{
    if (_districtTableView == nil) {
        _districtTableView = [[UITableView alloc] init];
        _districtTableView.frame = CGRectMake(SCREEN_WIDTH *2/3, 44, SCREEN_WIDTH/3, SCREEN_HEIGHT*0.382 - 44);
        _districtTableView.delegate = self;
        _districtTableView.dataSource = self;
        _districtTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _districtTableView.backgroundColor = GRAYCOLOR;
    }
    return _districtTableView;
}

- (NSMutableDictionary *)parameterDict{
    if (_parameterDict == nil) {
        _parameterDict = [[NSMutableDictionary alloc] init];
    }
    return _parameterDict;
}

- (NSMutableArray *)provinceArray{
    if (_provinceArray == nil) {
        _provinceArray = [[NSMutableArray alloc] init];
    }
    return _provinceArray;
}
- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc] init];
        
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:MALLColor forState:UIControlStateNormal];
        _cancelButton.frame = CGRectMake(SCREEN_WIDTH - 50, 5, 50, 30);
        [_cancelButton addTarget:self action:@selector(calcelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.provinceTableView];
    [self.view addSubview:self.cityTableView];
    [self.view addSubview:self.districtTableView];
    [self.view addSubview:self.cancelButton];
    [self.parameterDict setValue:@"0" forKey:@"flag"];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestArea];
}

- (void)requestArea{

    
    [YSSCShareBusinessManager.userManager getAreaWithDictionary:self.parameterDict success:^(id object) {
        if (object) {
            AreaObject *areaObject = object;
            if (areaObject.data.count > 0) {
                AreaDataObject *dataObject = areaObject.data[0];
                if (dataObject.nlevel.integerValue == 2) { //省
                    self.provinceArray = areaObject.data;
                   
                }
                if (dataObject.nlevel.integerValue == 3) { //市
                    self.cityArray = areaObject.data;
                   
                }
                if (dataObject.nlevel.integerValue == 4) { //区
                    self.districtArray = areaObject.data;

                }
                
                [self.provinceTableView reloadData];
                [self.cityTableView reloadData];
                [self.districtTableView reloadData];
            }
        }
        
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        
    }];
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.provinceTableView]) {
        return self.provinceArray.count;
    }else if ([tableView isEqual:self.cityTableView]){
        return self.cityArray.count;
    }else{
        return self.districtArray.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"areacell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"areacell"];
        
        
    }
    if ([tableView isEqual:self.provinceTableView]) {
        AreaDataObject *dataObject = self.provinceArray[indexPath.row];
        cell.textLabel.text = dataObject.aname;
    }
    
    if ([tableView isEqual:self.cityTableView]) {
        AreaDataObject *dataObject = self.cityArray[indexPath.row];
        cell.textLabel.text = dataObject.aname;
    }
    if ([tableView isEqual:self.districtTableView]) {
        AreaDataObject *dataObject = self.districtArray[indexPath.row];
        cell.textLabel.text = dataObject.aname;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.provinceTableView]) {
        AreaDataObject *dataObject = self.provinceArray[indexPath.row];
        [self.parameterDict setObject:dataObject.ID forKey:@"id"];
        [self.parameterDict setObject:@"1" forKey:@"flag"];
         self.provinceRow = indexPath.row;
        [self requestArea];
       
    }
    
    if ([tableView isEqual:self.cityTableView]) {
        AreaDataObject *dataObject = self.cityArray[indexPath.row];
        [self.parameterDict setObject:dataObject.ID forKey:@"id"];
        [self.parameterDict setObject:@"2" forKey:@"flag"];
        self.cityRow = indexPath.row;
        [self requestArea];
        
    }
    if ([tableView isEqual:self.districtTableView]) {
        AreaDataObject *province = self.provinceArray[self.provinceRow];
        AreaDataObject *city = self.cityArray[self.cityRow];
        AreaDataObject *district = self.districtArray[indexPath.row];
       
        NSString *address = [NSString stringWithFormat:@"%@%@%@",province.aname,city.aname,district.aname];
        if ([self.delegate respondsToSelector:@selector(userAreaPickViewControllerSelectAddress:ID:)]) {
            [self.delegate userAreaPickViewControllerSelectAddress:address ID:district.ID];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)calcelButtonClick{
    //[[NSNotificationCenter defaultCenter]postNotificationName:@"dissmiss" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
