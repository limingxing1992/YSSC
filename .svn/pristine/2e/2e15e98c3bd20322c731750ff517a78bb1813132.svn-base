//
//  UserOrderCommentViewController.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderCommentViewController.h"
#import "UserOrderCommentCell.h"
#import "UserGoodsOrderDetailObject.h"
#import "UserHotelOrderDetailObject.h"

@interface UserOrderCommentViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    UserOrderCommentCellDelegate
>

/**导航栏*/
@property (nonatomic, strong) YSSNavView *navBar;
/**tableView*/
@property (nonatomic, strong) UITableView *tableView;
/**确认按钮*/
@property (nonatomic, strong) UIButton *makeSureButton;

/**评分*/
@property (nonatomic, strong) NSString *score;
/**评论*/
@property (nonatomic, strong) NSString *comment;

/**评论数组*/
@property (nonatomic, strong) NSMutableArray *commentArray;



@end

@implementation UserOrderCommentViewController


- (YSSNavView *)navBar{
    if (_navBar == nil) {
        _navBar = [[YSSNavView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _navBar.backgroundColor = [UIColor whiteColor];
        [_navBar setTitletext:@"评价"];
        YSSCWeakObj(self);
        _navBar.block = ^{
            [weakself.navigationController popViewControllerAnimated:YES];
        };
    }
    return _navBar;
}



- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = GRAYCOLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UserOrderCommentCell class] forCellReuseIdentifier:@"userOrderCommentCell"];
    }
    return _tableView;
}

- (UIButton *)makeSureButton{
    if (_makeSureButton == nil) {
        _makeSureButton = [[UIButton alloc]init];
        [_makeSureButton setTitle:@"提交评价" forState:UIControlStateNormal];
        [_makeSureButton setBackgroundImage:[UIImage imageWithColor:MALLColor] forState:UIControlStateNormal];
        _makeSureButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
        [_makeSureButton addTarget:self action:@selector(makeSure) forControlEvents:UIControlEventTouchUpInside];
    }
    return _makeSureButton;
}

- (NSMutableArray *)commentArray{
    if (_commentArray == nil) {
        _commentArray = [[NSMutableArray alloc] init];
        
        
        NSInteger goodsCount = _model.data.goods.count;
        if (_isHotelOrder) {
            goodsCount = 1;
        }
        
        
        for (int i = 0 ; i < goodsCount; i ++) {
            NSMutableDictionary *dict = [@{@"goodsMdf":@"",@"score":@"",@"content":@""} mutableCopy];
            [_commentArray addObject:dict];
        }
    }
//    NSLog(@"%@",_commentArray);
    return _commentArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger goodsCount = self.model.data.goods.count;
    
    for (int i ; i < goodsCount; i ++) {
        
        [self.commentArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"",@"goodsMdf",@"", @"score",@"",@"content",nil]];
    }
    [self setupUI];
}

- (void)setupUI{
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.makeSureButton];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_isHotelOrder) {
       return self.model.data.goods.count;
    }else{
       return 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    

    UserGoodsDetailObject *goodObject = self.model.data.goods[indexPath.row];
    
    UserOrderCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userOrderCommentCell"];
    if (_isHotelOrder) {
        [cell setIconUrl:self.hotelModel.data.pic];
    }else{
        [cell setIconUrl:goodObject.pic_url];
    }
    
    cell.delegate = self;
    cell.tag = indexPath.row;
//    [cell callBack:^(NSString *score, NSString *comment) {
//        if (score == nil) {
//            score = @"5";
//        }
//        dict[@"score"] =  score;
//        dict[@"content"] = comment;
//        dict[@"goodsMdf"] = goodObject.subgoodsmdf;
//    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [_tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:_tableView];
    return height + 10;
}

- (void)makeSure{
   
    if (!_isHotelOrder) {
        NSDictionary *dict = @{@"orderMdf":self.model.data.ordermdf,@"commentList":self.commentArray};
        
        NSString *jsonStr = [self dictionaryToJson:dict];
        
        NSDictionary *parameterDict = @{@"type":@"10",@"commentJson":jsonStr};
        NSLog(@"====%@",parameterDict);
        [YSSCShareBusinessManager.userManager postOrderCommentWithDictionary:parameterDict success:^(id object) {
            ServerStatusObject *severStatusObject = object;
            if (severStatusObject.errorCode.integerValue == SeverStateSuccess) {
                [SVProgressHUD showSuccessWithStatus:@"评价成功"];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.navigationController popToRootViewControllerAnimated:YES];
                });
            }else{
                [SVProgressHUD showErrorWithStatus:severStatusObject.errorMsg];
            }
            
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            NSLog(@"%@",errorMsg);
        }];
    }else{
        
       
        NSDictionary *contentDict = self.commentArray[0];
        NSDictionary *parameterDict = @{@"villageOrderMdf":self.hotelModel.data.mdf,
                                        @"score":contentDict[@"score"],
                                        @"content":contentDict[@"content"]};
        NSLog(@"====%@",parameterDict);
        [YSSCShareBusinessManager.userManager postHotelOrderCommentWithDictionary:parameterDict success:^(id object) {
            ServerStatusObject *severStatusObject = object;
            if (severStatusObject.errorCode.integerValue == SeverStateSuccess) {
                [SVProgressHUD showSuccessWithStatus:@"评价成功"];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.navigationController popToRootViewControllerAnimated:YES];
                });
            }else{
                [SVProgressHUD showErrorWithStatus:severStatusObject.errorMsg];
            }
            
        } failure:^(NSInteger errCode, NSString *errorMsg) {
            NSLog(@"%@",errorMsg);
        }];    }
    
}





- (void)userOrderCommentCell:(UserOrderCommentCell *)cell stars:(NSInteger)count comment:(NSString *)comment{
    if (!_isHotelOrder) {
        NSMutableDictionary *dict = self.commentArray[cell.tag];
        UserGoodsDetailObject *goodObject = self.model.data.goods[cell.tag];
        dict[@"score"] =  [NSString stringWithFormat:@"%zd",count];
        dict[@"content"] = comment;
        dict[@"goodsMdf"] = goodObject.subgoodsmdf;
    }else{
    
        NSMutableDictionary *dict = self.commentArray[0];
        dict[@"score"] =  [NSString stringWithFormat:@"%zd",count];
        dict[@"content"] = comment;
    }
    
    
}

- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
