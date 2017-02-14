//
//  SurroundingAreaHeadView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "SurroundingAreaHeadView.h"

@interface SurroundingAreaHeadView ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UILabel *titleLB;

@property (nonatomic, strong) CAShapeLayer *indictorLayer;//指示箭头

@property (nonatomic, strong) UITableView *tableView;//选择列表

@property (nonatomic, strong) UIView *bgView;//空白背景

@property (nonatomic, assign) BOOL isShow;//是否显示列表

@property (nonatomic, strong) UIView *lineView;//底部切割线

@property (nonatomic, strong) NSMutableArray *textData;//标题分类

@property (nonatomic, copy) NSNumber *currentSelectID;//默认为全部

@end

@implementation SurroundingAreaHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _textData = [NSMutableArray array];
        _currentSelectID = @0;
        [self addSubview:self.titleLB];
        [self addSubview:self.lineView];
        [self.layer addSublayer:self.indictorLayer];
        self.titleLB.sd_layout
        .centerYIs(42)
        .centerXIs(self.frame.size.width / 2 - 7)
        .autoHeightRatio(0);
        [self.titleLB setSingleLineAutoResizeWithMaxWidth:200];
        
        self.lineView.sd_layout
        .bottomSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .rightSpaceToView(self, 0)
        .heightIs(0.5);

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuTapAction)];
        [self addGestureRecognizer:tap];
        
        YSSCWeakObj(self);
        self.titleLB.didFinishAutoLayoutBlock = ^(CGRect frame){
            weakself.indictorLayer.position = CGPointMake(SCREEN_WIDTH/2 + self.titleLB.size.width/2 + 6.5, 42);
        };
        
    }
    return self;


}


#pragma mark ----------------更新

- (void)updateInfoWith:(NSArray *)ary{
    [_textData removeAllObjects];
    [_textData addObjectsFromArray:ary];
    [self.tableView reloadData];

}


#pragma mark ----------------点击事件

- (void)menuTapAction{
    _isShow = !_isShow;
    [self animateIndicator];
    [self animationBgView];
}


#pragma mark ----------------动画效果

- (void)animationBgView{
    if (_isShow) {
        [self.superview addSubview:self.tableView];
        [self.superview addSubview:self.bgView];

        self.tableView.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self.superview, 0)
        .rightSpaceToView(self.superview, 0)
        .heightIs(44 *_textData.count);
        [self.tableView reloadData];
        
        self.bgView.sd_layout
        .topSpaceToView(self.tableView, 0)
        .leftSpaceToView(self.superview, 0)
        .rightSpaceToView(self.superview, 0)
        .bottomSpaceToView(self.superview, 0);
        
        [UIView animateWithDuration:0.25 animations:^{
            _bgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];//动画改变背景色，否则显得太突兀
        }];
        
    }else{
        [_tableView removeFromSuperview];
        [_bgView removeFromSuperview];
        _bgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    }

}

- (void)animateIndicator{
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.25];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0]];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anim.values = _isShow ? @[ @0, @(M_PI) ] : @[ @(M_PI), @0 ];
    
    if (!anim.removedOnCompletion) {
        [_indictorLayer addAnimation:anim forKey:anim.keyPath];
    } else {
        [_indictorLayer addAnimation:anim forKey:anim.keyPath];
        [_indictorLayer setValue:anim.values.lastObject forKeyPath:anim.keyPath];
    }
    //修改图标颜色
    if (_isShow) {
        _indictorLayer.strokeColor = MALLColor.CGColor;
        _titleLB.textColor = MALLColor;
    }else{
        _indictorLayer.strokeColor = SHENTEXTCOLOR.CGColor;
        _titleLB.textColor = BLACKTEXTCOLOR;
    }
    
    [CATransaction commit];

}


#pragma mark ----------------代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _textData.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _textData[indexPath.row][@"name"];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = FONT(15);
    if ([_currentSelectID isEqualToNumber:_textData[indexPath.row][@"id"]]) {
        cell.textLabel.textColor = MALLColor;
    }else{
        cell.textLabel.textColor = BLACKTEXTCOLOR;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _isShow = !_isShow;
    self.titleLB.text = _textData[indexPath.row][@"name"];
    [self animationBgView];
    [self animateIndicator];
    
    self.indictorLayer.position = CGPointMake(SCREEN_WIDTH/2 + self.titleLB.size.width/2 + 10, 42);
    _currentSelectID = _textData[indexPath.row][@"id"];
    if (self.delegate) {
        [self.delegate selectItemWithID:_currentSelectID name:_titleLB.text];
    }
}

#pragma mark ----------------实例化

- (UILabel *)titleLB{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = FONT(17);
        _titleLB.textColor = BLACKTEXTCOLOR;
        _titleLB.text = @"全部";
    }
    return _titleLB;
}

- (CAShapeLayer *)indictorLayer{
    if (_indictorLayer == nil) {
        UIBezierPath *path = [UIBezierPath new];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(6.5, 7.5)];
        [path addLineToPoint:CGPointMake(13, 0)];
        _indictorLayer  = [CAShapeLayer new];
        _indictorLayer.path = path.CGPath;
        _indictorLayer.lineWidth = 1;
        _indictorLayer.fillColor = nil;
        _indictorLayer.strokeColor = BLACKTEXTCOLOR.CGColor;
        
        CGPathRef bound = CGPathCreateCopyByStrokingPath(_indictorLayer.path, nil, _indictorLayer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, _indictorLayer.miterLimit);
        _indictorLayer.bounds = CGPathGetBoundingBox(bound);
        CGPathRelease(bound);
        _indictorLayer.position = CGPointMake(SCREEN_WIDTH/2 + 20, 42);
        
    }
    return _indictorLayer;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = GRAYCOLOR;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.backgroundColor = [UIColor redColor];
    }
    return _tableView;
}

- (UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuTapAction)];
        [_bgView addGestureRecognizer:tap];

    }
    return _bgView;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}


@end
