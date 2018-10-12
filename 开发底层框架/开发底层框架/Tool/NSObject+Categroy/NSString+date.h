//
//  NSString+XQDate.h
//  马军福
//
//  Created by mac on 2016/11/4.
//  Copyright © 2016年 e-voucher马军福. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (date)

+ (NSString*)getDate;
+ (NSString *)getCurrentDate;
- (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour;
+ (NSString*)switchData:(NSString*)timeStr ;

//计算两个时间戳的时间差

+ (NSString*)compareTwoTime:(long)time1 time2:(long)time2;

+ (NSInteger)getNumberOfDaysInMonth;

+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;
+ (NSDate*)swithDateDate:(NSString*)time;
//订单截面判断默认时间段
+ (NSString*)DetermineTheCurrentTimePeriod;
@end
