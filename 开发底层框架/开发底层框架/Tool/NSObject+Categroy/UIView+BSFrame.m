//
//  UIView+BSFrame.m
//  51微博分享
//
//  Created by zhangxueming on 16/4/12.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "UIView+BSFrame.h"

@implementation UIView (BSFrame)

- (CGFloat)X
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)X
{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}

- (CGFloat)Y
{
    return self.frame.origin.y;
}


- (void)setY:(CGFloat)Y
{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}


- (CGFloat)W
{
    return self.frame.size.width;
}

- (void)setW:(CGFloat)W
{
    CGRect frame = self.frame;
    frame.size.width = W;
    self.frame = frame;
}

- (CGFloat)H
{
    return self.frame.size.height;
}

- (void)setH:(CGFloat)H
{
    CGRect frame = self.frame;
    frame.size.height= H;
    self.frame = frame;
}



#pragma mark   动画弹跳效果关键代码
//弹跳多次可自行多嵌套几次   调用此方法  只需传入弹跳对象
+ (void)animationShootOut:(UIView *)animationView{
    CGRect frame = animationView.frame;
    [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^(void){
        
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^(void){
            //弹起
            animationView.frame = CGRectMake(frame.origin.x, frame.origin.y-20, frame.size.width, frame.size.height);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^(void){
                //下降
                animationView.frame = frame;
            } completion:^(BOOL finished){
                [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^(void){
                    //弹起
                    animationView.frame = CGRectMake(frame.origin.x, frame.origin.y-10, frame.size.width, frame.size.height);
                } completion:^(BOOL finished){
                    //下降
                    [UIView animateWithDuration:0.4f delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^(void){
                        animationView.frame = frame;
                    } completion:^(BOOL finished){
                    }];
                }];
            }];
        }];
    }];
}
@end
