//
//  MTNetworkData+ForModel.h
//  MiaoTuProject
//
//  Created by Mac on 16/4/1.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTNetworkData.h"
@interface MTNetworkData (ForModel)


-(NSDictionary *)getJsonDicForString:(NSString *)str;
-(NSArray *)getJsonForString:(NSString *)str;



//- (NSDictionary *)UserAddressListWith:(NSDictionary *)dic;//获取用户地址列表


@end
