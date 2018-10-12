//
//  MTTabBarViewController.h
//  MiaoTuProject
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTTabBar.h"

typedef void (^DidSelectImageButtonBlock) (NSInteger index);
@interface MTTabBarViewController : UITabBarController
{
    MTTabBar *_tabBar;
    BOOL isHidden;
    
    int ChangeStateNum;
}

-(void)setMessageNum:(int)num;
-(void)setTabBarHidden:(BOOL)hidden;
-(void)setTabBar1Num:(int)num; // 判断首页 图标 是否隐藏
-(void)setTabBar4Num:(int)num; //判断我 图标是否隐藏
@property (nonatomic,copy) DidSelectImageButtonBlock selectBlock;
@end
