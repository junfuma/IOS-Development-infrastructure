//
//  UIImage+BSImageOriginal.h
//  51微博分享
//
//  Created by zhangxueming on 16/4/11.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BSImage)

//返回原始的图片
+ (UIImage *)imageWithOriginalNamed:(NSString *)imageNamed;
+ (UIImage *)imageWithStretchable:(UIImage *)image;
+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL ;
+ (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize
               scaledToSize:(CGSize)newSize;
- (UIImage*)imageWithCornerRadius:(CGFloat)radius ;
//图片转圆角
+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;

//图片虚化
+ (UIImage*)imageBlur:(UIImage*)image;


+ (UIImage *)changeAlphaOfImageWith:(CGFloat)alpha withImage:(UIImage*)image;
@end
