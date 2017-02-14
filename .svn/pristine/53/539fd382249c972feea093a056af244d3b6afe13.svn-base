//
//  STL_DropDownMenu.m
//  LSDevModel3
//
//  Created by 李明星 on 16/9/5.
//  Copyright © 2016年 sen. All rights reserved.
//

#import "STL_DropDownMenu.h"
#import "STL_LimitTableViewCell.h"

@interface STL_DropDownMenu ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, assign) NSInteger numOfMenu;//指示个数 默认三个


@property (nonatomic, strong) NSArray *titleLayerAry;//标题结合

@property (nonatomic, strong) NSArray *indicotorLayerAry;//指示器集合


@property (nonatomic, strong) UIView *lineView;//底部切割线


@property (nonatomic, strong) UIView *backGroundView;//空白区域


@property (nonatomic, assign) BOOL show;//是否展开

@property (nonatomic, assign) NSInteger lastSelectIndex;//上次选中位置

/*
 记录上一次选中坐标
 */

@property (nonatomic, assign) NSInteger selectLeftRow;//一级分类选中位置
@property (nonatomic, assign) NSInteger selectRightRow;//二级分类选中位置
@property (nonatomic, assign) NSInteger selectSortRow;//排序选中位置

/*
 */
@property (nonatomic, assign) NSInteger lastSelectLeftRow;//上次一级分类选中

/*
 主要视图
 */
@property (nonatomic, strong) UITableView *leftTableView;//左侧列表
@property (nonatomic, strong) UITableView *rigthTableView;//右侧列表
@property (nonatomic, strong) UITableView *limitTableView;//筛选视图

/*
 数据源
 */
@property (nonatomic, strong) NSMutableArray *firstLevelData;//一级分类
@property (nonatomic, strong) NSMutableArray *secLevelData;//二级分类
@property (nonatomic, strong) NSMutableArray *sortData;//排序
@property (nonatomic, strong) NSMutableArray *limitData;//筛选


@end

@implementation STL_DropDownMenu

//初始化
- (instancetype)initWithTitleAry:(NSArray *)titles fram:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _numOfMenu = titles.count;
        [self addBgViewAndLineView];//分割线
        [self creatLayersWithTitles:titles];//创建标题和指示器，分割线等
        [self createTap];//添加手势
        [self createData];//初始化数据
    }
    return self;
}


#pragma mark ----------------数据初始化

- (void)createData{
    STL_ClassifyItemModel *model = [[STL_ClassifyItemModel alloc] init];
    model.cname =@"全部";
    model.ID = @"";
    STL_ClassifyItemModel *modelNull = [[STL_ClassifyItemModel alloc] init];
    modelNull.cname = @"全部";
    modelNull.ID = @"";
    self.firstLevelData = [[NSMutableArray alloc] initWithObjects:model, nil];
    self.secLevelData = [[NSMutableArray alloc] initWithObjects:model, nil];
    self.sortData = [[NSMutableArray alloc] init];
    NSArray *nameSort = @[@"智能排序", @"销量从高到低", @"人气从高到低", @"价格从低到高",@"价格从高到低"];
    NSArray *idSort = @[@"0_0", @"1_1", @"3_1", @"2_0", @"2_1"];
    for (NSInteger i = 0; i <nameSort.count; i++) {
        NSDictionary *dict = @{@"name":nameSort[i], @"Id":idSort[i]};
        [self.sortData addObject:dict];
    }
    self.limitData = [[NSMutableArray alloc] init];
}


#pragma mark ----------------数据刷新

- (void)updateFisrtDataWithAry:(NSArray *)data{
    [_firstLevelData removeAllObjects];
    _firstLevelData = [data mutableCopy];
    [_leftTableView reloadData];
    [_rigthTableView reloadData];
    [_limitTableView reloadData];
    
}

- (void)updateSecDataWithAry:(NSArray *)data{
    [_secLevelData removeAllObjects];
    _secLevelData = [data mutableCopy];
    [_rigthTableView reloadData];
}

- (void)updateLimitWithAry:(NSArray *)data{
    [_limitData removeAllObjects];
    _limitData = [data mutableCopy];
    [_limitTableView reloadData];
}

#pragma mark ----------------提交数据刷新条件

- (void)sumbitLimit:(UIButton *)sender{
    NSMutableArray *limitInfoAry = [[NSMutableArray alloc] init];
    for (STL_ClassifyLimitItemModel *model in _limitData) {
        if (model.currentValue) {
            [limitInfoAry addObject:model.currentValue];
        }
    }
    if (self.delegate) {
        [self.delegate sumbitClassLimitAry:limitInfoAry];
    }
    [self animateWithTapIndex:2 forword:NO];//关闭显示
}

- (void)repalceLimit:(UIButton *)sender{
    for (STL_ClassifyLimitItemModel *model in _limitData) {
        model.currentValue = nil;
    }
    [_limitTableView reloadData];
}

#pragma mark ----------------tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (_lastSelectIndex) {
        case 0:
        {
            if (tableView == _leftTableView) {
                return _firstLevelData.count;
            }else if (tableView == _rigthTableView){
                return _secLevelData.count;
            }
        }
            break;
        case 1:
        {
            return _sortData.count;
        }
            break;
        case 2:
        {
            return _limitData.count;
        }
            break;
        default:
            break;
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _limitTableView) {
        STL_LimitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"limit"];
        [cell updateInfoWithData:_limitData[indexPath.row]];
        return cell;
    }
    if (_lastSelectIndex == 0) {
        if (tableView == _leftTableView) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"left"];
            cell.backgroundColor = GRAYCOLOR;
            cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
            cell.selectedBackgroundView.backgroundColor = WHITECOLOR;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = [_firstLevelData[indexPath.row] cname];
            cell.textLabel.font = FONT(14);
            return cell;
        }else if (tableView == _rigthTableView){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rigth_left"];
            cell.textLabel.text = [_secLevelData[indexPath.row] cname];
            cell.textLabel.font = FONT(14);
            if (_selectRightRow == indexPath.row && _lastSelectLeftRow == _selectLeftRow) {
                cell.textLabel.textColor = MALLColor;
            }else{
                cell.textLabel.textColor = BLACKTEXTCOLOR;
            }
            return cell;
        }
    }else if (_lastSelectIndex == 1){
        if (tableView == _rigthTableView) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rigth"];
            cell.textLabel.text = _sortData[indexPath.row][@"name"];
            cell.textLabel.font = FONT(14);
            if (_selectSortRow == indexPath.row) {
                cell.textLabel.textColor = MALLColor;
            }else{
                cell.textLabel.textColor = BLACKTEXTCOLOR;
            }
            return cell;
        }
    }
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_lastSelectIndex == 2) {
        return [STL_LimitTableViewCell autoHeigthWithValueNumber:[_limitData[indexPath.row] attrValues].count];
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (tableView == _limitTableView) {
        return 57.5;
    }
    return 0.000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.000001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (tableView == _limitTableView) {
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 57.5)];
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [btn setBackgroundColor:MALLColor];
        [btn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        btn.titleLabel.font = FONT(15);
        [footView addSubview:btn];
        [btn addTarget:self action:@selector(sumbitLimit:) forControlEvents:UIControlEventTouchUpInside];
        btn.sd_layout
        .centerYEqualToView(footView)
        .rightSpaceToView(footView, 15)
        .heightIs(37.5)
        .widthIs(SCREEN_WIDTH / 2 - 22.5);
        
        UIButton *reBtn = [[UIButton alloc] init];
        [reBtn setTitle:@"重置" forState:UIControlStateNormal];
        [reBtn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [reBtn setBackgroundColor:WHITECOLOR];
        reBtn.titleLabel.font = FONT(15);
        reBtn.layer.borderWidth = 1;
        reBtn.layer.borderColor = GRAYCOLOR.CGColor;
        [reBtn addTarget:self action:@selector(repalceLimit:) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:reBtn];
        
        reBtn.sd_layout
        .centerYEqualToView(btn)
        .rightSpaceToView(btn, 15)
        .leftSpaceToView(footView, 15)
        .heightRatioToView(btn, 1);
        return footView;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTableView) {
        //单选一级分类
        [self.delegate didSelectIndex:_lastSelectIndex firstId:[_firstLevelData[indexPath.row] ID] secId:nil leftOrRight:0];
        _selectLeftRow = indexPath.row;
        return;
    }
    
    if (_lastSelectIndex == 0 && tableView == _rigthTableView) {
        [self.delegate didSelectIndex:_lastSelectIndex firstId:nil secId:[_secLevelData[indexPath.row] ID] leftOrRight:1];
        _selectRightRow = indexPath.row;
        _lastSelectLeftRow = _selectLeftRow;//保存上次退出前选中的一级分类
        [self animateTitle:[_secLevelData[indexPath.row] cname]];
        //单选二级分类
        [self.delegate getClassLimit];///刷新筛选条件
    }else if (_lastSelectIndex == 1){
        //单选排序
        [self.delegate didSelectIndex:_lastSelectIndex firstId:[_sortData[indexPath.row] objectForKey:@"Id"] secId:nil leftOrRight:0];
        _selectSortRow = indexPath.row;
        [self animateTitle:_sortData[indexPath.row][@"name"]];
    }
    
    
}


#pragma mark ----------------添加背景视图和分割线

- (void)addBgViewAndLineView{
    [self addSubview:self.lineView];
    self.lineView.sd_layout
    .bottomSpaceToView(self, 0)
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .heightIs(0.5);
}


#pragma mark ----------------创建标题和指示器

- (void)creatLayersWithTitles:(NSArray *)titles{
    CGFloat textLayerInterval = self.frame.size.width / ( _numOfMenu * 2);
    CGFloat separatorLineInterval = self.frame.size.width / _numOfMenu;
    
    NSMutableArray *tempTitles = [[NSMutableArray alloc] initWithCapacity:_numOfMenu];
    NSMutableArray *tempIndicators = [[NSMutableArray alloc] initWithCapacity:_numOfMenu];
    for (NSInteger i = 0; i < titles.count; i ++) {
        //title
        CGPoint titlePosition = CGPointMake( (i * 2  + 1) * textLayerInterval , self.frame.size.height / 2);
        CATextLayer *title = [self createTextLayerWithNSString:titles[i] position:titlePosition];
        [self.layer addSublayer:title];
        [tempTitles addObject:title];
        //indicator
        CAShapeLayer *indicator = [self creatIndictorLayerWithPosition:CGPointMake(titlePosition.x + title.bounds.size.width / 2 + 10, self.frame.size.height / 2)];
        [self.layer addSublayer:indicator];
        [tempIndicators addObject:indicator];
        //separato
        if (i != _numOfMenu - 1) {
            CGPoint separatorPosition = CGPointMake((i + 1) * separatorLineInterval, self.frame.size.height/2);
            CAShapeLayer *separator = [self createSeparatorLineWithPosition:separatorPosition];
            [self.layer addSublayer:separator];
        }
    }
    _titleLayerAry = [tempTitles copy];
    _indicotorLayerAry = [tempIndicators copy];
    
}


#pragma mark ----------------手势

- (void)createTap{
    UITapGestureRecognizer *menuTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuTapped:)];
    [self addGestureRecognizer:menuTap];
    UITapGestureRecognizer *bgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundTapped:)];
    [self.backGroundView addGestureRecognizer:bgTap];
    
}
//菜单栏点击
- (void)menuTapped:(UITapGestureRecognizer *)sender{
    CGPoint touchPoint = [sender locationInView:self];//获取手势触发点
    NSInteger tapIndex = touchPoint.x / (SCREEN_WIDTH / _numOfMenu);
    //取消上一次选中
    [self animateIndicator:_indicotorLayerAry[_lastSelectIndex] Forward:NO complete:^{
        [self animateTitle:_titleLayerAry[_lastSelectIndex] show:NO complete:nil];
    }];
    //动画选中本次选中
    if (tapIndex == _lastSelectIndex && _show) {
        //点击上次选中位置。关闭展示
        [self animateWithTapIndex:tapIndex forword:NO];
    }else{
        //展示
        [self animateWithTapIndex:tapIndex forword:YES];
    }
    
}
//空白点击
- (void)backGroundTapped:(UITapGestureRecognizer *)sender{
    [self animateWithTapIndex:_lastSelectIndex forword:NO];
}


#pragma mark ----------------动画区域

//动画综合
- (void)animateWithTapIndex:(NSInteger)tapIndex forword:(BOOL)forword{
    [self animateIndicator:_indicotorLayerAry[tapIndex] Forward:forword complete:^{
        [self animateTitle:_titleLayerAry[tapIndex] show:forword complete:^{
            [self animateBackGroundView:_backGroundView show:forword complete:^{
                [self animateTableViewWith:tapIndex forword:forword complete:^{
                    _show = forword;
                    _lastSelectIndex = tapIndex;
                }];
            }];
        }];
    }];
}
//动画展示背景视图
- (void)animateBackGroundView:(UIView *)view show:(BOOL)show complete:(NILBlock)complete {
    if (show) {
        [self.superview addSubview:view];
        [view.superview addSubview:self];
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    }
    if (complete) {
        complete();
    }
}
//动画指示箭头
- (void)animateIndicator:(CAShapeLayer *)indicator Forward:(BOOL)forward complete:(NILBlock)complete {
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.25];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0]];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anim.values = forward ? @[ @0, @(M_PI) ] : @[ @(M_PI), @0 ];
    
    if (!anim.removedOnCompletion) {
        [indicator addAnimation:anim forKey:anim.keyPath];
    } else {
        [indicator addAnimation:anim forKey:anim.keyPath];
        [indicator setValue:anim.values.lastObject forKeyPath:anim.keyPath];
    }
    //修改图标颜色
    if (forward) {
        indicator.strokeColor = MALLColor.CGColor;
    }else{
        indicator.strokeColor = SHENTEXTCOLOR.CGColor;
    }
    
    [CATransaction commit];
    if (complete) {
        complete();
    }
    
}
//动画标题
- (void)animateTitle:(CATextLayer *)title show:(BOOL)show complete:(NILBlock)complete {
    
    CGSize size = [self calculateTitleSizeWithString:title.string];
    CGFloat sizeWidth = (size.width < (self.frame.size.width / _numOfMenu) - 25) ? size.width : self.frame.size.width / _numOfMenu - 25;
    title.bounds = CGRectMake(0, 0, sizeWidth, size.height);
    //修改字体颜色
    if (show) {
        title.foregroundColor = MALLColor.CGColor;
        
    }else{
        title.foregroundColor = SHENTEXTCOLOR.CGColor;
    }
    
    if (complete) {
        complete();
    }
}
//展示列表
- (void)animateTableViewWith:(NSInteger)tapIndex forword:(BOOL)forword complete:(NILBlock)complete{
    CGRect leftFrame = CGRectMake(0, 0, 0, 2000);
    CGRect rightFrame = CGRectMake(0, 0, 0, 2000);
    CGRect limitFrame = CGRectMake(0, 0, 0, 2000);
    
    [self.leftTableView removeFromSuperview];
    [self.rigthTableView removeFromSuperview];
    [self.limitTableView removeFromSuperview];
    
    if (complete) {
        complete();
    }
    
    if (forword) {
        if (tapIndex == 0) {
            CGFloat height = self.firstLevelData.count *44;//右侧列表高度和左侧保持一致
            if (height >=  SCREEN_HEIGHT - 110 - 49) {
                height = SCREEN_HEIGHT - 110 -49;
            }
            
            leftFrame = CGRectMake(0, STL_ORIGIN_Y + HEIGHT_CELL , SCREEN_WIDTH *0.4, height);
            rightFrame = CGRectMake(SCREEN_WIDTH *0.4,HEIGHT_CELL + STL_ORIGIN_Y, SCREEN_WIDTH *0.6, height);
            
            self.leftTableView.frame = leftFrame;
            self.rigthTableView.frame = rightFrame;
            [self.superview addSubview:self.leftTableView];
            [self.superview addSubview:self.rigthTableView];
            [self.leftTableView reloadData];
            [self.rigthTableView reloadData];
            NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:_selectLeftRow inSection:0];
            [_leftTableView selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        }else if (tapIndex == 1){
            rightFrame = CGRectMake(0, HEIGHT_CELL + STL_ORIGIN_Y, SCREEN_WIDTH, self.sortData.count *44);
            self.rigthTableView.frame = rightFrame;
            [self.superview addSubview:self.rigthTableView];
            [self.rigthTableView reloadData];
        }else if (tapIndex == 2){
            CGFloat totalHeight = 0;//计算筛选高度
            for (NSInteger i = 0; i <_limitData.count; i++) {
                totalHeight += [STL_LimitTableViewCell autoHeigthWithValueNumber:[_limitData[i] attrValues].count];
            }
            CGFloat realHeight = totalHeight + 57.5 < (SCREEN_HEIGHT - HEIGHT_CELL - STL_ORIGIN_Y - 64) ? totalHeight + 57.5: (SCREEN_HEIGHT - HEIGHT_CELL - STL_ORIGIN_Y - 64);
            limitFrame = CGRectMake(0, HEIGHT_CELL + STL_ORIGIN_Y, SCREEN_WIDTH, realHeight);
            self.limitTableView.frame = limitFrame;
            [self.superview addSubview:self.limitTableView];
            [self.limitTableView reloadData];
        }
        
    }
    
    
}
//改变标题
- (void)animateTitle:(NSString *)text{
    CATextLayer *textLayer = _titleLayerAry[_lastSelectIndex];
    textLayer.string = text;
    [self animateWithTapIndex:_lastSelectIndex forword:NO];
    
    CAShapeLayer *indicator = (CAShapeLayer *)_indicotorLayerAry[_lastSelectIndex];
    indicator.position = CGPointMake(textLayer.position.x + textLayer.frame.size.width / 2 + 10, indicator.position.y);
    
}


#pragma mark ----------------实例化

//创建指示箭头
- (CAShapeLayer *)creatIndictorLayerWithPosition:(CGPoint)position{
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(6.5, 7.5)];
    [path addLineToPoint:CGPointMake(13, 0)];
    CAShapeLayer *indictorLayer  = [CAShapeLayer new];
    indictorLayer.path = path.CGPath;
    indictorLayer.lineWidth = 1;
    indictorLayer.fillColor = nil;
    indictorLayer.strokeColor = BLACKTEXTCOLOR.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(indictorLayer.path, nil, indictorLayer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, indictorLayer.miterLimit);
    indictorLayer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    indictorLayer.position = position;
    
    return indictorLayer;
    
}
//创建分割线
- (CAShapeLayer *)createSeparatorLineWithPosition:(CGPoint)point {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(160,30)];
    [path addLineToPoint:CGPointMake(160, self.frame.size.height - 30)];
    
    layer.path = path.CGPath;
    layer.lineWidth = 1.0;
    layer.strokeColor = GRAYCOLOR.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    
    CGPathRelease(bound);
    
    layer.position = point;
    
    return layer;
}
//创建标题
- (CATextLayer *)createTextLayerWithNSString:(NSString *)string position:(CGPoint)point {
    
    CGSize size = [self calculateTitleSizeWithString:string];
    
    CATextLayer *layer = [CATextLayer new];
    CGFloat sizeWidth = (size.width < (self.frame.size.width / _numOfMenu) - 25) ? size.width : self.frame.size.width / _numOfMenu - 25;
    layer.bounds = CGRectMake(0, 0, sizeWidth, size.height);
    layer.string = string;
    layer.fontSize = 14.0;
    layer.alignmentMode = kCAAlignmentCenter;
    layer.foregroundColor = BLACKTEXTCOLOR.CGColor;
    
    layer.contentsScale = [[UIScreen mainScreen] scale];
    
    layer.position = point;
    
    return layer;
}
//获取标题宽度
- (CGSize)calculateTitleSizeWithString:(NSString *)string
{
    CGFloat fontSize = 14.0;
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(280, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size;
}
//底部切割线
- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}
//空白
- (UIView *)backGroundView{
    if (_backGroundView == nil) {
        _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(STL_ORIGIN_X, STL_ORIGIN_Y, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        _backGroundView.opaque = NO;
    }
    return _backGroundView;
    
    
    
    
}
//左侧视图
- (UITableView *)leftTableView{
    if (_leftTableView == nil) {
        _leftTableView = [[UITableView alloc] init];
        _leftTableView.dataSource = self;
        _leftTableView.delegate = self;
        _leftTableView.backgroundColor = GRAYCOLOR;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leftTableView.userInteractionEnabled = YES;
        [_leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"left"];
    }
    return _leftTableView;
    
    
    
}
//右侧视图
- (UITableView *)rigthTableView{
    if (_rigthTableView == nil) {
        _rigthTableView = [[UITableView alloc] init];
        _rigthTableView.delegate = self;
        _rigthTableView.dataSource = self;
        _rigthTableView.backgroundColor = WHITECOLOR;
        _rigthTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _rigthTableView.separatorColor = GRAYCOLOR;//分割线颜色
        _rigthTableView.userInteractionEnabled = YES;
        [_rigthTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"rigth"];
        [_rigthTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"rigth_left"];
    }
    return _rigthTableView;
    
    
    
    
}
//筛选列表视图
- (UITableView *)limitTableView{
    if (_limitTableView == nil) {
        _limitTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _limitTableView.delegate = self;
        _limitTableView.dataSource = self;
        _limitTableView.backgroundColor = WHITECOLOR;
        _limitTableView.userInteractionEnabled = YES;
        [_limitTableView registerClass:[STL_LimitTableViewCell class] forCellReuseIdentifier:@"limit"];
    }
    return _limitTableView;
}

@end
