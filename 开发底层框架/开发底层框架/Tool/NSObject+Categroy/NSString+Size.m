//
//  NSString+Size.m
//  04_Cell动态高度
//
//  Created by Yangxin on 16/3/23.
//  Copyright © 2016年 51Baishi.net. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)getSizeWithFont:(UIFont *)font width:(CGFloat)width {
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

+ (NSString*)changeActiviyiText:(NSString*)text   keywordArr:(NSArray*)keywordArr replaceKeywordArr:(NSArray*)replaceKeywordArr{

    NSMutableString *retText = [[NSMutableString alloc] initWithString:text];
    
    for (int i = 0; i < replaceKeywordArr.count; i++) {
        [retText replaceOccurrencesOfString:keywordArr[i]
                                 withString:replaceKeywordArr[i]
                                    options:0
                                      range:NSMakeRange(0, retText.length)];
    }
    
    NSString *string2 = [NSString stringWithString:retText];
    return string2 ;
}
@end







