//
//  MallBussMessTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussMessTableViewCell.h"

@interface MallBussMessTableViewCell ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *messTableView;//动态列表

@property (nonatomic, strong) NSMutableArray *newdata;


@end

static NSString *const cellId = @"cell";

@implementation MallBussMessTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = GRAYCOLOR;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _newdata = [NSMutableArray array];
        [self.contentView addSubview:self.messTableView];
        self.messTableView.sd_layout
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0);
        

    }
    return self;
}

- (void)setData:(NSArray *)data{
    [_newdata removeAllObjects];
    [_newdata addObjectsFromArray:data];
    [_messTableView reloadData];
    
    _messTableView.sd_layout
    .heightIs([_messTableView cellsTotalHeight]);
    
    [self setupAutoHeightWithBottomView:_messTableView bottomMargin:10];
}

#pragma mark ----------------数据刷新

//- (void)updateWith:(NSArray *)ary{
//    [_data removeAllObjects];
//    [_data addObjectsFromArray:ary];
//    [_messTableView reloadData];
//    _messTableView.sd_layout
//    .heightIs([_messTableView cellsTotalHeight]);
//    
//    
//}


#pragma mark ----------------tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _newdata.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MallBussMessInfoTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.model = _newdata[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MallShopCommentItemModel *model = _newdata[indexPath.row];
    return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[MallBussMessInfoTableViewCell class] contentViewWidth:SCREEN_WIDTH];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}


#pragma mark ----------------实例化

- (UITableView *)messTableView{
    if (_messTableView == nil) {
        _messTableView = [[UITableView alloc] init];
        _messTableView.backgroundColor = WHITECOLOR;
        _messTableView.scrollEnabled = NO;
        _messTableView.delegate = self;
        _messTableView.dataSource = self;
        _messTableView.separatorColor = GRAYCOLOR;
        _messTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_messTableView registerClass:[MallBussMessInfoTableViewCell class] forCellReuseIdentifier:cellId];
    }
    return _messTableView;
}


@end
