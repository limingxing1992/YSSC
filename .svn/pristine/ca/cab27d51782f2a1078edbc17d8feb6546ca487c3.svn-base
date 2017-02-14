//
//  STL_LimitTableViewCell.m
//  LSDevModel3
//
//  Created by 李明星 on 16/9/5.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "STL_LimitTableViewCell.h"
#import "STL_LimitCollectionViewCell.h"

@interface STL_LimitTableViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UILabel *titleLb;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataTitleAry;

@end

static NSString *const collectionCell = @"cell";

@implementation STL_LimitTableViewCell

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
        _dataTitleAry = [NSMutableArray new];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.titleLb];
        [self addSubview:self.collectionView];
        
        self.titleLb.sd_layout
        .topSpaceToView(self, 20)
        .leftSpaceToView(self, 15)
        .autoHeightRatio(0);
        [self.titleLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.collectionView.sd_layout
        .topSpaceToView(self.titleLb, 15)
        .leftEqualToView(self.titleLb)
        .bottomSpaceToView(self, 0)
        .rightSpaceToView(self, 15);
        
        [self setupAutoHeightWithBottomView:_collectionView bottomMargin:10];
    }
    return self;
    
}

#pragma mark ----------------数据刷新

- (void)updateInfoWithData:(STL_ClassifyLimitItemModel *)model{
    _titleLb.text = model.attrName;
    _model = model;
    [_dataTitleAry removeAllObjects];
    _dataTitleAry = [model.attrValues mutableCopy];
    [_collectionView reloadData];
}


#pragma mark ----------------获取cell高度

+ (CGFloat)autoHeigthWithValueNumber:(NSInteger)num{
    NSInteger flag = num / 5  + 1;
    return flag * 40 + 50;
}


#pragma mark ---------delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataTitleAry.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    STL_LimitCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCell forIndexPath:indexPath];
    STL_ClassifyLimitItemValueModel *model = _dataTitleAry[indexPath.row];
    [cell updateInfoWith:model];
    if ([model.ID isEqualToString:_model.currentValue]) {
        [cell setColorWithBool:YES];
    }else{
        [cell setColorWithBool:NO];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    STL_ClassifyLimitItemValueModel *model = _dataTitleAry[indexPath.row];
    if ([_model.currentValue isEqualToString:model.ID]) {
        _model.currentValue = nil;//取消选中
    }else{
        _model.currentValue = model.ID;//选中
    }
    [collectionView reloadData];
}


#pragma mark ---------实例化

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.font = FONT(14);
        
    }
    return _titleLb;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
        layOut.itemSize = CGSizeMake((SCREEN_WIDTH - 60)/4, 25);
        layOut.minimumInteritemSpacing = 10;//格子间距
        layOut.minimumLineSpacing = 15;
        layOut.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layOut];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[STL_LimitCollectionViewCell class] forCellWithReuseIdentifier:collectionCell];
    }
    return _collectionView;
}


@end
