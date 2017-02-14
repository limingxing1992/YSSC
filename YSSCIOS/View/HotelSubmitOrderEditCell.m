//
//  HotelSubmitOrderEditCell.m
//  YSSCIOS
//
//  Created by yangbin on 16/9/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "HotelSubmitOrderEditCell.h"

@interface HotelSubmitOrderEditCell ()<UITextFieldDelegate>

/**title*/
@property (nonatomic, strong) UILabel *titleLabel;
/**content*/
@property (nonatomic, strong) UITextField *contentTextField;
/**lineView*/
@property (nonatomic, strong) UIView *lineView;

@end

@implementation HotelSubmitOrderEditCell

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = FONT(14);
        _titleLabel.textColor = LIGHTTEXTCOLOR;
    }
    return _titleLabel;
}

- (UITextField *)contentTextField{
    if (_contentTextField == nil) {
        _contentTextField = [[UITextField alloc] init];
        _contentTextField.delegate = self;
        _contentTextField.font = FONT(14);
        _contentTextField.textColor = LIGHTTEXTCOLOR;
        _contentTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _contentTextField;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GRAYCOLOR;
    }
    return _lineView;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentTextField];
    [self.contentView addSubview:self.lineView];
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.contentView)
    .autoHeightRatio(0);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.contentTextField.sd_layout
    .leftSpaceToView(self.contentView, 80)
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(28);
    
    self.lineView.sd_layout
    .bottomEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);

}

- (void)setTitle:(NSString *)title content:(NSString *)content{
    self.titleLabel.text = [NSString stringWithFormat:@"%@ :",title];
    self.contentTextField.text = content;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (_block) {
        _block(textField.text);
    }
}

- (void)callBack:(callBack)block{
    _block = block;
}


@end
