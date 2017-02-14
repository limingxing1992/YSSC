//
//  UserMessageDetailViewController.h
//  YSSCIOS
//
//  Created by yangbin on 16/8/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserMessageDetailViewController : UIViewController

- (instancetype)initWithPushMessage;

- (instancetype)initWithOrderMessage;

/**消息id*/
@property (nonatomic, strong) NSString *messageID;

@end
