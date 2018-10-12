//
//  NSObjectTool.m
//  newCoinali
//
//  Created by 开拍网ios研发 on 2018/10/12.
//  Copyright © 2018年 开拍网ios研发. All rights reserved.
//

#import "NSObjectTool.h"

@implementation NSObjectTool
/**
 *  清理缓存
 */
+(void)cleanCache:(void(^)())finish
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //文件路径
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
        [fileManager removeItemAtPath:cacheFilePath error:nil];
        NSString *tmpFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
        [fileManager removeItemAtPath:tmpFilePath error:nil];
        
        //        NSString *directoryPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        
        //        NSArray *subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
        //
        //        for (NSString *subPath in subpaths) {
        //            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
        //            [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        //        }
        //返回主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finish) {
                finish();
            }
        });
    });
    
}

+ (NSDictionary *)errorInfoData:(NSError *)error {
    NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
    NSData *jsonData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        return nil;
    }
    
    return dic;
}
@end
