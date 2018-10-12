//
//  NSString+XQDate.m
//  马军福
//
//  Created by mac on 2016/11/4.
//  Copyright © 2016年 e-voucher马军福. All rights reserved.
//

#import "NSString+date.h"

@implementation NSString (date)

+ (NSString *)getDate
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formate = [[NSDateFormatter alloc]init];
    formate.dateFormat =@"yyyy年MM月dd日 HH点mm分ss秒 Z";
    NSString *s = [formate stringFromDate:now];
    NSString *time =[s substringWithRange:NSMakeRange(12, 2)];
    return time;
}
+ (NSString *)getCurrentDate
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formate = [[NSDateFormatter alloc]init];
    formate.dateFormat =@"yyyy.MM.dd HH点mm分ss秒 Z";
    NSString *s = [formate stringFromDate:now];
    return s;
}
/**
 * @brief 判断当前时间是否在fromHour和toHour之间。如，fromHour=8，toHour=23时，即为判断当前时间是否在8:00-23:00之间
 */
- (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour
{
    NSDate *dateFrom = [self getCustomDateWithHour:fromHour];
    NSDate *dateEnd= [self getCustomDateWithHour:toHour];
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formate = [[NSDateFormatter alloc]init];
    formate.dateFormat =@"yyyy年MM月dd日 HH点mm分ss秒 Z";
    
    //目标时区
    NSTimeZone* destinationTimeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formate setTimeZone:destinationTimeZone];
    
    NSString *s = [formate stringFromDate:currentDate];
    NSDate *date = [formate dateFromString:s];
    
    
    if ([date compare:dateFrom]==NSOrderedDescending && [date compare:dateEnd]==NSOrderedAscending)
    {
        return YES;
    }
    return NO;
}

/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate date]比较）
 * @param hour 如hour为“8”，就是上午8:00（本地时间）
 */
- (NSDate *)getCustomDateWithHour:(NSInteger)hour
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}

+ (NSString*)switchData:(NSString*)timeStr {
    
    NSInteger num = [timeStr integerValue]/1000;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:num];
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr ;
}
//计算两个时间戳的时间差

+ (NSString*)compareTwoTime:(long)time1 time2:(long)time2

{
    NSTimeInterval balance = time2 /1000- time1 /1000;
    
    NSString*timeString = [[NSString alloc]init];
    
    timeString = [NSString stringWithFormat:@"%f",balance /60];
    
    timeString = [timeString substringToIndex:timeString.length-7];
    
    NSInteger timeInt = [timeString intValue];
    
    NSInteger hour = timeInt /60;
    
    NSInteger mint = timeInt %60;
    
    if(hour ==0) {
        
        timeString = [NSString stringWithFormat:@"*%ld分钟",(long)mint];
    }
    
    else
        
    {
        
        if(mint ==0) {
            
            timeString = [NSString stringWithFormat:@"%ld小时",(long)hour];
            
        }
        
        else
            
        {
            
            timeString = [NSString stringWithFormat:@"%ld小时%ld分钟",(long)hour,(long)mint];
            
        }
        
    }
    
    return timeString;
    
}

// 获取当月的天数
+ (NSInteger)getNumberOfDaysInMonth
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法 NSGregorianCalendar - ios 8
    NSDate * currentDate = [NSDate date];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay  //NSDayCalendarUnit - ios 8
                                   inUnit: NSCalendarUnitMonth //NSMonthCalendarUnit - ios 8
                                  forDate:currentDate];
    return range.length;
}


+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    if ([date compare:beginDate] ==NSOrderedAscending)
        return NO;
    
    if ([date compare:endDate] ==NSOrderedDescending)
        return NO ;
    
    return YES ;
}
+ (NSDate*)swithDateDate:(NSString*)time
{
    NSInteger num = [time integerValue]/1000;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:num] ;
    return confromTimesp;
}
+ (NSString*)DetermineTheCurrentTimePeriod{
    NSString *timeZone ;
    NSDate *now = [NSDate date] ;
    NSDateFormatter *formate = [[NSDateFormatter alloc]init];
    formate.dateFormat =@"yyyy年MM月dd日 HH点mm分ss秒 Z";
    NSString *s = [formate stringFromDate:now];
    NSInteger hour =[[s substringWithRange:NSMakeRange(12, 2)] integerValue];
    NSInteger minutes =[[s substringWithRange:NSMakeRange(15, 2)] integerValue];
    if (hour <12) {
        if (hour ==11 && minutes>30) {
            timeZone = @"12:00-18:00";
        }else{
            timeZone = @"9:00-12:00";
        }
    } else if(hour<18){
        if (hour ==17 && minutes>30) {
            timeZone = @"18:00-20:00";
        }else{
            timeZone = @"12:00-18:00";
        }
    }else  if(hour<20)
    {
        if (hour ==19 && minutes>30) {
            timeZone = @"9:00-12:00";
        }else{
            timeZone = @"18:00-20:00";
        }
    }else{
        timeZone = @"9:00-12:00";
    }
    return timeZone ;
}
@end
