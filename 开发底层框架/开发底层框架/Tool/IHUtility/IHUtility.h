//
//  IHUtility.h
//  libTest
//
//  Created by yaoyongping on 12-4-23.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonDigest.h>
 
#import "AppDelegate.h"
 
#import "IHUDIDTools.h"
#define AppCacheFolder           @"InfoholdCach"                              //文件夹名称
 

typedef enum{
	KCATransitionTypeCube=0,
	KCATransitionTypeMoveIn,
	KCATransitionTypeReveal,
	KCATransitionTypeFade,
	KCATransitionTypePageCurl,
	KCATransitionTypePageUnCurl,
	KCATransitionTypeSuckEffect,
	KCATransitionTypeRippleEffect,
	KCATransitionTypeOglFlip,
	KCATransitionTypeTwist,
} KCATransitionType;

typedef enum {
    IHCheckPasswordResultTypeLength=0,          //密码长度不够
    IHCheckPasswordResultTypeNull,              //密码为空
    IHCheckPasswordResultTypeFormat,            //密码格式不对，只能数字和字母
    IHCheckPasswordResultTypeSuccess,           //验证通过
    
}IHCheckPasswordResultType;

@interface IHUtility : NSObject {

}

+(NSString *)base64WithString:(NSString *)str;
+(NSDictionary *)ReadFileWithPath:(NSString *)fileName;
+(BOOL)IsExistFileWithName:(NSString *)imagename;
+(BOOL)CachFileWithPath:(NSString *)fileName dicData:(NSDictionary *)dic;
+(NSString *)imageNameFromUrl:(NSString *)url;
+(BOOL)CachImageWithName:(NSString *)imagename img:(UIImage *)img;
+(UIImage *)getCacheImageWithImageName:(NSString *)imagename;
+(NSString *)getCachePath;
+(void)clearCachData;
 //判断时间是白天还是晚上 以早六晚六为节点  yes为白天 否则为晚上
+(BOOL)isWhetherDayOrNightWithNow;
//获取时间差
+(NSString *)CalLastTime:(NSString *)inputDate curDate:(NSString *)curDate;
//判断时间是否过期
+(BOOL)overtime:(NSString *)nowDate inputDate:(NSString *)inputDate;

//判断日期大小
+ (BOOL)compareDate:(NSString*)aDate withDate:(NSString*)bDate;

//格式化微博时间
+(NSString *)GetTwitterTime:(NSString *)inputDate;

//判断字符串是否为数字
+(BOOL)IsFloat:(NSString *)string;

+(void)saveDicUserDefaluts:(NSDictionary *)dic  key:(NSString *)key;
+(NSDictionary*)getUserDefalutDic:(NSString *)key;

+(NSDictionary *)getUserDefalutsDicKey:(NSString *)key;
+(void)setUserDefalutsKey:(NSString *)value key:(NSString *)key;
+(void)setUserDefaultDic:(NSDictionary *)dic key:(NSString*)key;

+(void)removeUserDefalutsKey:(NSString *)key;

//格式化字符串  将字符串两边空格去掉
+(NSString *)Trim:(NSString *)string;

//验证邮箱地址是否合法
+(BOOL)IsValidateEmail:(NSString *)email;

//通过原始价格和现有价格计算折扣值
+(float)ComputeDiscount:(float)originalPrice GroupOnPrice:(float)GroupOnPrice;

//比较是否为同一天
+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2;
+(NSString *)FormatDateTimeByString:(NSString *)inputDate;
//格式化日期
+(NSString *)FormatDateByString:(NSString *)inputDate;
+(NSString *)getFormatDateTimeByString:(NSString *)inputDate;
+(NSString *)FormatDateByString2:(NSString *)inputDate;

+ (UIColor *) colorWithHexString: (NSString *)color;
+(UIColor *)colorWithRGBString:(NSString *)color alph:(CGFloat)alph;
+(int )daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate;
// 15/10 -> 10月15号
+(NSString *)FormatDigitDateToStringDate:(NSString *)inputDate;

//将字符串转换为日期
+(NSDate *)ConvertToDateFromString:(NSString *)inputDate;
//将数字转换为时间格式的字符串
+(NSString *)getTimeStringFromString:(NSString *)str;
+(NSString *)FormatDateByString3:(NSString *)inputDate;

+(NSString *)FormatDateByString4:(NSString *)inputDate;

+(NSDate *)ConvertToDateFromString:(NSString *)inputDate withformat:(NSString *)format;

//随机数
+ (NSString*)getTransactionID;

+(void)saveUserDefaluts:(NSArray *)arr  key:(NSString *)key;

+(NSString *)getUserDefalutsKey:(NSString *)key;

+(NSArray *)getUserdefalutsList:(NSString *)key;
//将日期转换为字符串格式
+(NSString *)ConvertToStringFromNSDate:(NSDate *)inpuDate;

//将日期转换为字符串格式
+(NSString *)ConvertToStringFromNSDate:(NSDate *)inpuDate withDataFormate:(NSString *)Formate;
+(NSString *)FormatMonthAndDayByString:(NSString *)inputDate;
+(NSString *)FormatMonthAndDayByString2:(NSString *)inputDate;
+(NSString *)FormatMonthAndDayByString3:(NSString *)inputDate;
//读取day
+(NSString *)GetDayFromData:(NSDate *)date;
+(NSString *)getFormatDateByString:(NSString *)inputDate;
//读取week
+(NSString *)GetWeekFromData:(NSDate *)date;

+(BOOL)CompareDate:(NSDate *)Date_1 withDate:(NSDate *)Date_2;
//解码
+(NSString *)getBase64Encoded:(NSString *)str;

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
//图片压缩
+(UIImage *)rotateAndScaleImage:(UIImage *)image maxResolution:(NSInteger)maxResolution;
//拨打电话
+(void)CallNumber:(NSString *)phoneNumber;
//判断时间差
+(BOOL) isShowMsgTime:(NSString *)beginTime;
 
//获取翻转效果   
//tarnsactionType参数选择：	@"cube" @"moveIn" @"reveal" @"fade"(default) @"pageCurl" 
//							@"pageUnCurl" @"suckEffect" @"rippleEffect" @"oglFlip" @“twist”
//direction参数选择：			kCATransitionFromRight;kCATransitionFromLeft;kCATransitionFromTop;
//							kCATransitionFromBottom; kCATransitionFade;kCATransitionMoveIn;
//							kCATransitionPush;kCATransitionReveal;
+(CATransition *)GetTransiton:(KCATransitionType)transactionType direction:(NSString *)direction;



+(CGSize)GetSizeByText:(NSString *)text sizeOfFont:(int)sizeOfFont width:(int)width;
 
 
+ (NSString *)getMd5_32Bit_String:(NSString *)srcString;
+ (NSString*)MD5Encode:(NSString*)input;
+ (NSString*)URLEncode:(NSString*)str;
+ (NSString*)URLDecoded:(NSString*)str;
+ (NSString*)HandleSpecialCharactor:(NSString*)str;
+ (NSString*)URLEncodeAndHandleSpecialCharactor:(NSString*)str;

+(NSString*)GetMoneyStringFormat:(double)f withSymbol:(BOOL)symbol;
+(NSString *)GetMoneyStringFormat:(double)f withSymbol:(BOOL)symbol isFloat:(int)count;
+ (NSString *)base64StringWithHMACSHA1Digest:(NSString *)strSource key:(NSString *)secretKey;
+ (NSString *)base64StringFromData:(NSData *)data length:(int)length;

+(NSString *)getMonthWeekdayString:(int)weekday withIndex:(int)index;

+ (NSString*)sha1:(NSString*)input;
+(void)AlertMessage:(NSString *)title message:(NSString *)message  delegate:(id)delegate;
+(void)AlertMessage:(NSString *)title message:(NSString *)message;
+(void)AlertMessage:(NSString *)title 
            message:(NSString *)message 
           delegate:(id)delegate 
  cancelButtonTitle:(NSString *)cancelButton
  otherButtonTitles:(NSString *)otherButton
                tag:(NSInteger)tag;

+ (NSString*) judgePasswordStrength:(NSString*) _password;//判读密码强度
+ (BOOL)judgeRange:(NSArray*)_termArray Password:(NSString*)_password;

+ (NSString *)getUUID;
+ (NSString *)generateTimestamp;
+ (NSString *)generateNonce;
+ (NSString *)getParameterString:(NSDictionary *)dic;
+ (NSMutableArray *)bubbleSortDictionaryByKeys:(NSDictionary *)dict;
+(UIImage *)convertImage:(UIImage *)image withImageWidth:(float)targetWidth;
+(CGSize)GetSizeByText:(NSString *)text boldOfFont:(int)sizeOfFont width:(int)width;

/**
 *   获取手机通讯录
 *
 *  @return 
 */

+(BOOL) isValidateMobile:(NSString *)mobile;




#pragma mark 动画效果
/**
 *   心跳动画
 *
 */
+ (void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration;

/**
 *   放大缩小动画
 */
+(void)heartBigView:(UIView *)view
           duration:(CGFloat)fDuration
          beginTime:(CGFloat)time
          fromValue:(CGFloat)fromValue
            toValue:(CGFloat)toValue
        repeatCount:(CGFloat)repeatCount;
@end
