//
//  TripManager.h
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "APIManager.h"

@interface TripManager : APIManager

+ (void)apiGetTripWithOffset:(NSInteger)offset
                       limit:(NSInteger)limit
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
