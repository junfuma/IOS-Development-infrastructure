/************************************************************
  *  * Hyphenate CONFIDENTIAL
  * __________________ 
  * Copyright (C) 2016 Hyphenate Inc. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of Hyphenate Inc.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from Hyphenate Inc.
  */

#ifndef ChatDemo_UI2_0_ChatDemoUIDefine_h
#define ChatDemo_UI2_0_ChatDemoUIDefine_h

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )
#define IS_IPHONE_6P ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )736 ) < DBL_EPSILON )
//#define IS_IPHONE_X ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )1125 ) < DBL_EPSILON )
#define IS_IPHONE_X (LL_ScreenWidth == 375.f && LL_ScreenHeight == 812.f ? YES : NO)
// UIScreen width.
#define  LL_ScreenWidth   [UIScreen mainScreen].bounds.size.width

// UIScreen height.
#define  LL_ScreenHeight  [UIScreen mainScreen].bounds.size.height

// Status bar height.
#define  LL_StatusBarHeight      (IS_IPHONE_X ? 44.f : 20.f)

// Navigation bar height.
#define  LL_NavigationBarHeight  44.f

// Tabbar height.
#define  LL_TabbarHeight         (IS_IPHONE_X ? (49.f+34.f) : 49.f)

// Tabbar safe bottom margin.
#define  LL_TabbarSafeBottomMargin         (IS_IPHONE_X ? 34.f : 0.f)

// Status bar & navigation bar height.
#define  LL_StatusBarAndNavigationBarHeight  (IS_IPHONE_X ? 88.f : 64.f)


#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"

#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]

// 系统版本
#define IS_IOS_VERSION   floorf([[UIDevice currentDevice].systemVersion floatValue]
#define IS_IOS_5    floorf([[UIDevice currentDevice].systemVersion floatValue]) ==5.0 ? 1 : 0
#define IS_IOS_6    floorf([[UIDevice currentDevice].systemVersion floatValue]) ==6.0 ? 1 : 0
#define IS_IOS_7    floorf([[UIDevice currentDevice].systemVersion floatValue]) ==7.0 ? 1 : 0
#define IS_IOS_8    floorf([[UIDevice currentDevice].systemVersion floatValue]) ==8.0 ? 1 : 0
#define IS_IOS_9    floorf([[UIDevice currentDevice].systemVersion floatValue]) ==9.0 ? 1 : 0
#define IS_IOS_10    floorf([[UIDevice currentDevice].systemVersion floatValue]) ==10.0 ? 1 : 0


#endif
