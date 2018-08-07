//
//  NSObject+Henry.m
//  runtime字典轉模型二級轉換
//
//  Created by 廖冠翰 on 2016/7/18.
//  Copyright © 2016年 Hanry. All rights reserved.
//

#import "NSObject+Henry.h"
#import <objc/message.h>

@implementation NSObject (Henry)

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    
    NSObject *objc = [[self alloc]init];
    
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (int i=0; i<count; i++) {
        
        NSString *nameStr = [NSString stringWithUTF8String:ivar_getName(ivarList[i])];
        NSString *typeStr = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivarList[i])];
        
        NSString *key = [nameStr substringFromIndex:1];
        id value = dict[key];
        
        //判斷從dict中取出的值是否是NSDictionary類的,並且本身不是NSDictionary
        if ([value isKindOfClass:[NSDictionary class]] && ![typeStr containsString:@"NS"]) {
            
            //1.第一次擷取,將左邊引號及引號左邊的所有東西切除
            NSRange range = [typeStr rangeOfString:@"\""];
            NSString *subStr = [typeStr substringFromIndex:range.location + range.length];
            
            //2.第二次擷取,將右邊引號及引號右邊的所有東西切除
            NSRange classRange = [subStr rangeOfString:@"\""];
            NSString *classStr = [subStr substringToIndex:classRange.location];
            //取出pet類
            Class class = NSClassFromString(classStr);
            
            NSLog(@"%@",class);
            
        }
        
        //如果value有值才需要匹配key
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}

@end
