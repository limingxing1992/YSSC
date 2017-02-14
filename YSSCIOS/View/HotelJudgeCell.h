//
//  HotelJudgeCell.h
//  YSSCIOS
//
//  Created by Rock on 16/8/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommentObject;

@interface HotelJudgeCell : UITableViewCell

typedef void (^TouchMoreInfoButton)(UIButton *button);

@property (nonatomic, copy) TouchMoreInfoButton block;

- (void)addTargetBlock:(TouchMoreInfoButton)touchButtonBlock;
/**model*/
@property (nonatomic, strong) CommentObject *commentModel;

- (void)setCommentCount:(NSInteger)count score:(NSInteger)score;

- (void)starHidden;

- (void)cellHidden;

@end
