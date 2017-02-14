//
//  MallBussTopView.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/17.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MallBussTopViewDelegate <NSObject>

@optional
- (void)backToLast;

- (void)searchWithText:(NSString *)text;

- (void)enterPeopleHome;

@end

@interface MallBussTopView : UIView

@property (nonatomic, assign) id<MallBussTopViewDelegate> delegate;

@property (nonatomic, strong) UIImageView *backBtn;//返回按钮

@property (nonatomic, strong) UISearchBar *searchBar;//搜索框

@property (nonatomic, strong) UIButton *peopleHomeBtn;//进入乡宿按钮

@property (nonatomic, assign) BOOL mallHome;

- (instancetype)initWithFrame:(CGRect)frame ret:(BOOL)ret;

@end
