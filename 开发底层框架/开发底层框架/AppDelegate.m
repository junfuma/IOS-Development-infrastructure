//
//  AppDelegate.m
//  开发底层框架
//
//  Created by 开拍网ios研发 on 2018/10/12.
//  Copyright © 2018年 开拍网ios研发. All rights reserved.
//

#import "AppDelegate.h"
#import "SSMainViewController.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedAppDelegate
{
    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return app;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 修改状态栏颜色
    [UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleLightContent ;
    
    // 避免多个按钮同时点击
    [[UIButton appearance] setExclusiveTouch:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = cBgColor;
    
    SSMainViewController *mainVC = [[SSMainViewController alloc] init];
    self.window.backgroundColor = cBgColor;
    self.window.rootViewController = mainVC;
    
    [self.window makeKeyAndVisible];
    [self netWorkChangeEvent];
    //    zh-Hans
    [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
    return YES;
}
#pragma mark - 检测网络状态变化
-(void)netWorkChangeEvent {
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    NSURL *url = [NSURL URLWithString:@"http://baidu.com"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"当前使用的是流量模式");
                self.brokenNetwork = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"当前使用的是wifi模式");
                self.brokenNetwork = NO;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"断网了");
                self.brokenNetwork = YES;
                [MBProgressHUD showMessage:@"亲~断网了" toView:KeyWindow];
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"变成了未知网络状态");
                self.brokenNetwork = NO;
                [MBProgressHUD showMessage:@"亲~变成了未知网络" toView:KeyWindow];
                break;
                
            default:
                break;
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"netWorkChangeEventNotification" object:@(self.brokenNetwork)];
    }];
    [manager.reachabilityManager startMonitoring];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
