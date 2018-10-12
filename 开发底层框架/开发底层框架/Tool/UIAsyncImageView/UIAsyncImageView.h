//
//  UIAsyncImageView.h
//  TaSayProject
//
//  Created by Mac on 15/6/25.
//  Copyright (c) 2015年 xubin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SDWaitingView.h"
@interface UIAsyncImageView : UIImageView
{
    UIWindow *window;
    CGRect defaultRect;
    SDWaitingView *_waitingView;

}
-(void)setImageAsyncWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder;

-(void)canClickItWithDuration:(CGFloat)duration ThumbUrl:(NSString *)thumbUrl;
@property (nonatomic) BOOL isFadeInEffect;
@property (nonatomic) BOOL isEnableCenterMode;
@property (nonatomic) UIViewContentMode defaultMode;
@property (nonatomic) BOOL createReflection;
@property (nonatomic) CGFloat reflectionFraction;
@property(nonatomic ,assign)CGFloat duration;//动画时间
@property(nonatomic ,retain)NSString * thumbUrl;//大图图片路径
@property(nonatomic,strong)NSDictionary *mDic;
@property (nonatomic, assign) CGFloat pro;
@end
