//
//  IHUtility+category.m
//  MiaoTuProject
//
//  Created by Mac on 16/4/4.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "IHUtility+category.h"
#import "GTMBase64.h"
#include <CommonCrypto/CommonCryptor.h>

//#import "UMSocialUIManager.h"
@implementation IHUtility (category)

+(void)ViewAnimateWith:(UIView *)v{
    
    v.alpha=0;
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        v.alpha = 1.;
    } completion:^(BOOL finished) {
        
    }];
    
}

+(void)addWaitingView{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
 
//    [MBProgressHUD showHUDAddedTo:window animated:YES];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window ];
     
    //修改样式，否则等待框背景色将为半透明
    
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    
    hud.bezelView.size = CGSizeMake(160, 60);
    //设置等待框背景色为黑色
    
    hud.bezelView.backgroundColor = [UIColor colorWithRed:33/255.0 green:76/255.0 blue:146/255.0 alpha:0.5/1.0];
    
    hud.removeFromSuperViewOnHide = YES;
    
    //设置菊花框为白色
    
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor colorWithHexString:@"#6394DB"];
    
    hud.label.textColor = cWhiteColor;
    hud.label.font = [UIFont systemFontOfSize:13];
    hud.label.text = @"加载中";
    
    [window addSubview:hud];
    
    [hud showAnimated:YES];

}

+(void)removeWaitingView{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
 
    [MBProgressHUD hideHUDForView:window animated:YES];
}

+(void)addSucessView:(NSString *)str type:(int)type{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:window animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    
    // 再设置模式
    hud.mode = MBProgressHUDModeText;
//     hud.labelText = str;
//    hud.frame = CGRectMake(0, 0, 160, 60);
//    hud.centerX = MainScreenW/2 ;
//    hud.centerY = MainScreenH/2 ;
    hud.label.text = str;
    hud.bezelView.backgroundColor = [UIColor colorWithRed:33/255.0 green:76/255.0 blue:146/255.0 alpha:0.5/1.0];
    hud.label.font = sysFont(12);
    hud.label.backgroundColor = [UIColor clearColor];
    hud.label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];//文本颜色
//    hud.label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
    hud.clipsToBounds = YES ;
    hud.layer.cornerRadius = 8 ;
//    UIImage *alertImage;
//    if (type == 1) {
//        alertImage = Image(@"Location_successImg");
//    }else {
//        alertImage = Image(@"NetFailure_Image");
//    }
//    // 设置图片
//    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,alertImage.size.width , alertImage.size.height)];
//    imgView.image=alertImage;
//    hud.customView =imgView;


    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1.5];
}


//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


+(BOOL)validateWeb:(NSString *)web{
    NSString *webRegex = @"(\\bhttp(s)?://)?[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    NSPredicate *webTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", webRegex];
    return [webTest evaluateWithObject:web];
}


+ (BOOL)checkPhoneValidate:(NSString*)str
{
    //去除首位空格
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (str == nil || [str length] == 0 ) {
    
//        [IHUtility addSucessView:@"手机号码不能为空" type:2];
        return NO;
    }
    
    if([str length] != 11)
    {
        
//        [IHUtility addSucessView:@"手机号码为11位" type:2];
        return NO;
    }
    
    return YES;
}





//是否为纯数字
+ (BOOL)isPureNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

+ (BOOL) IsEnableWIFI {
//    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] == ReachableViaWiFi);
    return NO;
    
}


+(CGFloat)getNewImagesViewHeigh:(NSArray*)imgsArray imageWidth:(CGFloat)imageWidth{
    float heigh = 0;
    
    if (imgsArray.count==1) {
//        MTPhotosModel *obj=(MTPhotosModel *)[imgsArray objectAtIndex:0];
//        float i;
//        
//        if (obj.imgHeigh>obj.imgWidth*1.8) {
//            i=imageWidth/1.8/obj.imgWidth;
//        }else{
//            if (obj.imgWidth>imageWidth) {
//                i=imageWidth/obj.imgWidth*0.5;
//            }else{
//                i=0.5;
//            }
//        }
//        heigh=i* obj.imgHeigh;
        
    }
    else if (imgsArray.count==2){
        
        heigh=imageWidth/2-0.5;
        
    }else if (imgsArray.count==3){
        heigh=imageWidth +1 +imageWidth/2;
        //        heigh=imageWidth/3*2;
    }else if (imgsArray.count==4){
        heigh=imageWidth+1;
    }else if(imgsArray.count==5){
        float f=imageWidth/2;
        float f1=imageWidth/3;
        heigh=f+f1+1;
    }else if (imgsArray.count==6){
        float f1=imageWidth/3;
        heigh=f1*2+1;
    }else if (imgsArray.count==7){
        float f1=imageWidth/3;
        heigh=imageWidth+f1*2+2;
        
    }else if (imgsArray.count==8){
        float f=imageWidth/2;
        float f1=imageWidth/3;
        heigh=f+f1*2+2;
    }else if (imgsArray.count==9){
        float f1=imageWidth/3;
        heigh= f1*3+2;
    }
    return heigh+5;
}




/**
 截取屏幕

 @param currentView 需要截取的页面view
 @return 返回截取的图片
 */
+(UIImage *)captureScreenForView:(UIView *)currentView {
    UIGraphicsBeginImageContext(currentView.frame.size);
    [currentView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key {
    // 利用 GTMBase64 解碼 Base64 字串
    NSData* cipherData = [GTMBase64 decodeString:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    
    // IV 偏移量不需使用
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}
/*字符串加密
 *参数
 *plainText : 加密明文
 *key        : 密钥 64位
 */
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key
{
    NSData *data = [clearText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          1024,
                                          &numBytesEncrypted);
    
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData *dataTemp = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        plainText = [GTMBase64 stringByEncodingData:dataTemp];
    }else{
        NSLog(@"DES加密失败");
    }
    return plainText;
}

/**
 *  压缩图片
 *
 *  @param image       需要压缩的图片
 *  @param fImageBytes 希望压缩后的大小(以KB为单位)
 *
 *  @return 压缩后的图片
 */
+ (void)compressedImageFiles:(UIImage *)image
                     imageKB:(CGFloat)fImageKBytes
                  imageBlock:(void(^)(UIImage *image))block {
    
    __block UIImage *imageCope = image;
    CGFloat fImageBytes = fImageKBytes * 1024;//需要压缩的字节Byte
    
    __block NSData *uploadImageData = nil;
    
    uploadImageData = UIImagePNGRepresentation(imageCope);
    NSLog(@"图片压前缩成 %fKB",uploadImageData.length/1024.0);
    CGSize size = imageCope.size;
    CGFloat imageWidth = size.width;
    CGFloat imageHeight = size.height;
    
    if (uploadImageData.length > fImageBytes && fImageBytes >0) {
        
        dispatch_async(dispatch_queue_create("CompressedImage", DISPATCH_QUEUE_SERIAL), ^{
            
            /* 宽高的比例 **/
            CGFloat ratioOfWH = imageWidth/imageHeight;
            /* 压缩率 **/
            CGFloat compressionRatio = fImageBytes/uploadImageData.length;
            /* 宽度或者高度的压缩率 **/
            CGFloat widthOrHeightCompressionRatio = sqrt(compressionRatio);
            
            CGFloat dWidth   = imageWidth *widthOrHeightCompressionRatio;
            CGFloat dHeight  = imageHeight*widthOrHeightCompressionRatio;
            if (ratioOfWH >0) { /* 宽 > 高,说明宽度的压缩相对来说更大些 **/
                dHeight = dWidth/ratioOfWH;
            }else {
                dWidth  = dHeight*ratioOfWH;
            }
            
            imageCope = [self drawWithWithImage:imageCope width:dWidth height:dHeight];
            uploadImageData = UIImagePNGRepresentation(imageCope);
            
            NSLog(@"当前的图片已经压缩成 %fKB",uploadImageData.length/1024.0);
            //微调
            NSInteger compressCount = 0;
            /* 控制在 1M 以内**/
            while (fabs(uploadImageData.length - fImageBytes) > 1024) {
                /* 再次压缩的比例**/
                CGFloat nextCompressionRatio = 0.9;
                
                if (uploadImageData.length > fImageBytes) {
                    dWidth = dWidth*nextCompressionRatio;
                    dHeight= dHeight*nextCompressionRatio;
                }else {
                    dWidth = dWidth/nextCompressionRatio;
                    dHeight= dHeight/nextCompressionRatio;
                }
                
                imageCope = [self drawWithWithImage:imageCope width:dWidth height:dHeight];
                uploadImageData = UIImagePNGRepresentation(imageCope);
                
                /*防止进入死循环**/
                compressCount ++;
                if (compressCount == 10) {
                    break;
                }
                
            }
            imageCope = [[UIImage alloc] initWithData:uploadImageData];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                block(imageCope);
            });
        });
    }
    else
    {
        block(imageCope);
    }
}
/* 根据 dWidth dHeight 返回一个新的image**/
+ (UIImage *)drawWithWithImage:(UIImage *)imageCope width:(CGFloat)dWidth height:(CGFloat)dHeight{
    
    UIGraphicsBeginImageContext(CGSizeMake(dWidth, dHeight));
    [imageCope drawInRect:CGRectMake(0, 0, dWidth, dHeight)];
    imageCope = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCope;
    
}

@end
