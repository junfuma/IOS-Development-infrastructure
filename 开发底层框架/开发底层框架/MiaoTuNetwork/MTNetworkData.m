//
//  MTNetworkData.m
//  MiaoTuProject
//
//  Created by Mac on 16/4/1.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTNetworkData.h"

#import "MTNetworkData+ForModel.h"

@implementation MTNetworkData


static MTNetworkData *_config;

+(MTNetworkData *)shareInstance{
    @synchronized(self){
        if (_config==nil) {
            _config=[[MTNetworkData alloc] init];
        }
    }
    return _config;
}


//根据tag 来封装数据
-(void)httpPostRequestTagWithParameter:(NSDictionary *)dic
                            method:(NSString *)method
                               tag:(IHFunctionTag)tag
                           success:(void (^)(id))success
                           failure:(void (^)(id))failure{

    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
/*
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.operationQueue.maxConcurrentOperationCount = 5;
    
    // 开始设置请求头
    [sessionManager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",@"application/x-www-form-urlencoded",@"charset=utf-8", nil];
    [sessionManager.requestSerializer setValue:@"" forHTTPHeaderField:@"If-None-Match"];
*/
    
    [sessionManager.requestSerializer setValue:@"" forHTTPHeaderField:@"If-None-Match"];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];

    
    
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",@"application/x-www-form-urlencoded", nil];
    
    sessionManager.operationQueue.maxConcurrentOperationCount = 5;

    NSString *service = [NSString stringWithFormat:@"%@%@", serverURL,method];

    NSString* parameter;
    if (dic.allKeys.count>0) {
        parameter  = [IHUtility getParameterString:dic];
    }
    
    NSLog(@"total url:  %@?%@", service, parameter);
    
    [sessionManager setTaskWillPerformHTTPRedirectionBlock:^NSURLRequest *(NSURLSession *session, NSURLSessionTask *task, NSURLResponse *response, NSURLRequest *request) {
        if (response) {
            return nil;
        }
        return request;
    }];
    [IHUtility addWaitingView];
    
    [sessionManager POST:service parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            
        [IHUtility removeWaitingView];
        NSError *err=nil;
           NSDictionary *ret = [NSJSONSerialization JSONObjectWithData:responseObject
                                                     options:kNilOptions
                                                       error:&err];
            
     
            ret = [self deleteAllNullValue:ret];
            NSLog(@"res= %@", ret);
            NSArray *keyArr = [ret allKeys];
            if ([keyArr containsObject:@"code"]) {
                NSInteger errorNo=[[ret objectForKey:@"code"]integerValue];
                if (errorNo!=001) {
                    failure(ret);
                    NSString *message =[ret objectForKey:@"msg"];

                    if (tag != IH_PostPop) {
                        if (message.length >0) {
                            [IHUtility addSucessView:[ret objectForKey:@"msg"] type:1];
                        }
                    }

                    return ;
                }
            }
            NSDictionary *dic2=[self parseResult:ret tag:tag];
            success(dic2);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSDictionary *userInfo = error.userInfo;
        
      
        NSLog(@"%@ ,%@",error,[userInfo objectForKey:@"NSLocalizedDescription"]);
      
        [IHUtility removeWaitingView];
        NSDictionary *dic = [NSObjectTool errorInfoData:error];

        failure(dic);
    }];
}

//  PUT 根据tag 来封装数据
-(void)httpPUTRequestTagWithParameter:(NSDictionary *)dic
                            method:(NSString *)method
                               tag:(IHFunctionTag)tag
                           success:(void (^)(id))success
                           failure:(void (^)(id))failure{
    
//    if (tag != IH_UserRegistered && tag != IH_UserReSetPassWord) {
//        NSDictionary *userDic=[IHUtility getUserDefalutDic:kUserDefalutLoginInfo];
//        //用户不是登录状态
//        if (userDic == nil) {
//            [IHUtility removeWaitingView];
//            return;
//        }
//    }
    
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager.requestSerializer setValue:@"" forHTTPHeaderField:@"If-None-Match"];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",@"application/x-www-form-urlencoded", nil];
    sessionManager.operationQueue.maxConcurrentOperationCount = 5;
    [sessionManager setTaskWillPerformHTTPRedirectionBlock:^NSURLRequest *(NSURLSession *session, NSURLSessionTask *task, NSURLResponse *response, NSURLRequest *request) {
        if (response) {
            return nil;
        }
        return request;
    }];
    
    NSString *service = [NSString stringWithFormat:@"%@%@", serverURL,method];
      [IHUtility addWaitingView];
    [sessionManager PUT:service parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            [IHUtility removeWaitingView];
 
            
            NSError *err=nil;
            NSDictionary *ret = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                options:kNilOptions
                                                                  error:&err];
            
            
            ret = [self deleteAllNullValue:ret];
            NSLog(@"res= %@", ret);
            
            NSArray *keyArr = [ret allKeys];
            if ([keyArr containsObject:@"code"]) {
                NSInteger errorNo=[[ret objectForKey:@"code"]integerValue];
                if (errorNo!=001) {
                    failure(ret);
                    NSString *message =[ret objectForKey:@"msg"];
                    
                    if (tag != IH_PutPop) {
                        if (message.length >0) {
                            [IHUtility addSucessView:[ret objectForKey:@"msg"] type:1];
                        }
                    }
                    
                    return ;
                }
            }
            NSDictionary *dic2=[self parseResult:ret tag:tag];
            success(dic2);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [IHUtility removeWaitingView];
        /*
        NSDictionary *userInfo=error.userInfo;
        
        if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"503"].location != NSNotFound) {
//            [IHUtility addSucessView:@"服务器正忙！请稍后重试" type:2];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"400"].location != NSNotFound){
            
            NSData *data =[userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
            NSString *errorStr = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
            if (errorStr.length >0) {
                
//                [IHUtility addSucessView:errorStr type:2];
            }else{
//                [IHUtility addSucessView:[userInfo objectForKey:@"NSLocalizedDescription"] type:2];
            }
            
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"401"].location != NSNotFound){
            //接口认证失败，
            [self userLoginOut];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"429"].location != NSNotFound){
//            [IHUtility addSucessView:@"操作过快！让它飞一会" type:2];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"302"].location != NSNotFound){
            NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
            NSDictionary *allHeaders = response.allHeaderFields;
            if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"302"].location != NSNotFound){
                //重定向redirect_content
                NSString *redirect_content = @"";
                if ([[allHeaders allKeys] containsObject:@"Location"]) {
                    redirect_content = [NSString stringWithFormat:@"%@",allHeaders[@"Location"]];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationHttpRedirect" object:redirect_content];
            }
        }else{
//            [IHUtility addSucessView:[userInfo objectForKey:@"NSLocalizedDescription"] type:2];
        }
        */
        NSDictionary *dic = [NSObjectTool errorInfoData:error];
        
        failure(dic);
         
    }];
    
}

//  DELETE 根据tag 来封装数据
-(void)httpDELETERequestTagWithParameter:(NSDictionary *)dic
                               method:(NSString *)method
                                  tag:(IHFunctionTag)tag
                              success:(void (^)(id))success
                              failure:(void (^)(id))failure{
    
//    if (tag != IH_UserRegistered && tag != IH_UserReSetPassWord) {
//        NSDictionary *userDic=[IHUtility getUserDefalutDic:kUserDefalutLoginInfo];
//        //用户不是登录状态
//        if (userDic == nil) {
//            [IHUtility removeWaitingView];
//            return;
//        }
//    }
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager.requestSerializer setValue:@"" forHTTPHeaderField:@"If-None-Match"];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",@"application/x-www-form-urlencoded", nil];
    sessionManager.operationQueue.maxConcurrentOperationCount = 5;

    
    [sessionManager setTaskWillPerformHTTPRedirectionBlock:^NSURLRequest *(NSURLSession *session, NSURLSessionTask *task, NSURLResponse *response, NSURLRequest *request) {
        if (response) {
            return nil;
        }
        return request;
    }];
    
    NSString *service = [NSString stringWithFormat:@"%@%@", serverURL,method];
    [IHUtility addWaitingView];
    [sessionManager DELETE:service parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            [IHUtility removeWaitingView];
            NSError *err=nil;
            NSDictionary *ret = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                options:kNilOptions
                                                                  error:&err];
            

            ret = [self deleteAllNullValue:ret];
            NSLog(@"res= %@", ret);

            NSArray *keyArr = [ret allKeys];
            if ([keyArr containsObject:@"code"]) {
                NSInteger errorNo=[[ret objectForKey:@"code"]integerValue];
                if (errorNo!=001) {
                    failure(ret);
                    NSString *message =[ret objectForKey:@"msg"];
                    
                    if (tag != IH_DeletePop) {
                        if (message.length >0) {
                            [IHUtility addSucessView:[ret objectForKey:@"msg"] type:1];
                        }
                    }
                    
                    return ;
                }
            }
            NSDictionary *dic2=[self parseResult:ret tag:tag];
            success(dic2);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [IHUtility removeWaitingView];
        /*
        NSDictionary *userInfo=error.userInfo;
        if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"503"].location != NSNotFound) {
//            [IHUtility addSucessView:@"服务器正忙！请稍后重试" type:2];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"400"].location != NSNotFound){
            
            NSData *data =[userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
            NSString *errorStr = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
            if (errorStr.length >0) {
                
//                [IHUtility addSucessView:errorStr type:2];
            }else{
//                [IHUtility addSucessView:[userInfo objectForKey:@"NSLocalizedDescription"] type:2];
            }
            
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"401"].location != NSNotFound){
            //接口认证失败，
            [self userLoginOut];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"429"].location != NSNotFound){
//            [IHUtility addSucessView:@"操作过快！让它飞一会" type:2];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"302"].location != NSNotFound){
            NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
            NSDictionary *allHeaders = response.allHeaderFields;
            if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"302"].location != NSNotFound){
                //重定向redirect_content
                NSString *redirect_content = @"";
                if ([[allHeaders allKeys] containsObject:@"Location"]) {
                    redirect_content = [NSString stringWithFormat:@"%@",allHeaders[@"Location"]];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationHttpRedirect" object:redirect_content];
            }
        }else{
//            [IHUtility addSucessView:[userInfo objectForKey:@"NSLocalizedDescription"] type:2];
        }
        */
        NSDictionary *dic = [NSObjectTool errorInfoData:error];
        
        failure(dic);
    }];
    
}
//根据tag 来封装数据 GET请求
-(void)httpGETRequestTagWithParameter:(NSDictionary *)dic
                            method:(NSString *)method
                               tag:(IHFunctionTag)tag
                           success:(void (^)(id))success
                           failure:(void (^)(id))failure{
    
//    if (tag != IH_UserRegistered && tag != IH_UserReSetPassWord) {
//        NSDictionary *userDic=[IHUtility getUserDefalutDic:kUserDefalutLoginInfo];
//        //用户不是登录状态
//        if (userDic == nil) {
//            [IHUtility removeWaitingView];
//            return;
//        }
//    }
    
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager.requestSerializer setValue:@"" forHTTPHeaderField:@"If-None-Match"];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",@"application/x-www-form-urlencoded", nil];
    sessionManager.operationQueue.maxConcurrentOperationCount = 5;

    [sessionManager setTaskWillPerformHTTPRedirectionBlock:^NSURLRequest *(NSURLSession *session, NSURLSessionTask *task, NSURLResponse *response, NSURLRequest *request) {
        if (response) {
            return nil;
        }
        return request;
    }];
    
    NSString *service = [NSString stringWithFormat:@"%@%@", serverURL,method];
   
       NSString* parameter;
        if (dic.allKeys.count>0) {
            parameter  = [IHUtility getParameterString:dic];
        }

        NSLog(@"total url:  %@?%@", service, parameter);
      [IHUtility addWaitingView];
    [sessionManager GET:service parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            [IHUtility removeWaitingView];
            
            NSError *err=nil;
            NSDictionary *ret = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                options:kNilOptions
                                                                  error:&err] ;
            ret = [self deleteAllNullValue:ret];
            NSLog(@"res= %@", ret ) ;
          
            NSArray *keyArr = [ret allKeys];
            if ([keyArr containsObject:@"code"]) {
                NSInteger errorNo=[[ret objectForKey:@"code"]integerValue];
                if (errorNo!=001) {
                    failure(ret);
                    NSString *message =[ret objectForKey:@"msg"];
                    if (tag != IH_GetPop) {
                    if (message.length >0) {
                        [IHUtility addSucessView:[ret objectForKey:@"msg"] type:1];
                      }
                    }
                    return ;
                }
            }
            NSDictionary *dic2=[self parseResult:ret tag:tag] ;
            success(dic2) ;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [IHUtility removeWaitingView];
        /*
        NSDictionary *userInfo=error.userInfo ;
        
        if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"503"].location != NSNotFound) {
//            [IHUtility addSucessView:@"服务器正忙！请稍后重试" type:2];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"400"].location != NSNotFound){
            NSData *data =[userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
            NSString *errorStr = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
//            if (errorStr.length >0) {
//                if (tag != IH_PanicBuyingActivityState && tag != IH_MySendOrderList && tag != IH_MyReceiveOrderList){
//
//                    [IHUtility addSucessView:errorStr type:2];
//                }
//
//            }else{
//                [IHUtility addSucessView:[userInfo objectForKey:@"NSLocalizedDescription"] type:2];
//            }
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"401"].location != NSNotFound){
            //接口认证失败，
            [self userLoginOut];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"429"].location != NSNotFound){
//            [IHUtility addSucessView:@"操作过快！让它飞一会" type:2];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"302"].location != NSNotFound){
            NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
            NSDictionary *allHeaders = response.allHeaderFields;
            if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"302"].location != NSNotFound){
                //重定向redirect_content
                NSString *redirect_content = @"";
                if ([[allHeaders allKeys] containsObject:@"Location"]) {
                    redirect_content = [NSString stringWithFormat:@"%@",allHeaders[@"Location"]];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationHttpRedirect" object:redirect_content];
            }
        }else{
//            [IHUtility addSucessView:[userInfo objectForKey:@"NSLocalizedDescription"] type:2];
        }
        */
        NSDictionary *dic = [NSObjectTool errorInfoData:error];

        failure(error);
    }];

}


//提交图片
-(void)httpUploadImageWithParameter:(NSDictionary *)dic
                            method:(NSString *)method
                           success:(void (^)(id))success
                           failure:(void (^)(id))failure{
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.operationQueue.maxConcurrentOperationCount = 5;
    
    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSString *service = [NSString stringWithFormat:@"http://resource.shuiguoshule.com.cn/v1/%@",method];
    NSString* parameter;
    if (dic.allKeys.count>0) {
        parameter  = [IHUtility getParameterString:dic];
    }
    
    [sessionManager POST:service parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData =  dic[@"file"];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat =@"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
        
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:fileName
                                mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            
            NSError *err=nil;
            NSDictionary *ret = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                options:kNilOptions
                                                                  error:&err];
            ret = [self deleteAllNullValue:ret];
            NSLog(@"res= %@", ret);
            NSInteger errorNo=[[ret objectForKey:@"code"]integerValue];
          
                if (errorNo!=001) {
                    failure(ret);
                    NSString *message =[ret objectForKey:@"msg"];
                    
                    if (message.length >0) {
                        [IHUtility addSucessView:[ret objectForKey:@"msg"] type:1];
                    }
                    
                    return ;
                }
            
            success(ret);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error) ;
        NSDictionary *userInfo=error.userInfo ;
        /*
        if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"503"].location != NSNotFound) {
//            [IHUtility addSucessView:@"服务器正忙！请稍后重试" type:2];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"400"].location != NSNotFound){
            NSData *data =[userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
            NSString *errorStr = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
            if (errorStr.length >0) {
                
//                [IHUtility addSucessView:errorStr type:2];
            }else{
//                [IHUtility addSucessView:[userInfo objectForKey:@"NSLocalizedDescription"] type:2];
            }
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"401"].location != NSNotFound){
            //接口认证失败，
            [self userLoginOut];
        }else if ([[NSString stringWithFormat:@"%@",[userInfo objectForKey:@"NSLocalizedDescription"]] rangeOfString:@"429"].location != NSNotFound){
//            [IHUtility addSucessView:@"操作过快！让它飞一会" type:2];
        }else{
//            [IHUtility addSucessView:[userInfo objectForKey:@"NSLocalizedDescription"] type:2];
        }
         */

        NSDictionary *dic = [NSObjectTool errorInfoData:error];
        failure(dic);
        
    }];
        
}

- (NSDictionary *)deleteAllNullValue:(NSDictionary *)dic{
    
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyStr in dic.allKeys) {
        
        if ([[dic objectForKey:keyStr] isKindOfClass:[NSNull class]]) {
//            [mutableDic setObject:@"" forKey:keyStr];
        }else{
            [mutableDic setObject:[dic objectForKey:keyStr] forKey:keyStr];
        }
    }
    return mutableDic;
}
//提示用户重新登录
- (void)userLoginOut
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    BombBoxView *alertView = [[BombBoxView alloc] initWithFrame:CGRectMake(0, 0, WindowWith, kScreenHeight) context:@"" title:@"账号已过期，请重新登录" buttonArr:@[@"确认"]];
//    alertView.selectBlock = ^(NSInteger index){
//        //退出登录
//        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationOutLogin object:nil];
//    };
//    [window addSubview:alertView];
//    alertView.alpha = 0;
//    [UIView animateWithDuration:.3 animations:^{
//        alertView.alpha = 1;
//    }];
}

#pragma mark 构建模型
-(NSDictionary *)parseResult:(NSDictionary*)dic tag:(IHFunctionTag)tag{
    //    if (tag == IH_AddressList) {
    //        return [self UserAddressListWith:dic];
    //
    //    }
    return dic;
}
@end
