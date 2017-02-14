//
//  UserOrderCommentCell.h
//  YSSCIOS
//
//  Created by yangbin on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserOrderCommentCell;

typedef void(^callBack)(NSString *score,NSString *comment);

@protocol UserOrderCommentCellDelegate <NSObject>

@optional
- (void)userOrderCommentCell:(UserOrderCommentCell *)cell stars:(NSInteger)count comment:(NSString *)comment;

@end

@interface UserOrderCommentCell : UITableViewCell

- (void)setIconUrl:(NSURL *)url;

/**评论内容*/
@property (nonatomic, strong) UITextView *commentTextView;
/**当前选择tag*/
@property (nonatomic, assign) NSInteger currentTag;

//@property (nonatomic, copy) callBack callBack;
//
//- (void)callBack:(callBack)block;

/**delegate*/
@property (nonatomic, assign) id<UserOrderCommentCellDelegate> delegate;

@end
