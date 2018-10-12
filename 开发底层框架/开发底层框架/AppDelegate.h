//
//  AppDelegate.h
//  开发底层框架
//
//  Created by 开拍网ios研发 on 2018/10/12.
//  Copyright © 2018年 开拍网ios研发. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//当前网络是否断网
@property(nonatomic,assign) BOOL brokenNetwork;

+ (AppDelegate *)sharedAppDelegate;
@end

