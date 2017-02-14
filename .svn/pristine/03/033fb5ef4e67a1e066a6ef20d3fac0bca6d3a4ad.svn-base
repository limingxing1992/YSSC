//
//  UserMenuVC.h
//  YSSCIOS
//
//  Created by Rock on 16/8/25.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidClick)(NSString *title);

@interface UserMenuVC : UITableViewController

/**当前选中的title*/
@property (nonatomic, strong) NSString *currentString;

@property (nonatomic, copy) DidClick block;

- (void)cellDidClick:(DidClick)callBack;

@end
