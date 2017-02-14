//
//  MallGoodsDetailRankView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "MallGoodsDetailRankView.h"
#import "STL_LimitCollectionViewCell.h"

@interface MallGoodsDetailRankView ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource
>
@property (nonatomic, strong) UIView *bgNOView;//背景空白图
@property (nonatomic, strong) UIView *bgContentView;//内容区域

@property (nonatomic, strong) UIImageView *headIv;//商品头像
@property (nonatomic, strong) UILabel *priceLb;//商品价格
@property (nonatomic, strong) UILabel *stockLb;//库存
@property (nonatomic, strong) UIButton *cancelBtn;//X按钮

@property (nonatomic, strong) UILabel *selectedLb;//已选内容

@property (nonatomic, strong) UIView *firstSingleLineView;//第一条切割线

@property (nonatomic, strong) UILabel *attrNameLb;//规格名称

@property (nonatomic, strong) UICollectionView *attrCollectionView;//

@property (nonatomic, strong) NSMutableArray *data;



@property (nonatomic, strong) UIView *secondSingleLineView;//第二条切割线


@property (nonatomic, strong) UILabel *shopNumTitleLB;//购买数量标题
@property (nonatomic, strong) UIButton *subtractBtn;//减号
@property (nonatomic, strong) UIButton *addNumBtn;//加号


@property (nonatomic, strong) UILabel *shopNum;//购买数量
@property (nonatomic, strong) UIView *thirdSingleLineView;//第三条切割线



@property (nonatomic, strong) UIButton *addBtn;//加入购物车
@property (nonatomic, strong) UIButton *buyBtn;//立即购买

@property (nonatomic, strong) STL_GoodsDetailBaseSubItemModel *itemModel;


@end

#define ContentView self.bgContentView

@implementation MallGoodsDetailRankView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        [self addSubview:self.bgNOView];
        [self addSubview:ContentView];
        _data = [NSMutableArray array];
        
        [ContentView addSubview:self.headIv];
        [ContentView addSubview:self.priceLb];
        [ContentView addSubview:self.stockLb];
        [ContentView addSubview:self.selectedLb];
        [ContentView addSubview:self.cancelBtn];
        [ContentView addSubview:self.firstSingleLineView];
        [ContentView addSubview:self.attrNameLb];
        [ContentView addSubview:self.attrCollectionView];
        [ContentView addSubview:self.secondSingleLineView];
        [ContentView addSubview:self.shopNumTitleLB];
        [ContentView addSubview:self.subtractBtn];
        [ContentView addSubview:self.shopNum];
        [ContentView addSubview:self.addNumBtn];
        [ContentView addSubview:self.thirdSingleLineView];
        [ContentView addSubview:self.addBtn];
        [ContentView addSubview:self.buyBtn];

        [self setFramAutoLayout];
    }
    return self;






}

- (void)setFramAutoLayout{
    
    ContentView.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .bottomSpaceToView(self, 0);
    

    self.headIv.sd_layout
    .topSpaceToView(ContentView, 15)
    .leftSpaceToView(ContentView, 15)
    .widthIs(90)
    .heightIs(90);
    
    self.cancelBtn.sd_layout
    .topSpaceToView(ContentView, 15)
    .rightSpaceToView(ContentView, 15)
    .widthIs(10)
    .heightEqualToWidth();
    
    self.priceLb.sd_layout
    .topSpaceToView(ContentView, 27.5)
    .leftSpaceToView(self.headIv, 25)
    .autoHeightRatio(0);
    [self.priceLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.stockLb.sd_layout
    .topSpaceToView(self.priceLb, 12)
    .leftEqualToView(self.priceLb)
    .autoHeightRatio(0);
    [self.stockLb setSingleLineAutoResizeWithMaxWidth:200];
    
    self.selectedLb.sd_layout
    .topSpaceToView(self.stockLb, 12)
    .leftEqualToView(self.stockLb)
    .rightSpaceToView(ContentView, 15)
    .autoHeightRatio(0);
    [self.selectedLb setMaxNumberOfLinesToShow:1];
    
    self.firstSingleLineView.sd_layout
    .topSpaceToView(self.headIv, 15)
    .leftEqualToView(self.headIv)
    .rightSpaceToView(ContentView, 0)
    .heightIs(0.5);
    
    self.attrNameLb.sd_layout
    .topSpaceToView(self.firstSingleLineView,15)
    .leftSpaceToView(ContentView, 15)
    .autoHeightRatio(0);
    [self.attrNameLb setSingleLineAutoResizeWithMaxWidth:300];
    
    self.attrCollectionView.sd_layout
    .topSpaceToView(self.attrNameLb, 15)
    .leftEqualToView(self.attrNameLb)
    .rightSpaceToView(ContentView, 15)
    .heightIs(25);
    
    
    self.secondSingleLineView.sd_layout
    .topSpaceToView(self.attrCollectionView, 20)
    .leftSpaceToView(ContentView, 15)
    .rightSpaceToView(ContentView, 0)
    .heightIs(0);
    
    self.shopNumTitleLB.sd_layout
    .topSpaceToView(self.secondSingleLineView, 15)
    .leftEqualToView(self.secondSingleLineView)
    .autoHeightRatio(0);
    [self.shopNumTitleLB setSingleLineAutoResizeWithMaxWidth:200];
    
    self.addNumBtn.sd_layout
    .centerYEqualToView(self.shopNumTitleLB)
    .rightSpaceToView(ContentView, 15)
    .heightIs(20)
    .widthEqualToHeight();
    
    self.shopNum.sd_layout
    .centerYEqualToView(self.shopNumTitleLB)
    .rightSpaceToView(self.addNumBtn, 12)
    .autoHeightRatio(0);
    [self.shopNum setSingleLineAutoResizeWithMaxWidth:100];
    
    self.subtractBtn.sd_layout
    .centerYEqualToView(self.shopNumTitleLB)
    .rightSpaceToView(self.shopNum, 12)
    .heightIs(20)
    .widthEqualToHeight();
    
    
    self.thirdSingleLineView.sd_layout
    .topSpaceToView(self.shopNumTitleLB, 15)
    .leftEqualToView(self.secondSingleLineView)
    .rightSpaceToView(ContentView, 0)
    .heightIs(0.5);
    
    self.addBtn.sd_layout
    .topSpaceToView(self.thirdSingleLineView, 82)
    .leftSpaceToView(ContentView, 0)
    .widthRatioToView(ContentView, 0.5)
    .heightIs(50);
    
    self.buyBtn.sd_layout
    .topEqualToView(self.addBtn)
    .rightSpaceToView(ContentView, 0)
    .widthRatioToView(ContentView, 0.5)
    .heightIs(50);


    [ContentView setupAutoHeightWithBottomView:_buyBtn bottomMargin:0];

    self.bgNOView.sd_layout
    .topSpaceToView(self, 0)
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .bottomSpaceToView(ContentView, 0);

}

#pragma mark ----------------刷新数据

- (void)updateInfoWith:(STL_GoodsDetailBaseInfoModel *)model{
    for (NSInteger i = 0; i <  model.subList.count; i++) {
        STL_GoodsDetailBaseSubItemModel *itemmodel = model.subList[i];
        if ([_currentValue isEqualToString:itemmodel.attr_id]) {
            itemmodel.quantity = _shopNum.text;
            [self updateInfoWithItemModel:itemmodel];
            _itemModel = itemmodel;
        }
    }
    _data = [model.subList mutableCopy];
    [_attrCollectionView reloadData];
    
}

- (void)updateInfoWithItemModel:(STL_GoodsDetailBaseSubItemModel *)itemmodel
{
    [self.headIv sd_setImageWithURL:[NSURL URLWithString:itemmodel.pic] placeholderImage:IMAGE(@"placeholderImage")];
    self.priceLb.text = [NSString stringWithFormat:@"¥: %@",itemmodel.promotion_price];
    self.stockLb.text = [NSString stringWithFormat:@"库存%@件", itemmodel.amount];
    self.selectedLb.text = [NSString stringWithFormat:@"已选: %@",itemmodel.avalue];
    self.attrNameLb.text = itemmodel.attr_name;

}

#pragma mark ----------------collectionviewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    STL_LimitCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    STL_GoodsDetailBaseSubItemModel *model = _data[indexPath.row];
    [cell updateInfoWithItemModel:model];
    
    if ([model.attr_id isEqualToString:_currentValue]) {
        [cell setColorWithBool:YES];
    }else{
        [cell setColorWithBool:NO];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    STL_GoodsDetailBaseSubItemModel *model = _data[indexPath.row];
    if ([_currentValue isEqualToString:model.attr_id]) {
        return;
    }
    _itemModel = model;
    _currentValue = model.attr_id;//选中
    _itemModel.quantity = @"1";
    _shopNum.text = @"1";
    if (self.delegate) {
        [self.delegate selectItemWith:model];
    }
    [self updateInfoWithItemModel:model];
    [collectionView reloadData];
}


#pragma mark ----------------事件

- (void)cancelAction{
    [self removeFromSuperview];
    self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (void)addAction{
    if (self.delegate) {
        [self.delegate addToStoreCarWithCurrentRank];
    }
}

- (void)buyNowAction{
    if (self.delegate) {
        [self.delegate buyNowWithCurrentRank];
    }
}

- (void)subtractAction{
    NSInteger num = self.shopNum.text.integerValue;
    if (num == 1) {
        [SVProgressHUD showErrorWithStatus:@"购买数量不能小于1"];
        return;
    }else{
        num -= 1;
    }
    
    self.shopNum.text = [NSString stringWithFormat:@"%ld",num];
    _itemModel.quantity = [NSString stringWithFormat:@"%ld", num];
}

- (void)addNumAction{
    
    NSInteger num = self.shopNum.text.integerValue;
    if (num >= _itemModel.amount.integerValue) {
        [SVProgressHUD showErrorWithStatus:@"超过库存"];
        return;
    }else{
        num += 1;
    }
    
    self.shopNum.text = [NSString stringWithFormat:@"%ld",num];
    _itemModel.quantity = [NSString stringWithFormat:@"%ld", num];
}

#pragma mark ----------------实例化

- (UIImageView *)headIv{
    if (_headIv == nil) {
        _headIv = [[UIImageView alloc] init];
        _headIv.image = IMAGE(@"placeholderImage");
    }
    return _headIv;
}

- (UILabel *)priceLb{
    if (_priceLb == nil) {
        _priceLb = [[UILabel alloc] init];
        _priceLb.font = FONT(17);
        _priceLb.textColor = MALLColor;
        _priceLb.text = @"¥: 29.00";
    }
    return _priceLb;
}

- (UILabel *)stockLb{
    if (_stockLb == nil) {
        _stockLb = [[UILabel alloc] init];
        _stockLb.font = FONT(14);
        _stockLb.textColor = LIGHTTEXTCOLOR;
        _stockLb.text = @"库存 18 件";
    }
    return _stockLb;
}

- (UILabel *)selectedLb{
    if (_selectedLb == nil) {
        _selectedLb = [[UILabel alloc] init];
        _selectedLb.font = FONT(12);
        _selectedLb.textColor = BLACKTEXTCOLOR;
        _selectedLb.text = @"已选: 720kg";
    }
    return _selectedLb;
}

- (UIButton *)cancelBtn{
    if (_cancelBtn == nil) {
        _cancelBtn = [[UIButton alloc] init];
        [_cancelBtn setBackgroundImage:IMAGE(@"classify71") forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;

}

- (UIView *)firstSingleLineView{
    if (_firstSingleLineView == nil) {
        _firstSingleLineView = [[UIView alloc] init];
        _firstSingleLineView.backgroundColor = GRAYCOLOR;
    }
    return _firstSingleLineView;
}

- (UIView *)secondSingleLineView{
    if (_secondSingleLineView == nil) {
        _secondSingleLineView = [[UIView alloc] init];
        _secondSingleLineView.backgroundColor = GRAYCOLOR;
    }
    return _secondSingleLineView;
}

- (UILabel *)shopNum{
    if (_shopNum == nil) {
        _shopNum = [[UILabel alloc] init];
        _shopNum.font = FONT(14);
        _shopNum.textColor = BLACKTEXTCOLOR;
        _shopNum.text = @"1";
        _shopNum.textAlignment= NSTextAlignmentCenter;
    }
    return _shopNum;

}

- (UILabel *)shopNumTitleLB{
    if (_shopNumTitleLB == nil) {
        _shopNumTitleLB = [[UILabel alloc] init];
        _shopNumTitleLB.font = FONT(14);
        _shopNumTitleLB.textColor = BLACKTEXTCOLOR;
        _shopNumTitleLB.text = @"购买数量";
    }
    return _shopNumTitleLB;
}

- (UIButton *)subtractBtn{
    if (_subtractBtn == nil) {
        _subtractBtn = [[UIButton alloc] init];
        [_subtractBtn setBackgroundImage:IMAGE(@"classify74") forState:UIControlStateNormal];
        [_subtractBtn addTarget:self action:@selector(subtractAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subtractBtn;

}

- (UIButton *)addNumBtn{
    if (_addNumBtn == nil) {
        _addNumBtn = [[UIButton alloc] init];
        [_addNumBtn setBackgroundImage:IMAGE(@"classify76") forState:UIControlStateNormal];
        [_addNumBtn addTarget:self action:@selector(addNumAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addNumBtn;

}

- (UIView *)thirdSingleLineView{
    if (_thirdSingleLineView == nil) {
        _thirdSingleLineView = [[UIView alloc] init];
        _thirdSingleLineView.backgroundColor = GRAYCOLOR;
    }
    return _thirdSingleLineView;
}

- (UIButton *)addBtn{
    if (_addBtn == nil) {
        _addBtn = [[UIButton alloc] init];
        _addBtn.backgroundColor = YSSCRGBColor(250, 140, 40);
        [_addBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_addBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
        _addBtn.titleLabel.font = FONT(14);
    }
    return _addBtn;
}

- (UIButton *)buyBtn{
    if (_buyBtn == nil) {
        _buyBtn = [[UIButton alloc] init];
        _buyBtn.backgroundColor = MALLColor;
        [_buyBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        [_buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [_buyBtn addTarget:self action:@selector(buyNowAction) forControlEvents:UIControlEventTouchUpInside];
        _buyBtn.titleLabel.font = FONT(14);
    }
    return _buyBtn;
}

- (UIView *)bgNOView{
    if (_bgNOView == nil) {
        _bgNOView = [[UIView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelAction)];
        [_bgNOView addGestureRecognizer:tap];
    }
    return _bgNOView;

}

- (UIView *)bgContentView{
    if (_bgContentView == nil) {
        _bgContentView = [[UIView alloc] init];
        _bgContentView.backgroundColor = WHITECOLOR;
    }
    return _bgContentView;
}

- (UILabel *)attrNameLb{
    if (_attrNameLb == nil) {
        _attrNameLb = [[UILabel alloc] init];
        _attrNameLb.font = FONT(14);
        _attrNameLb.textColor = BLACKTEXTCOLOR;
    }
    return _attrNameLb;
}

- (UICollectionView *)attrCollectionView{
    if (_attrCollectionView == nil) {
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
        layOut.itemSize = CGSizeMake((SCREEN_WIDTH - 60)/4, 25);
        layOut.minimumInteritemSpacing = 10;//格子间距
        layOut.minimumLineSpacing = 15;
        layOut.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _attrCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layOut];
        _attrCollectionView.backgroundColor = WHITECOLOR;
        _attrCollectionView.delegate = self;
        _attrCollectionView.dataSource = self;
        [_attrCollectionView registerClass:[STL_LimitCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _attrCollectionView;
}

@end
