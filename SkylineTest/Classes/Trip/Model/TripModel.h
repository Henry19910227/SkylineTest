//
//  TripModel.h
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TripModel : NSObject

@property(nonatomic,assign)NSInteger RowNumber;

@property(nonatomic,copy)NSString *stitle;

@property(nonatomic,copy)NSString *xbody;

@property(nonatomic,copy)NSString *file;

@property(nonatomic,strong)NSArray<NSString *> *urls;

@end
