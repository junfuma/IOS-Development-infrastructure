//
//  NSObject+Common.m
//  cook
//
//  Created by Gaowz on 15/8/18.
//  Copyright (c) 2015年 Fanlai. All rights reserved.
//


#import "NSObject+Common.h"
#import "MBProgressHUD.h"
//#import "PLMChangeLanguage.h"


@implementation NSObject (Common)

#pragma mark Tip M

- (NSString *)encode:(NSString *)string
{
    //先将string转换成data
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    
    return baseString;
}

- (void)changeLanguageTo:(NSString *)str{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:str forKey:@"walletLanguage"];
}

//- (NSString *)getLanguageWithKey:(NSString *)string{
//    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
//    [PLMChangeLanguage setUserlanguage:[def objectForKey:@"walletLanguage"]];
//    [PLMChangeLanguage initUserLanguage];
//    NSBundle *bundle = [PLMChangeLanguage bundle];
//    NSString *str = [bundle localizedStringForKey:string value:nil table:@"English"];
//    return str;
//}
- (void)closeKeyBoard{
    for (UIWindow* window in [UIApplication sharedApplication].windows){
        for (UIView* view in window.subviews){
            [self dismissAllKeyBoardInView:view];}
    }
}
-(BOOL) dismissAllKeyBoardInView:(UIView *)view{
    if([view isFirstResponder]){
        [view resignFirstResponder];
        return YES;
    }
    for(UIView *subView in view.subviews){
        if([self dismissAllKeyBoardInView:subView]){
            return YES;
        }
    }return NO;
}
- (NSString*)removeFloatAllZero:(NSString*)string{
    
        /*---------第一种方法-----------*/
        NSString * testNumber = string;
        NSString * s = nil;
        NSInteger offset = testNumber.length - 1;
    
        while (offset){
            s = [testNumber substringWithRange:NSMakeRange(offset, 1)];
            if ([s isEqualToString:@"0"]){
                offset--;
            }else if ([s isEqualToString:@"."]){
                offset--;
                break;
            }else{
                break;
            }
        }
        NSString * outNumber = [testNumber substringToIndex:offset+1];
        NSLog(@"%@", outNumber);
    
    
    /*---------第二种方法-----------*/
//    NSString * testNumber = string;
//    NSString * outNumber = [NSString stringWithFormat:@"%@",@(testNumber.floatValue)];
    return outNumber;
}


-(int)checkIsHaveNumAndLetter:(NSString*)password{
    
    //数字条件
    
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]"options:NSRegularExpressionCaseInsensitive error:nil];
    
    
    
    //符合数字条件的有几个字节
    
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:password
                                 
                                                                       options:NSMatchingReportProgress
                                 
                                                                         range:NSMakeRange(0, password.length)];
    
    
    
    //英文字条件
    
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]"options:NSRegularExpressionCaseInsensitive error:nil];
    
    
    
    //符合英文字条件的有几个字节
    
    NSUInteger tLetterMatchCount = [tLetterRegularExpression  numberOfMatchesInString:password options:NSMatchingReportProgress range:NSMakeRange(0, password.length)];
    
    
    
    if (tNumMatchCount == password.length) {
        
        //全部符合数字，表示沒有英文
        
        return 1;
        
    } else if (tLetterMatchCount == password.length) {
        
        //全部符合英文，表示沒有数字
        
        return 2;
        
    } else if (tNumMatchCount + tLetterMatchCount == password.length) {
        
        //符合英文和符合数字条件的相加等于密码长度
        
        return 3;
        
    } else {
        
        return 4;
        
        //可能包含标点符号的情況，或是包含非英文的文字，这里再依照需求详细判断想呈现的错误
        
    }
}
- (NSString *)cTimestampFromString:(NSString *)theTime {
    // theTime __@"%04d-%02d-%02d %02d:%02d:00"
    // 转换为时间戳
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    // NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    // [formatter setTimeZone:timeZone];
    NSDate* dateTodo = [formatter dateFromString:theTime];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[dateTodo timeIntervalSince1970]];
    return timeSp;
}
- (NSString *)chooseAddress{
    NSArray *arr = @[@"47.52.44.156:25884",@"47.75.44.148:25884",@"47.75.45.95:25884",@"47.91.218.249:25884",@"47.75.4.61:25884",@"47.91.208.36:25884",@"47.75.44.103:25884"];
    int x = arc4random() % 7;
    NSString *address = arr[x];
    return address;
}
- (void)showHudTipStr:(NSString *)tipStr{
    if (tipStr && tipStr.length > 0) {
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
//        [kKeyWindow bringSubviewToFront:hud];
//        hud.mode = MBProgressHUDModeText;
//        hud.detailsLabel.font = [UIFont boldSystemFontOfSize:15.0];
//        hud.detailsLabel.text = tipStr;
//        hud.margin = 10.f;
//        hud.removeFromSuperViewOnHide = YES;
//        [hud hideAnimated:YES afterDelay:1.5];
    }
}
- (NSString *)mnemonicStrWithAes:(NSString*)aes{
    if (aes.length %2 == 0) {
        int result = 0;
        for (NSUInteger i = 0; i + 2 <= aes.length; i += 2) {
            NSString *subString = [aes substringWithRange:NSMakeRange(i, 2)];
            int intResult;
            [[NSScanner scannerWithString:subString] scanHexInt:&intResult];
            result += intResult;
        }
        NSLog(@"result == %d", result);
        NSString *str = [self stringWithHexNumber:result];
        if (str.length >= 2) {
            NSString *subString = [str substringWithRange:NSMakeRange(str.length - 2, 2)];
            NSString *str_C = [aes stringByAppendingString: subString];
            NSLog(@"str_C == %@", str_C);
            return str_C;
        }
    }
    return @"";
}
- (NSInteger)numberWithHexString:(NSString *)hexString{
    
    const char *hexChar = [hexString cStringUsingEncoding:NSUTF8StringEncoding];
    
    int hexNumber;
    
    sscanf(hexChar, "%x", &hexNumber);
    
    return (NSInteger)hexNumber;
}

- (NSString *)stringWithHexNumber:(NSUInteger)hexNumber{
    
    char hexChar[6];
    sprintf(hexChar, "%x", (int)hexNumber);
    
    NSString *hexString = [NSString stringWithCString:hexChar encoding:NSUTF8StringEncoding];
    
    return hexString;
}
-(id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError{
    NSError *error = nil;
    
    return error;
}
@end
