//
//  MTNetworkData+extend.h
//  MiaoTuProject
//
//  Created by Mac on 16/4/9.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTNetworkData.h"

@interface MTNetworkData (extend)

- (void)getVerificationCodeWith:(NSString *)userMobile
                        success:(void (^)(NSDictionary *obj))success
                        failure:(void (^)(NSDictionary *obj2))failure;
- (void)getVerificationCodeWithEmailAddress:(NSString *)EmailAddress
                        success:(void (^)(NSDictionary *obj))success
                        failure:(void (^)(NSDictionary *obj2))failure;

- (void)GetsThePublicKeyInterfaceSuccess:(void (^)(NSDictionary *obj))success
                                 failure:(void (^)(NSDictionary *obj2))failure;


- (void)getRegisteredWith:(NSString *)userMobile
                 password:(NSString *)password
                    email:(NSString *)email
                 nickName:(NSString *)nickName
                  mgsCode:(NSString *)mgsCode
                 inviteId:(NSString *)inviteId
               inviteCode:(NSString *)inviteCode
                  type:(NSString*)type
                  success:(void (^)(NSDictionary *obj))success
                  failure:(void (^)(NSDictionary *obj2))failure;
- (void)getLoginWithMobile:(NSString *)account
                  password:(NSString *)password
                 loginType:(NSString *)loginType
                   success:(void (^)(NSDictionary *obj))success
                   failure:(void (^)(NSDictionary *obj2))failure;

- (void)ToResetYourPasswordAccount:(NSString *)account
                  newPassword:(NSString *)newPassword
                   success:(void (^)(NSDictionary *obj))success
                   failure:(void (^)(NSDictionary *obj2))failure;
@end





