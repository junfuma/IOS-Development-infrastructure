//
//  SSGetPhoneOnlylogo.h
//  SSClient
//
//  Created by lh on 2017/9/20.
//  Copyright © 2017年 lh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSGetPhoneOnlylogo : NSObject

+ (void)save:(NSString *)service data:(id)data;//保存唯一标识到系统里

+ (id)load:(NSString *)service;

+ (void)Delete:(NSString *)service;

+ (NSString *)getIDFV;//获取唯一标识

//
@end
