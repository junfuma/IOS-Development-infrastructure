//
//  IHTextBaseTextField.m
//  XFDesigners
//
//  Created by yaoyongping on 12-12-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "IHTextBaseTextField.h"

@implementation IHTextBaseTextField

- (id)initWithFrame:(CGRect)frame
{
    if (frame.size.height==0) {
        frame.size.height=43;
    }
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self setClearButtonMode:UITextFieldViewModeWhileEditing];
        UIView *v=[[UIView alloc] init];
        CGRect rect=v.frame;
        rect.size.height=20;
        [v setFrame:rect];
        
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [btn setImage:[UIImage imageNamed:@"jianpan"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"jianpan_action"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(hideKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:btn];
        [btn release];
        
        [self setInputAccessoryView:v];
        [v release];
        
        
        
        UIImage *image=[UIImage imageNamed:@"bg_text.png"];
        image=[image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
//        [self setBackground:image];
        
        UIView *left=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, frame.size.height)];
        [self setLeftView:left];
        [left release];
        
        [self setLeftViewMode:UITextFieldViewModeAlways];
    }
    return self;
}

-(void)setLeftViewIcon:(UIImage *)image{
    CGRect r=self.leftView.frame;
    r.size.width=40;
    [self.leftView setFrame:r];
    
    UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(10, (self.frame.size.height-image.size.height)/2, image.size.width, image.size.height)];
    [imageview setImage:image];
    [self.leftView addSubview:imageview];
    [imageview release];
}

-(void)hideKeyBoard:(id)sender{
    [self resignFirstResponder];
}

-(void)dealloc{
    NSLog(@"IHTextBaseTextField dealloc");
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end





@implementation UITextFieldLogin

-(void)setLeftImage:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (self.frame.size.height - 20)/2, 20, 20)];
    imageView.image = image;
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 37,self.frame.size.height)];
    [view addSubview:imageView];
	self.leftView = view;
	[imageView release];
    [view release];
    
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    UIImage* image = [UIImage imageNamed:@"unsel_bg.png"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    self.background = image;
    
    self.font = [UIFont fontWithName:@"STHeitiSC-Light" size:18];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage* image = [UIImage imageNamed:@"unsel_bg.png"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
        self.background = image;
        self.font = [UIFont fontWithName:@"STHeitiSC-Light" size:18];
    }
    return self;
}

-(void)refreshTextField:(BOOL)editing
{
    
    UIImage* image = nil;
    
    if (editing == YES) {
        image = [UIImage imageNamed:@"sel_bg.png"];
    }
    else
    {
        image = [UIImage imageNamed:@"unsel_bg.png"];
    }
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    self.background = image;
}

-(void)drawRect:(CGRect)rect
{
    self.borderStyle = UITextBorderStyleNone;
	//self.disabledBackground = disImage;
	
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
	self.leftViewMode = UITextFieldViewModeAlways;
    
    
    if (self.leftView == nil) {
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
        self.leftView = paddingView;
        [paddingView release];
        [super drawRect:rect];
    }
    
    [super drawRect:rect];
}

@end



@implementation IHTextField

- (id)initWithFrame:(CGRect)frame
{
    if (frame.size.height==0) {
        frame.size.height=43;
    }
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self setClearButtonMode:UITextFieldViewModeWhileEditing];
        UIView *v=[[UIView alloc] init];
        
        CGRect rect=v.frame;
        v.tag=1001;
        rect.size.height=41;
        [v setFrame:rect];
        
        v.backgroundColor= [UIColor whiteColor];
        
        UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WindowWith, 1)];
        lineView.backgroundColor=RGB(193, 195, 198);
        [v addSubview:lineView];
        [lineView release];
        
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame=CGRectMake(WindowWith-56, 0, 56, 41);
        [btn setTitle:@"完成" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont boldSystemFontOfSize:15];
        [btn addTarget:self action:@selector(hideKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
       
        [v addSubview:btn];
     
        [self setInputAccessoryView:v];
        [v release];
        
        
        
        [self setLeftViewMode:UITextFieldViewModeAlways];
    }
    return self;
}
 -(void)hideKeyBoard:(id)sender{
   
     UIView *v=[self viewWithTag:1001];
     v.origin=CGPointMake(0, kScreenHeight);
     
     [self resignFirstResponder];
}

-(void)dealloc{
    NSLog(@"IHTextBaseTextField dealloc");
    [super dealloc];
}


@end

