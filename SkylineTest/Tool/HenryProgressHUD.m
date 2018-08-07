//
//  HenryProgressHUD.m
//  TTIAv2
//
//  Created by 廖冠翰 on 2017/9/26.
//  Copyright © 2017年 Whats Media. All rights reserved.
//

#import "HenryProgressHUD.h"

@interface HenryProgressHUD()

@property(nonatomic,strong)UIActivityIndicatorView *activityView;

@property(nonatomic,strong)HenryProgressHUD *progressView;

@end

@implementation HenryProgressHUD


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
    
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.activityView];

    }
    return self;
}

- (UIActivityIndicatorView *)activityView {
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] init];
        _activityView.bounds = CGRectMake(0, 0, 50, 50);
        _activityView.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5 - 44);
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        _activityView.color = [UIColor grayColor];
        _activityView.hidesWhenStopped = NO;
        
    }
    return _activityView;
}

- (void)startLoading {
    [self.activityView startAnimating];
}

- (void)stopLoading {
    [self.activityView stopAnimating];
}

@end
