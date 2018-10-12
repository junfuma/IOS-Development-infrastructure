//
//  KTNNetManger.m
//  wallet
//
//  Created by kp-dev on 2018/8/20.
//  Copyright © 2018年 肖芳. All rights reserved.
//

#import "KTNNetManger.h"
@implementation KTNNetManger
+ (KTNNetManger *)sharedJsonClient {
    static KTNNetManger *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //因为后台给了多个服务,BaseUrl给空,调用时直接给完成的URL
        _sharedClient = [[KTNNetManger alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        //        NSString *certFilePath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];
        //        NSData *certData = [NSData dataWithContentsOfFile:certFilePath];
        //        NSSet *certSet = [NSSet setWithObject:certData];
        //        AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:certSet];
        //        policy.allowInvalidCertificates = YES;
        //        policy.validatesDomainName = NO;
        //
        //        _sharedClient.securityPolicy = policy;
        //        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        //        _sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        //        // _sharedClient.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
        //        //关闭缓存避免干扰测试r
        //        _sharedClient.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    });
    
    return _sharedClient;
}
- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(int)NetworkMethod
                       andBlock:(void (^)(id data, NSError *error))block{
    [self requestJsonDataWithPath:aPath withParams:params withMethodType:NetworkMethod autoShowError:YES andBlock:block];
}
- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(int)NetworkMethod
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block{
    
    if (!aPath || aPath.length <= 0) {
        return;
    }
    NSUserDefaults *defu = [NSUserDefaults standardUserDefaults];
    // 添加版本信息；
//    NSMutableDictionary *par = [[NSMutableDictionary alloc]initWithDictionary:params];
//    par[@"os"] = @"ios";
//    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
//    NSString *shotVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
//    par[@"appv"] = shotVersion;
//    par[@"network"] = [defu objectForKey:@"netWork"];
//    par[@"osv"] = [[UIDevice currentDevice] systemVersion];
//    if (params[@"shopId"]) {
//
//    }else{
//        par[@"shopId"] = [defu objectForKey:Code_Mall_ShopId];
//    }
//    par[@"memberId"] = [defu objectForKey:Code_Login_MemberId];
//    par[@"token"] = [defu objectForKey:Code_Login_Token];
//    params = par;
    //log请求数据
#ifndef CloseHTTPControlLog
    NSLog(@"\n===========request===========\n%@:\n%@", aPath, params);
#endif
    //    NSString *certFilePath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];
    //
    //    NSLog(@"certFilePath-- = %@",certFilePath);
    //    NSData *certData = [NSData dataWithContentsOfFile:certFilePath];
    //    NSSet *certSet = [NSSet setWithObject:certData];
    
    //    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:certSet];
    //    policy.allowInvalidCertificates = YES;
    //    policy.validatesDomainName = NO;
    //
    //    self.securityPolicy = policy;
    AFHTTPRequestSerializer *requestSerializer =  [AFHTTPRequestSerializer serializer];
    /*
    NSString *userID = [defu objectForKey:kLogin_UserId];
    NSString *kToken = [defu objectForKey:kLogin_Token];
    NSString *lang = [defu objectForKey:kLogin_Lang];
//    NSString *lang = @"zh";
    if (userID != nil  && kToken != nil   && lang != nil ) {
//        NSDictionary *headerFieldValueDictionary = @{@"userId":userID, @"ticket":kToken, @"lang":lang};
//        NSLog(@"headerFieldValueDictionary === %@",headerFieldValueDictionary);
        [requestSerializer setValue:[NSString stringWithFormat:@"%@",userID] forHTTPHeaderField:@"userId"];
        [requestSerializer setValue:[NSString stringWithFormat:@"%@",kToken] forHTTPHeaderField:@"ticket"];
        [requestSerializer setValue:[NSString stringWithFormat:@"%@",lang] forHTTPHeaderField:@"lang"];
//         [requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Accept"];
        self.requestSerializer = requestSerializer;
//        self.requestSerializer = [AFHTTPRequestSerializer serializer];
    }else if (lang != nil ) {
        [requestSerializer setValue:[NSString stringWithFormat:@"%@",lang] forHTTPHeaderField:@"lang"];
        self.requestSerializer = requestSerializer;
    }else{
//        NSLog(@"headerFieldValueDictionary === %@",headerFieldValueDictionary
       self.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
     */
    [self.requestSerializer setValue:@"" forHTTPHeaderField:@"If-None-Match"];
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    //关闭缓存避免干扰测试r
    //self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    
    //[self test];
    

    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",@"application/x-www-form-urlencoded", nil];
    
    
//    if (!IOS9_OR_LATER) {
//        aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    }else{
//        aPath = [aPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
//    }
//
    //发起请求
    switch (NetworkMethod) {
        case Get:
        {
            NSLog(@"self.requestSerializer.HTTPRequestHeaders ==== %@", self.requestSerializer.HTTPRequestHeaders);
            [self GET:aPath parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"\n===========response Get===========\n%@:\n%@", aPath, responseObject);
//                id error = [self handleResponse:responseObject autoShowError:autoShowError];
                NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"请求成功JSON:%@", JSON);
                NSString *retCode = JSON[@"code"];
                if ([retCode  isEqualToString:@"001"]) {
                    
                }else if ([retCode  isEqualToString:@"002"]){
                    if ([self.delegate respondsToSelector:@selector(getLogin)]) {
                        [self.delegate getLogin];
                    }
                }
                id error = [self handleResponse:responseObject autoShowError:autoShowError];
                if (error) {
                    block(nil, error);
                }else{
                    block(JSON, nil);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"\n===========response Get===========\n%@:\n%@", aPath, error);
                if (autoShowError) {
//                    [self showError:error];
                }
                block(nil, error);
            }];
            break;
        }
            
        case Post:
        {
            NSLog(@"self.requestSerializer.HTTPRequestHeaders ==== %@", self.requestSerializer.HTTPRequestHeaders);
            [self POST:aPath parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id error = [self handleResponse:responseObject autoShowError:autoShowError];
//                if (range1.length > 0) {
//                    [self saveCookieDataToFile:Code_CookieDataDevice];
//                }else if (range2.length > 0){
//                    [self saveCookieDataToFile:Code_CookieDataSNS];
//                }
#ifndef CloseHTTPControlLog
                
                //                NSLog(@"\n===========response Post===========\n%@:\n%@", aPath, responseObject);
#endif
                NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"请求成功JSON:%@", JSON);
                NSLog(@"\n===========response Post===========\n%@:\n%@", aPath, responseObject);
                if (responseObject) {
                    NSString *retCode = JSON[@"code"];
                    if ([retCode  isEqualToString:@"001"]) {
                        
                    }else if ([retCode  isEqualToString:@"002"]){
                        if ([self.delegate respondsToSelector:@selector(getLogin)]) {
                            [self.delegate getLogin];
                        }
                    }
                    //                    BaseResultModel *model = [[BaseResultModel alloc] initWithDictionary:JSON error:nil];
//                    if (retCode.integerValue == 1000) {
//                        [self deleteCookie];
//                        [CKAlertView ck_showAlertViewWithTitle:@"重新登录" message:@"帐号未登录，请登录" cancelButtonTitle:@"登录" otherButtonTitle:nil isImage:NO handler:^(CKAlertView *alertView, NSInteger buttonIndex) {
//                            if (buttonIndex == 0) {
//                                [self quit];
//                            }
//                        }];
//
//                    }else if (retCode.integerValue == 1001) {
//                        [self deleteCookie];
//                        [CKAlertView ck_showAlertViewWithTitle:@"重新登录" message:@"其他人登录了您的账户，请重新登录并保证账户安全" cancelButtonTitle:@"登录" otherButtonTitle:nil isImage:NO handler:^(CKAlertView *alertView, NSInteger buttonIndex) {
//                            if (buttonIndex == 0) {
//                                [self quit];
//                            }
//                        }];
//
//                    }else if (retCode.integerValue == 1002) {
//                        [self deleteCookie];
//                        [CKAlertView ck_showAlertViewWithTitle:@"重新登录" message:@"ST验证失败，请重新登录" cancelButtonTitle:@"登录" otherButtonTitle:nil isImage:NO handler:^(CKAlertView *alertView, NSInteger buttonIndex) {
//                            if (buttonIndex == 0) {
//                                [self quit];
//                            }
//                        }];
//                    }else if (retCode.integerValue == 1003) {
//                        [self deleteCookie];
//                        [CKAlertView ck_showAlertViewWithTitle:@"重新登录" message:@"登录已过期，请重新登录" cancelButtonTitle:@"登录" otherButtonTitle:nil isImage:NO handler:^(CKAlertView *alertView, NSInteger buttonIndex) {
//                            if (buttonIndex == 0) {
//                                [self quit];
//                            }
//                        }];
//                    }else if (retCode.integerValue == -1){
//                        NSArray *arr = [PLMMaintainModel mj_objectArrayWithKeyValuesArray:JSON[@"retObj"]];
//                        PLMMaintainModel *model = arr[0];
//                        if (model.info.length) {
//                            [CKAlertView ck_showAlertViewWithTitle:@"服务器维护中" message:model.info cancelButtonTitle:@"好的" otherButtonTitle:nil isImage:NO handler:^(CKAlertView *alertView, NSInteger buttonIndex) {
//                                if (buttonIndex == 0) {
//                                    [self quit];
//                                }
//                            }];
//
//                        }
//                    }
                }
                if (error) {
                    //  NSLog(@"\n===========response Post===========\n%@:\n%@", aPath, responseObject);
                    block(nil, error);
                }else{
                    block(JSON, nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"\n===========response Post===========\n%@:\n%@", aPath, error);
//                !autoShowError || [self showError:error];
                block(nil, error);
            }];
            break;
        }
            
        case Put:
        {
            [self PUT:aPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"\n===========response Put===========\n%@:\n%@", aPath, responseObject);
                NSString *retCode = responseObject[@"code"];
                if ([retCode  isEqualToString:@"001"]) {
                    
                }else if ([retCode  isEqualToString:@"002"]){
                    if ([self.delegate respondsToSelector:@selector(getLogin)]) {
                        [self.delegate getLogin];
                    }
                }
//                id error = [self handleResponse:responseObject autoShowError:autoShowError];
//                if (error) {
//                    block(nil, error);
//                }else{
//                    block(responseObject, nil);
//                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"\n===========response Put===========\n%@:\n%@", aPath, error);
                if (autoShowError) {
//                    [self showError:error];
                }
                block(nil, error);
            }];
            break;
        }
            
        case Delete:
        {
            [self DELETE:aPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"\n===========response Delete===========\n%@:\n%@", aPath, responseObject);
                NSString *retCode = responseObject[@"code"];
                if ([retCode  isEqualToString:@"001"]) {
                    
                }else if ([retCode  isEqualToString:@"002"]){
                    if ([self.delegate respondsToSelector:@selector(getLogin)]) {
                        [self.delegate getLogin];
                    }
                }
//                id error = [self handleResponse:responseObject autoShowError:autoShowError];
//                if (error) {
//                    block(nil, error);
//                }else{
//                    block(responseObject, nil);
//                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (autoShowError) {
//                    [self showError:error];
                }
                block(nil, error);
            }];
        }
        default:
            break;
    }
    //重置请求超时时间(因为可能外部调用前改变了超时设置)
    [self setRequestTimeoutInterval:25];
}

-(void)setRequestTimeoutInterval:(NSTimeInterval)timeInterval{
    self.requestSerializer.timeoutInterval = timeInterval;
}
@end
