//
//  SMBaseViewController.h
//  SkillExchange
//
//  Created by xu bin on 15/3/10.
//  Copyright (c) 2015年 xubin. All rights reserved.
//

//#import "IHBaseViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "MTBaseTableView.h"
#import <MJRefresh/MJRefresh.h>
//#import "CustomView.h"
#define  backBtnY  WindowHeight-110
#import "IHBaseViewController.h"
typedef void (^successRefeshBlock) (MJRefreshComponent *refreshView);

typedef enum{
   ENT_RefreshAll,   // 加载全部
   ENT_RefreshHeader,  //加载 下拉刷新
   ENT_RefreshFooter,  //加载上拉加载
}RefreshEnumType;

@class XHFriendlyLoadingView;
@interface SMBaseViewController : IHBaseViewController<UIGestureRecognizerDelegate,CLLocationManagerDelegate,UITextFieldDelegate>

{
    MTBaseTableView *commBaseTableView;
    UICollectionView *CollectionView;
    UITableView *tableView;
    UIScrollView *ScrollView;
    UIButton *moreBtn;
    UIButton *searchBtn;
    UIButton *backTopbutton;
    UIButton *_backBtn;
    XHFriendlyLoadingView* _HUD;
    
//    OrderWaitingView *_orderWaitView;//订单等待

}

@property(nonatomic,weak)SMBaseViewController *inviteParentController;
@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,copy)successRefeshBlock successRefeshBlock;
//@property(nonatomic,copy)ShowUserLocationBlock showUserLocationBlock;
//封装下拉刷新
//-(void)setbackTopFrame:(CGFloat)y;
-(void)scrollTopPoint:(UIScrollView *)scroll;
-(void)beginRefesh:(RefreshEnumType)type;
-(void)endRefresh;

-(void)endTableViewRefresh;
-(void)beginTableViewRefesh:(RefreshEnumType)type;
-(void)CreateTableViewRefesh:(UITableView *)TableView
                        type:(RefreshEnumType)type
               successRefesh:(void(^)(MJRefreshComponent *refreshView))successRefesh;
-(void)CreateBaseRefesh:(MTBaseTableView *)commtableView
                   type:(RefreshEnumType)type
          successRefesh:(void(^)(MJRefreshComponent *refreshView))successRefesh;
-(void)CreateCollectionViewRefesh:(UICollectionView *)collectionView
                             type:(RefreshEnumType)type
                    successRefesh:(void(^)(MJRefreshComponent *refreshView))successRefesh;

-(void)CreateScrollViewRefesh:(UIScrollView *)scrollView
                         type:(RefreshEnumType)type
                successRefesh:(void(^)(MJRefreshComponent *refreshView))successRefesh;

-(void)begincollectionViewRefesh:(RefreshEnumType)type;
-(void)beginScrollViewRefesh:(RefreshEnumType)type;
-(void)endcollectionViewRefresh;
-(void)endScrollViewRefresh;
//-(void)reloadWaitingView;
-(void)prsentToLoginViewController;
-(void)addWaitingView;
-(void)removeWaitingView;
-(void)addSucessView:(NSString *)str type:(int)type;

-(void)presentViewController:(UIViewController *)viewcontroller;

-(void)refreshTableViewLoading2:(UITableView *)_commTableView
                           data:(NSMutableArray *)dataArray
                       dateType:(NSString *)dateType;
//数据缓存 1小时刷新一次

-(void)setHomeTabBarHidden:(BOOL)isHidden;
-(void)refreshTableViewLoading:(MTBaseTableView *)_commTableView
                          data:(NSMutableArray *)dataArray
                      dateType:(NSString *)dateType;


-(void)setNavBarItem:(BOOL)hasCollection;
- (void)setApleaNavgationItem:(BOOL)hasCollection;
-(void)share;
-(void)collection;

@end

#import "IHTextBaseTextField.h"
@interface SMBaseCustomViewController : SMBaseViewController<UITextFieldDelegate,UITextViewDelegate>
{
//    AppUserSettings *_usersettings;
    UIScrollView *_BaseScrollView;
    IHTextField *_activityTextField;
    UITextView *_activityTextView;
    float _scrollOffset_y;
    float _moreOffset_y;
    
    UITapGestureRecognizer *_singleTapGR;
    BOOL _hadKeyboardShow;
    CGSize _addContentSize;
}
//@property(nonatomic,strong)AppUserSettings *_usersettings;
@property(nonatomic,strong)UIScrollView *BaseScrollView;
@property(nonatomic,strong)UITextField *activityTextField;

- (void)registerForKeyboardNotifications;

@end

