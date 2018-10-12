//
//  Contant.h
//  AlphaPorject
//
//  Created by xu bin on 13-8-14.
//  Copyright (c) 2013年 xu bin. All rights reserved.
//

#import <Foundation/Foundation.h>




typedef enum{
    KP_HpomePageAD,//首页广告图片轮播
    KP_HpomePageMessage,//首页消息轮播
}advertisingType;


typedef enum{
    KP_homepageFall,//首页涨幅榜
    KP_homepageRose,//首页跌幅榜
}homepageFallOrRoseType;


typedef enum{
    KP_personPropertyHomePageLogin,
    KP_personPropertyHomePageNo,
    KP_personPropertyMineLogin,
    KP_personPropertyMineNo,
}personPropertyMessageType;


typedef void (^DidSelectBlock) (NSInteger index);
typedef void (^DidSelectAdvertisingBlock) (advertisingType type);



//通知宏

#define kUserDefalutLoginInfo                   @"kUserDefalutLoginInfo"  // 用户登录信息
#define NotificationLoginIn         @"NotificationLoginIn"
#define NotificationOutLogin        @"NotificationOutLogin"

#define IHPushViewControllerKey                        @"SXPushViewControllerKey"
#define IHPopViewControllerKey                        @"SXPopViewControllerKey"
#define IHPopToRootViewController                    @"SXPopToRootViewController"
#define IHOpenPresentModelViewControllerKey                @"IHOpenPresentModelViewControllerKey"
#define IHDissmissModalViewContollerKey                @"IHDissmissModalViewContollerKey"
#define NotificationChangeTabBarSelectedIndex       @"NotificationChangeTabBarSelectedIndex"//切换tabbar
#define NotificationTabBarChanged      @"NotificationTabBarChanged"//切换tabbar之后
#define NotificationOutLogin        @"NotificationOutLogin"
#define  NotificationtabBarHidden    @"NotificationtabBarHidden"

