//
//  MallSumbitOrderViewController.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallSumbitOrderViewController.h"
#import "UserAddressObject.h"//收货地址模型
#import "UserChooseAddressViewController.h"//收货地址页面

@interface MallSumbitOrderViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    UserChooseAddressViewControllerDelegate,
    UITextFieldDelegate
>

@property (nonatomic, strong) MallTopView *topView;

@property (nonatomic, strong) UIScrollView *contentView;//背景滚动视图

@property (nonatomic, strong) UIView *fisrtView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *addressTitleLb;//收货地址标题
@property (nonatomic, strong) UILabel *cusNameLb;//消费者姓名
@property (nonatomic, strong) UILabel *cusPhoneLb;//消费者电话
@property (nonatomic, strong) UILabel *cusAddressLb;//消费者地址
@property (nonatomic, strong) UIButton *cusEditBtn;//跳转地址管理页

@property (nonatomic, strong) UIImageView *addAressIv;//添加地址
@property (nonatomic, strong) UILabel *addAressLb;//添加地址文案





@property (nonatomic, strong) UITableView *goodsTableView;//商品列表




//@property (nonatomic, strong) UIView *thirdView;
//@property (nonatomic, strong) UILabel *shopNumTitleLb;//购买数量标题
//@property (nonatomic, strong) UIButton *subtractBtn;//减号
//@property (nonatomic, strong) UIButton *addNumBtn;//加号
//@property (nonatomic, strong) UILabel *shopNum;//购买数量


@property (nonatomic, strong) UIView *fourthView;
@property (nonatomic, strong) UILabel *expressStyleLb;//快递方式
@property (nonatomic, strong) UILabel *expressPriceLb;//快递价格



@property (nonatomic, strong) UIView *fifthView;

@property (nonatomic, strong) UITextField *remarksTf;//备注说明


@property (nonatomic, strong) UIView *sixedView;//计算栏
@property (nonatomic, strong) UILabel *assessTitleLb;//合计标题
@property (nonatomic, strong) UILabel *assessPriceLb;//合计价格

@property (nonatomic, strong) UIButton *subOrderBtn;//提交订单按钮

@property (nonatomic, strong) UserAddressDataObject *addressObj;//当前地址模型

@property (nonatomic, copy) NSString *subGoodsMdf;//商品mdf
@property (nonatomic, copy) NSString *subGoodsCount;//商品数量
@property (nonatomic, copy) NSString *subActIDStr;//活动ID。默认0.跟商品保持一致的数量


@property (nonatomic, assign) float expressPrice;//邮费,默认0；




@end

@implementation MallSumbitOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GRAYCOLOR;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.contentView];
    [self.view addSubview:self.sixedView];
    [self initData];//初始化计算数据
    [self loadAddressList];//请求地址数据。完成后请求邮费数据。邮费数据请求完成后刷新总价
    [self loadAllPrice];
    
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
    
    self.contentView.sd_layout
    .topSpaceToView(self.topView, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    self.sixedView.sd_layout
    .bottomSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(50);
    [self autoLayoutSixedViewSubViews];

    
    
    
    self.fisrtView.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(112);
    [self autoLayoutFirstViewSubViews];
    
    self.goodsTableView.sd_layout
    .topSpaceToView(self.fisrtView, 10)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(94 *_data.count);
    
    
    self.fourthView.sd_layout
    .topSpaceToView(self.goodsTableView, 10)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(45);
    [self autoLayoutFourthViewSubViews];
    
    self.fifthView.sd_layout
    .topSpaceToView(self.fourthView, 10)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(45);
    [self autoLayoutFifthViewSubViews];
   
    
    [self.contentView setupAutoContentSizeWithBottomView:_fifthView bottomMargin:10];


}


#pragma mark ----------------界面布局

- (void)autoLayoutFirstViewSubViews{
    
    self.lineView.sd_layout
    .topSpaceToView(self.fisrtView, 45)
    .leftSpaceToView(self.fisrtView, 0)
    .rightSpaceToView(self.fisrtView, 0)
    .heightIs(0.5);

    self.addressTitleLb.sd_layout
    .centerYIs(22.5)
    .leftSpaceToView(self.fisrtView, 15)
    .autoHeightRatio(0);
    [self.addressTitleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.addAressIv.sd_layout
    .centerYIs(78.5)
    .leftSpaceToView(self.fisrtView, 15)
    .heightIs(18)
    .widthEqualToHeight();
    
    self.addAressLb.sd_layout
    .centerYEqualToView(self.addAressIv)
    .leftSpaceToView(self.addAressIv, 15)
    .autoHeightRatio(0);
    [self.addAressLb setSingleLineAutoResizeWithMaxWidth:300];
    
    
    self.cusEditBtn.sd_layout
    .centerYIs(78.25)
    .rightSpaceToView(self.fisrtView, 15)
    .heightIs(14)
    .widthIs(10);

}

- (void)autoLayoutFourthViewSubViews{
    self.expressStyleLb.sd_layout
    .centerYEqualToView(self.fourthView)
    .leftSpaceToView(self.fourthView, 15)
    .autoHeightRatio(0);
    [self.expressStyleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.expressPriceLb.sd_layout
    .centerYEqualToView(self.expressStyleLb)
    .rightSpaceToView(self.fourthView, 15)
    .autoHeightRatio(0);
    [self.expressPriceLb setSingleLineAutoResizeWithMaxWidth:200];

}

- (void)autoLayoutFifthViewSubViews{
    self.remarksTf.sd_layout
    .centerYEqualToView(self.fifthView)
    .leftSpaceToView(self.fifthView, 15)
    .rightSpaceToView(self.fifthView, 15)
    .heightRatioToView(self.fifthView, 1);
    
}

- (void)autoLayoutSixedViewSubViews{
    
    self.assessTitleLb.sd_layout
    .centerYEqualToView(self.sixedView)
    .leftSpaceToView(self.sixedView , 15)
    .autoHeightRatio(0);
    [self.assessTitleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.assessPriceLb.sd_layout
    .centerYEqualToView(self.sixedView)
    .leftSpaceToView(self.assessTitleLb, 12)
    .autoHeightRatio(0);
    [self.assessPriceLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.subOrderBtn.sd_layout
    .centerYEqualToView(self.sixedView)
    .rightSpaceToView(self.sixedView, 0)
    .heightRatioToView(self.sixedView, 1)
    .widthIs(129);
}

#pragma mark ----------------初始化计算数据

- (void)initData{
    NSMutableString *str = [[NSMutableString alloc] init];
    NSMutableString *count = [[NSMutableString alloc] init];
    NSMutableString *idStr = [[NSMutableString alloc] init];
    
    if (_data.count == 1) {
        STL_GoodsDetailBaseSubItemModel *model = _data[0];
        [str appendString:model.mdf];
        [count appendString:model.quantity];
        [idStr appendString:@"0"];
    }else{
        for (STL_GoodsDetailBaseSubItemModel *model in _data) {
            [str appendFormat:@"%@,",model.mdf];
            [count appendFormat:@"%@,",model.quantity];
            [idStr appendFormat:@"@0,"];
        }
    }
    
    _subGoodsMdf = str;
    _subGoodsCount = count;
    _subActIDStr = idStr;
}


#pragma mark ----------------请求收货地址和邮费计算

- (void)loadAddressList{
    YSSCWeakObj(self);
    [YSSCShareBusinessManager.userManager getUserAddressWithDictionary:nil
                                                               success:^(id object) {
                                                                   UserAddressObject *obj = object;
                                                                   [weakself updateAddressWith:obj.data];
                                                                   
                                                               } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                   [SVProgressHUD showErrorWithStatus:errorMsg];
                                                               }];

}

- (void)loadExpressPrice{
    
    if (!_addressObj.ID) {
        [SVProgressHUD showErrorWithStatus:@"请先选择收货地址"];
        return;
    }
    
    YSSCWeakObj(self);
    [YSSCShareBusinessManager.mallManager getExpressPriceWithParameters:@{@"subGoodsMdf":_subGoodsMdf,
                                                                          @"subGoodsCount":_subGoodsCount,
                                                                          @"addressId":_addressObj.ID,
                                                                          @"actIdStr":_subActIDStr}
                                                                success:^(id responObject) {
                                                                    //刷新邮费信息
                                                                    NSString *str = responObject;
                                                                    _expressPrice = str.floatValue;
                                                                    _expressPriceLb.text = [NSString stringWithFormat:@"快递: %@ 元",str];
                                                                    [weakself loadAllPrice];
                                                                }
                                                                failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                    [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                }];
}


#pragma mark ----------------文本输入代理

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.remarksTf resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.remarksTf resignFirstResponder];
}

#pragma mark ----------------刷新界面逻辑

- (void)updateAddressWith:(NSArray *)data{
    
    if (data.count) {
        [_addAressIv removeFromSuperview];
        [_addAressLb removeFromSuperview];
        [_fisrtView addSubview:self.cusNameLb];
        [_fisrtView addSubview:self.cusPhoneLb];
        [_fisrtView addSubview:self.cusAddressLb];
        
        
        self.cusNameLb.sd_layout
        .topSpaceToView(self.lineView, 15)
        .leftSpaceToView(self.fisrtView, 15)
        .autoHeightRatio(0);
        [self.cusNameLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.cusPhoneLb.sd_layout
        .topEqualToView(self.cusNameLb)
        .leftSpaceToView(self.cusNameLb, 15)
        .autoHeightRatio(0);
        [self.cusPhoneLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.cusAddressLb.sd_layout
        .bottomSpaceToView(self.fisrtView, 15)
        .leftEqualToView(self.cusNameLb)
        .autoHeightRatio(0);
        [self.cusAddressLb setSingleLineAutoResizeWithMaxWidth:400];
        
        
        BOOL flag = NO;
        for (UserAddressDataObject *obj in data) {
            if (obj.isdefault) {
                _addressObj = obj;
                flag = YES;
            }
        }
        //若用户设置了默认收货。则以默认收货为准，若未设置，则选择第一个
        if (flag) {
            //已设置默认
        }else{
            _addressObj = data.firstObject;
        }
        _cusNameLb.text = _addressObj.name;
        _cusPhoneLb.text = _addressObj.cellphone;
        _cusAddressLb.text = _addressObj.address;
        
        [self loadExpressPrice];//请求邮费信息
    }
    
    
    [self loadAllPrice];
}

- (void)loadAllPrice{
    float totalPrice = 0.0;
    for (STL_GoodsDetailBaseSubItemModel *model in _data) {
        float proPrice = model.promotion_price.floatValue;
        NSInteger lm = model.quantity.integerValue;
        totalPrice += (proPrice *lm);
    }
    totalPrice += _expressPrice;
    _assessPriceLb.text = [NSString stringWithFormat:@"¥ %.2f", totalPrice];
}

#pragma mark ----------------UserChooseAddressViewControllerDelegate

- (void)userChooseAddressViewControllerDidSelectAddress:(UserAddressDataObject *)model{
    //从地址列表返回新的
    if (!model.address.length) {
        [SVProgressHUD showErrorWithStatus:@"地址列表为空"];
    }
    
    NSArray *ary = @[model];
    [self updateAddressWith:ary];
//    _addressObj = model;
//    _cusNameLb.text = _addressObj.name;
//    _cusPhoneLb.text = _addressObj.cellphone;
//    _cusAddressLb.text = _addressObj.address;

//    [self loadExpressPrice];//请求邮费信息
}


#pragma mark ----------------tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MallCreateOrderTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"goodsCell"];
    STL_GoodsDetailBaseSubItemModel *model = _data[indexPath.row];
    [cell updateInfo:model];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 94;
}

#pragma mark ----------------//提交订单和跳转地址列表动作

- (void)subOrederAction{
    YSSCWeakObj(self);
    
    if (!_subGoodsMdf ||! _subGoodsCount || !_addressObj.ID) {
        [SVProgressHUD showErrorWithStatus:@"请选择收货地址"];
        return;
    }
    NSDictionary *dict = @{@"subGoodsMdf":_subGoodsMdf,
                           @"subGoodsCount":_subGoodsCount,
                           @"addressId":_addressObj.ID,
                           @"actldStr":@0,
                           @"sendMethod":@1};
    NSMutableDictionary *newDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    if (_remarksTf.text.length) {
        [newDict setValue:_remarksTf.text forKey:@"remark"];
    }
    [SVProgressHUD showWithStatus:@"提交订单中"];
    [YSSCShareBusinessManager.mallManager getMallCreateOrderWithParameters:newDict
                                                                   success:^(id responObject) {
                                                                       [SVProgressHUD dismiss];
                                                                       //赞
                                                                       MallPayViewController *payVc = [[MallPayViewController alloc] init];
                                                                       
                                                                       payVc.orderNum  = responObject[@"ordernumber"];
                                                                       payVc.totalPrice = responObject[@"totalMoney"];
                                                                       payVc.blancePrice = responObject[@"balance"];
                                                                       
                                                                       [weakself.navigationController pushViewController:payVc animated:YES];
                                                                   }
                                                                   failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                       [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                   }];



}

- (void)cusAddressEditAction{
    UserChooseAddressViewController *vc = [[UserChooseAddressViewController alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ----------------实例化

- (MallTopView *)topView{
    if (_topView == nil) {
        _topView = [[MallTopView alloc] init];
        [_topView setTitleText:@"提交订单" imageArrays:nil selecterArys:nil target:nil isShowLeftBtn:YES];
        YSSCWeakObj(self);
        _topView.block = ^(){
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _topView;
}

- (UIView *)fisrtView{
    if (_fisrtView == nil) {
        _fisrtView = [[UIView alloc] init];
        _fisrtView.backgroundColor = WHITECOLOR;
        [_fisrtView addSubview:self.lineView];
        [_fisrtView addSubview:self.addressTitleLb];
        [_fisrtView addSubview:self.cusEditBtn];
        [_fisrtView addSubview:self.addAressIv];
        [_fisrtView addSubview:self.addAressLb];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cusAddressEditAction)];
        [_fisrtView addGestureRecognizer:tap];
    }
    return _fisrtView;
}

- (UIView *)fourthView{
    if (_fourthView == nil) {
        _fourthView = [[UIView alloc] init];
        _fourthView.backgroundColor = WHITECOLOR;
        [_fourthView addSubview:self.expressStyleLb];
        [_fourthView addSubview:self.expressPriceLb];
    }
    return _fourthView;
}

- (UIView *)fifthView{
    if (_fifthView == nil) {
        _fifthView = [[UIView alloc] init];
        _fifthView.backgroundColor = WHITECOLOR;
        [_fifthView addSubview:self.remarksTf];
    }
    return _fifthView;

}

- (UIView *)sixedView{
    if (_sixedView == nil) {
        _sixedView = [[UIView alloc] init];
        _sixedView.backgroundColor = WHITECOLOR;
        [_sixedView addSubview:self.assessTitleLb];
        [_sixedView addSubview:self.assessPriceLb];
        [_sixedView addSubview:self.subOrderBtn];
    }
    return _sixedView;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (UILabel *)addressTitleLb{
    if (_addressTitleLb == nil) {
        _addressTitleLb = [[UILabel alloc] init];
        _addressTitleLb.font = FONT(14);
        _addressTitleLb.textColor = LIGHTTEXTCOLOR;
        _addressTitleLb.text = @"收货地址";
    }
    return _addressTitleLb;
}

- (UILabel *)cusNameLb{
    if (_cusNameLb == nil) {
        _cusNameLb = [[UILabel alloc] init];
        _cusNameLb.font = FONT(14);
        _cusNameLb.textColor = BLACKTEXTCOLOR;
        _cusNameLb.text = @"李明星";
    }
    return _cusNameLb;
}

- (UILabel *)cusPhoneLb{
    if (_cusPhoneLb == nil) {
        _cusPhoneLb = [[UILabel alloc] init];
        _cusPhoneLb.font = FONT(14);
        _cusPhoneLb.textColor = BLACKTEXTCOLOR;
        _cusPhoneLb.text = @"12345678901";
    }
    return _cusPhoneLb;
}

- (UILabel *)cusAddressLb{
    if (_cusAddressLb == nil) {
        _cusAddressLb = [[UILabel alloc] init];
        _cusAddressLb.font = FONT(14);
        _cusAddressLb.textColor = LIGHTTEXTCOLOR;
        _cusAddressLb.text = @"浙江省杭州市江干区国家大学科技园12楼";
    }
    return _cusAddressLb;
}

- (UILabel *)expressStyleLb{
    if (_expressStyleLb == nil) {
        _expressStyleLb = [[UILabel alloc] init];
        _expressStyleLb.font = FONT(14);
        _expressStyleLb.textColor = LIGHTTEXTCOLOR;
        _expressStyleLb.text = @"配送方式:";
    }
    return _expressStyleLb;
}

- (UILabel *)expressPriceLb{
    if (_expressPriceLb == nil) {
        _expressPriceLb = [[UILabel alloc] init];
        _expressPriceLb.font = FONT(14);
        _expressPriceLb.textColor = LIGHTTEXTCOLOR;
        _expressPriceLb.text = @"快递00.00元";
    }
    return _expressPriceLb;

}

- (UITextField *)remarksTf{
    if (_remarksTf == nil) {
        _remarksTf = [[UITextField alloc] init];
        _remarksTf.font = FONT(14);
        _remarksTf.delegate = self;
        _remarksTf.returnKeyType =UIReturnKeyDone;
        _remarksTf.clearButtonMode = UITextFieldViewModeWhileEditing;
        _remarksTf.textColor = BLACKTEXTCOLOR;
        _remarksTf.placeholder = @"有什么想对商家说的";
    }
    return _remarksTf;
}

- (UILabel *)assessTitleLb{
    if (_assessTitleLb == nil) {
        _assessTitleLb = [[UILabel alloc] init];
        _assessTitleLb.font = FONT(14);
        _assessTitleLb.textColor = BLACKTEXTCOLOR;
        _assessTitleLb.text = @"合计 : ";
    }
    return _assessTitleLb;
}

- (UILabel *)assessPriceLb{
    if (_assessPriceLb == nil) {
        _assessPriceLb = [[UILabel alloc] init];
        _assessPriceLb.font = FONT(19);
        _assessPriceLb.textColor = MALLColor;
        _assessPriceLb.text = @"¥ 46.00";
    }
    return _assessPriceLb;

}

- (UIButton *)subOrderBtn{
    if (_subOrderBtn == nil) {
        _subOrderBtn = [[UIButton alloc] init];
        _subOrderBtn.backgroundColor = MALLColor;
        _subOrderBtn.titleLabel.font = FONT(14);
        [_subOrderBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_subOrderBtn setTitle:@"提交下单" forState:UIControlStateNormal];
        [_subOrderBtn addTarget:self action:@selector(subOrederAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subOrderBtn;
}

- (UIButton *)cusEditBtn{
    if (_cusEditBtn == nil) {
        _cusEditBtn = [[UIButton alloc] init];
        [_cusEditBtn setBackgroundImage:IMAGE(@"classify141") forState:UIControlStateNormal];
        [_cusEditBtn addTarget:self action:@selector(cusAddressEditAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cusEditBtn;
}

- (UITableView *)goodsTableView{
    if (_goodsTableView == nil) {
        _goodsTableView = [[UITableView alloc] init];
        _goodsTableView.delegate = self;
        _goodsTableView.dataSource = self;
        _goodsTableView.scrollEnabled = NO;
        [_goodsTableView registerClass:[MallCreateOrderTableViewCell class] forCellReuseIdentifier:@"goodsCell"];
    }
    return _goodsTableView;


}

- (UIScrollView *)contentView{
    if (_contentView == nil) {
        _contentView = [[UIScrollView alloc] init];
        _contentView.backgroundColor = GRAYCOLOR;
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.showsHorizontalScrollIndicator = NO;
        [_contentView addSubview:self.fisrtView];
        [_contentView addSubview:self.goodsTableView];
//        [_contentView addSubview:self.thirdView];
        [_contentView addSubview:self.fourthView];
        [_contentView addSubview:self.fifthView];
    }
    return _contentView;

}

- (UIImageView *)addAressIv{
    if (_addAressIv == nil) {
        _addAressIv = [[UIImageView alloc] init];
        _addAressIv.image = IMAGE(@"classify103");
    }
    return _addAressIv;
}

- (UILabel *)addAressLb{
    if (_addAressLb == nil) {
        _addAressLb = [[UILabel alloc] init];
        _addAressLb.font = FONT(14);
        _addAressLb.textColor = BLACKTEXTCOLOR;
        _addAressLb.text = @"暂无收货地址";
    }
    return _addAressLb;
}

@end
