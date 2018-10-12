//
//  IHTableViewCell.m
//  XFDesigners
//
//  Created by yaoyongping on 12-12-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "IHTableViewCell.h"

@implementation IHTableViewCell
@synthesize attribute,delegate,tag,indexPath,cellHeight;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

//-(void)setData:(NSDictionary *)dic{
//    _data=[dic retain];
//}
//-(NSDictionary *)data{
//    return _data;
//}

-(void)dealloc{
    indexPath =nil;
    [attribute release];
    delegate=nil;
    [super dealloc];
}

@end

@implementation IHMemberCenterCell{
    UIImageView *_logoimage;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
            // Initialization code
        
        UIImageView *sImage=[[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 20, 20)];
        [self addSubview:sImage];
        _logoimage=sImage;
        [sImage release];
        
        UILabel *lbl=[[SMLabel alloc] initWithFrame:CGRectMake(50, 2, 160, 37)];
		[lbl setText:@"我的订单"];
        [lbl setTextColor:RGBA(75, 75, 75, 1)];
        [lbl setFont:sysFont(14)];
        [lbl setBackgroundColor:[UIColor clearColor]];
		[self addSubview:lbl];
		lblTitle=lbl;
		[lbl release];
		
		UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(30, 15, 22, 22)];
		[self addSubview:imageview];
		icon=imageview;
		[imageview release];
		
		imageview=[[UIImageView alloc] initWithFrame:CGRectMake(275, 12, 16, 16)];
		[imageview setImage:[UIImage imageNamed:@"system_arrowing.png"]];
		[self addSubview:imageview];
		[imageview release];
    }
    return self;
}

-(void)setMember:(NSDictionary *)dic{
    if (_member!=nil) {
        [_member release];
    }
	_member=[dic retain];
	NSString *title=[_member objectForKey:@"title"];
	if (title==nil) {
		title=[_member objectForKey:@"name"];
	}
	lblTitle.text=title;
	UIImage *img=[UIImage imageNamed:[_member objectForKey:@"image"]];
	if (img!=nil) {
		_logoimage.image=img;
	}else {
		CGRect r=lblTitle.frame;
		r.origin.x=30;
		[lblTitle setFrame:r];
	}
    
	
}

-(NSDictionary *)member{
    return _member;
}

-(void)dealloc{
	[_member release];
	[super dealloc];
}

@end
