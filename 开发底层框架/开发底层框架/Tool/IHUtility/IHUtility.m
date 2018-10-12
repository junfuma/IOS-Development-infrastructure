//
//  IHUtility.m
//  libTest
//
//  Created by yaoyongping on 12-4-23.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "IHUtility.h"
 
#import <AddressBookUI/AddressBookUI.h>
@implementation IHUtility


+(NSString *)base64WithString:(NSString *)str{
    
    NSData *basicAuthCredentials = [[NSString stringWithFormat:@"%@", str] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64AuthCredentials = [basicAuthCredentials base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)0];
    
    return base64AuthCredentials;
}


+(NSDictionary *)ReadFileWithPath:(NSString *)fileName 
{
    NSFileManager *fm=[NSFileManager defaultManager];
    NSError *error;
	NSString *url=[@"~" stringByExpandingTildeInPath];
	url=[url stringByAppendingPathComponent:AppCacheFolder];
    if (![fm fileExistsAtPath:url]) {
        [fm createDirectoryAtPath:url withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSString* path = [NSString stringWithFormat:@"%@/%@", url, fileName];
    NSDictionary* dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    return [dic autorelease];
}

+(BOOL)IsExistFileWithName:(NSString *)imagename{
    NSFileManager *fm=[NSFileManager defaultManager];
	NSString *url=[self getCachePath];
	url=[url stringByAppendingPathComponent:AppCacheFolder];
	url=[url stringByAppendingPathComponent:imagename];
    //NSError *error;
    if ([fm fileExistsAtPath:url]) {
        return YES;
    }else {
        return NO;
    }
}

+(BOOL)CachImageWithName:(NSString *)imagename img:(UIImage *)img;{
    NSFileManager *fm=[NSFileManager defaultManager];
    NSError *error;
	NSString *url=[self getCachePath];
	url=[url stringByAppendingPathComponent:AppCacheFolder];
    if (![fm fileExistsAtPath:url]) {
        [fm createDirectoryAtPath:url withIntermediateDirectories:YES attributes:nil error:&error];
    }
	url=[url stringByAppendingPathComponent:imagename];
    
    return [UIImagePNGRepresentation(img) writeToFile:url atomically:YES];
}

+(NSString *)imageNameFromUrl:(NSString *)url{
    NSString *imageName=[url lastPathComponent];
    return imageName;
}

+(UIImage *)getCacheImageWithImageName:(NSString *)imagename{
	NSString *url=[self getCachePath];
	url=[url stringByAppendingPathComponent:AppCacheFolder];
	url=[url stringByAppendingPathComponent:imagename];
	UIImage *img= [[UIImage alloc] initWithContentsOfFile:url];
	
	return [img autorelease];
}

+(NSString *)getCachePath{
    NSString *url=[@"~" stringByExpandingTildeInPath];
    url=[url stringByAppendingPathComponent:@"Library"];
    url=[url stringByAppendingPathComponent:@"Caches"];
    NSLog(@"Cache image url=%@",url);
    return url;
}


+(void)clearCachData{
	NSString *url=[@"~" stringByExpandingTildeInPath];
    url=[url stringByAppendingPathComponent:@"Library"];
    url=[url stringByAppendingPathComponent:@"Caches"];
	url=[url stringByAppendingPathComponent:AppCacheFolder];
    NSError *error;
    NSFileManager *fm=[NSFileManager defaultManager];
    [fm removeItemAtPath:url error:&error];
	
    [fm createDirectoryAtPath:url withIntermediateDirectories:YES attributes:nil error:&error];
    
}


+(UIColor *)colorWithRGBString:(NSString *)color alph:(CGFloat)alph
{
       
    NSArray *result=[color componentsSeparatedByString:@","];
    
    
    return RGBA([result[0] doubleValue], [result[1] doubleValue], [result[2] doubleValue],alph);
}



+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


+(BOOL)CachFileWithPath:(NSString *)fileName dicData:(NSDictionary *)dic
{
    NSFileManager *fm=[NSFileManager defaultManager];
    NSError *error;
	NSString *url=[@"~" stringByExpandingTildeInPath];
	url=[url stringByAppendingPathComponent:AppCacheFolder];
    if (![fm fileExistsAtPath:url]) {
        [fm createDirectoryAtPath:url withIntermediateDirectories:YES attributes:nil error:&error];
    }
    NSString* path = [NSString stringWithFormat:@"%@/%@", url, fileName];
    return [dic writeToFile:path atomically:YES];
    
}


+(int )daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate
{
    NSCalendar *cal =[NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *d = [cal components:unitFlags fromDate:startDate toDate:endDate options:0];
    int hour = (int)[d hour];
   
    return hour;
}

+(NSString *)CalLastTime:(NSString *)inputDate curDate:(NSString *)curDate{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *toDate=[dateFormat dateFromString:inputDate];
    NSDate *currentDate=[dateFormat dateFromString:curDate];
	[dateFormat release];
	
	NSCalendar *cal =[NSCalendar currentCalendar]; 
	unsigned int unitFlags = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *d = [cal components:unitFlags fromDate:currentDate toDate:toDate options:0];
	NSString *result;
	if ([d day]<0 || [d hour]<0 || [d minute]<0 || [d second]<0) {
		result=@"已过期";
	}else {
		result=[NSString stringWithFormat:@"%ld天",(long)[d day]];
	}
	return result;
}

+(BOOL) isShowMsgTime:(NSString *)beginTime{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    //要注意格式一定要统一
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *beginD=[dateFormatter dateFromString:beginTime];
  
    NSDate *endD=[NSDate date];
    
    NSTimeInterval value=[endD timeIntervalSinceDate:beginD];
    //如果时间大于72小时，5*60秒，则显示时间
    if (value > 72*60*60) {
        return YES;
    }
    return NO;
}
//判断时间是否过期
+(BOOL)overtime:(NSString *)nowDate inputDate:(NSString *)inputDate{

    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *currentDate=[dateFormat dateFromString:nowDate];
    NSDate *toDate=[dateFormat dateFromString:inputDate];
    [dateFormat release];
    
    NSCalendar *cal =[NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *d = [cal components:unitFlags fromDate:currentDate toDate:toDate options:0];
    
    if ([d day]<0 || [d hour]<0 || [d minute]<0 || [d second]<0) {
        return YES;
    }
    return NO;
}
//判断日期大小
+ (BOOL)compareDate:(NSString*)aDate withDate:(NSString*)bDate
{
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM"];
    NSDate *dta = [[NSDate alloc] init];
    NSDate *dtb = [[NSDate alloc] init];
    
    dta = [dateformater dateFromString:aDate];
    dtb = [dateformater dateFromString:bDate];
    NSComparisonResult result = [dta compare:dtb];
    if (result==NSOrderedAscending)
    {

        return YES;
    }else
    {
        return NO;
    }
    

}


+(NSString *)GetTwitterTime:(NSString *)inputDate
{
	NSDate *currentDate=[NSDate date]; 
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *fromDate=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	NSCalendar *cal=[NSCalendar currentCalendar];
	unsigned int unitFlags=NSCalendarUnitHour | NSCalendarUnitMinute;
	NSDateComponents *d=[cal components:unitFlags fromDate:fromDate toDate:currentDate options:0];
	NSString *result = nil;
	int minute=(int)[d minute];
	int day=(int)[d day];
    int hour=(int)[d hour];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"MM-dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:fromDate];
    //输出格式为：2010-10-27 10:22:13
    NSLog(@"%@",currentDateStr);
    NSString * nowStr = currentDateStr;
	if (day>30)
    {
		return nowStr;
	}
    else
    {
        if (day<1)
        {
             result=[NSString stringWithFormat:@"%d小时前",hour];
        }
		else
        {
			 result=[NSString stringWithFormat:@"%d天前",minute];
		}
		return result;
	}
}

+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2 
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    return [comp1 day]==[comp2 day] &&
    [comp1 month]==[comp2 month] &&
    [comp1 year]==[comp2 year];
}

+(NSString *)FormatDateByString:(NSString *)inputDate{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	
	NSCalendar *cal=[NSCalendar currentCalendar];
	NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
	NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *d=[cal components:unitFlags fromDate:date];
	return [NSString stringWithFormat:@"%ld年%ld月%ld日",(long)[d year],(long)[d month],(long)[d day]];
}

+(NSString *)FormatDateTimeByString:(NSString *)inputDate{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	
	NSCalendar *cal=[NSCalendar currentCalendar];
	NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
	NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *d=[cal components:unitFlags fromDate:date];
    NSString *hour;
    NSString *minute;
    if ([d hour]<10) {
        hour=[NSString stringWithFormat:@"0%ld",(long)[d hour]];
    }else{
        hour=[NSString stringWithFormat:@"%ld",(long)[d hour]];
    }
    
    if ([d minute]<10) {
        minute=[NSString stringWithFormat:@"0%ld",(long)[d minute]];
    }else{
        minute=[NSString stringWithFormat:@"%ld",(long)[d minute]];
    }
    
	return [NSString stringWithFormat:@"%ld月%ld日 %@:%@",(long)[d month],(long)[d day],hour,minute];
}

+(NSString *)getFormatDateByString:(NSString *)inputDate{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	
	NSCalendar *cal=[NSCalendar currentCalendar];
	NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
	NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *d=[cal components:unitFlags fromDate:date];
    NSString *hour;
    NSString *minute;
    if ([d hour]<10) {
        hour=[NSString stringWithFormat:@"0%ld",[d hour]];
    }else{
        hour=[NSString stringWithFormat:@"%ld",[d hour]];
    }
    
    if ([d minute]<10) {
        minute=[NSString stringWithFormat:@"0%ld",[d minute]];
    }else{
        minute=[NSString stringWithFormat:@"%ld",[d minute]];
    }
    
	return [NSString stringWithFormat:@"%ld年%ld月%ld日 %@:%@",[d year],[d month],[d day],hour,minute];
}

+(NSString *)getFormatDateTimeByString:(NSString *)inputDate{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[dateFormat dateFromString:inputDate];
    [dateFormat release];
    
    NSCalendar *cal=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *d=[cal components:unitFlags fromDate:date];
    NSString *hour;
    NSString *minute;
    NSString *second;
    if ([d hour]<10) {
        hour=[NSString stringWithFormat:@"0%ld",[d hour]];
    }else{
        hour=[NSString stringWithFormat:@"%ld",[d hour]];
    }
    
    if ([d minute]<10) {
        minute=[NSString stringWithFormat:@"0%ld",[d minute]];
    }else{
        minute=[NSString stringWithFormat:@"%ld",[d minute]];
    }
    
    if ([d second]<10) {
        second=[NSString stringWithFormat:@"0%ld",[d second]];
    }else{
        second=[NSString stringWithFormat:@"%ld",[d second]];
    }
    
    return [NSString stringWithFormat:@"%ld年%ld月%ld日 %@:%@:%@",[d year],[d month],[d day],hour,minute,second];
}



+(NSString *)FormatMonthAndDayByString:(NSString *)inputDate
{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	
	NSCalendar *cal=[NSCalendar currentCalendar];
	NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
	NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *d=[cal components:unitFlags fromDate:date];
	return [NSString stringWithFormat:@"%ld月%ld日",[d month],[d day]];
}

+(NSString *)FormatMonthAndDayByString2:(NSString *)inputDate
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[dateFormat dateFromString:inputDate];
    [dateFormat release];
    
    NSCalendar *cal=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *d=[cal components:unitFlags fromDate:date];
    return [NSString stringWithFormat:@"%ld-%ld",[d month],[d day]];
}
+(BOOL)isWhetherDayOrNightWithNow
{
    NSDate *date = [NSDate date];
    NSCalendar *cal=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *d=[cal components:unitFlags fromDate:date];
    if ([d hour]>=6 && [d hour]<18) {
        return YES;
    }
    return NO;
}
+(NSString *)FormatMonthAndDayByString3:(NSString *)inputDate
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[dateFormat dateFromString:inputDate];
    [dateFormat release];
    
    NSCalendar *cal=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *d=[cal components:unitFlags fromDate:date];
    return [NSString stringWithFormat:@"%ld/%ld",[d month],[d day]];
}
+(NSString *)FormatDateByString2:(NSString *)inputDate{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	
	NSCalendar *cal=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *d=[cal components:unitFlags fromDate:date];
	return [NSString stringWithFormat:@"%ld-%ld-%ld",[d year],[d month],[d day]];
}

+(NSString *)FormatDateByString3:(NSString *)inputDate{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yy-MM-dd HH:mm:ss"];
	NSDate *date=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	
	NSCalendar *cal=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *d=[cal components:unitFlags fromDate:date];
    NSString *s=[NSString stringWithFormat:@"%ld",[d year]];
    NSString *b = [s substringFromIndex:2];
    
	return [NSString stringWithFormat:@"%@-%ld-%ld",b,[d month],[d day]];
}

+(NSString *)FormatDateByString4:(NSString *)inputDate{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	NSCalendar *cal=[NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *d=[cal components:unitFlags fromDate:date];
    NSString *hour;
    if ([d hour] == 0) {
        hour = @"00";
    }else {
        hour =[NSString stringWithFormat:@"%ld",[d hour]];
    }
    NSString *minute;
    if ([d minute] == 0) {
        minute = @"00";
    }else {
        minute =[NSString stringWithFormat:@"%ld",[d minute]];
    }
	return [NSString stringWithFormat:@"%ld-%ld-%ld %@:%@",[d year],[d month],[d day],hour,minute];
}



+(NSString *)FormatDigitDateToStringDate:(NSString *)inputDate
{
    NSRange range = [inputDate rangeOfString:@"/"];
    NSRange dateRange = NSMakeRange(0, range.location);
    NSUInteger loc = range.location+range.length;
    NSUInteger len = [inputDate length] - loc;
    NSRange monRange = NSMakeRange(loc,len);
    NSString* str = [NSString stringWithFormat:@"%@月%@日", [inputDate substringWithRange:monRange], [inputDate substringWithRange:dateRange]];
    return  str;
    
}


+(NSDate *)ConvertToDateFromString:(NSString *)inputDate{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	return date;
}
+(NSString *)getTimeStringFromString:(NSString *)str
{
    NSString *year = [str substringWithRange:NSMakeRange(0, 4)];
    NSString *month = [str substringWithRange:NSMakeRange(4, 2)];
    NSString *day = [str substringWithRange:NSMakeRange(6, 2)];
    
    return [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
}

+(NSDate *)ConvertToDateFromString:(NSString *)inputDate withformat:(NSString *)format{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:format];
	NSDate *date=[dateFormat dateFromString:inputDate];
	[dateFormat release];
	return date;
}

+(NSString *)ConvertToStringFromNSDate:(NSDate *)inpuDate{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSString *result=[dateFormat stringFromDate:inpuDate];
	[dateFormat release];
	return result;
}

+(NSString *)ConvertToStringFromNSDate:(NSDate *)inpuDate withDataFormate:(NSString *)Formate
{
	NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:Formate];
	NSString *result=[dateFormat stringFromDate:inpuDate];
	[dateFormat release];
	return result;
}


+(NSString *)GetDayFromData:(NSDate *)date
{
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];  
	
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	
    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];
	NSString *m_day = [NSString stringWithFormat:@"%ld",[comps day]];
	
	[calendar release];
	
	return m_day;
}

//读取week
+(NSString *)GetWeekFromData:(NSDate *)date
{
	
	NSDateFormatter *formatter =[[[NSDateFormatter alloc] init] autorelease];
	[formatter setTimeStyle:NSDateFormatterMediumStyle];
	NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	NSDateComponents *comps = [[[NSDateComponents alloc] init] autorelease];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	//int week=0;
	comps = [calendar components:unitFlags fromDate:date];
	int week = (int)[comps weekday];
	NSString *m_week = [IHUtility getWeekStringFromInteger:week];
	return m_week;
}
//通过数字返回星期几
+(NSString *)getWeekStringFromInteger:(int)week
{
    NSString *str_week = @"";
    
    switch (week) {
        case 1:
            str_week = @"周日";
            break;
        case 2:
            str_week = @"周一";
            break;
        case 3:
            str_week = @"周二";
            break;
        case 4:
            str_week = @"周三";
            break;
        case 5:
            str_week = @"周四";
            break;
        case 6:
            str_week = @"周五";
            break;
        case 7:
            str_week = @"周六";
            break;
    }
    return str_week;
}

+(BOOL)CompareDate:(NSDate *)Date_1 withDate:(NSDate *)Date_2
{
	NSDateFormatter *formatter =[[[NSDateFormatter alloc] init] autorelease];
	[formatter setTimeStyle:NSDateFormatterMediumStyle];
	NSCalendar *calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	NSDateComponents *comps = [[[NSDateComponents alloc] init] autorelease];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;;
	//int week=0;
	comps = [calendar components:unitFlags fromDate:Date_1];
	
	int m_year_1 = (int)[comps year];
	//int m_month_1 = [comps month];
	int m_day_1 = (int)[comps day];
	
	comps = [calendar components:unitFlags fromDate:Date_2];
	
	int m_year_2 = (int)[comps year];
	//int m_month_2 = [comps month];
	int m_day_2 = (int)[comps day];
	
	if (m_year_1==m_year_2&&m_day_1==m_day_2)
	{
		return YES;
	}
	else 
	{
		return NO;
	}
}


/*手机号码验证 正则表达式*/
+(BOOL) isValidateMobile:(NSString *)mobile
{
    //基本覆盖全部号码段
    NSString *phoneRegex =@"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";;
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}










+(BOOL)IsFloat:(NSString *)string{
	NSScanner *scan=[NSScanner scannerWithString:string];
	float val;
	return [scan scanFloat:&val] && [scan isAtEnd];
}

+(NSString *)Trim:(NSString *)string{
	return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+(BOOL)IsValidateEmail:(NSString *)str
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    
    return [emailTest evaluateWithObject:str];
}

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


 

//解码
+(NSString *)getBase64Encoded:(NSString *)str{
    NSData *dataTake2 =
    [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // Convert to Base64 data
  
    NSData *nsdataDecoded = [dataTake2 initWithBase64EncodedData:dataTake2 options:0];
    NSString *str2 = [[[NSString alloc] initWithData:nsdataDecoded encoding:NSUTF8StringEncoding]autorelease];
    NSLog(@"%@", str);
    return str2 ;
}

+(void)saveUserDefaluts:(NSArray *)arr  key:(NSString *)key{
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    [userDefaluts setObject:arr forKey:key];
    [userDefaluts synchronize];
}

+(NSArray *)getUserdefalutsList:(NSString *)key{
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    NSArray *arr=[userDefaluts objectForKey:key];
    return arr;
}

+(void)saveDicUserDefaluts:(NSDictionary *)dic  key:(NSString *)key{
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    [userDefaluts setObject:dic forKey:key];
    [userDefaluts synchronize];
}

+(NSDictionary*)getUserDefalutDic:(NSString *)key{
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    NSDictionary *dic=[userDefaluts objectForKey:key];
    return dic;
}

+(void)setUserDefaultDic:(NSDictionary *)dic key:(NSString*)key{
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    [userDefaluts setObject:dic forKey:key];
    [userDefaluts synchronize];
    
}

+(NSDictionary *)getUserDefalutsDicKey:(NSString *)key{
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    NSDictionary *dic=[userDefaluts objectForKey:key];
    return dic;
}


+(void)setUserDefalutsKey:(NSString *)value key:(NSString *)key{
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    [userDefaluts setObject:value forKey:key];
    [userDefaluts synchronize];
}

+(NSString *)getUserDefalutsKey:(NSString *)key{
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    NSString *str=[userDefaluts objectForKey:key];
    return str;
}

+(void)removeUserDefalutsKey:(NSString *)key{
    NSUserDefaults *userDefaluts=[NSUserDefaults standardUserDefaults];
    [userDefaluts removeObjectForKey:key];
    [userDefaluts synchronize];
}

+(UIImage *)rotateAndScaleImage:(UIImage *)image maxResolution:(NSInteger)maxResolution {
    
    int kMaxResolution;
    if (maxResolution <= 0)
        kMaxResolution = 640;
    else
        kMaxResolution = (int)maxResolution;
    
    CGImageRef imgRef = image.CGImage;
    
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    if (width > kMaxResolution || height > kMaxResolution) {
        CGFloat ratio = width/height;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = roundf(bounds.size.width / ratio);
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = roundf(bounds.size.height * ratio);
        }
    }
    
    CGFloat scaleRatio = bounds.size.width / width;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}


+(float)ComputeDiscount:(float)originalPrice GroupOnPrice:(float)GroupOnPrice{
	float value=(originalPrice-GroupOnPrice)/originalPrice;
	return [[[NSString alloc] initWithFormat:@"%.1f",(1-value)*10] floatValue];
}

+(void)CallNumber:(NSString *)phoneNumber{
	NSURL *telUrl=[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]];
	[[UIApplication sharedApplication] openURL:telUrl];
	[phoneNumber release];
}

+(CATransition *)GetTransiton:(KCATransitionType)transactionType direction:(NSString *)direction{
	CATransition *transaction=[CATransition animation];
	transaction.duration=1.0f;
	transaction.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	switch (transactionType) {
		case KCATransitionTypeCube:
			transaction.type=@"cube";
			break;
		case KCATransitionTypeMoveIn:
			
			transaction.type=@"moveIn";
			break;
		case KCATransitionTypeReveal:
			transaction.type=@"reveal";
			break;
		case KCATransitionTypeFade:
			transaction.type=@"fade";
			break;
		case KCATransitionTypePageCurl:
			transaction.type=@"pageCurl";
			break;
		case KCATransitionTypePageUnCurl:
			transaction.type=@"pageUnCurl";
			break;
		case KCATransitionTypeSuckEffect:
			transaction.type=@"suckEffect";
			break;
		case KCATransitionTypeRippleEffect:
			transaction.type=@"rippleEffect";
			break;
		case KCATransitionTypeOglFlip:
			transaction.type=@"oglFlip";
			break;
		case KCATransitionTypeTwist:
			transaction.type=@"twist";
			break;
		default:
			break;
	}
	
	transaction.subtype=direction;
	return transaction;
}





+(CGSize)GetSizeByText:(NSString *)text sizeOfFont:(int)sizeOfFont width:(int)width{
	CGSize size;
	if (text==nil || [text length]==0) {
		size=CGSizeMake(320, 20);
		return size;
	}
	UIFont *font;
	if (sizeOfFont<=0) {
		font=sysFont(12);
	}else {
		font=sysFont(sizeOfFont);
	}
	
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        NSDictionary *attribute = @{NSFontAttributeName: sysFont(sizeOfFont)};
        size = [text boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:\
                        NSStringDrawingTruncatesLastVisibleLine |
                        NSStringDrawingUsesLineFragmentOrigin |
                        NSStringDrawingUsesFontLeading
                                            attributes:attribute context:nil].size;
    }else{
        size=[text sizeWithFont:font constrainedToSize:CGSizeMake(width,MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    
	
	return size;
}






+(CGSize)GetSizeByText:(NSString *)text boldOfFont:(int)sizeOfFont width:(int)width{
    CGSize size;
    if (text==nil || [text length]==0) {
        size=CGSizeMake(WindowWith, 20);
        return size;
    }
    UIFont *font;
    if (sizeOfFont<=0) {
        font=boldFont(12);
    }else {
        font=boldFont(sizeOfFont);
    }
    
    
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"        %@",text]];
    
    
    
    [attrString addAttribute:NSFontAttributeName value: boldFont(15) range:NSMakeRange(0,attrString.length)];
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6];//调整行间距
    [attrString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attrString length])];
    [attrString addAttribute:NSForegroundColorAttributeName value:RGB(44, 44, 46) range:NSMakeRange(0,attrString.length)];

    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        NSDictionary *attribute = @{NSFontAttributeName: boldFont(sizeOfFont)};
        size = [attrString boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:\
                NSStringDrawingTruncatesLastVisibleLine |
                NSStringDrawingUsesLineFragmentOrigin |
                NSStringDrawingUsesFontLeading
                               attributes:attribute context:nil].size;
    }else{
        size=[attrString sizeWithFont:font constrainedToSize:CGSizeMake(width,MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    
    
    return size;
}





+ (NSString *)getGUID 
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    NSMakeCollectable(theUUID);
    NSMutableString* str = [[[NSMutableString alloc] initWithString:(NSString *)string] autorelease];
    
    //NSLog(@"generateNonce = %@", str);    
    
    [str deleteCharactersInRange:NSMakeRange(13,1)];
    
    [str deleteCharactersInRange:NSMakeRange(8,1)];    
    
    //NSLog(@"generateNonce = %@", str);
    return str;
}

+ (NSString*)MD5Encode:(NSString*)input
{
	const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

+ (NSString *)getMd5_32Bit_String:(NSString *)srcString{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}




+ (NSString*)URLEncode:(NSString*)str
{
	return [(NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)[[str mutableCopy] autorelease], NULL, CFSTR("￼=,!$&'()*+;@?\n\"<>#\t :/~"),kCFStringEncodingUTF8) autorelease];
}

+ (NSString*)URLDecoded:(NSString*)str
{
    NSString *result = (NSString *)
    CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                            (CFStringRef)str,
                                                            CFSTR(""),
                                                            kCFStringEncodingUTF8);
    [result autorelease];
    return result;
}

+ (NSString*)HandleSpecialCharactor:(NSString*)str
{
    NSMutableString* str2 = [[NSMutableString alloc] initWithString:str];  
    
    [str2 replaceOccurrencesOfString:@"\\" withString:@"\\\\" options:NSLiteralSearch range:NSMakeRange(0, [str2 length])];
    
    [str2 replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSLiteralSearch range:NSMakeRange(0, [str2 length])];
    [str2 replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSLiteralSearch range:NSMakeRange(0, [str2 length])];
    [str2 replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSLiteralSearch range:NSMakeRange(0, [str2 length])];    
    
    return [str2 autorelease];
    
}

+ (NSString*)URLEncodeAndHandleSpecialCharactor:(NSString*)str
{
    NSString* str2 = [self HandleSpecialCharactor:str];
    return [self URLEncode:str2];
}

+(NSString *)GetMoneyStringFormat:(double)f withSymbol:(BOOL)symbol isFloat:(int)count{
	NSMutableString* str =[NSMutableString stringWithFormat:@"%.2f",f];
	
    NSRange dotRange = [str rangeOfString:@"."];
    int dotPos = dotRange.location;
    int startPos = dotPos%3;
    int pos = dotPos-3;
	if (dotRange.length==0) {
		pos=[str length];
	}
    int n = 0;
    while (pos>0) {
        if (startPos == 0) {
            startPos = 3;
        }
        [str insertString:@"," atIndex:n*3+startPos];
        n++;
        startPos++;
        pos = pos-3;        
    }
	
	//    int n = f;
	//    int pos = n/1000;
	//    if (pos >= 1) {
	//        int n = 0;
	//        while (pos) {
	//            n++;
	//            pos = pos/10;
	//        }
	//        [str insertString:@"," atIndex:n];
	//    }
    
    if (symbol) {
        [str insertString:@"¥" atIndex:0];
    }
	
	if (count==0) {
		dotRange = [str rangeOfString:@"."];
		dotPos = dotRange.location;
		NSString *result = [str substringToIndex:dotPos];
		return result;
	}
	
    return str;
}

+(NSString*)GetMoneyStringFormat:(double)f withSymbol:(BOOL)symbol
{
    NSMutableString* str = [[NSMutableString alloc] initWithFormat:@"%.2f", f];
    
    NSRange dotRange = [str rangeOfString:@"."];
    int dotPos = dotRange.location;
    int startPos = dotPos%3;
    int pos = dotPos-3;
    int n = 0;
    while (pos>0) {
        if (startPos == 0) {
            startPos = 3;
        }
        [str insertString:@"," atIndex:n*3+startPos];
        n++;
        startPos++;
        pos = pos-3;        
    }
	
	//    int n = f;
	//    int pos = n/1000;
	//    if (pos >= 1) {
	//        int n = 0;
	//        while (pos) {
	//            n++;
	//            pos = pos/10;
	//        }
	//        [str insertString:@"," atIndex:n];
	//    }
    
    if (symbol) {
        [str insertString:@"¥" atIndex:0];
    }
    
    return [str autorelease];
}

static char base64EncodingTable[64] = {
	'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
	'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
	'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
	'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};

+ (NSString *)base64StringWithHMACSHA1Digest:(NSString *)strSource key:(NSString *)secretKey
{
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];	
	
	char *keyCharPtr = strdup([secretKey UTF8String]);
	char *dataCharPtr = strdup([strSource UTF8String]);
	
	CCHmacContext hctx;
	CCHmacInit(&hctx, kCCHmacAlgSHA1, keyCharPtr, strlen(keyCharPtr));
	CCHmacUpdate(&hctx, dataCharPtr, strlen(dataCharPtr));
	CCHmacFinal(&hctx, digest);
	
	NSData *encryptedStringData = [NSData dataWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
    
	//NSString* str2 = [[NSString alloc] initWithFormat:@"%s", digest];
	
	//NSLog(@"%@", str2);
	
	free(keyCharPtr);
	free(dataCharPtr);
	
	return [IHUtility base64StringFromData:encryptedStringData length:[encryptedStringData length]];
}

+ (NSString *)base64StringFromData:(NSData *)data length:(int)length
{
    unsigned long ixtext, lentext;
	long ctremaining;
	unsigned char input[3], output[4];
	short i, charsonline = 0, ctcopy;
	const unsigned char *raw;
	NSMutableString *result;
	
	lentext = [data length]; 
	if (lentext < 1)
		return @"";
	result = [NSMutableString stringWithCapacity: lentext];
	raw = [data bytes];
	ixtext = 0; 
	
	while (true) {
		ctremaining = lentext - ixtext;
		if (ctremaining <= 0) 
			break;        
		for (i = 0; i < 3; i++) { 
			unsigned long ix = ixtext + i;
			if (ix < lentext)
				input[i] = raw[ix];
			else
				input[i] = 0;
		}
		output[0] = (input[0] & 0xFC) >> 2;
		output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
		output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
		output[3] = input[2] & 0x3F;
		ctcopy = 4;
		
		switch (ctremaining) {
			case 1: 
				ctcopy = 2; 
				break;
			case 2: 
				ctcopy = 3; 
				break;
		}
		
		for (i = 0; i < ctcopy; i++)
			[result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
		
		for (i = ctcopy; i < 4; i++)
			[result appendString: @"="];
		
		ixtext += 3;
		charsonline += 4;
		
		if ((length > 0) && (charsonline >= length))
			charsonline = 0;
	}
	
	return result;
}

+(NSString *)getMonthWeekdayString:(int)weekday withIndex:(int)index{
	NSString *week=@"";
	if (index==0) {
		week=@"星期一";
		switch (weekday) {
			case 2:
				week=@"星期二";
				break;
			case 3:
				week=@"星期三";
				break;
			case 4:
				week=@"星期四";
				break;
			case 5:
				week=@"星期五";
				break;
			case 6:
				week=@"星期六";
				break;
			case 7:
				week=@"星期日";
				break;
			default:
				week=@"星期一";
				break;
		}
	}else {
		
	}
	return week;
}
 
+ (NSString*)sha1:(NSString*)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}  

+(void)AlertMessage:(NSString *)title message:(NSString *)message{
    if (title==nil) {
        title=@"";
    }
	UIAlertView *alert=[[UIAlertView alloc] initWithTitle:title
												  message:message 
												 delegate:nil 
									    cancelButtonTitle:@"确定" 
									    otherButtonTitles:nil];
	[alert show];
	[alert release];
}

+(void)AlertMessage:(NSString *)title message:(NSString *)message  delegate:(id)delegate{
    if (title==nil) {
        title=@"";
    }
	UIAlertView *alert=[[UIAlertView alloc] initWithTitle:title
												  message:message
												 delegate:delegate
									    cancelButtonTitle:@"确定"
									    otherButtonTitles:nil];
	[alert show];
	[alert release];
}


+(void)AlertMessage:(NSString *)title 
            message:(NSString *)message 
           delegate:(id)delegate 
  cancelButtonTitle:(NSString *)cancelButton
  otherButtonTitles:(NSString *)otherButton
                tag:(NSInteger)tag
{
    if (title==nil) {
        title=@"";
    }
    
	UIAlertView *alert=[[UIAlertView alloc] initWithTitle:title 
												  message:message 
												 delegate:delegate 
									    cancelButtonTitle:cancelButton
									    otherButtonTitles:otherButton,nil];
    alert.tag = tag;
	[alert show];
	[alert release];
}

+ (NSString *)getUUID
{ 
       return [IHUDIDTools UDID];
}

+ (NSString *)generateTimestamp 
{
    return [[[NSString alloc] initWithFormat:@"%ld", time(NULL)] autorelease];
}

+ (NSString *)generateNonce 
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    NSMakeCollectable(theUUID);
    NSMutableString* str = [[[NSMutableString alloc] initWithString:(NSString *)string] autorelease];
    
    [str deleteCharactersInRange:NSMakeRange(13,1)];
    
    [str deleteCharactersInRange:NSMakeRange(8,1)];    
    
    return str;
}


+ (NSString *)getParameterString:(NSDictionary *)dic
{
	NSMutableArray* arr = [self bubbleSortDictionaryByKeys:dic];
	
	NSMutableString* paraString = [[NSMutableString alloc] init];
	
	for (NSInteger j = 0; j < [arr count]; j++) {		
        NSString* value = [self URLEncode:[NSString stringWithFormat:@"%@",[dic objectForKey:[arr objectAtIndex:j]]]];
		NSString* temp2 = [NSString stringWithFormat:@"%@=%@&", [arr objectAtIndex:j], value];
		[paraString appendString:temp2];
	}	
	
    NSString* str = [NSString stringWithFormat:@"%@", [paraString substringToIndex:[paraString length] - 1]];
    
    [paraString release];
    
	return str;
}


+ (void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration
{
    [[self class] heartbeatView:view duration:fDuration maxSize:1.1f durationPerBeat:fDuration];
}

+ (void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration maxSize:(CGFloat)fMaxSize durationPerBeat:(CGFloat)fDurationPerBeat
{
    if (view && (fDurationPerBeat > 0.1f))
    {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        
        CATransform3D scale1 = CATransform3DMakeScale(0.8, 0.8, 1);
        CATransform3D scale2 = CATransform3DMakeScale(fMaxSize, fMaxSize, 1);
        CATransform3D scale3 = CATransform3DMakeScale(fMaxSize - 0.3f, fMaxSize - 0.3f, 1);
        CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
        
        NSArray *frameValues = [NSArray arrayWithObjects:
                                [NSValue valueWithCATransform3D:scale1],
                                [NSValue valueWithCATransform3D:scale2],
                                [NSValue valueWithCATransform3D:scale3],
                                [NSValue valueWithCATransform3D:scale4],
                                nil];
        
        [animation setValues:frameValues];
        
        NSArray *frameTimes = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.05],
                               [NSNumber numberWithFloat:0.2],
                               [NSNumber numberWithFloat:0.6],
                               [NSNumber numberWithFloat:1.0],
                               nil];
        [animation setKeyTimes:frameTimes];
        
        animation.fillMode = kCAFillModeForwards;
        animation.duration = fDurationPerBeat;
        animation.repeatCount = CGFLOAT_MAX;
        
        [view.layer addAnimation:animation forKey:@"heartbeatView"];
    }else{}
}

//随机数
+ (NSString*)getTransactionID
{
    NSDate* date = [NSDate date];
    NSMutableString* strDate = [NSMutableString stringWithFormat:@"%@", date];
   NSString *s1=[strDate stringByReplacingOccurrencesOfString:@"-" withString:@""];
   NSString *s2= [s1 stringByReplacingOccurrencesOfString:@" " withString:@""];
   NSString *s3= [s2 stringByReplacingOccurrencesOfString:@":" withString:@""];
 
    
 
    int n = (arc4random() % 9000) + 1000;
    //[strDate appendFormat:@"%4d", n];
    NSMutableString* transactionID = [NSMutableString stringWithString:[s3 substringToIndex:14]];
    [transactionID appendString:[NSString stringWithFormat:@"%d", n]];
 
   [transactionID stringByReplacingOccurrencesOfString:@" " withString:@""];
    return transactionID;
    
}

+ (NSMutableArray *)bubbleSortDictionaryByKeys:(NSDictionary *)dict
{
        //this method takes an NSDictionary and performs a basic bubblesort
        //on its keys. It then returns those ordered keys as an NSMutableArray.
        //You can then traverse the original NSDictionary and retrive its
        //ordered objects by simply stepping through each key in the NSMutableArray.
	
	if(!dict)
		return nil;
	NSMutableArray *sortedKeys = [NSMutableArray arrayWithArray: [dict allKeys]];
	if([sortedKeys count] <= 0)
		return nil;
	else if([sortedKeys count] == 1)
		return sortedKeys; //no sort needed
	
        //perform bubble sort on keys:
	int n = [sortedKeys count] -1;
	int i;
	BOOL swapped = YES;
	
	NSString *key1,*key2;
	NSComparisonResult result;
	
	while(swapped)
        {
		swapped = NO;
		for(i=0;i<n;i++)
            {
			key1 = [sortedKeys objectAtIndex: i];
			key2 = [sortedKeys objectAtIndex: i+1];
			
                //here is where we do our basic NSString comparison
                //This can be easily customized.
                //See the options for -compare: in NSString docs
			result = [key1 compare: key2 ];
			if(result == NSOrderedDescending)
                {
                    //we retain for good form, but these
                    //objects should still be safely
                    //retained by the dictionary:
				[key1 retain];
				[key2 retain];
				
                    //pop the two keys out of the array
				[sortedKeys removeObjectAtIndex: i]; // key1
				[sortedKeys removeObjectAtIndex: i]; // key2
                                                     //replace them
				[sortedKeys insertObject: key1 atIndex: i];
				[sortedKeys insertObject: key2 atIndex: i];
				
				[key1 release];
				[key2 release];
				
				swapped = YES;
                }
            }
        }
	
	return sortedKeys;
}

+(UIImage *)convertImage:(UIImage *)image  withImageWidth:(float)targetWidth{
    if (targetWidth==0) {
        targetWidth=640;
    }
    UIImage *sourceImage = image;
    CGSize imageSize = sourceImage.size;
    CGSize targetSize;
//    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight =0;
    if (imageSize.width<=targetWidth) {
        return image;
    }else {
        targetHeight=targetWidth*imageSize.height/image.size.width;
    }
    targetSize=CGSizeMake(targetWidth, targetHeight);
    UIImage *newImage = nil;      
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
        {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
            // center the image
        if (widthFactor > heightFactor)
            {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.4;
            }
        else
            if (widthFactor < heightFactor)
                {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.4;
                }
        }      
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    
        //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark 动画效果
/**
 *   放大缩小动画
 */
+(void)heartBigView:(UIView *)view
           duration:(CGFloat)fDuration
          beginTime:(CGFloat)time
          fromValue:(CGFloat)fromValue
            toValue:(CGFloat)toValue
        repeatCount:(CGFloat)repeatCount
{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 动画持续时间
    animation.duration = fDuration;
    animation.beginTime = CACurrentMediaTime() + time;
    // 开始时的倍率
    animation.fromValue = [NSNumber numberWithFloat:fromValue];
    // 结束时的倍率
    animation.toValue = [NSNumber numberWithFloat:toValue];
    animation.repeatCount=repeatCount;
   //  [animation setRemovedOnCompletion:NO];  是否点击后就移除
    [view.layer addAnimation:animation forKey:@"scale-layer"];
}

//条件
+ (NSString*) judgePasswordStrength:(NSString*) _password
{
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    
    NSArray* termArray1 = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
    NSArray* termArray2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", nil];
    NSArray* termArray3 = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];

    NSString* result1 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray1 Password:_password]];
    NSString* result2 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray2 Password:_password]];
    NSString* result3 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray3 Password:_password]];
    
    [resultArray addObject:[NSString stringWithFormat:@"%@",result1]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result2]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result3]];
    int intResult=0;
    for (int j=0; j<[resultArray count]; j++)
    {
        if ([[resultArray objectAtIndex:j] isEqualToString:@"1"])
        {
            intResult++;
        }
    }
    NSString* resultString = [[NSString alloc] init];
    if (intResult < 2 || [_password length]<6)
    {
        resultString = @"0";
    }
    else if (intResult == 2&&[_password length]>=6)
    {
        resultString = @"1";
    }
    if (intResult > 2&&[_password length]>=6)
    {
        resultString = @"2";
    }
    return resultString;
}

+ (BOOL)judgeRange:(NSArray*)_termArray Password:(NSString*)_password
{
    NSRange range;
    BOOL result =NO;
    for(int i=0; i<[_termArray count]; i++)
    {
        range = [_password rangeOfString:[_termArray objectAtIndex:i]];
        if(range.location != NSNotFound)
        {
            result =YES;
        }
    }
    return result;
}

@end


