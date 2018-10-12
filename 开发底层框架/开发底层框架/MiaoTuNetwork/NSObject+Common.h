//
//  NSObject+Common.h
//  cook
//
//  Created by Gaowz on 15/8/18.
//  Copyright (c) 2015年 Fanlai. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSObject (Common)
- (NSString *)encode:(NSString *)string;
- (void)changeLanguageTo:(NSString *)str;
- (NSString *)getLanguageWithKey:(NSString *)string;
- (void)closeKeyBoard;
- (NSString*)removeFloatAllZero:(NSString*)string;
-(int)checkIsHaveNumAndLetter:(NSString*)password;
- (NSString *)cTimestampFromString:(NSString *)theTime;
- (NSString *)chooseAddress;
- (void)showHudTipStr:(NSString *)tipStr;
- (NSString *)mnemonicStrWithAes:(NSString*)aes;
-(id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError;
@end
