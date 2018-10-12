//
//  IHDataSource.h
//  XFDesigners
//
//  Created by yaoyongping on 12-12-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IHDataSource : NSObject<UITableViewDataSource> {
	NSArray *datasource;
	int sectionCount;
	BOOL allowEdit;
	NSObject *attributes;
    int tag;
}
@property(nonatomic,assign)NSObject *attributes;
@property(nonatomic,retain)NSArray *datasource;
@property(nonatomic)int sectionCount;
@property(nonatomic)BOOL allowEdit;
@property(nonatomic,assign)NSObject *sourcedelegate;
@property(nonatomic)int tag;
@end

@interface IHMemberCenterDatasource : IHDataSource
{
    
}

@end
