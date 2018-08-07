//
//  NSString+Henry.m
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "NSString+Henry.h"

@implementation NSString (Henry)

- (NSMutableAttributedString *)lineSpace:(CGFloat)space color:(UIColor *)color alignment:(NSTextAlignment)alignment {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;
    paragraphStyle.alignment = alignment;
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    
    [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, self.length)];
    
    return attributeStr;
}

@end
