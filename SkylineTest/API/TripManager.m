//
//  TripManager.m
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "TripManager.h"

@implementation TripManager

+ (void)apiGetTripWithOffset:(NSInteger)offset
                       limit:(NSInteger)limit
                     success:(void (^)(NSURLSessionDataTask *, id))success
                     failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    
    NSDictionary *parameters = @{@"scope": @"resourceAquire",
                                 @"rid": @"36847f3f-deff-4183-a5bb-800737591de5",
                                 @"sort": @"",
                                 @"limit": @(limit),
                                 @"offset": @(offset)};
    
    [APIManager sendGetRequestWithParameters:parameters path:API_GET_TRIP success:success failure:failure];
}

@end
