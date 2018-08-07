//
//  TripViewModel.h
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TripModel.h"

@class TripViewModel;

@protocol TripViewModelDelegate<NSObject>

@optional
- (void)tripStartLoadingInTripViewModel:(TripViewModel *)tripViewModel;

- (void)tripResponseSuccessInTripViewModel:(TripViewModel *)tripViewModel;

- (void)tripResponseFailureInTripViewModel:(TripViewModel *)tripViewModel;

@end


@interface TripViewModel : NSObject

@property(nonatomic,weak)id<TripViewModelDelegate> delegate;

@property(nonatomic,strong)NSMutableArray<TripModel *> *tripModels;

- (void)reloadMoreTripData;

@end
