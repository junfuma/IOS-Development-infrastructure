//
//  SMParamModel.h
//  SMAirlineTickets
//
//  Created by yaoyongping on 12-5-22.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PARAMMODEL [IHParamModel parammanagement]

@interface IHParamModel : NSObject {
	NSMutableDictionary *param;
    NSMutableDictionary* configData;
}
@property(nonatomic,retain)NSMutableDictionary * param;
@property(nonatomic,retain)NSMutableDictionary * configData;
- (NSString *)loadCityName;
- (void)saveCityName:(NSString *)cityName;
+(IHParamModel *)parammanagement;
-(void)clearParam;
@end
