//
//  SMParamModel.m
//  SMAirlineTickets
//
//  Created by yaoyongping on 12-5-22.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "IHParamModel.h"

static IHParamModel *manager=nil;
@implementation IHParamModel
@synthesize param,configData;
+(IHParamModel *)parammanagement{
	@synchronized(self){
		if (manager==nil) {
			manager=[[IHParamModel alloc] init];
			manager.param=[[NSMutableDictionary alloc] init];
            manager.configData =[[NSMutableDictionary alloc] init];
            
		}
	}
	return manager;
}

-(void)clearParam{
	[manager.param removeAllObjects];
}

- (NSString *)loadCityName{
    NSString *cityName = [[NSUserDefaults standardUserDefaults] objectForKey:@"IT_CityName"];
    return cityName;
}

- (void)saveCityName:(NSString *)cityName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:cityName forKey:@"IT_CityName"];
    [defaults synchronize];
}

-(void)dealloc{
	[self.param release];
	[manager release];
    [self.configData release];
	[super dealloc];
}
@end
