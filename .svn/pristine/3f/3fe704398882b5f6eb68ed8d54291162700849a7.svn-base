//
//  UserAreaPickViewController.h
//  YSSCIOS
//
//  Created by Rock on 16/9/21.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserAreaPickViewControllerDelegate <NSObject>
@optional
- (void)userAreaPickViewControllerSelectAddress:(NSString *)address ID:(NSString *)ID;

@end

@interface UserAreaPickViewController : UIViewController

/**delegate*/
@property (nonatomic, weak) id<UserAreaPickViewControllerDelegate> delegate;

@end
