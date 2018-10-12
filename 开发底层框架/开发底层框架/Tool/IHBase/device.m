//
//  device.m
//  XFDesigners
//
//  Created by yaoyongping on 12-12-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "device.h"
#import <sys/utsname.h>
@implementation device
+(CGSize)deviceSize{
    CGRect r = [ UIScreen mainScreen ].applicationFrame;
    return CGSizeMake(r.size.width, r.size.height);
}

+(CGSize)deviceBoundSize
{
    CGRect r = [ UIScreen mainScreen ].bounds;
    return CGSizeMake(r.size.width, r.size.height);
}


+(BOOL)iPhone5
{
    return CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size);
}


+(int)leftWindowHeight{
    return  [UIScreen mainScreen ].bounds.size.width - 20-44;
}

+ (int)leftWindowWidth{
    return [UIScreen mainScreen ].bounds.size.height;
}

+(int)windowWith{
    return  [UIScreen mainScreen ].bounds.size.width;
}

+(int)topWindowWidth{
    CGRect r = [ UIScreen mainScreen ].applicationFrame;
    
    return r.size.width+20;
}


+(int)windowRootHeight
{
    if ([device iPhone5])
        return 458;
    else
        return 370;
}

+(int)windowHeight
{
   return  [UIScreen mainScreen ].bounds.size.height -20-44;
    /*
    if ([device iPhone5])
        return 504;
    else
        return 416;
     */
}

+(int)boundHeihgt
{
    return [UIScreen mainScreen ].bounds.size.height;
}

+(int)deviceHeight
{
    return [UIScreen mainScreen ].bounds.size.height - 20;
}


+ (NSString*)deviceString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}

+(IHDeviceType)deviceType{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhon e1,1"])    return IHDeviceTypeIPhone1G;
    if ([deviceString isEqualToString:@"iPhone1,2"])    return IHDeviceTypeIPhone3G;
    if ([deviceString isEqualToString:@"iPhone2,1"])    return IHDeviceTypeIPhone3GS;
    if ([deviceString isEqualToString:@"iPhone3,1"])    return IHDeviceTypeIPhone4;
    if ([deviceString isEqualToString:@"iPhone4,1"])    return IHDeviceTypeIPhone4S;
    if ([deviceString isEqualToString:@"iPhone3,2"])    return IHDeviceTypeVerizonIPhone4;
    if ([deviceString isEqualToString:@"iPod1,1"])      return IHDeviceTypeIPodTouch1G;
    if ([deviceString isEqualToString:@"iPod2,1"])      return IHDeviceTypeIPodTouch2G;
    if ([deviceString isEqualToString:@"iPod3,1"])      return IHDeviceTypeIPodTouch3G;
    if ([deviceString isEqualToString:@"iPod4,1"])      return IHDeviceTypeIPodTouch4G;
    if ([deviceString isEqualToString:@"iPad1,1"])      return IHDeviceTypeIPad;
    if ([deviceString isEqualToString:@"iPad2,1"])      return IHDeviceTypeIPad2WiFi;
    if ([deviceString isEqualToString:@"iPad2,2"])      return IHDeviceTypeIPad2GSM;
    if ([deviceString isEqualToString:@"iPad2,3"])      return IHDeviceTypeIPad2CDMA;
    if ([deviceString isEqualToString:@"i386"])         return IHDeviceTypeSimulator;
    if ([deviceString isEqualToString:@"x86_64"])       return IHDeviceTypeSimulator;
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return IHDeviceTypeOther;
}



 
@end
