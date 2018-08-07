//
//  NSObject+Henry.h
//  runtime字典轉模型二級轉換
//
//  Created by 廖冠翰 on 2016/7/18.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Henry)

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
