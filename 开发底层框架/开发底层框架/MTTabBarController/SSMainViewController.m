//
//  SSMainViewController.m
//  框架搭建
//
//  Created by 开拍网ios研发 on 2018/9/28.
//  Copyright © 2018年 开拍网ios研发. All rights reserved.
//

#import "SSMainViewController.h"
#import "MTTabBarViewController.h"


@interface SSMainViewController ()
{
     MTTabBarViewController *_tabBarVC;
}
@end

@implementation SSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dic=[IHUtility getUserDefalutDic:kUserDefalutLoginInfo];
    
    if (dic!=nil) {
        if (dic.allKeys.count>0) {
            [USERMODEL setUserInfo:dic];
        }
    }
    
    MTTabBarViewController *controller=[[MTTabBarViewController alloc]init];
    controller.view.frame=CGRectMake(0, 0, [UIScreen mainScreen ].bounds.size.width, [UIScreen mainScreen ].bounds.size.height+75);
    _tabBarVC=controller;
    [_tabBarVC setTabBarHidden:NO];
    controller.selectBlock=^(NSInteger index) {
        
        if (index==0) {
            
        }
        if (index==1) {//供求 ，供应
            
        }
        if (index==2) {
            
        }
        
        else if (index==3){
            
        }
    };
    
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    
//    页面跳转隐藏tabbar
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarHidden:) name:NotificationtabBarHidden object:nil];
    
}


-(void)tabBarHidden:(NSNotification *)notification{
    BOOL isHidden=[[notification object]boolValue];
    [_tabBarVC setTabBarHidden:isHidden];
}
@end
