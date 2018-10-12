//
//  NSString+Size.h
//  04_Cell动态高度
//
//  Created by Yangxin on 16/3/23.
//  Copyright © 2016年 51BaKKishi.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Size)

- (CGSize)getSizeWithFont:(UIFont *)font width:(CGFloat)width;
//拼接字符串
+ (NSString*)changeActiviyiText:(NSString*)text    keywordArr:(NSArray*)keywordArr replaceKeywordArr:(NSArray*)replaceKeywordArr;
@end
