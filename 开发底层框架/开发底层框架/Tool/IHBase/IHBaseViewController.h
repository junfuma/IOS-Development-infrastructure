//
//  IHBaseViewController.h
//  IHBaseProject
//
//  Created by yaoyongping on 13-1-7.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IHDataSource.h"
#import "device.h"



//#define showName    @"数据加载中.."
//#import "JLLoginViewController.h"
//#import "InfoHoldNetWorkData+CWInfoHoldNetWorkData.h"
typedef enum{
	IHNavButtonStyleAdd,
	IHNavButtonStyleDefault,
	IHNavButtonStyleOK,
	IHNavButtonStyleEdit,
	IHNavButtonStyleSave,
    IHNavButtonStyleCancel,
    IHNavButtonStyleShare,
    IHNavButtonStyleSearch,
    IHNavButtonStyleClickPraise,
    IHNavButtonStyleChatInfo,
}IHNavButtonStyle;

@interface IHBaseViewController : UIViewController {
    UIButton *leftbutton;
	UIButton *rightbutton;
    UILabel  *titleLabel;
    UIImageView   *barlineView;
   
    
@private
    UIView *_footBar;
}
 -(void)setTitle:(NSString *)title;
-(void)hideNavigationBar:(BOOL)hidden;
-(void)back:(id)sender;
-(void)home:(id)sender;
-(void)setRightButtonImage:(UIImage *)img forState:(UIControlState)state;
-(void)setLeftButtonImage:(UIImage *)img forState:(UIControlState)state;
-(void)AlertMessage:(NSString *)alertTitle message:(NSString *)message;
 
//-(void)addErrorView:(NSString *)str;

-(void)AddStatusbBar:(NSString *)msg type:(int)type;
-(void)AddStatusbBar:(NSString *)msg type:(int)type withTag:(int)index;
-(void)statusbarDisappear:(int)index;
-(void)pushViewController:(UIViewController *)viewcontroller;
-(void)presentViewController:(UIViewController *)viewcontroller useNav:(BOOL)useNav;
-(void)popViewController:(int)ControllerId;
-(void)dismissModalViewController;
 
-(void)setRightButtonStyle:(IHNavButtonStyle)style;
-(void)setLeftButtonStyle:(IHNavButtonStyle)style;
-(void)setRightButtonStyle:(NSString *)normalImageName highlightImageName:(NSString *)highlightImageName text:(NSString *)text;
-(void)setRightButtonTitle:(NSString *)title;
-(void)addHelpView:(UIView *)helpView;
-(void)addStartView;

-(void)removeStartView;
- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
-(void)showFootBar;
-(void)showFootBar:(float)y;
-(UIView *)footBar;
-(void)removeFootBar;
@end
@class IHTextField;
 @interface IHBaseCustomViewController : IHBaseViewController<UITextFieldDelegate,UITextViewDelegate,UIScrollViewDelegate>{
    UIScrollView *_BaseScrollView;
    float _scrollOffset_y;
    float _moreOffset_y;
    IHTextField *_activityTextField;
	UITextView *_activityTextView;
}
@property(nonatomic)BOOL autoLoad;
-(void)useRefreshHeader;
-(void)loadLatestData;
-(void)doneLoadingLatestData;
-(void)setContentsize:(CGSize)size;
-(void)loadHistoryData;
-(void)doneLoadingHistoryData:(BOOL)isOver;
@end

@interface UIScrollView (infohold)

-(CGRect)visibleRect;
@end

@interface UINavigationBar(infohold)

-(void)drawRect:(CGRect)rect;

@end

 
