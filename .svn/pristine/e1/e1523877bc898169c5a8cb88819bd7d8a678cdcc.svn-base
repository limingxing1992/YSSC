//
//  HotelCheckEstablishmentCell.m
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelCheckEstablishmentCell.h"
#import "RoomDetailObject.h"
#import "RoomAttr.h"

@interface HotelCheckEstablishmentCell ()

/**topTitle*/
@property (nonatomic, strong) UILabel *topTitle;
/**分隔线*/
@property (nonatomic, strong) UIView *lineView;
/**设施列表*/
@property (nonatomic, strong) UIView *buttonListView;



@end

@implementation HotelCheckEstablishmentCell

- (UILabel *)topTitle{
    if (_topTitle == nil) {
        _topTitle = [[UILabel alloc] init];
        _topTitle.font = FONT(14);
        _topTitle.textColor = SHENTEXTCOLOR;
        _topTitle.text = @"配套设置";
    }
    return _topTitle;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
     
    }
    return _lineView;
}

- (UIView *)buttonListView{
    if (_buttonListView == nil) {
        _buttonListView = [[UIView alloc] init];
        

    }  
    return _buttonListView;
}

- (void)setModel:(RoomDetailObject *)model{
    _model = model;
    int  i = 0;
    for (RoomAttr * attr in model.data.roomAttrList) {
        long row = i/3;
        int line = i%3;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(line * SCREEN_WIDTH /3, row * 51, SCREEN_WIDTH /3, 51)];
       
        [btn setTitle:[NSString stringWithFormat:@"  %@",attr.name] forState:UIControlStateNormal];
        [btn sd_setImageWithURL:attr.icon forState:UIControlStateNormal placeholderImage:nil];
        i ++;
        
        [btn setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateNormal];
        btn.titleLabel.font = FONT(12);
        [btn sizeToFit];
        btn.origin = CGPointMake((line * SCREEN_WIDTH /3) + 30, row * 51 + 15);
        [self.buttonListView addSubview:btn];
        
    }
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.topTitle];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.buttonListView];
        
        self.topTitle.sd_layout
        .topSpaceToView(self.contentView, 15)
        .leftSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.topTitle setSingleLineAutoResizeWithMaxWidth:300];
        
        self.lineView.sd_layout
        .topSpaceToView(self.contentView, 45)
        .widthRatioToView(self.contentView, 1)
        .centerXEqualToView(self.contentView)
        .heightIs(0.5);
        
        //测试
        self.buttonListView.sd_layout
        .topSpaceToView(self.lineView, 0)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0);

        [self.buttonListView setupAutoHeightWithBottomView:self.buttonListView.subviews.lastObject bottomMargin:10];
        
        [self setupAutoHeightWithBottomView:self.buttonListView bottomMargin:15];
    }
    return self;
}

#pragma mark --------- cell增加分割线

- (void)setFrame:(CGRect)frame{
    CGFloat height = frame.size.height - 10;
    CGFloat width = frame.size.width;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    frame = CGRectMake(x, y, width, height);
    [super setFrame:frame];
}

@end
