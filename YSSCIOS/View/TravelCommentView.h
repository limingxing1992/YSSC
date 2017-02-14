//
//  TravelCommentView.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelCommentView : UIView

@property (nonatomic, copy) NILBlock block;

@property (nonatomic, strong) UITextField *commentTf;//评论框

@property (nonatomic, strong) UIImageView *commentIv;//评论按钮图

@property (nonatomic, strong) UILabel *commentLb;//评论字数


@end
