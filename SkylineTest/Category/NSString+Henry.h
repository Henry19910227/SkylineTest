//
//  NSString+Henry.h
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Henry)

- (NSMutableAttributedString *)lineSpace:(CGFloat)space color:(UIColor *)color alignment:(NSTextAlignment)alignment;

@end
