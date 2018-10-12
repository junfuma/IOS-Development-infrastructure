//
//  NSObjectTool.h
//  newCoinali
//
//  Created by 开拍网ios研发 on 2018/10/12.
//  Copyright © 2018年 开拍网ios研发. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObjectTool : NSObject
/**
 清除缓存
 
 @param finish 清除成功回调
 */
+(void)cleanCache:(void(^)())finish;

/**
 获取出错body信息
 
 @param error 错误信息
 */
+ (NSDictionary *)errorInfoData:(NSError *)error;
@end

NS_ASSUME_NONNULL_END
