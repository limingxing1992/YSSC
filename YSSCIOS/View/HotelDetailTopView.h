//
//  HotelDetailTopView.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HotelDetailDataObject,YSSGreenBorderButton;


@interface HotelDetailTopView : UIView


//想住
@property (nonatomic, strong) YSSGreenBorderButton *wantButton;

//住过
@property (nonatomic, strong) YSSGreenBorderButton *alreadyButton;

/**model*/
@property (nonatomic, strong) HotelDetailDataObject *model;

//进入店铺
@property (nonatomic, strong) YSSGreenBorderButton *comeInShop;


@end
