//
//  SkylineTestTests.m
//  SkylineTestTests
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TripManager.h"
#import "TripModel.h"
#import "NSObject+Henry.h"


@interface SkylineTestTests : XCTestCase

@end

@implementation SkylineTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
}

/** 測試API回傳一頁是否是十筆 */
- (void)testTenItem {
    
    XCTestExpectation *expect = [self expectationWithDescription:@"success"];
    
    [TripManager apiGetTripWithOffset:0 limit:10 success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray<NSDictionary *> *results = responseObject[@"result"][@"results"];
        
        __block NSInteger count = 0;
        [results enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull resultDict, NSUInteger idx, BOOL * _Nonnull stop) {
            
            count ++;
        }];
        
        XCTAssertEqual(count % 10, 0,"每筆資料應為10");
        
        [expect fulfill];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        XCTFail("API 回傳錯誤!");
    }];
    
    [self waitForExpectations:@[expect] timeout:20];
}

/** 測試是否每筆URL為有效 或是File欄位格式變更導致讀取不到圖片*/
- (void)testImageUrlValid {
    
    XCTestExpectation *expect = [self expectationWithDescription:@"success"];
    
    [TripManager apiGetTripWithOffset:0 limit:10 success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray<NSDictionary *> *results = responseObject[@"result"][@"results"];
        
        
        [results enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull resultDict, NSUInteger idx, BOOL * _Nonnull stop) {

            TripModel *trip = [TripModel modelWithDict:resultDict];

            [trip.urls enumerateObjectsUsingBlock:^(NSString * _Nonnull url, NSUInteger idx, BOOL * _Nonnull stop) {
                if (![url hasPrefix:@"http://"]) {
                    XCTFail("此URL不符合格式");
                    return;
                }
                
                if (![url hasSuffix:@"jpg"] && ![url hasSuffix:@"JPG"]) {
                    XCTFail("此URL不符合格式");
                    return;
                }
            }];
            
            XCTAssert(true);
        }];
        
        [expect fulfill];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        XCTFail("API 回傳錯誤!");
    }];
    
    [self waitForExpectations:@[expect] timeout:20];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
