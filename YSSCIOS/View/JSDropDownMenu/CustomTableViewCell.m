//
//  CustomTableViewCell.m
//  筛选
//
//  Created by TSApple on 16/8/10.
//  Copyright © 2016年 StarLi. All rights reserved.
//


#define WIDTH_CELL self.frame.size.width
#define HEIGHT_CELL self.frame.size.height

#import "CustomTableViewCell.h"
#import "CustomCollectionViewCell.h"
@interface CustomTableViewCell ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource
>

@property (nonatomic, strong) UILabel *titleLb;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataTitleAry;



@end

static NSString *const collectionCell = @"cell";

@implementation CustomTableViewCell

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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deSelectItemCell) name:@"replaceItme" object:nil];
        
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
    }
    return self;

}


#pragma mark ---------界面刷新

- (void)setTitle:(NSString *)title itemTitleAry:(NSArray *)ary{
    _titleLb.text = title;

    [_dataTitleAry removeAllObjects];
    [_dataTitleAry addObjectsFromArray:ary];
    [_collectionView reloadData];
}



#pragma mark ---------delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataTitleAry.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCell forIndexPath:indexPath];
    ClassAttributeItemValueObject *obj = _dataTitleAry[indexPath.row];
    [cell setItemTitle:obj.value];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell = (CustomCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setColor];
    [collectionView reloadData];
    [collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    ClassAttributeItemValueObject *obj = _dataTitleAry[indexPath.row];
//    NSLog(@"%@",obj.value);
//    [[MallLimitObject sharedMallLimitObject].limitDic setObject:obj forKey:_titleLb.text];
//    [[MallLimitObject sharedMallLimitObject].limitDic setObject:@"123" forKey:@"12313"];
}


#pragma mark ---------通知取消选中重置筛选条件

- (void)deSelectItemCell{
    for (NSInteger i = 0; i < _dataTitleAry.count; i++) {
        [_collectionView deselectItemAtIndexPath:[NSIndexPath indexPathWithIndex:i] animated:YES];
    }
    [_collectionView reloadData];
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
        [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:collectionCell];
    }
    return _collectionView;
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
