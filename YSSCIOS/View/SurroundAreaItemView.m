//
//  SurroundAreaItemView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/15.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SurroundAreaItemView.h"

@interface SurroundAreaItemView ()

@property (nonatomic, strong) UIImageView *bussHeadIv;//商家头像

@property (nonatomic, strong) UILabel *bussNameLb;//商家名称

@property (nonatomic, strong) UILabel *bussDistanceLb;//距离

@property (nonatomic, strong) UILabel *bussLimitPriceLb;//人均消费金额

@property (nonatomic, strong) UIImageView *positionIv;//定位图标

@property (nonatomic, copy) NSString *Id;


@end

@implementation SurroundAreaItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClick)];
        [self addGestureRecognizer:tap];
        
        [self addSubview:self.bussHeadIv];
        [self addSubview:self.bussNameLb];
        [self addSubview:self.bussDistanceLb];
        [self addSubview:self.bussLimitPriceLb];
        [self addSubview:self.positionIv];
        /*
         布局
         */
        self.bussHeadIv.sd_layout
        .topSpaceToView(self, 13)
        .leftSpaceToView(self,16.5)
        .bottomSpaceToView(self, 13)
        .widthIs(100);
        
        self.bussNameLb.sd_layout
        .topSpaceToView(self, 19.5)
        .leftSpaceToView(self.bussHeadIv, 15)
        .autoHeightRatio(0);
        [self.bussNameLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.bussLimitPriceLb.sd_layout
        .bottomSpaceToView(self, 17.5)
        .leftEqualToView(self.bussNameLb)
        .autoHeightRatio(0);
        [self.bussLimitPriceLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.bussDistanceLb.sd_layout
        .topEqualToView(self.bussLimitPriceLb)
        .rightSpaceToView(self, 15)
        .autoHeightRatio(0);
        [self.bussDistanceLb setSingleLineAutoResizeWithMaxWidth:200];
        
        self.positionIv.sd_layout
        .topEqualToView(self.bussLimitPriceLb)
        .rightSpaceToView(self.bussDistanceLb, 5)
        .widthIs(10)
        .heightIs(14);
    }
    return self;
}

#pragma mark ----------------刷新界面

- (void)updateInfoWith:(SurroundingAreaItemModel *)model{
    [self.bussHeadIv sd_setImageWithURL:[NSURL URLWithString:model.tbumbnail] placeholderImage:PlaceholderHeadImage];
    self.bussNameLb.text = model.name;
    self.bussLimitPriceLb.text = [NSString stringWithFormat:@"¥%ld/人",model.consumption];
//    if (model.distance / 1000) {
//
//    }
//    self.bussDistanceLb.text = [NSString stringWithFormat:@"%@米",model.distance];
    
    float dis = model.distance / 1000.f;
    if (dis >= 1.0f) {
        self.bussDistanceLb.text = [NSString stringWithFormat:@"%.1fkm", dis];
    }else{
        self.bussDistanceLb.text = [NSString stringWithFormat:@"%.0fm",model.distance];
    }
    self.Id = model.ID;
}


#pragma mark ----------------点击事件

- (void)onClick
{
    if (_block) {
        _block(self.Id);
    }
}

#pragma mark ----------------实例化

- (UIImageView *)bussHeadIv{
    if (_bussHeadIv == nil) {
        _bussHeadIv = [[UIImageView alloc] init];
        _bussHeadIv.layer.borderWidth = 0.5;
        _bussHeadIv.layer.borderColor = GRAYCOLOR.CGColor;
        _bussHeadIv.image = PlaceholderHeadImage;
    }
    return _bussHeadIv;
}

- (UILabel *)bussNameLb{
    if (_bussNameLb == nil) {
        _bussNameLb = [[UILabel alloc] init];
        _bussNameLb.font = FONT(16);
        _bussNameLb.textColor = BLACKTEXTCOLOR;
        _bussNameLb.text = @"马格里阿塔";
    }
    return _bussNameLb;
}

- (UILabel *)bussDistanceLb{
    if (_bussDistanceLb == nil) {
        _bussDistanceLb = [[UILabel alloc] init];
        _bussDistanceLb.font = FONT(14);
        _bussDistanceLb.textColor = BLACKTEXTCOLOR;
        _bussDistanceLb.text = @"100米";
    }
    return _bussDistanceLb;
}

- (UILabel *)bussLimitPriceLb{
    if (_bussLimitPriceLb == nil) {
        _bussLimitPriceLb = [[UILabel alloc] init];
        _bussLimitPriceLb.font = FONT(14);
        _bussLimitPriceLb.textColor = MALLColor;
        _bussLimitPriceLb.text = @"¥ 22/人";
    }
    return _bussLimitPriceLb;
}

- (UIImageView *)positionIv{
    if (_positionIv == nil) {
        _positionIv = [[UIImageView alloc] initWithImage:IMAGE(@"classify88")];
    }
    return _positionIv;
}

@end
