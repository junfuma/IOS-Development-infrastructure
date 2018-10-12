//
//  IHDataSource.m
//  XFDesigners
//
//  Created by yaoyongping on 12-12-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "IHDataSource.h"

@implementation IHDataSource
@synthesize datasource,sectionCount,allowEdit,attributes,sourcedelegate,tag;


-(id)init{
	self=[super init];
	if (self) {
		self.sectionCount=0;
	}
	
	return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	if (self.sectionCount>0) {
		return self.sectionCount;
	}
	return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
      
	if (self.sectionCount>0 && self.datasource.count == self.sectionCount) {
		NSDictionary *dic=[datasource objectAtIndex:section];
		NSArray *arr=[dic objectForKey:@"data"];
		return [arr count];
	}
	return [datasource count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	return nil;
}

-(void)dealloc{
    sourcedelegate=nil;
	//[attributes release];
    attributes=nil;
	[datasource release];
	[super dealloc];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
    return UITableViewCellEditingStyleDelete; 
} 
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
        //NSLog(@"是他们");
    return self.allowEdit; 
} 

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
    NSLog(@"点击了编辑");
	int index=(int)indexPath.row;
	NSMutableArray *d=(NSMutableArray *)self.datasource;
	[d removeObjectAtIndex:index];
	[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


@end

@implementation IHMemberCenterDatasource

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	NSDictionary *dic=[self.datasource objectAtIndex:section];
	NSString *t=(NSString *)[dic objectForKey:@"headerText"];
	
	return t;
	
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *identify=@"IHMemberCenterCell";
	IHMemberCenterCell *cell=(IHMemberCenterCell *)[tableView dequeueReusableCellWithIdentifier:identify];
	
	if (cell==nil) {
		cell=[[[IHMemberCenterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify] autorelease];
	}
	
	NSDictionary *dic=[datasource objectAtIndex:indexPath.section];
	NSArray *data=[dic objectForKey:@"data"];
	NSDictionary *member=[data objectAtIndex:indexPath.row];
	[cell setMember:member];
	
	return cell;
}

@end
