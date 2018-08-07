//
//  TripModel.m
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "TripModel.h"

@implementation TripModel

- (instancetype)init {
    if (self = [super init]) {
        self.urls = [NSArray array];
    }
    return self;
}

#pragma mark - Setter
- (void)setFile:(NSString *)file {
    _file = file;
    
    [self setupTripImageUrlWithFile:file];
}

#pragma mark - Class Medthod
- (void)setupTripImageUrlWithFile:(NSString *)file {
    
    NSMutableArray *imageUrls = [NSMutableArray array];
    NSArray<NSString *> *urlStrs = [file componentsSeparatedByString:@"http://"];
    
    [urlStrs enumerateObjectsUsingBlock:^(NSString * _Nonnull urlStr, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([urlStr hasSuffix:@".jpg"] || [urlStr hasSuffix:@".JPG"]) {
            [imageUrls addObject:[NSString stringWithFormat:@"http://%@",urlStr]];
        }
    }];
    
    self.urls = imageUrls;
}

@end
