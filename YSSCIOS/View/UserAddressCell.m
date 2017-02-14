//
//  UserAddressCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "UserAddressCell.h"
#import "UserAddressObject.h"

@interface UserAddressCell ()

/**名字*/
@property (nonatomic, strong) UILabel *nameLabel;
/**电话号码*/
@property (nonatomic, strong) UILabel *phoneNum;
/**address*/
@property (nonatomic, strong) UILabel *userAddressLabel;
/**分割线*/
@property (nonatomic, strong) UIView *lineView;
/**默认地址按钮*/
@property (nonatomic, strong) UIButton *defaultAddressBtn;
/**编辑*/
@property (nonatomic, strong) UIButton *editBtn;
/**删除*/
@property (nonatomic, strong) UIButton *deletBtn;
/**选中标记*/
@property (nonatomic, strong) UIImageView *flagImgView;

@end

@implementation UserAddressCell

#pragma mark --------- 懒加载

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT(16);
        _nameLabel.textColor = SHENTEXTCOLOR;
    }
    return _nameLabel;
}

- (UILabel *)phoneNum{
    if (_phoneNum == nil) {
        _phoneNum = [[UILabel alloc] init];
        _phoneNum.font = FONT(16);
        _phoneNum.textColor = SHENTEXTCOLOR;
    }
    return _phoneNum;
}

- (UILabel *)userAddressLabel{
    if (_userAddressLabel == nil) {
        _userAddressLabel = [[UILabel alloc] init];
        _userAddressLabel.font = FONT(14);
        _userAddressLabel.textColor = LIGHTTEXTCOLOR;
        
    }
    return _userAddressLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}

- (UIButton *)defaultAddressBtn{
    if (_defaultAddressBtn == nil) {
        _defaultAddressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _defaultAddressBtn.titleLabel.font = FONT(14);
        
        [_defaultAddressBtn setImage:IMAGE(@"classify106") forState:UIControlStateNormal];
        [_defaultAddressBtn setImage:IMAGE(@"classify104") forState:UIControlStateSelected];
        [_defaultAddressBtn setTitle:@"设为默认地址" forState:UIControlStateNormal];
        [_defaultAddressBtn setTitle:@"默认地址" forState:UIControlStateSelected];
        [_defaultAddressBtn setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateNormal];
        [_defaultAddressBtn setTitleColor:MALLColor forState:UIControlStateSelected];
        [_defaultAddressBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0)];
        [_defaultAddressBtn addTarget:self action:@selector(defaultBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _deletBtn.tag = 305;
    }
    return _defaultAddressBtn;
}

- (UIButton *)editBtn{
    if (_editBtn == nil) {
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _editBtn.titleLabel.font = FONT(14);
        [_editBtn setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateNormal];
        [_editBtn setImage:IMAGE(@"classify107") forState:UIControlStateNormal];
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        _editBtn.tag = 303;
        [_editBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_editBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0)];
    }
    return _editBtn;
}

- (UIButton *)deletBtn{
    if (_deletBtn == nil) {
        _deletBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deletBtn.titleLabel.font = FONT(14);
        [_deletBtn setTitleColor:LIGHTTEXTCOLOR forState:UIControlStateNormal];
        [_deletBtn setImage:IMAGE(@"classify105") forState:UIControlStateNormal];
        [_deletBtn setTitle:@"删除" forState:UIControlStateNormal];
        _deletBtn.tag = 304;
        [_deletBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_deletBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0)];
    }
    return _deletBtn;
}

- (UIImageView *)flagImgView{
    if (_flagImgView == nil) {
        _flagImgView = [[UIImageView alloc] init];
        _flagImgView.image = IMAGE(@"classify152");
        _flagImgView.hidden = YES;
    }
    return _flagImgView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.phoneNum];
    [self.contentView addSubview:self.userAddressLabel];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.defaultAddressBtn];
    [self.contentView addSubview:self.editBtn];
    [self.contentView addSubview:self.deletBtn];
    [self.contentView addSubview:self.flagImgView];
    
    self.nameLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 20.5)
    .autoHeightRatio(0);
    [self.nameLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.phoneNum.sd_layout
    .leftSpaceToView(self.nameLabel, 26)
    .topSpaceToView(self.contentView, 20.5)
    .autoHeightRatio(0);
    [self.phoneNum setSingleLineAutoResizeWithMaxWidth:200];
    
    self.userAddressLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.nameLabel, 11)
    .autoHeightRatio(0);
    [self.userAddressLabel setSingleLineAutoResizeWithMaxWidth:295];
    
    self.lineView.sd_layout
    .topSpaceToView(self.userAddressLabel, 21.5)
    .leftSpaceToView(self.contentView, 0)
    .widthRatioToView(self.contentView, 1)
    .heightIs(0.5);
    //测试
    self.defaultAddressBtn.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.lineView, 9)
    .widthIs(110)
    .heightIs(15);
    
    self.deletBtn.sd_layout
    .topEqualToView(self.defaultAddressBtn)
    .rightSpaceToView(self.contentView, 15)
    .bottomEqualToView(self.defaultAddressBtn)
    .widthIs(60.5);
    
    self.editBtn.sd_layout
    .topEqualToView(self.defaultAddressBtn)
    .bottomEqualToView(self.defaultAddressBtn)
    .rightSpaceToView(self.deletBtn,0)
    .widthIs(60.5);
    
    self.flagImgView.sd_layout
    .topSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .widthIs(35)
    .heightIs(35);

    [self setupAutoHeightWithBottomView:self.defaultAddressBtn bottomMargin:9];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];


}

#pragma mark --------- 设置数据

- (void)setAddressModel:(UserAddressDataObject *)addressModel{
    _addressModel = addressModel;
    self.nameLabel.text = _addressModel.name;
    self.phoneNum.text = _addressModel.cellphone;
    self.userAddressLabel.text = _addressModel.address;
    self.flagImgView.hidden = !_addressModel.isdefault;
    self.defaultAddressBtn.selected = _addressModel.isdefault;
    
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


- (void)buttonClick:(UIButton *)button{
    if (_block) {
        _block(button);
    }
}

- (void)defaultBtnClick:(UIButton *)button{
    button.selected = !button.selected;
    if (button.selected) {
//        addressId：地址id
        
        
        NSDictionary *dict = @{@"addressId":self.addressModel.ID};
        
        [YSSCShareBusinessManager.userManager setDefAddressWithDictionary:dict success:^(id object) {
            ServerStatusObject *severStatus = object;
            if (severStatus.errorCode.integerValue == SeverStateSuccess) {
                
            }else{
                [SVProgressHUD showErrorWithStatus:severStatus.errorMsg];
            }

        } failure:^(NSInteger errCode, NSString *errorMsg) {
            
        }];
    }
    
    [self buttonClick:button];
}

//回调
- (void)buttonDidClick:(buttonDidClick)block{
    _block = block;
}



@end
