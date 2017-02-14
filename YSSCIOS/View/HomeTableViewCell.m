//
//  HomeTableViewCell.m
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HotelClassifyObject.h"
#import "HotelIndexCityObject.h"


@interface HomeTableViewCell ()
//展示图
@property (nonatomic, strong) UIImageView *headIv;
//标题
@property (nonatomic, strong) UILabel *homeTitleLabel;
//子标题
@property (nonatomic, strong) UILabel *homeDetailLabel;
//数量
@property (nonatomic, strong) UILabel *countLabel;
//顶部线条
@property (nonatomic, strong) UIImageView *topImageView;
//底部线条
@property (nonatomic, strong) UIImageView *bottomImageView;
/**左边白线*/
@property (nonatomic, strong) UIImageView *leftLineView;
/**右边白线*/
@property (nonatomic, strong) UIImageView *rightLineView;

@property (nonatomic, strong) UIView *lineView;


@end

@implementation HomeTableViewCell

- (void)setModel:(IndexCity *)model{
    _model = model;
    
    [self.headIv sd_setImageWithURL:model.backImage placeholderImage:IMAGE(@"placeholderImage")];
    self.homeDetailLabel.text = model.subtitle;
    self.homeTitleLabel.text = model.aname;
    
}

- (void)setVillageModel:(IndexVillage *)villageModel{
    _villageModel = villageModel;
    [self.headIv sd_setImageWithURL:villageModel.pic_url placeholderImage:IMAGE(@"placeholderImage")];
//    self.homeDetailLabel.text = @"寻找心中的世外桃源";
//    self.homeTitleLabel.text = @"云裳山村";
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.headIv];
    [self.contentView addSubview:self.homeDetailLabel];
    [self.contentView addSubview:self.homeTitleLabel];
    [self.contentView addSubview:self.lineView];
   // [self.contentView addSubview:self.countLabel];
//    [self.contentView addSubview:self.topImageView];
//    [self.contentView addSubview:self.bottomImageView];
   // [self.contentView addSubview:self.leftLineView];
  //  [self.contentView addSubview:self.rightLineView];
    
    _headIv.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .rightEqualToView(self.contentView);
    
    _homeTitleLabel.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView, (SCREEN_HEIGHT - 49)*0.25 - 39)
    .autoHeightRatio(0);
    [_homeTitleLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH)];
    
    _homeDetailLabel.sd_layout
    .bottomSpaceToView(self.contentView, (SCREEN_HEIGHT - 49)*0.25 - 21)
    .centerXEqualToView(self.contentView)
    .autoHeightRatio(0);
    [_homeDetailLabel setSingleLineAutoResizeWithMaxWidth:(SCREEN_WIDTH)];
    
    _lineView.sd_layout
    .centerYEqualToView(self.contentView)
    .centerXEqualToView(self.contentView)
    .heightIs(0.5)
    .widthRatioToView(self.homeDetailLabel, 1.2);
    
    
//    _countLabel.sd_layout
//    .topSpaceToView(self.homeTitleLabel, 50)
//    .centerXEqualToView(self.contentView)
//    .autoHeightRatio(0);
//    [_countLabel setSingleLineAutoResizeWithMaxWidth:300];
//    
//    _leftLineView.sd_layout
//    .centerYEqualToView(self.countLabel)
//    .rightSpaceToView(self.countLabel, 5)
//    .widthIs(30)
//    .heightIs(0.5);
//    
//    _rightLineView.sd_layout
//    .centerYEqualToView(self.countLabel)
//    .leftSpaceToView(self.countLabel, 5)
//    .widthIs(30)
//    .heightIs(0.5);
//    
//    _topImageView.sd_layout
//    .topSpaceToView(self.contentView, 80)
//    .centerXEqualToView(self.contentView)
//    .widthRatioToView(self.homeTitleLabel, 1.2)
//    .heightIs(10);
//    
//    _bottomImageView.sd_layout
//    .topSpaceToView(self.homeDetailLabel, 6)
//    .centerXEqualToView(self.contentView)
//    .widthRatioToView(self.topImageView,1)
//    .heightIs(10);
    
    

}

#pragma mark ---------实例化
- (UIImageView *)headIv
{
    if (_headIv == nil) {
        _headIv = [[UIImageView alloc] init];
        
    }
    return _headIv;
}
- (UILabel *)homeTitleLabel{
    if (_homeTitleLabel == nil) {
        _homeTitleLabel = [[UILabel alloc] init];
        _homeTitleLabel.font = [UIFont boldSystemFontOfSize:30];
        _homeTitleLabel.textColor = [UIColor whiteColor];
    }
    return _homeTitleLabel;
}

- (UILabel *)homeDetailLabel{
    if (_homeTitleLabel == nil) {
        _homeDetailLabel = [[UILabel alloc] init];
        _homeDetailLabel.font = FONT(14);
        _homeDetailLabel.textColor = [UIColor whiteColor];
    }
    return  _homeDetailLabel;
}

- (UILabel *)countLabel{
    if (_countLabel == nil) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.textColor = [UIColor whiteColor];
        _countLabel.font = FONT(14);
    }
    return _countLabel;
}

- (UIImageView *)topImageView{
    if (_topImageView == nil) {
        _topImageView = [[UIImageView alloc] init];
        _topImageView.image = IMAGE(@"line2");
    }
    return _topImageView;
}

- (UIImageView *)bottomImageView{
    if (_bottomImageView == nil) {
        _bottomImageView = [[UIImageView alloc] init];
        _bottomImageView.image = IMAGE(@"line3");
    }
    return _bottomImageView;
}

- (UIImageView *)leftLineView{
    if (_leftLineView == nil) {
        _leftLineView = [[UIImageView alloc] initWithImage:IMAGE(@"line5")];
    }
    return _leftLineView;
}

- (UIImageView *)rightLineView{
    if (_rightLineView == nil) {
        _rightLineView = [[UIImageView alloc] initWithImage:IMAGE(@"line5")];
    }
    return _rightLineView;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}

#pragma mark --------- cell增加分割线

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 0.5;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}

@end
