//
//  IHBaseViewController.m
//  IHBaseProject
//
//  Created by yaoyongping on 13-1-7.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "IHBaseViewController.h"
#import "AppDelegate.h"

@interface IHBaseViewController ()

@end

@implementation IHBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
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


 


- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 5.0f>7){
      //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"mall_s_titlebg2.png"] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"mall_s_titlebg2.png"] forBarMetrics:UIBarMetricsDefault];
	}
    */
    
    
 
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif
    
//    UIImage *image = Image(@"navBar_bg.png");
//    UIImage *newImage = [image stretchableImageWithLeftCapWidth:WindowWith/image.size.width topCapHeight:64/image.size.height];
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:cWhiteColor andSize:CGSizeMake(_deviceSize.width, 64)]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];

    titleLabel=[[SMLabel alloc] initWithFrame:CGRectMake(70, 8, 140, 30)];
    [titleLabel setFont:sysFont(19)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:cBlackColor];
  //  titleLabel.adjustsFontSizeToFitWidth = YES;
  
    
    
    titleLabel.hidden = YES;
    
    int leftWith=0;
    if(_IOS7){
        leftWith=30;
    }
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImage *img=[UIImage imageNamed:@"LeftArrow.png"];
    UIImage *Img=Image(@"LeftArrow.png");
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
  //  CGSize size=[IHUtility GetSizeByText:@"返回" sizeOfFont:16 width:100];
    //[btn setTitle:@"返回" forState:UIControlStateNormal];
    btn.titleLabel.font=sysFont(16);
    [btn setTitleColor:RGB(103, 114, 114) forState:UIControlStateNormal];
    btn.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
    btn.frame=CGRectMake(0, 0, img.size.width+10, img.size.height+10);
    [btn setImage:[Img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    //[btn setImage:Img forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *leftbtn=[[UIBarButtonItem alloc] initWithCustomView:btn];
	leftbutton=btn;
	[self.navigationItem setLeftBarButtonItem:leftbtn];
	 
	[leftbtn release];

	btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, img.size.width, img.size.height)];
	[btn setImageEdgeInsets:UIEdgeInsetsMake(0, -25, 0, -leftWith)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -leftWith+10)];
 
	[btn addTarget:self action:@selector(home:) forControlEvents:UIControlEventTouchUpInside];
	
	leftbtn=[[UIBarButtonItem alloc] initWithCustomView:btn];
	rightbutton=btn;
    rightbutton.hidden=YES;
	[self.navigationItem setRightBarButtonItem:leftbtn];
	[btn release];
	[leftbtn release];
    
//	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CancleHTTPConnectionNotification:) name:NetWorkCancleHTTPConnection object:nil];
    
//    network = [[InfoHoldNetWorkData alloc] init];
//    network.delegate = self;
      self.navigationItem.titleView = titleLabel;

    //nav_def_Image
    UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43.5, WindowWith, 3.5)];
    lineView.image = Image(@"tab_def_Image");
    lineView.contentMode = UIViewContentModeScaleAspectFill;
    lineView.transform = CGAffineTransformMakeRotation(M_PI);
    
    if (!barlineView) {
        barlineView = lineView;
        for (UIView *view in self.navigationController.navigationBar.subviews) {
            if ([view isKindOfClass:[UIImageView class]]) {
                [view removeFromSuperview];
            }
        }
        [self.navigationController.navigationBar addSubview:lineView];
        self.navigationController.navigationBar.clipsToBounds = NO;
    }
}

-(void)setTitle:(NSString *)title
{
    if (title == nil || [title length] == 0) {
        titleLabel.hidden = YES;
    }
    else
    {
        titleLabel.hidden = NO;
        titleLabel.text = title;
    }
}

-(void)setRightButtonStyle:(NSString *)normalImageName highlightImageName:(NSString *)highlightImageName text:(NSString *)text{
    rightbutton.hidden=NO;
    if (normalImageName==nil) {
        normalImageName=@"Search Icon.png";
    }
    if (highlightImageName==nil) {
        highlightImageName=@"Search Icon.png";
    }
    CGRect rect=[rightbutton frame];
    rect.size.height=30;
    //[rightbutton setFrame:rect];
    
    [rightbutton setImage:[Image(normalImageName) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    [rightbutton setImage:[Image(normalImageName) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    
    UIImage *imageNormal=[UIImage imageNamed:normalImageName];
    imageNormal=[imageNormal stretchableImageWithLeftCapWidth:imageNormal.size.width/2 topCapHeight:imageNormal.size.height/2];
   // [rightbutton setImage:imageNormal forState:UIControlStateNormal];
    UIImage *imageHighlight=[UIImage imageNamed:highlightImageName];
    imageHighlight=[imageHighlight stretchableImageWithLeftCapWidth:imageHighlight.size.width/2 topCapHeight:imageHighlight.size.height/2];
   // [rightbutton setImage:imageHighlight forState:UIControlStateHighlighted];
    [rightbutton setTitle:text forState:UIControlStateNormal];
    [rightbutton setTitleColor:RGBA(98, 98, 98, 1) forState:UIControlStateNormal];
    [rightbutton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightbutton.titleLabel setShadowOffset:CGSizeMake(1, 1)];
    [rightbutton.titleLabel setFont:boldFont(13)];
}


- (void)viewDidUnload
{
    NSLog(@"view is unload");
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



-(void)showFootBar{
    if(_footBar==nil){
        _footBar=[[UIView alloc] initWithFrame:CGRectMake(0, _deviceSize.height-43, self.view.frame.size.width, 43)];
        UIImageView *bg=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _footBar.frame.size.width, 43)];
        UIImage *image=[UIImage imageNamed:@"system_bg_footar"];
        image=[image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
        [bg setImage:image];
        [_footBar addSubview:bg];
        [bg release];
        [_footBar setBackgroundColor:RGBA(246, 246, 246, 1)];
//        [_footBar setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:_footBar];
        [self.view bringSubviewToFront:_footBar];
        [_footBar release];
    }
}
-(void)showFootBar:(float)y{
	if(_footBar==nil){
        _footBar=[[UIView alloc] initWithFrame:CGRectMake(0, y-43, self.view.frame.size.width, 43)];
        UIImageView *bg=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _footBar.frame.size.width, 43)];
        UIImage *image=[UIImage imageNamed:@"system_bg_footar"];
        image=[image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
        [bg setImage:image];
        [_footBar addSubview:bg];
        [bg release];
        
        [_footBar setBackgroundColor:RGBA(246, 246, 246, 1)];
//        [_footBar setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:_footBar];
        [self.view bringSubviewToFront:_footBar];
        [_footBar release];
    }
}

-(void)removeFootBar{
    if (_footBar!=nil) {
        [_footBar removeFromSuperview];
        _footBar=nil;
    }
}

-(UIView *)footBar{
    return _footBar;
}

-(void)addHelpView:(UIView *)helpView{
    [helpView setTag:30000];
    UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeHelpView:)];
    [helpView addGestureRecognizer:gesture];
    [gesture release];
    [self.view addSubview:helpView];
}

-(void)removeHelpView:(UITapGestureRecognizer *)recognizer{
    if(recognizer.state==UIGestureRecognizerStateEnded){
        UIView *v=[self.view viewWithTag:30000];
        [v removeFromSuperview];
    }
}
/*
-(void)showLoginPage:(UIViewController*)controller animate:(BOOL)animate
 {
    JLLoginViewController* ctrl = [[JLLoginViewController alloc] init];
    ctrl.delegate = controller;
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:ctrl];
//    UINib *nib = [UINib nibWithNibName:@"JLCustomNavigation" bundle:nil];
//    UINavigationController* nav =
//    [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
//    nav.viewControllers = [NSArray arrayWithObject:ctrl];
//    [ctrl release];
    
    [self.view presentModalViewController:nav animated:animate];
    [ctrl release];
    [nav release];
}
*/
-(void)CancleHTTPConnectionNotification:(NSNotification *)notification{
	//[network cancelHttpConnectMenutal];
}

-(void)hideNavigationBar:(BOOL)hidden{
    if (hidden)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showNavigationBar" object:@"0"];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showNavigationBar" object:@"1"];
    }
}

-(void)setRightButtonTitle:(NSString *)title{
         rightbutton.hidden=NO;
    [rightbutton setTitle:title forState:UIControlStateNormal];
}

-(void)setRightButtonImage:(UIImage *)img forState:(UIControlState)state{
	[rightbutton setImage:[img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:state];
     rightbutton.hidden=NO;
     rightbutton.frame=CGRectMake(0, 0, img.size.width, img.size.height);
}

-(void)setLeftButtonImage:(UIImage *)img forState:(UIControlState)state{
    leftbutton.frame=CGRectMake(0, 0, img.size.width, img.size.height);
    [leftbutton setImage:[img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:state];
    //[leftbutton setImage:img forState:state];
}

-(void)setRightButtonStyle:(IHNavButtonStyle)style
{
     rightbutton.hidden=NO;
	if (style==IHNavButtonStyleAdd) {
		[rightbutton setImage:[UIImage imageNamed:@"F_rightBtn.png"] forState:UIControlStateNormal];
		[rightbutton setImage:[UIImage imageNamed:@"F_rightBtn.png"] forState:UIControlStateHighlighted];
	}else if (style==IHNavButtonStyleOK) {
		[rightbutton setImage:[UIImage imageNamed:@"gou_ok.png"] forState:UIControlStateNormal];
		[rightbutton setImage:[UIImage imageNamed:@"gou_ok_action.png"] forState:UIControlStateHighlighted];
	}else if (style==IHNavButtonStyleEdit) {
		[rightbutton setImage:[UIImage imageNamed:@"bianji.png"] forState:UIControlStateNormal];
		[rightbutton setImage:[UIImage imageNamed:@"bianji_action.png"] forState:UIControlStateHighlighted];
	}else if (style==IHNavButtonStyleSave) {
		[rightbutton setImage:[UIImage imageNamed:@"baocun.png"] forState:UIControlStateNormal];
		[rightbutton setImage:[UIImage imageNamed:@"baocun_action.png"] forState:UIControlStateHighlighted];
	}else if(style==IHNavButtonStyleCancel){
        [rightbutton setImage:[UIImage imageNamed:@"unsel_取消.png"] forState:UIControlStateNormal];
		[rightbutton setImage:[UIImage imageNamed:@"sel_取消.png"] forState:UIControlStateHighlighted];
    }else if(style==IHNavButtonStyleShare){
        [rightbutton setImage:[UIImage imageNamed:@"shareGreen.png"] forState:UIControlStateNormal];
		[rightbutton setImage:[UIImage imageNamed:@"shareGreen.png"] forState:UIControlStateHighlighted];
    }else if (style==IHNavButtonStyleClickPraise){
        
        [rightbutton setImage:[UIImage imageNamed:@"F_Praise.png"] forState:UIControlStateNormal];
        [rightbutton setImage:[UIImage imageNamed:@"F_Praise.png"] forState:UIControlStateHighlighted];
    }
    else if(style==IHNavButtonStyleSearch){
        [rightbutton setImage:[UIImage imageNamed:@"Search Icon.png"] forState:UIControlStateNormal];
		[rightbutton setImage:[UIImage imageNamed:@"Search Icon.png"] forState:UIControlStateHighlighted];
    }else if(style==IHNavButtonStyleChatInfo){
        [rightbutton setImage:[UIImage imageNamed:@"chat_Slice.png"] forState:UIControlStateNormal];
        [rightbutton setImage:[UIImage imageNamed:@"chat_Slice.png"] forState:UIControlStateHighlighted];
    }
    else {
		[rightbutton setImage:[UIImage imageNamed:@"unsel_home.png"] forState:UIControlStateNormal];
		[rightbutton setImage:[UIImage imageNamed:@"sel_home.png"] forState:UIControlStateHighlighted];
	}
	
}

-(void)setLeftButtonStyle:(IHNavButtonStyle)style{
	if (style==IHNavButtonStyleAdd) {
		
	}else {
		[leftbutton setImage:[UIImage imageNamed:@"unsel_back.png"] forState:UIControlStateNormal];
		[leftbutton setImage:[UIImage imageNamed:@"sel_back.png"] forState:UIControlStateHighlighted];
	}
}

-(void)AlertMessage:(NSString *)alertTitle message:(NSString *)message{
	if (alertTitle==nil) {
		alertTitle=@"提示";
	}
	UIAlertView *alert=[[UIAlertView alloc] initWithTitle:alertTitle message:message delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
}
//-(void)networkData:(GJNetWorkData *)networkData successful:(signed char)success statusString:(NSString *)status{
//	
//}

 


 



-(void)starAddWaitingView{
  }


-(void)removeWaitingView{
   // [network cancelHttpConnect];
   
}




-(void)_setStatusBar:(NSString *)msg type:(int)type{
    UIView *v=[self.view viewWithTag:1000000];
	if(v==nil){
		v=[[UIView alloc] initWithFrame:CGRectMake(0, -30, 320, 32)];
            //[v setBackgroundColor:[UIColor orangeColor]];
		[v setTag:1000000];
		
		UIImageView *image=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _deviceSize.width, 32)];
		[image setImage:[UIImage imageNamed:@"system_tip_bg"]];
		[v addSubview:image];
		[image release];
		
		UILabel *lbl=[[SMLabel alloc] initWithFrame:CGRectMake(0, 5, _deviceSize.width, 21)];
        [lbl setTextColor:[UIColor blackColor]];
		[lbl setTextAlignment:NSTextAlignmentCenter];
		[lbl setBackgroundColor:[UIColor clearColor]];
		[lbl setFont:sysFont(12)];
		[lbl setText:msg];
		[v addSubview:lbl];
		[lbl release];
		[self.view addSubview:v];
		[v release];
	}
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	CGRect rect=v.frame;
	rect.origin.y=0;
	[v setFrame:rect];
	[UIView commitAnimations];
}
-(void)AddStatusbBar:(NSString *)msg type:(int)type{
   
	[self _setStatusBar:msg type:type];
    if (type==99) {
        [self performSelector:@selector(removeStatusBar:) withObject:nil afterDelay:10];
    }else{
        [self performSelector:@selector(removeStatusBar:) withObject:nil afterDelay:1.5];
    }
	
}

-(void)AddStatusbBar:(NSString *)msg type:(int)type withTag:(int)index{
    [self _setStatusBar:msg type:type];
	[self performSelector:@selector(removeStatusBar:) withObject:[NSString stringWithFormat:@"%d",index] afterDelay:2];
}

-(void)removeStatusBar:(NSObject *)object{
    NSString *index=(NSString *)object;
	CATransition *an=[IHUtility GetTransiton:KCATransitionTypeFade direction:kCATransitionFade];
	UIView *v=[self.view viewWithTag:1000000];
	[self.view.layer addAnimation:an forKey:nil];
	[v removeFromSuperview];
    if (index!=nil || [index length]>0) {
        [self statusbarDisappear:[index intValue]];
    }
	
}

-(void)statusbarDisappear:(int)index{   
    
}


-(void)back:(id)sender{
    
        //[self.navigationController popViewControllerAnimated:YES];
  //  [network cancelHttpConnect];
	// [[NSNotificationCenter defaultCenter] postNotificationName:IHPopViewControllerKey  object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)popViewController:(int)ControllerId{
    NSArray *ViewControllers=self.navigationController.viewControllers;
    
    if (ViewControllers.count>ControllerId) {
        UIViewController *controller=[ViewControllers objectAtIndex:ControllerId];
        [self.navigationController popToViewController:controller animated:YES];
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

-(void)popTabController{
	
}

-(void)home:(id)sender{
        //	[ParamManager clearParam];
        [self.navigationController popToRootViewControllerAnimated:YES];
  //  [network cancelHttpConnect];
	// [[NSNotificationCenter defaultCenter] postNotificationName:IHPopToRootViewController object:nil];
}
-(void)pushViewController:(UIViewController *)viewcontroller{
	//viewcontroller.hidesBottomBarWhenPushed = YES;   //这个必须写在super前面, 否则跳转已经过了
    [self.navigationController pushViewController:viewcontroller animated:YES];
   //  [[NSNotificationCenter defaultCenter] postNotificationName:IHPushViewControllerKey object:viewcontroller];
}

-(void)presentViewController:(UIViewController *)viewcontroller useNav:(BOOL)useNav{
    NSString *index=@"";
    if (useNav) {
        index=@"1";
    }else {
        index=@"0";
    }
    NSDictionary *dic=[[NSDictionary alloc] initWithObjectsAndKeys:viewcontroller,@"viewcontroller",index,@"usenav",nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:IHOpenPresentModelViewControllerKey object:dic];
    [dic release];
}

-(void)dismissModalViewController{
    [[NSNotificationCenter defaultCenter] postNotificationName:IHDissmissModalViewContollerKey object:nil];
}

-(void)dealloc{
    [titleLabel removeFromSuperview];
    NSLog(@"dealloc=%@",self);
    [titleLabel release];
//    [network cancelHttpConnect];
//    [network release];
    [super dealloc];
}

@end

 

@implementation IHBaseCustomViewController{
    
    BOOL _reloading;
    BOOL _autoload;
    UIButton *_bottomStatusView;
    UILabel *_lblBottomStatus;
    UIActivityIndicatorView *_activityView;
    BOOL _loadingHistory;//表示数据是否加载完成
    BOOL _overHistory;//表示数据是否已经加载完毕
}
@synthesize autoLoad=_autoload;
-(void)viewDidLoad{
    [super viewDidLoad];
    _BaseScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _deviceSize.width, _deviceSize.height-44)];
    NSLog(@"_baseScrollview.frame.size.width=%f",_BaseScrollView.frame.size.width);
    NSLog(@"_baseScrollview.frame.size.heigh=%f",_BaseScrollView.frame.size.height);
    [_BaseScrollView setDelegate:self];
	[_BaseScrollView setContentSize:CGSizeMake(_deviceSize.width, _deviceSize.height-44)];
	[_BaseScrollView setBackgroundColor:[UIColor clearColor]];
	[self.view addSubview:_BaseScrollView];
    
  
}

-(void)setAutoLoad:(BOOL)load{
    _autoload=load;
    if (load) {
        
        UIButton *v=[[UIButton alloc] initWithFrame:CGRectMake(0, -1000, _BaseScrollView.frame.size.width, 70)];
        UILabel *lbl=[[SMLabel alloc ] initWithFrame:CGRectMake(0, (v.frame.size.height-20)/2, v.frame.size.width, 20)];
        [lbl setBackgroundColor:[UIColor clearColor]];
        [lbl setFont:sysFont(15)];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        [lbl setTextColor:[UIColor grayColor]];
        [v addSubview:lbl];
        _lblBottomStatus=lbl;
        [lbl release];
        [_BaseScrollView addSubview:v];
        _bottomStatusView=v;
        [v release];
        
        UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, (v.frame.size.height-20)/2, 20, 20)];
        [activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [_bottomStatusView addSubview:activityView];
        _activityView=activityView;
        
        [activityView release];
       // [_bottomStatusView addTarget:self action:@selector(loadHistory:) forControlEvents:UIControlEventTouchUpInside];
        
        [_bottomStatusView setHidden:YES];
    }else{
        [_bottomStatusView removeFromSuperview];
        _bottomStatusView=nil;
        _activityView=nil;
        _lblBottomStatus=nil;
    }
   
}

 
-(void)doneLoadingHistoryData:(BOOL)isOver{
    _overHistory=isOver;
    _loadingHistory=NO;
    [_activityView stopAnimating];
    [_activityView setHidden:YES];
    if (isOver) {
        [_lblBottomStatus setText:@"数据已经全部加载"];
    }else{
        [_lblBottomStatus setText:@"上拉加载更多数据"];
    }
}

-(void)setContentsize:(CGSize)size{
    if (self.autoLoad) {
        CGRect rect=_bottomStatusView.frame;
        rect.origin.y=size.height;
        [_bottomStatusView setFrame:rect];
        
        size.height+=_bottomStatusView.frame.size.height;
        [_BaseScrollView setContentSize:size];
        if (size.height>_BaseScrollView.frame.size.height) {
            _bottomStatusView.hidden=NO;
        }else{
            [_bottomStatusView setHidden:YES];
        }
        
    }else{
        [_BaseScrollView setContentSize:size];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
  
    if (self.autoLoad) {
        if (!_loadingHistory && !_overHistory) {
            CGSize size=[_BaseScrollView contentSize];
            if (size.height-_bottomStatusView.frame.size.height>_BaseScrollView.frame.size.height) {
                CGPoint p=scrollView.contentOffset;
                if (p.y+scrollView.frame.size.height>scrollView.contentSize.height+40) {
                    [_lblBottomStatus setText:@"松开后加载数据"];
                }else{
                    [_lblBottomStatus setText:@"上拉加载更多数据"];
                }
            }
            
        }
       
    }
}


 -(void)loadLatestData{
    
}

-(void)doneLoadingLatestData{
    _reloading = NO;
	 
}




- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
	
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _BaseScrollView.contentInset = contentInsets;
    _BaseScrollView.scrollIndicatorInsets = contentInsets;
    
	CGRect fieldFrame;
    
	if (_activityTextField!=nil) {
        fieldFrame=[[_activityTextField superview] convertRect:_activityTextField.frame toView:_BaseScrollView];
	}else {
        fieldFrame=[[_activityTextView superview] convertRect:_activityTextField.frame toView:_BaseScrollView];
	}
	
	CGPoint p= _BaseScrollView.contentOffset;
    float off=p.y+_BaseScrollView.frame.size.height-kbSize.height;
    if (off>fieldFrame.origin.y) {
        
    }else {
        CGPoint pp=CGPointMake(0, off-fieldFrame.size.height+80);
        [_BaseScrollView setContentOffset:pp animated:YES];
    }
    
}

-(void)viewDidUnload{
    [self removeKeyboardNotifications];
}


- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
	
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _BaseScrollView.contentInset = contentInsets;
    _BaseScrollView.scrollIndicatorInsets = contentInsets;
        //NSDictionary* info = [aNotification userInfo];
        //CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        //    CGRect bkgndRect = _activityTextField.superview.frame;
    
	CGSize c= _BaseScrollView.contentSize;
        //bkgndRect.size.height += kbSize.height;
        //[_activityTextField.superview setFrame:bkgndRect];
	[_BaseScrollView setContentSize:CGSizeMake(c.width, c.height)];
    
    _scrollOffset_y = 0.0f;
	_activityTextField=nil;
	_activityTextView=nil;
}

-(void)removeKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _activityTextField=(IHTextField *)textField;
    UIImage* image = [UIImage imageNamed:@"bg_text_action.png"];
	image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
	[textField setBackground:image];
    return YES;
}

-(void)endEdit:(id)sender{
    [self.view endEditing:YES];
}

-(void)textFieldDidEndEditing:(IHTextField *)textField{
    UIImage* image = [UIImage imageNamed:@"bg_text.png"];
	image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
	[textField setBackground:image];
}

-(void)dealloc{
    [self removeKeyboardNotifications];
    [_BaseScrollView release];
    [super dealloc];
    
}

@end

@implementation UIScrollView (infohold)

-(CGRect)visibleRect{
    CGPoint p=self.contentOffset;
    CGRect rect=CGRectMake(p.x, p.y, self.frame.size.width, self.frame.size.height);
    return rect;
}

@end

@implementation UINavigationBar(infohold)

-(void)drawRect:(CGRect)rect{
	//UIImage *image=[UIImage imageNamed:@"title"];
	//[image drawInRect:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height)];
	//[self setClearsContextBeforeDrawing:NO];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title.png"]];
	
	imageView.frame =rect;
	[imageView drawRect:rect];
	
}

@end
