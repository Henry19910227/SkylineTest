//
//  APIManager.m
//  Wing
//
//  Created by Henry on 2016/7/4.
//  Copyright © 2016年 Hanry. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+ (AFHTTPSessionManager *)sharedHTTPSession{
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        
        [manager.requestSerializer setTimeoutInterval:20];
        manager.requestSerializer  = [AFJSONRequestSerializer serializer];      //請求
        [manager.requestSerializer setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];     //響應
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"application/xml", nil];
    });
    return manager;
}


+ (void)sendGetRequestWithParameters:(NSDictionary *)parameters
                                path:(NSString *)url
                             success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                             failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{

    [[self sharedHTTPSession] GET:url parameters:parameters progress:nil success:success failure:failure];
}

//+ (void)sendGetRequestWithParameters:(NSDictionary *)parameters
//                                path:(NSString *)url
//                             success:(void (^)(id responseObject))success
//                             failure:(void (^)(NSError *error))failure{
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    [[session dataTaskWithURL:[NSURL URLWithString:@"http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=36847f3f-deff-4183-a5bb-800737591de5&limit=10&offset=0"]
//            completionHandler:^(NSData *data,
//                                NSURLResponse *response,
//                                NSError *error) {
//                
//                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//                
//                NSLog(@"%@", dict[@"result"][@"results"][0]);
//                
//                
//            }] resume];
//}


@end
