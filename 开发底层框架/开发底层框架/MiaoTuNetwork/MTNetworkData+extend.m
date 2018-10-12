//
//  MTNetworkData+extend.m
//  MiaoTuProject
//
//  Created by Mac on 16/4/9.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTNetworkData+extend.h"

#import "MTNetworkData+ForModel.h"
@implementation MTNetworkData (extend)

static MTNetworkData *_config;
#pragma mark - 发送短信验证码
- (void)getVerificationCodeWith:(NSString *)userMobile
                        success:(void (^)(NSDictionary *obj))success
                        failure:(void (^)(NSDictionary *obj2))failure
{
    [self httpGETRequestTagWithParameter:nil method:[NSString stringWithFormat:@"nb-web/api/system/msg?mobile=%@",userMobile] tag:IH_GetPop success:^(NSDictionary * dic) {
        success(dic);
    } failure:^(NSDictionary * dic) {
        failure(dic);
    }];
    
}
#pragma mark - 发送邮件
- (void)getVerificationCodeWithEmailAddress:(NSString *)EmailAddress
                                    success:(void (^)(NSDictionary *obj))success
                                    failure:(void (^)(NSDictionary *obj2))failure{
    [self httpGETRequestTagWithParameter:nil method:[NSString stringWithFormat:@"nb-web/api/system/sendMail?account=%@",EmailAddress] tag:IH_init success:^(NSDictionary * dic) {
        success(dic);
    } failure:^(NSDictionary * dic) {
        failure(dic);
    }];
}
#pragma mark - 获取公钥
- (void)GetsThePublicKeyInterfaceSuccess:(void (^)(NSDictionary *obj))success
                                 failure:(void (^)(NSDictionary *obj2))failure{
    [self httpPostRequestTagWithParameter:nil method:@"nb-web/api/system/pubkey" tag:IH_PostPop success:^(NSDictionary * dic) {
        success(dic);
    } failure:^(NSDictionary * dic) {
        failure(dic);
    }];
}
#pragma mark - 注册用户
- (void)getRegisteredWith:(NSString *)mobile
               password:(NSString *)password
             email:(NSString *)email
                  nickName:(NSString *)nickName
                  mgsCode:(NSString *)mgsCode
               inviteId:(NSString *)inviteId
            inviteCode:(NSString *)inviteCode
                     type:(NSString*)type
                  success:(void (^)(NSDictionary *obj))success
                  failure:(void (^)(NSDictionary *obj2))failure
{
    
    NSDictionary *dic2;
    if ([type isEqualToString:@"email"]) {
     dic2=   [NSDictionary dictionaryWithObjectsAndKeys:
         password,@"password",
         mgsCode,@"mgsCode",
         email,@"email",
  
         nil];
    } else {
     dic2=   [NSDictionary dictionaryWithObjectsAndKeys:
         mobile,@"mobile",
         password,@"password",
         mgsCode,@"mgsCode",
         nil];
    }
    
   

    [self httpPostRequestTagWithParameter:dic2 method:@"nb-web/api/user/regist" tag:0 success:^(NSDictionary * dic) {
        success(dic);
    } failure:^(NSDictionary * dic) {

        failure(dic);
    }];
    
//    [[KTNNetManger sharedJsonClient] requestJsonDataWithPath:@"http://test.coin.com/nb-web/api/user/regist" withParams:dic2 withMethodType:Post andBlock:^(id data, NSError *error) {
//
//    }];
}
#pragma mark - 登录用户
- (void)getLoginWithMobile:(NSString *)account
              password:(NSString *)password
                loginType:(NSString *)loginType
                   success:(void (^)(NSDictionary *obj))success
                   failure:(void (^)(NSDictionary *obj2))failure
{
    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:
                        account,@"account",
                        password,@"password",
                        loginType,@"loginType",
                        nil];
    
    [self httpPostRequestTagWithParameter:dic2 method:@"nb-web/api/user/login" tag:0 success:^(NSDictionary * dic) {
        success(dic);
    } failure:^(NSDictionary * dic) {
        failure(dic);
    }];
    
}

#pragma mark - 重置密码
- (void)ToResetYourPasswordAccount:(NSString *)account
                       newPassword:(NSString *)newPassword
                           success:(void (^)(NSDictionary *obj))success
                           failure:(void (^)(NSDictionary *obj2))failure{
    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:
                        account,@"account",
                        newPassword,@"newPassword",
                        nil];
    [self httpPostRequestTagWithParameter:dic2 method:@"nb-web/api/user/resetPwd" tag:IH_PostPop success:^(NSDictionary * dic) {
        success(dic);
    } failure:^(NSDictionary * dic) {
        failure(dic);
    }];
}
@end
