//
//  UIView+BSFrame.h
//  51微博分享
//
//  Created by zhangxueming on 16/4/12.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BSFrame)

@property (nonatomic,assign)CGFloat X;
@property (nonatomic,assign)CGFloat Y;

@property (nonatomic,assign)CGFloat W;
@property (nonatomic,assign)CGFloat H;

+ (void)animationShootOut:(UIView *)animationView;
@end
