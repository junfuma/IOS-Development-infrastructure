//
//  device.h
//  XFDesigners
//
//  Created by yaoyongping on 12-12-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    IHDeviceTypeIPhone1G,
    IHDeviceTypeIPhone3G,
    IHDeviceTypeIPhone3GS,
    IHDeviceTypeIPhone4,
    IHDeviceTypeIPhone4S,
    IHDeviceTypeVerizonIPhone4,
    IHDeviceTypeIPodTouch1G,
    IHDeviceTypeIPodTouch2G,
    IHDeviceTypeIPodTouch3G,
    IHDeviceTypeIPodTouch4G,
    IHDeviceTypeIPad,
    IHDeviceTypeIPad2WiFi,
    IHDeviceTypeIPad2GSM,
    IHDeviceTypeIPad2CDMA,
    IHDeviceTypeSimulator,
    IHDeviceTypeOther,
}IHDeviceType;


#define _deviceSize   [device deviceSize]

#define _deviceBoundSize [device deviceBoundSize]

#define _iPhone5       [device iPhone5]

#define _boundHeihgt   [device boundHeihgt]

#define _deviceHeight  [device deviceHeight]

#define WindowHeight	(IS_IPHONE_X ? ([device windowHeight]-34.f):[device windowHeight])

#define WindowWith    [device windowWith]

#define LeftWindowHeight		[device leftWindowHeight]
#define LeftWindowWidth         [device leftWindowWidth]

#define TopWindowWidth  [device topWindowWidth]

#define _IOS6      [[[UIDevice currentDevice] systemVersion] floatValue] < 7

#define _IOS7      [[[UIDevice currentDevice] systemVersion] floatValue] >= 7

#define IOS7_OR_LATER    ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 )

#define _IOS8     [[[UIDevice currentDevice] systemVersion] floatValue] >= 8
#define WindowRootHeight	[device windowRootHeight]
#define kScreenHeight [UIScreen mainScreen].bounds.size.height//获取屏幕高度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width//获取屏幕宽度

#define XFTabViewHeight      49

#define WindowUUid   [device  readUuID]
@interface device : NSObject
+(CGSize)deviceSize;
+(CGSize)deviceBoundSize;
+(BOOL)iPhone5;
+(int)windowRootHeight;
+(int)windowHeight;
+(int)boundHeihgt;
+(int)deviceHeight;

+ (NSString*)deviceString;
+(IHDeviceType)deviceType;

+(int)windowWith;
+(int)leftWindowHeight;
+(int)leftWindowWidth;
+(int)topWindowWidth;
@end
