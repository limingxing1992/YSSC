//
//  HotelChoseCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelChooseCell.h"
#import "YSSChooseDateButton.h"
#import "YSSGreenBorderButton.h"

@interface HotelChooseCell()

 
@property (nonatomic, strong) YSSGreenBorderButton *moreInfoBtn;

@end

@implementation HotelChooseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (YSSChooseDateButton *)choseBtn{
    if (_choseBtn == nil) {
        _choseBtn = [YSSChooseDateButton buttonWithType:UIButtonTypeCustom];
        [_choseBtn addTarget:self action:@selector(choseDateBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _choseBtn;
}

- (YSSGreenBorderButton *)moreInfoBtn{
    if (_moreInfoBtn == nil) {
        _moreInfoBtn = [YSSGreenBorderButton buttonWithType:UIButtonTypeCustom];
        [_moreInfoBtn addTarget:self action:@selector(moreInfoBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [_moreInfoBtn setTitle:@"更多筛选条件" forState:UIControlStateNormal];
    }
    return _moreInfoBtn;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.choseBtn];
//        [self.contentView addSubview:self.moreInfoBtn];
        self.contentView.backgroundColor = BACKGROUNDCOLOR;
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.choseBtn.sd_layout
    .topSpaceToView(self.contentView, 15)
    .leftSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(65);
    
//    self.moreInfoBtn.sd_layout
//    .topSpaceToView(self.choseBtn, 18)
//    .leftSpaceToView(self.contentView, 15)
//    .rightSpaceToView(self.contentView, 15)
//    .heightIs(40);
    
    [self setupAutoHeightWithBottomView:self.choseBtn bottomMargin:18];
    
}

#pragma mark --------- 点击事件处理
- (void)choseDateBtnDidClick:(UIButton *)button{
    if (_chooseDate) {
        self.chooseDate(button);
    }
}

- (void)chooseDateButtonClick:(chooseBlock)block{
    self.chooseDate = block;
}

- (void)moreInfoBtnDidClick:(UIButton *)button{
    if (_moreInfo) {
        self.moreInfo(button);
    }
}

- (void)moreInfoBtnClick:(chooseBlock)block{
    self.moreInfo = block;
}



@end
