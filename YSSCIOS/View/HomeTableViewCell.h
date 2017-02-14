//
//  HomeTableViewCell.h
//  YSSCIOS
//
//  Created by TSApple on 16/8/9.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IndexCity,IndexVillage;

@interface HomeTableViewCell : UITableViewCell

/**模型*/
@property (nonatomic, strong) IndexCity *model;

/**自营模型*/
@property (nonatomic, strong) IndexVillage *villageModel;
@end
