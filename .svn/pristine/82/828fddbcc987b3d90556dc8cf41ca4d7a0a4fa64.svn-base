//
//  UserAccountMangeCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/23.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserAccountMangeCell.h"

@interface UserAccountMangeCell ()



@end

@implementation UserAccountMangeCell

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.layer.cornerRadius = 18.5;
        _iconView.layer.masksToBounds = YES;
    }
    return _iconView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.textLabel.textColor = SHENTEXTCOLOR;
        [self.contentView addSubview:self.iconView];
        
        self.iconView.sd_layout
        .rightSpaceToView(self.contentView, 0)
        .centerYEqualToView(self.contentView)
        .heightIs(37)
        .widthIs(37);
        
    }
    return self;
}


@end
