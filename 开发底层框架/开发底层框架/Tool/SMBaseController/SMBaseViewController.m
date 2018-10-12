//
//  SMBaseViewController.m
//  SkillExchange
//
//  Created by xu bin on 15/3/10.
//  Copyright (c) 2015年 xubin. All rights reserved.
//

#import "SMBaseViewController.h"
#import "IHUtility+category.h"
#import "AppDelegate.h"
#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0
#define  bactTopWidth  42
#import "UINavigationBar+Awesome.h"
#import "SSMainViewController.h"
#import "MTTabBarViewController.h"
#import "HomePageController.h"
#import "MiaoTuHeader.h"
#import "MiaoTuFooter.h"
@interface SMBaseViewController ()
{
  
    
}
@end

@implementation SMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ( IOS7_OR_LATER )
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    //去掉navigationBar下面的那条分割线
 
    self.view.backgroundColor = cBgColor;
//导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:cBgColor] forBarMetrics:UIBarMetricsDefault];
//状态栏
    self.navigationController.navigationBar.barTintColor = cBgColor;
}


//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    UIViewController * currVC = nil;
    UIViewController * Rootvc = window.rootViewController ;
    if ([Rootvc isKindOfClass:[SSMainViewController class]]) {
        SSMainViewController * mainVC = (SSMainViewController *)Rootvc;
        MTTabBarViewController *tabVc = [mainVC.childViewControllers lastObject];
        UINavigationController * nav = (UINavigationController *)[tabVc.viewControllers objectAtIndex:tabVc.selectedIndex];
        UIViewController * v = [nav.viewControllers lastObject];
        currVC = v;
    }
    
    return currVC;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    NSArray *ViewControllers=self.navigationController.viewControllers;
    if (ViewControllers.count>1) {
        [self setHomeTabBarHidden:YES];
    }else{
         [self setHomeTabBarHidden:NO];
    }
    
}


-(void)backTopClick:(UIButton *)sender{
    
}



-(void)setHomeTabBarHidden:(BOOL)isHidden{
    if (isHidden) {
        [[NSNotificationCenter defaultCenter]postNotificationName:NotificationtabBarHidden object:[NSNumber numberWithBool:YES]];
    }else{
        [[NSNotificationCenter defaultCenter]postNotificationName:NotificationtabBarHidden object:[NSNumber numberWithBool:NO]];
    }
}



-(void)back:(id)sender{
   
//    NSArray *ViewControllers=self.navigationController.viewControllers;
//    if (ViewControllers.count==2) {
//        [self setHomeTabBarHidden:NO];
//    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pushViewController:(UIViewController *)viewcontroller{
    [self setHomeTabBarHidden:YES];
    
//    viewcontroller.hidesBottomBarWhenPushed = YES;   //这个必须写在super前面, 否则跳转已经过了
    [self.navigationController pushViewController:viewcontroller animated:YES];
    
    if ([[self getCurrentVC] isMemberOfClass:[HomePageController class]]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pushViewController" object:nil];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [[SDWebImageManager sharedManager] cancelAll];
    
//    [[SDImageCache sharedImageCache] clearDisk];
}

-(void)presentViewController:(UIViewController *)viewcontroller{
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:viewcontroller];
    
     [self presentViewController:nav animated:YES completion:nil];
}


//数据缓存 1小时刷新一次
-(void)refreshTableViewLoading:(MTBaseTableView *)_commTableView
                          data:(NSMutableArray *)dataArray
                      dateType:(NSString *)dateType{
    if([_commTableView.table.mj_header isRefreshing])
    {
        return;
    }
    
    //1小时更新一次
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSDate *date1=[NSDate date];
    NSDate *oldDate;
    oldDate=[userDefault objectForKey:dateType];
    int t=[IHUtility daysWithinEraFromDate:oldDate toDate:date1];
    if (oldDate!=nil) {
        if (dataArray.count==0) {
            
        }else{
            if (t<0.5){
                return;
            }
        }
    }
    [_commTableView.table.mj_header beginRefreshing];
    
    NSDate *date=[NSDate date];
    [userDefault setObject:date forKey:dateType];
    [userDefault synchronize];
    
}

-(void)refreshTableViewLoading2:(UITableView *)_commTableView
                          data:(NSMutableArray *)dataArray
                      dateType:(NSString *)dateType{
    if([_commTableView.mj_header isRefreshing])
    {
        return;
    }
    
    //1小时更新一次
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSDate *date1=[NSDate date];
    NSDate *oldDate;
    oldDate=[userDefault objectForKey:dateType];
    int t=[IHUtility daysWithinEraFromDate:oldDate toDate:date1];
    if (oldDate!=nil) {
        if (dataArray.count==0) {
            
        }else{
            if (t<0.5){
                return;
            }
        }
    }
    [_commTableView.mj_header beginRefreshing];
    
    NSDate *date=[NSDate date];
    [userDefault setObject:date forKey:dateType];
    [userDefault synchronize];
    
}


-(void)CreateBaseRefesh:(MTBaseTableView *)commtableView
                   type:(RefreshEnumType)type
          successRefesh:(void(^)(MJRefreshComponent *refreshView))successRefesh{
    [self.view setBackgroundColor:cBgColor];
    
     self.successRefeshBlock=successRefesh;
    if (type==ENT_RefreshAll) {
        commtableView.table.mj_header = [MiaoTuHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
        commtableView.table.mj_footer = [MiaoTuFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }else if (type==ENT_RefreshHeader){
        commtableView.table.mj_header = [MiaoTuHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }else if (type==ENT_RefreshFooter){
         commtableView.table.mj_footer = [MiaoTuFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }
    
    commBaseTableView=commtableView;
}

-(void)scrollTopPoint:(UIScrollView *)scroll{
    [scroll setContentOffset:CGPointMake(0, 0) animated:YES];
}

-(void)CreateCollectionViewRefesh:(UICollectionView *)collectionView
                   type:(RefreshEnumType)type
          successRefesh:(void(^)(MJRefreshComponent *refreshView))successRefesh{
    [self.view setBackgroundColor:cBgColor];
    
    self.successRefeshBlock=successRefesh;
    if (type==ENT_RefreshAll) {
        collectionView.mj_header = [MiaoTuHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
        collectionView.mj_footer = [MiaoTuFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }else if (type==ENT_RefreshHeader){
        collectionView.mj_header = [MiaoTuHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }else if (type==ENT_RefreshFooter){
        collectionView.mj_footer = [MiaoTuFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }
    
    CollectionView=collectionView;
}


-(void)CreateTableViewRefesh:(UITableView *)TableView
                             type:(RefreshEnumType)type
                    successRefesh:(void(^)(MJRefreshComponent *refreshView))successRefesh{
    [self.view setBackgroundColor:cBgColor];
    
    self.successRefeshBlock=successRefesh;
    if (type==ENT_RefreshAll) {
        TableView.mj_header = [MiaoTuHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
        TableView.mj_footer = [MiaoTuFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }else if (type==ENT_RefreshHeader){
        TableView.mj_header = [MiaoTuHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }else if (type==ENT_RefreshFooter){
        TableView.mj_footer = [MiaoTuFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }
    
    tableView=TableView;
}
-(void)CreateScrollViewRefesh:(UIScrollView *)scrollView
                        type:(RefreshEnumType)type
               successRefesh:(void(^)(MJRefreshComponent *refreshView))successRefesh{
    [self.view setBackgroundColor:cBgColor];
    
    self.successRefeshBlock=successRefesh;
    if (type==ENT_RefreshAll) {
        scrollView.mj_header = [MiaoTuHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
        scrollView.mj_footer = [MiaoTuFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }else if (type==ENT_RefreshHeader){
        scrollView.mj_header = [MiaoTuHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }else if (type==ENT_RefreshFooter){
        scrollView.mj_footer = [MiaoTuFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadRefreshData:)];
    }
    
    ScrollView=scrollView;
}
-(void)beginRefesh:(RefreshEnumType)type{
    if (type==ENT_RefreshHeader){
        [commBaseTableView.table.mj_header beginRefreshing];
    }
    else if (type==ENT_RefreshFooter){
         [commBaseTableView.table.mj_footer beginRefreshing];
    }
}

-(void)begincollectionViewRefesh:(RefreshEnumType)type{
    if (type==ENT_RefreshHeader){
        [CollectionView.mj_header beginRefreshing];
    }
    else if (type==ENT_RefreshFooter){
        [CollectionView.mj_footer beginRefreshing];
    }
}

-(void)beginTableViewRefesh:(RefreshEnumType)type{
    if (type==ENT_RefreshHeader){
        [tableView.mj_header beginRefreshing];
    }
    else if (type==ENT_RefreshFooter){
        [tableView.mj_footer beginRefreshing];
    }
}

-(void)beginScrollViewRefesh:(RefreshEnumType)type{
    if (type==ENT_RefreshHeader){
        [ScrollView.mj_header beginRefreshing];
    }
    else if (type==ENT_RefreshFooter){
        [ScrollView.mj_footer beginRefreshing];
    }
}



-(void)endRefresh{
    if([commBaseTableView.table.mj_header isRefreshing])
    {
        [commBaseTableView.table.mj_header endRefreshing];
    }else if ([commBaseTableView.table.mj_footer isRefreshing]){
         [commBaseTableView.table.mj_footer endRefreshing];
    }
}

-(void)endcollectionViewRefresh{
    if([CollectionView.mj_header isRefreshing])
    {
        [CollectionView.mj_header endRefreshing];
    }else if ([CollectionView.mj_footer isRefreshing]){
        [CollectionView.mj_footer endRefreshing];
    }
}

-(void)endTableViewRefresh{
    if([tableView.mj_header isRefreshing])
    {
        [tableView.mj_header endRefreshing];
    }else if ([tableView.mj_footer isRefreshing]){
        [tableView.mj_footer endRefreshing];
    }
}

-(void)endScrollViewRefresh{
    if([ScrollView.mj_header isRefreshing])
    {
        [ScrollView.mj_header endRefreshing];
    }else if ([tableView.mj_footer isRefreshing]){
        [ScrollView.mj_footer endRefreshing];
    }
}


-(void)loadRefreshData:(MJRefreshComponent *)refreshView{
    self.successRefeshBlock(refreshView);
}



-(void)setNavBarItem:(BOOL)hasCollection{
    UIImage *img=Image(@"Group 35.png");
    UIImage *shareImg=Image(@"shareGreen.png");
    if (hasCollection) {
        img=Image(@"activ_detailCollect.png");
    }
    searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame=CGRectMake(0, 0, img.size.width, img.size.height);
    
    [searchBtn addTarget:self action:@selector(collection) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setBackgroundImage:img forState:UIControlStateNormal];
     searchBtn.imageEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    
    
    moreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame=CGRectMake(0, 0, 40, 40);
    [moreBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [moreBtn setImage:shareImg forState:UIControlStateNormal];
    
   // moreBtn.imageEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    UIBarButtonItem *barSearchBtn=[[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    UIBarButtonItem *barMoreBtn=[[UIBarButtonItem alloc]initWithCustomView:moreBtn];
    NSArray *rightBtns=[NSArray arrayWithObjects:barMoreBtn,barSearchBtn, nil];
    self.navigationItem.rightBarButtonItems=rightBtns;
    
    
    
    UIButton *Btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    Btn2.frame=CGRectMake(0, 0, 40, 40);
    
    [Btn2 setBackgroundImage:img forState:UIControlStateNormal];
    Btn2.hidden=YES;
    
    UIBarButtonItem *leftBtn2=[[UIBarButtonItem alloc]initWithCustomView:Btn2];
    
    
    
    img=Image(@"iconfont-fanhui.png");
    
    UIButton *Btn3=[UIButton buttonWithType:UIButtonTypeCustom];
    Btn3.frame=CGRectMake(0, 0, 30, 30);
    [Btn3 setImage:img forState:UIControlStateNormal];
    [Btn3 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *item3  = [[UIBarButtonItem alloc] initWithCustomView:Btn3];
    _backBtn = Btn3;
    self.navigationItem.leftBarButtonItems=@[item3,leftBtn2];
    
}
//导航栏透明的按钮
- (void)setApleaNavgationItem:(BOOL)hasCollection{
    
    UIImage *collectImg = Image(@"Group 35.png");
    
    UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(0, 0, collectImg.size.width, collectImg.size.height);
    [collectBtn setImage:collectImg forState:UIControlStateNormal];
    [collectBtn setImage:Image(@"activ_detailCollect.png") forState:UIControlStateSelected];
    [collectBtn addTarget:self action:@selector(collection) forControlEvents:UIControlEventTouchUpInside];
    searchBtn = collectBtn;
    
    if (hasCollection){
        collectBtn.selected = YES;
    }
    
    UIBarButtonItem *collectBarItem = [[UIBarButtonItem alloc] initWithCustomView:collectBtn];
    
    UIImage *shareImg = Image(@"shareGreen.png");
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(0, 0, shareImg.size.width, shareImg.size.height);
    [shareBtn setImage:shareImg forState:UIControlStateNormal];
    [shareBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    moreBtn = shareBtn;
    UIBarButtonItem *shareBarItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    
    self.navigationItem.rightBarButtonItems = @[shareBarItem,collectBarItem];
    

}

-(void)share
{
    
}

-(void)collection
{
    
}

-(void)addWaitingView{
  [IHUtility addWaitingView];
   
}

-(void)removeWaitingView{
    [IHUtility removeWaitingView];
}


// type 1成功  2失败
-(void)addSucessView:(NSString *)str type:(int)type{
    [IHUtility addSucessView:str type:type];

}

-(void)prsentToLoginViewController
{
//    [[NSNotificationCenter defaultCenter]postNotificationName:NotificationLoginIn object:nil];
}

@end


@implementation SMBaseCustomViewController

@synthesize BaseScrollView,activityTextField;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if ( IOS7_OR_LATER )
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    //去掉navigationBar下面的那条分割线
    //    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.view setBackgroundColor:cBgColor];

    
    UIScrollView *scroll=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _deviceSize.width, _boundHeihgt)];
    [scroll setContentSize:CGSizeMake(_deviceSize.width, _boundHeihgt)];
    [scroll setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:scroll];
    _BaseScrollView=scroll;
    
    
    //导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:cBgColor] forBarMetrics:UIBarMetricsDefault];
    //状态栏
    self.navigationController.navigationBar.barTintColor = cBgColor;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    
    [self registerForKeyboardNotifications];
    
    // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleLeaveViewController) name:@"leftViewController" object:nil];
    
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    _singleTapGR = singleTapGR;
    [self.view addGestureRecognizer:singleTapGR];
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    
    [self.view endEditing:YES];
}


- (void)dealloc {
    [self removeKeyboardNotifications];
    //    [_usersettings release];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



#pragma mark UIKeyboard

-(void)removeKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}


- (void)keyboardWasShown:(NSNotification*)aNotification
{
    //如果不是当前页面
    if (![self.navigationController.visibleViewController isEqual:self] || (_activityTextField == nil && _activityTextView==nil)) {
        return;
    }
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // NSLog(@"\n\n  keyboardWasShown   kbSize height:%f",kbSize.height);
    
    //如果加过一次，就不再加了。 不然重复加会出问题
    if(_hadKeyboardShow == NO)
    {
        CGSize size= _BaseScrollView.contentSize;
        
        size.height +=kbSize.height;
        
        
        _addContentSize = kbSize;
        [_BaseScrollView setContentSize:CGSizeMake(size.width, size.height)];
    }
    
    
    UIView *container;
    CGRect fieldFrame;
    if (_activityTextField!=nil) {
        container=[_activityTextField superview];
        fieldFrame=[_activityTextField frame];
    }else {
        container=[_activityTextView superview];
        fieldFrame=[_activityTextView frame];
    }
    
    float h = _boundHeihgt;
    
    UIWindow* window = [AppDelegate sharedAppDelegate].window;
    
    //全部都转到window里去
    CGPoint ptToWindow = [_BaseScrollView convertPoint:_BaseScrollView.frame.origin toView:window];
    
    float off =   ptToWindow.y + fieldFrame.origin.y + fieldFrame.size.height -  (h - kbSize.height);
    
    
    while ([container isEqual:_BaseScrollView] == NO && container !=nil) {
        off = off + container.frame.origin.y;
        container = [container superview];
    }
    
    if (off>0) {
        CGPoint pp=CGPointMake(0, off+_BaseScrollView.contentOffset.y+_moreOffset_y+50);
        
        [_BaseScrollView setContentOffset:pp animated:YES];
    }
    
    _hadKeyboardShow = YES;
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_activityTextField resignFirstResponder];
    [_activityTextView resignFirstResponder];
    //[AppUserSettings SETCURRENTACTIVITYFIELD:nil];
    [self.view endEditing:YES];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    //如果不是当前页面
    if (!_hadKeyboardShow) {
        return;
    }
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _BaseScrollView.contentInset = contentInsets;
    _BaseScrollView.scrollIndicatorInsets = contentInsets;
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    //    CGRect bkgndRect = _activityTextField.superview.frame;
    CGSize c= _BaseScrollView.contentSize;
    
    NSLog(@"\n\n keyboardWillBeHidden :kbSize height:%f",kbSize.height);
    
    c.height = c.height-_addContentSize.height;
    
    [_BaseScrollView setContentSize:c];
    
    NSLog(@"size after,content height:%f",c.height);
    
    _scrollOffset_y = 0.0f;
    _activityTextField=nil;
    _activityTextView=nil;
    
    _hadKeyboardShow = NO;
}



-(BOOL)textFieldShouldBeginEditing:(IHTextField *)textField{
    
    if ([textField isKindOfClass:[UITextFieldLogin class]]) {
        UITextFieldLogin* text = (UITextFieldLogin *)textField;
        [text refreshTextField:YES];
    }
    
//    [AppUserSettings SETCURRENTACTIVITYFIELD:textField];
    _activityTextField=textField;
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if ([textField isKindOfClass:[UITextFieldLogin class]]) {
        UITextFieldLogin* text = (UITextFieldLogin *)textField;
        [text refreshTextField:NO];
    }
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    _activityTextView = textView;
    return YES;
}







@end
