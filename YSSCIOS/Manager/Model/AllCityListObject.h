//
//  AllCityListObject.h
//  YSSCIOS
//
//  Created by yangbin on 16/10/12.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AllCityListDataObject;

@interface AllCityListObject : BaseObject

/**data*/
@property (nonatomic, strong) AllCityListDataObject *data;

@end

@interface AllCityListDataObject : NSObject
/**cityList*/
@property (nonatomic, strong) NSMutableArray *allCityList;

@end

@interface LetterList : NSObject

/**key*/
@property (nonatomic, strong) NSString *key;
/**value*/
@property (nonatomic, strong) NSString *value;
/**cityList*/
@property (nonatomic, strong) NSMutableArray *cityList;

@end

@interface City : NSObject

/**areaId*/
@property (nonatomic, strong) NSString *areaId;
/**aname*/
@property (nonatomic, strong) NSString *aname;

@end
