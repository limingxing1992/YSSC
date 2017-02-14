//
//  HotelJudegTopCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelJudegTopCell.h"
#import "YSSStarView.h"


@interface HotelJudegTopCell ()

@property (nonatomic, strong) UILabel *judgeTitle;

@property (nonatomic, strong) YSSStarView *starView;

@end

@implementation HotelJudegTopCell

#pragma mark --------- 懒加载

- (UILabel *)judgeTitle{
    if (_judgeTitle == nil) {
        _judgeTitle = [[UILabel alloc] init];
        _judgeTitle.font = FONT(14);
        _judgeTitle.textColor = SHENTEXTCOLOR;
    }
    return _judgeTitle;
}

- (YSSStarView *)starView{
    if (_starView == nil) {
        _starView = [[YSSStarView alloc] init];
        
    }
    return _starView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.judgeTitle];
        [self.contentView addSubview:self.starView];
        
        self.judgeTitle.sd_layout
        .topSpaceToView(self.contentView, 22)
        .leftSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [self.judgeTitle setSingleLineAutoResizeWithMaxWidth:300];
        
        self.starView.sd_layout
        .topSpaceToView(self.judgeTitle, 9)
        .leftSpaceToView(self.contentView, 15)
        .heightIs(10)
        .widthIs(95);
        
        [self setupAutoHeightWithBottomView:self.starView bottomMargin:22];
        

        
    }
    return self;
}

- (void)setJudgeNum:(NSString *)numStr score:(NSInteger)startCount{
    
    self.judgeTitle.text = [NSString stringWithFormat:@"评价（%@）",numStr];
    [self.starView setImageCount:startCount];
}

@end
