//
//  BaseNavigationController.m
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [UINavigationBar appearance].translucent = NO;
    
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:73.0/255.0 green:181.0/255.0 blue:231.0/255.0 alpha:1.0];
}

@end
