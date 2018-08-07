//
//  APIManager.h
// 
//
//  Created by Henry on 2016/7/4.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetWorking.h"


#define HOST @"data.taipei/opendata/datalist"

#define API_URL [NSString stringWithFormat:@"http://%@/",HOST]

#define API_GET_TRIP  [API_URL stringByAppendingString:@"apiAccess"]

@interface APIManager : NSObject


+ (void)sendGetRequestWithParameters:(NSDictionary *)parameters
                                path:(NSString *)url
                             success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                             failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
