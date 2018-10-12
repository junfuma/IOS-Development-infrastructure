//
//  MTNetworkData.h
//  MiaoTuProject
//
//  Created by Mac on 16/4/1.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MiaoTuNetworkConst.h"
#import "NSDictionary+PropertyCode.h"

#define network	 	[MTNetworkData shareInstance]

@interface MTNetworkData : NSObject
@property(nonatomic,assign) int tag;
@property(nonatomic,assign) int ntpage;
-(NSDictionary *)parseResult:(NSDictionary*)dic tag:(IHFunctionTag)tag;

//根据tag 来封装数据
-(void)httpPostRequestTagWithParameter:(NSDictionary *)dic
                            method:(NSString *)method
                               tag:(IHFunctionTag)tag
                           success:(void (^)(id))success
                           failure:(void (^)(id))failure;

//根据tag 来封装数据 GET请求
-(void)httpGETRequestTagWithParameter:(NSDictionary *)dic
                               method:(NSString *)method
                                  tag:(IHFunctionTag)tag
                              success:(void (^)(id))success
                              failure:(void (^)(id))failure;

//根据tag 来封装数据 PUT请求
-(void)httpPUTRequestTagWithParameter:(NSDictionary *)dic
                            method:(NSString *)method
                               tag:(IHFunctionTag)tag
                           success:(void (^)(id))success
                              failure:(void (^)(id))failure;
//  DELETE 根据tag 来封装数据
-(void)httpDELETERequestTagWithParameter:(NSDictionary *)dic
                                  method:(NSString *)method
                                     tag:(IHFunctionTag)tag
                                 success:(void (^)(id))success
                                 failure:(void (^)(id))failure;

//提交图片
-(void)httpUploadImageWithParameter:(NSDictionary *)dic
                             method:(NSString *)method
                            success:(void (^)(id))success
                            failure:(void (^)(id))failure;

+(MTNetworkData *)shareInstance;

- (void)POST:(NSString *)URLString parameters:(id)parameters progress:(void(^)(id downloadProgress))progress success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
@end
