//
//  MallBussHomeTableViewCell.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/18.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallBussHomeTableViewCell.h"
#import "MallBussHomeCollectionReusableView.h"//顶部banner

@interface MallBussHomeTableViewCell ()
<
    UICollectionViewDelegateFlowLayout,
    UICollectionViewDataSource,
    SDCycleScrollViewDelegate
>

@property (nonatomic, strong) UICollectionView *collectionView;//主列表视图

@property (nonatomic, strong) NSMutableArray *data;//数据源

@property (nonatomic, strong) NSMutableArray *bannerData;//轮播图数据源

@end

static NSString *const mallCell = @"mallCell";

@implementation MallBussHomeTableViewCell

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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = GRAYCOLOR;
        [self.contentView addSubview:self.collectionView];
        
        
        _data = [[NSMutableArray alloc] init];
        _bannerData = [NSMutableArray array];
        self.collectionView.sd_layout
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .heightIs(250 * _data.count/2 + 210);
        
        
    }
    return self;
}

#pragma mark ----------------界面刷新

- (void)updateWith:(NSArray *)ary ret:(BOOL)ret{
    

    
    [_data removeAllObjects];
    [_data addObjectsFromArray:ary];
    [_collectionView reloadData];
    NSInteger flag = _data.count /2;
    if (_data.count %2) {
        flag += 1;
    }
    
    
    self.collectionView.sd_layout
    .heightIs(250 *flag + 220);
    
}

#pragma mark ----------------bannerDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if (self.delegate) {
        NSDictionary *dict = _bannerData[index];
        [self.delegate intoGoodsDetailWithID:dict[@"link_id"]];
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
    return CGSizeMake(SCREEN_WIDTH, 210);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    MallBussHomeCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
    //在这里请求下banner图。。
    [YSSCShareBusinessManager.mallManager getShopBannerWithParameters:@{@"shopId":_shopId, @"isGroup":@0, @"flag":@"index_store"} success:^(id responObject) {
        NSArray *ary = (NSArray *)responObject;
        [_bannerData removeAllObjects];
        [_bannerData addObjectsFromArray:ary];

        NSMutableArray *imgAry = [NSMutableArray array];

        for (NSDictionary *dict in ary) {
            if (dict[@"img"]) {
                //防止出现无图
                [imgAry addObject:dict[@"img"]];
            }
        }
        headView.bannerScr.delegate = self;
        [headView.bannerScr setImageURLStringsGroup:imgAry];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:errorMsg];
    }];

    return headView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    STL_GoodsItemModel *model = _data[indexPath.row];
    if (self.delegate) {
        [self.delegate selectGoodsInHomeShop:model.mainGoodsMdf];
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
        [_collectionView registerClass:[MallBussHomeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    }
    return _collectionView;
}



@end
