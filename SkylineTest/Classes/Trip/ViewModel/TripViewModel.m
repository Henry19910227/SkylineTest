//
//  TripViewModel.m
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "TripViewModel.h"
#import "TripManager.h"

#import "NSObject+Henry.h"

@interface TripViewModel()

@property(nonatomic,assign)NSInteger currentRowNumber;

@end

@implementation TripViewModel

#pragma mark - Init
- (instancetype)init {
    
    if (self = [super init]) {
        
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.currentRowNumber = 0;
}

#pragma mark - Public
- (void)reloadMoreTripData {
    
    [self apiGetTripWithOffset:self.currentRowNumber limit:10];
}

#pragma mark - Getter
- (NSMutableArray<TripModel *> *)tripModels {
    if (!_tripModels) {
        _tripModels = [NSMutableArray array];
    }
    return _tripModels;
}

#pragma mark - API
- (void)apiGetTripWithOffset:(NSInteger)offset limit:(NSInteger)limit {
    
    if ([self.delegate respondsToSelector:@selector(tripStartLoadingInTripViewModel:)]) {
        [self.delegate tripStartLoadingInTripViewModel:self];
    }
    
    [TripManager apiGetTripWithOffset:offset limit:limit success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray<NSDictionary *> *results = responseObject[@"result"][@"results"];
        [results enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull resultDict, NSUInteger idx, BOOL * _Nonnull stop) {
            
            TripModel *trip = [TripModel modelWithDict:resultDict];
            
            [self.tripModels addObject:trip];
        }];
        
        self.currentRowNumber = self.tripModels.count;
        
        if ([self.delegate respondsToSelector:@selector(tripResponseSuccessInTripViewModel:)]) {
            [self.delegate tripResponseSuccessInTripViewModel:self];
        }
    
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if ([self.delegate respondsToSelector:@selector(tripResponseFailureInTripViewModel:)]) {
            [self.delegate tripResponseFailureInTripViewModel:self];
        }
    }];
}

@end
