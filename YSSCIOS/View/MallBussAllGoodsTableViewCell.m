//
//  MallBussAllGoodsTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussAllGoodsTableViewCell.h"

@interface MallBussAllGoodsTableViewCell ()
<
    UICollectionViewDelegateFlowLayout,
    UICollectionViewDataSource,
    MallBussAllGoodsCollectionReusableViewDelegate
>

@property (nonatomic, strong) UICollectionView *collectionView;//主列表视图

@property (nonatomic, strong) NSMutableArray *data;

@end

static NSString *const mallCell = @"mallCell";


@implementation MallBussAllGoodsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = GRAYCOLOR;
        [self.contentView addSubview:self.collectionView];
        _data = [NSMutableArray array];
        self.collectionView.sd_layout
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .heightIs(250 * _data.count + 45);

    }
    return self;
}


#pragma mark ----------------数据刷新

- (void)updateInfoWithAry:(NSArray *)ary{
    [self.data removeAllObjects];
    [self.data addObjectsFromArray:ary];
    [_collectionView reloadData];
    
    NSInteger flag = _data.count /2;
    if (_data.count %2) {
        flag += 1;
    }
    self.collectionView.sd_layout
    .heightIs(250 *flag + 55);

}



#pragma mark ----------------头部筛选按钮事件

- (void)reloadDataDelegate:(NSInteger)index{
    if (self.delegate) {
        [self.delegate reloadDataWithIndex:index];
    }
}

#pragma mark ---------CollectionViewDeleage

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mallCell forIndexPath:indexPath];
    STL_GoodsItemModel *model = _data[indexPath.row];
    [cell updateInfoWith:model];

    return cell;

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, 45);

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    MallBussAllGoodsCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
    headView.delegate = self;
    return headView;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    STL_GoodsItemModel *model = _data[indexPath.row];
    
    if (self.delegate) {
        [self.delegate selectGoodsInShopWith:model.mainGoodsMdf];
    }
}


#pragma mark ----------------实例化

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
        layOut.itemSize = CGSizeMake(SCREEN_WIDTH/2 - 27.5, 237);
        layOut.minimumLineSpacing = 12;
        layOut.minimumInteritemSpacing = 25;
        layOut.sectionInset = UIEdgeInsetsMake(12, 15, 10, 15);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layOut];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollEnabled = NO;
        [_collectionView registerClass:[MallCollectionViewCell class] forCellWithReuseIdentifier:mallCell];
        [_collectionView registerClass:[MallBussAllGoodsCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    }
    return _collectionView;
}


@end
