//
//  UserMenuVC.m
//  YSSCIOS
//
//  Created by Rock on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//导航栏弹出的菜单

#import "UserMenuVC.h"

@interface UserMenuVC ()


@end

@implementation UserMenuVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma mark - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = MALLColor;
    cell.accessoryView = [[UIImageView alloc] initWithImage:IMAGE(@"classify65")];
    if ([self.currentString isEqualToString:@"乡宿订单"]) {
        cell.textLabel.text = @"商品订单";
    }else{
        cell.textLabel.text = @"乡宿订单";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (_block) {
        _block(cell.textLabel.text);
    }
}

- (void)cellDidClick:(DidClick)callBack{
    _block = callBack;
}



@end
