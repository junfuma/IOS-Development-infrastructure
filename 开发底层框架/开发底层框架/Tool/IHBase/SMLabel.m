//
//  SMLabel.m
//  SMAirlineTickets
//
//  Created by yaoyongping on 12-5-18.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SMLabel.h"


@implementation SMLabel
-(id)init
{
	self=[super init];
	if (self!=nil) {
        
	}
	return self;
}

-(id)initWithFrame:(CGRect)frame
{
	self=[super initWithFrame:frame];
	if (self!=nil) {
		self.backgroundColor=[UIColor clearColor];
	}
	return self;
}

-(id)initWithFrameWith:(CGRect)frame textColor :(UIColor*)color textFont:(UIFont *)font
{
    self=[super initWithFrame:frame];
    if (self!=nil) {
        self.backgroundColor=[UIColor clearColor];
        self.textColor=color;
        self.font=font;
    }
    return self;
}
 
@end


 