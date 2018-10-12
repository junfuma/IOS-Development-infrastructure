//
//  MTTabBarViewController.m
//  MiaoTuProject
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTTabBarViewController.h"

#import "HomePageController.h"
#import "MineViewController.h"


#define  stateBarHeigh  [UIApplication sharedApplication].statusBarFrame.size.height
@interface MTTabBarViewController ()<MTTabBarDelegate>
{
    int indexFlag;
    UIImageView *_backImgView;
}
@end

@implementation MTTabBarViewController


- (NSArray *)createTabItemArr
{
   NSArray * _tabConfigList = [ConfigManager getMainConfigList];
    NSMutableArray *item = [NSMutableArray array];
    for (int i = 0; i < _tabConfigList.count; i ++)
    {
        switch (i) {
            case 0:
            {
                HomePageController *vc=[[HomePageController alloc]init];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
                
                [item addObject:nav];
                
            }
                break;
            case 1:
            {
                MineViewController *vc=[[MineViewController alloc]init];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
                
                [item addObject:nav];

            }
                break;
//            case 2:
//            {
//
//                
//                TradingController *vc=[[TradingController alloc]init];
//                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//                
//                [item addObject:nav];
//            }
//                break;
//            case 3:
//            {
//                
//                
//                MineController *vc=[[MineController alloc]init];
//                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//                
//                [item addObject:nav];
//            }
//                break;
            default:
                break;
        }
        
    }
    return item;
    
}

 
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
//  状态栏
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    

}



- (void)viewDidLoad {
    [super viewDidLoad];
    indexFlag=0;
    self.viewControllers = [self createTabItemArr];
    
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = tabBarHeigh;
    tabFrame.origin.y = _boundHeihgt+100;//self.view.frame.size.height - tabBarHeigh;
    self.tabBar.frame = tabFrame;
    self.tabBar.hidden=YES;
    
    if (stateBarHeigh==40) {
        ChangeStateNum=20;
    }else if (stateBarHeigh==20){
        ChangeStateNum=0;
    }
    
    CGRect rect = CGRectMake(0, _boundHeihgt-tabBarHeigh-ChangeStateNum, WindowWith, tabBarHeigh);//self.tabBar.bounds;
//    if (IS_IPHONE_X) {
//        rect = CGRectMake(0, _boundHeihgt-tabBarHeigh-ChangeStateNum - 34, WindowWith, tabBarHeigh + 34);
//    }
  
    MTTabBar *myView = [[MTTabBar alloc] init]; //设置代理必须改掉前面的类型,不能用UIView
    myView.frame = rect;
    _tabBar=myView;
    myView.backgroundColor= cBgColor;
    myView.delegate = self; //设置代理
    [self.view addSubview:myView]; //添加到系统自带的tabBar上, 这样可以用的的事件方法. 而不必自己去写

    UIImageView *backImgView = [[UIImageView alloc] initWithFrame:myView.bounds];
    backImgView.image = Image(@"tab_shouye.png");
    backImgView.contentMode = UIViewContentModeScaleToFill;
    backImgView.backgroundColor = [UIColor clearColor];
    _backImgView = backImgView;
//    [myView addSubview:backImgView];

    UIView *lineVIew=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WindowWith, 0.5)];
    lineVIew.backgroundColor=RGBA(189, 202, 219, 1);
//    [myView addSubview:lineVIew];
    
    //为控制器添加按钮
    NSArray * _tabConfigList = [ConfigManager getMainConfigList];
    for (int i=0; i<_tabConfigList.count; i++) { //根据有多少个子视图控制器来进行添加按钮
        NSDictionary *dic=[_tabConfigList objectAtIndex:i];
        NSString *imageName = [dic objectForKey:@"image"];
        NSString *imageNameSel = [dic objectForKey:@"highlightedImage"];
        
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *imageSel = [UIImage imageNamed:imageNameSel];
        
        [myView addButtonWithImage:image selectedImage:imageSel index:i title:dic[@"title"]];
        
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTabBarSelected:) name:NotificationChangeTabBarSelectedIndex object:nil];
    // Do any additional setup after loading the view.
    isHidden=NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stateBarFrame2:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
    
}

-(void)stateBarFrame2:(NSNotification *)notification{
    
    NSLog(@"进来了1111=%f ",[UIApplication sharedApplication].statusBarFrame.size.height);
    
    CGRect rect=_tabBar.frame;
    if (stateBarHeigh==40) {
        ChangeStateNum=20;
    }else if (stateBarHeigh==20){
        ChangeStateNum=0;
    }
    rect.origin.y= _boundHeihgt-tabBarHeigh-ChangeStateNum;

    _tabBar.frame=rect;
 

}

-(void)setTabBar1Num:(int)num{
  
    if (num>0) {
        [_tabBar setGCRedHidden:NO];
    }else{
        [_tabBar setGCRedHidden:YES];
    }

    
}

-(void)setMessageNum:(int)num{
    [_tabBar setMessageNum:num];
}

-(void)setTabBar4Num:(int)num{
  
    if (num>0) {
        [_tabBar setMeRedHidden:NO];
    }else{
        [_tabBar setMeRedHidden:YES];
    }
}


-(void)setTabBarHidden:(BOOL)hidden{
    
//    if (isHidden!=hidden) {
        if (hidden) {
            [UIView animateWithDuration:0.4 animations:^{
                CGRect rect=_tabBar.frame;
                rect.origin.y=_boundHeihgt+15-ChangeStateNum;
                _tabBar.frame=rect;
                
            } completion:^(BOOL finished) {
                
            }];
        }else{
            [UIView animateWithDuration:0.4 animations:^{
                CGRect rect=_tabBar.frame;
                rect.origin.y=_boundHeihgt-tabBarHeigh-ChangeStateNum;
                _tabBar.frame=rect;
                
            } completion:^(BOOL finished) {
                
            }];
        }
        isHidden=hidden;
        
//    }
    
    
}
/**永远别忘记设置代理*/
- (void)tabBar:(MTTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to {
    
    NSInteger index=to-1000;

    self.selectedIndex = index;
    if (index == 0) {
        _backImgView.image = Image(@"tab_guoyou_bg.png");
    }else if (index == 1){
        _backImgView.image = Image(@"tab_shouye.png");
    }else{
        _backImgView.image = Image(@"tab_wode.png");
    }
    
}

-(void)setTabBarSelected:(NSNotification *)notification
{
    int selIndex=[[notification object]intValue];
    
    self.selectedIndex=selIndex;
    UIButton *btn=[_tabBar viewWithTag:1000+selIndex];
    [_tabBar clickBtn:btn];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    if (indexFlag!=index) {
       [self animationWithIndex:index];
    }
}

- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.08;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
    
   indexFlag =(int) index;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
