//
//  KTNNetManger.h
//  wallet
//
//  Created by kp-dev on 2018/8/20.
//  Copyright © 2018年 肖芳. All rights reserved.
//

#import "AFHTTPSessionManager.h"
typedef enum {
    Get = 0,
    Post,
    Put,
    Delete
}NetworkMethod;
@protocol KTNNetMangerDelegate <NSObject>

- (void)getLogin;

@end
@interface KTNNetManger : AFHTTPSessionManager
+ (KTNNetManger *)sharedJsonClient;
@property(nonatomic, weak)id<KTNNetMangerDelegate>delegate;
//- (void)requestJsonDataWithPath:(NSString *)aPath
//                           file:(NSDictionary *)file
//                     withParams:(NSDictionary*)params
//                 withMethodType:(int)NetworkMethod
//                       andBlock:(void (^)(id data, NSError *error))block;
- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(void (^)(id data, NSError *error))block;
@end
