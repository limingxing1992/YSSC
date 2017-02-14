//
//  CitySearchResultTableViewController.m
//  YSSCIOS
//
//  Created by Rock on 16/9/4.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "CitySearchResultTableViewController.h"

@interface CitySearchResultTableViewController ()

@end

@implementation CitySearchResultTableViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"searchResultCityCell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.citysArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchResultCityCell" forIndexPath:indexPath];
    NSString *str = [self.citysArr objectAtIndex:indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.parentViewController.navigationController popViewControllerAnimated:YES];
    
}


- (void)setCitysArr:(NSMutableArray *)citysArr{
    _citysArr = citysArr;
    [self.tableView reloadData];
}

@end
