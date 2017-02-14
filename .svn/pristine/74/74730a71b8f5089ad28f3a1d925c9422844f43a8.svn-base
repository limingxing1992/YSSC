//
//  SurroundingAreaHeadView.h
//  YSSCIOS
//
//  Created by 李明星 on 16/8/30.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SurroundingAreaHeadViewDelegate <NSObject>

- (void)selectItemWithID:(NSNumber *)Id name:(NSString *)name;

@end


@interface SurroundingAreaHeadView : UIView

@property (nonatomic, assign) id<SurroundingAreaHeadViewDelegate> delegate;

- (void)updateInfoWith:(NSArray *)ary;

@end
