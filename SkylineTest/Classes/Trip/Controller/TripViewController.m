//
//  TripViewController.m
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "TripViewController.h"
#import "TripViewModel.h"
#import "TripCell.h"

@interface TripViewController ()<UITableViewDataSource,UITableViewDelegate,TripViewModelDelegate>

//UI
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//View Model
@property (strong, nonatomic)TripViewModel *tripViewModel;

//Status
@property (assign, nonatomic)BOOL isScrollToBottom;

@end

@implementation TripViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initParameter];
    [self initUI];
    [self.tripViewModel reloadMoreTripData];
}

#pragma mark - Getter
- (TripViewModel *)tripViewModel {
    if (!_tripViewModel) {
        _tripViewModel = [[TripViewModel alloc] init];
        _tripViewModel.delegate = self;
    }
    return _tripViewModel;
}

#pragma mark - Parameter Init
- (void)initParameter {
    
    self.isScrollToBottom = YES;
    
}

#pragma mark - UI Init
- (void)initUI {
    self.title = @"台北市熱門景點";
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tripViewModel.tripModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TripCell *cell = [TripCell cellWithTableView:tableView tripModel:self.tripViewModel.tripModels[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 1000;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat contentYoffset = scrollView.contentOffset.y;
    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYoffset;
    
    if (distanceFromBottom <= scrollView.frame.size.height) {
        
        if (self.isScrollToBottom == YES) {
            [self.tripViewModel reloadMoreTripData];
        }
    }
}

#pragma mark - TripViewModelDelegate

- (void)tripStartLoadingInTripViewModel:(TripViewModel *)tripViewModel {
    
    [self showLoading];
    self.isScrollToBottom = NO;
}

- (void)tripResponseSuccessInTripViewModel:(TripViewModel *)tripViewModel {
    [self.tableView reloadData];
    self.isScrollToBottom = YES;
    [self hideLoading];
}

- (void)tripResponseFailureInTripViewModel:(TripViewModel *)tripViewModel {
    
    self.isScrollToBottom = YES;
    [self hideLoading];
}

@end
