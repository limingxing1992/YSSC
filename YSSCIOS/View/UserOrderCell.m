//
//  UserOrderCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/16.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserOrderCell.h"
#import "YSSBlockUserButton.h"

@interface UserOrderCell ()

@property (nonatomic, strong) NSArray *listArr;
@property (nonatomic, strong) NSArray *imgArr;

@end

@implementation UserOrderCell

- (NSArray *)listArr{
    if (_listArr == nil) {
        _listArr = @[@"待付款",@"待发货",@"待收货",@"待评价"];
    }
    return _listArr;
}

- (NSArray *)imgArr{
    if (_imgArr == nil) {
        _imgArr = @[@"classify123",@"classify124",@"classify125",@"classify126"];
    }
    return _imgArr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}
//初始化n个按钮
- (void)setupUI{
    
    CGFloat width = SCREEN_WIDTH / self.listArr.count;

    YSSCWeakObj(self)
    for (int i = 0; i < self.listArr.count; i++) {
        YSSBlockUserButton *btn = [[YSSBlockUserButton alloc] init];
        NSString *btnTitle = self.listArr[i];
        [btn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        
        btn.titleLabel.font = FONT(14);
        [btn setTitle:btnTitle forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:self.imgArr[i]] forState:UIControlStateNormal];
        [btn addTargetBlock:^(YSSBlockUserButton *button) {
            if (weakself.block) {
                weakself.block(button);
            }
        }];
        [self.contentView addSubview:btn];
        btn.frame = CGRectMake(width * i , 0, width, 100);
        btn.tag = i;
    }
  
}


- (void)buttonDidClick:(buttonDidClick)block{
    _block = block;
}


@end
