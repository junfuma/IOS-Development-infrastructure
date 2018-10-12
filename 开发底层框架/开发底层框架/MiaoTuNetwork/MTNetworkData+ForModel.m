//
//  MTNetworkData+ForModel.m
//  MiaoTuProject
//
//  Created by Mac on 16/4/1.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTNetworkData+ForModel.h"
@implementation MTNetworkData (ForModel)
-(NSArray *)getJsonForString:(NSString *)str{
    NSData *data =[str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil];
    
    return arr;
}
-(NSDictionary *)getJsonDicForString:(NSString *)str{
    NSData *data =[str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *arr = [NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingMutableContainers
                                                          error:nil];
    
    return arr;
}


//- (NSDictionary *)UserAddressListWith:(NSDictionary *)dic
//{
//    
//    NSArray* array = [dic objectForKey:@"listResult"];
//    NSMutableArray* mArray = [[NSMutableArray alloc] initWithCapacity:[array count]];
//    for (NSDictionary* itemDic in array){
//        UserAddressListModel *model=[[UserAddressListModel alloc]initWithDictionary:itemDic error:nil];
//        [mArray addObject:model];
//    }
//    NSMutableDictionary* dic2 = [NSMutableDictionary dictionaryWithDictionary:dic];
//    [dic2 setObject:mArray forKey:@"listResult"];
//
//    return dic2;
//}


@end
