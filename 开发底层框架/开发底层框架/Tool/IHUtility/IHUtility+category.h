//
//  IHUtility+category.h
//  MiaoTuProject
//
//  Created by Mac on 16/4/4.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "IHUtility.h"
 #import "SDImageCache.h"
//#import "Reachability.h"
@class SDImageCache;
@interface IHUtility (category)
//验证手机号码
+ (BOOL)checkPhoneValidate:(NSString*)str;
+(void)addWaitingView;
+(void)removeWaitingView;
#pragma mark  调用appDelegate单例
+(void)addSucessView:(NSString*)str type:(int)type;

//是否为纯数字
+(BOOL)isPureNumandCharacters:(NSString *)str;

+ (BOOL) IsEnableWIFI ;

+ (BOOL) validateEmail:(NSString *)email;
+(BOOL)validateWeb:(NSString *)web;
+(CGFloat)getNewImagesViewHeigh:(NSArray*)imgsArray imageWidth:(CGFloat)imageWidth;

+ (NSString *) compareCurrentTimeString:(NSString *) compareDateString;

+ (NSString *)compareCurrentTimeStringWithMonth:(NSString *)compareDateString;

+(NSString *)genBillNo;

//改变部分字体的颜色
+(NSMutableAttributedString *)changePartTextColor:(NSString *)string range:(NSRange)range value:(id)value;
+(void)ViewAnimateWith:(UIView *)v;

//绘制虚线
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key;//DES解密
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key;//DES加密

+ (void)compressedImageFiles:(UIImage *)image
                     imageKB:(CGFloat)fImageKBytes
                  imageBlock:(void(^)(UIImage *image))block ;//图片压缩指定大小

+(UIImage *)captureScreenForView:(UIView *)currentView;
@end
