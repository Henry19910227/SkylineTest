//
//  BaseViewController.m
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "BaseViewController.h"
#import "HenryProgressHUD.h"
#import "AFNetworking.h"

@interface BaseViewController ()

@property(nonatomic,strong)HenryProgressHUD *progressView;

@end

@implementation BaseViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setupNetworkReachabilityStatus];
}

#pragma mark - Getter
- (HenryProgressHUD *)progressView {
    if (!_progressView) {
        _progressView = [[HenryProgressHUD alloc] initWithFrame:self.view.bounds];
        
    }
    return _progressView;
}

#pragma mark - Public
- (void)showLoading{
    
    [self.view addSubview:self.progressView];
    [self.progressView startLoading];

}

- (void)hideLoading{
    
    [self.progressView removeFromSuperview];
    self.progressView = nil;
    
}

#pragma mark - AFNetworkReachabilityStatus
- (void)setupNetworkReachabilityStatus {
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: {
                NSLog(@"未知網路");
            }
                break;
            case AFNetworkReachabilityStatusNotReachable: {
                NSLog(@"無法上網");
                
                [self showNetworkStatusAlert];
                
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                NSLog(@"行動網路");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                NSLog(@"WIFI");
            }
                
        }
    }];
}

#pragma mark - Class Medthod
- (void)showNetworkStatusAlert {
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"" message:@"網路異常" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:nil];
    
    [alertVc addAction:actionOK];
    
    [self presentViewController:alertVc animated:YES completion:nil];

}

@end
