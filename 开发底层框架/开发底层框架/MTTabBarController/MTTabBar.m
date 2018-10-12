
//  MTTabBar.m
//  MiaoTuProject
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "MTTabBar.h"

@implementation MTTabBar
- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage index :(int)index title:(NSString *)title{
    
    indexFlag=0 ;
    
    CGRect rect = self.bounds ;
    [[UITabBar appearance] setShadowImage:[UIImage new]] ;
    [[UITabBar appearance] setBackgroundImage:[UIImage new]] ;
    rect.size.height = tabBarHeigh ;
    rect.origin.y = -5 ;
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom] ;
    CGFloat btnWidth=WindowWith/TabbarCount;
    
    CGFloat x=index*btnWidth ;
    int y= 7 ;
    btn.frame=CGRectMake(x, 0, btnWidth, 47) ;
    
//    CGFloat ImageWidth =0 ;
//    if (index == 0) {
//        ImageWidth = (btnWidth/2-(image.size.width)/2)*3/2 ;
//    }else if (index == 1){
//        ImageWidth = btnWidth/2-(image.size.width)/2 ;
//    }else if (index == 2){
//        ImageWidth = btnWidth - image.size.width -(btnWidth/2-(image.size.width)/2)*3/2 ;
////        self.lastBtn = btn ;
//    }
    UIImageView *btnImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, y, image.size.width, image.size.height)] ;
    btnImage.tag=10+index ;
    btnImage.image=image ;
    btnImage.centerX = btn.width/2.0;
    btnImage.backgroundColor = [UIColor clearColor];
    [btn addSubview:btnImage] ;
    
    SMLabel *lbl=[[SMLabel alloc]initWithFrame:CGRectMake(0, btnImage.bottom+5, btnWidth, 12)] ;
    lbl.centerX = btnImage.centerX ;
    lbl.backgroundColor = [UIColor clearColor];
    lbl.font=sysFont(12) ;
//    默认的颜色
    lbl.textColor= [UIColor colorWithRed:33/255.0 green:76/255.0 blue:146/255.0 alpha:1/1.0];
//    [UIColor colorWithRed:33/255.0 green:76/255.0 blue:146/255.0 alpha:1/1.0];
    lbl.text=title;
    lbl.tag=100+index;
    lbl.textAlignment=NSTextAlignmentCenter;
    [btn addSubview:lbl];
    
    btn.tag=1000+index;
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];

    if (index==1) {
        
        UIImage *img=Image(@"redpoint.png");
        UIImageView *redIMG=[[UIImageView alloc]initWithFrame:CGRectMake(x+btnImage.right - 5, btnImage.top, img.size.width, img.size.height)];
//        redIMG.image=img;
        redIMG.hidden=YES;
        redIMG.clipsToBounds = YES;
        [redIMG.layer setCornerRadius:img.size.width/2];
        redIMG.backgroundColor = [UIColor redColor];
        _gcRedImageView=redIMG;
        [self addSubview:redIMG];
        
//        CornerView *view=[[CornerView alloc]initWithFrame:CGRectMake(x+btnImage.right-5, btnImage.top, 15, 15) count:0];//
//        _cornerview=view;
        
//        [self addSubview:view];
    }
    //tab_def_Image
   
    //如果是第一个按钮, 则选中(按顺序一个个添加)
    if (index == 0) {
        [self clickBtn:btn];
        self.selectedBtn = btn;
    }
    
    UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -2.5, WindowWith, 3.5)];
    lineView.image = Image(@"tab_def_Image");
    lineView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:lineView];
}




 -(void)setMessageNum:(int)num{
//     [_cornerview setNum:num];
     if (num>0) {
         _gcRedImageView.hidden=NO;
     }else{
         _gcRedImageView.hidden=YES;
     }
}

-(void)setGCRedHidden:(BOOL)isHidden{
    _gcRedImageView.hidden=isHidden;
}


-(void)setMeRedHidden:(BOOL)isHidden{
    _meRedImageView.hidden=isHidden;
}

/**
 *  自定义TabBar的按钮点击事件
 */
- (void)clickBtn:(UIButton *)button {
    
    NSInteger index=button.tag-1000;
    if (index!=0) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"launchAdvertise"];
    }

    if (indexFlag!=index) {
        [self animationWithIndex:index];
    }
    
    NSInteger oldIndex=self.selectedBtn.tag-1000;
    if (index==oldIndex) {
        return;
    }
    
    SMLabel *lbl=[button viewWithTag:index+100];
//    lbl.textColor=RGBA(85, 136, 216, 1.0f);
//    选中的颜色
    lbl.textColor= [UIColor colorWithRed:85/255.0 green:136/255.0 blue:216/255.0 alpha:1/1.0];

    
    NSArray * _tabConfigList = [ConfigManager getMainConfigList];
    NSDictionary *dic=[_tabConfigList objectAtIndex:index];
    NSString *imageNameSel = [dic objectForKey:@"highlightedImage"];

    UIImageView *imgView=[button viewWithTag:index+10];
    
  
     imgView.image=Image(imageNameSel);
    self.selectedBtn.selected = NO;
    
    if (oldIndex<0) {
        oldIndex=0;
    }
//    默认的颜色
    lbl=[self.selectedBtn viewWithTag:oldIndex+100];
    lbl.textColor= [UIColor colorWithRed:33/255.0 green:76/255.0 blue:146/255.0 alpha:1/1.0];
//    RGB(157, 157, 169)
    imgView=[self.selectedBtn viewWithTag:oldIndex+10];
    NSDictionary *dic2=[_tabConfigList objectAtIndex:oldIndex];
    NSString *imageNameunSel = [dic2 objectForKey:@"image"];
    imgView.image=Image(imageNameunSel);
    
    //2.再将当前按钮设置为选中
    button.selected = YES;
    
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectedBtn = button;
    
    //1.先将之前选中的按钮设置为未选中
   
    //却换视图控制器的事情,应该交给controller来做
    //最好这样写, 先判断该代理方法是否实现
    
  
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:self.selectedBtn.tag to:button.tag];
    }
    
    //切换tab栏之后
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationTabBarChanged object:[NSNumber numberWithInteger:index]];
    
}


- (void)animationWithIndex:(NSInteger) index {
//    NSArray * _tabConfigList = [ConfigManager getMainConfigList];
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    
    for (NSInteger i=0; i<TabbarCount; i++) {
        UIButton *btn=[self viewWithTag:1000+i];
        [tabbarbuttonArray addObject:btn];
    }
//    for (UIButton *tabBarButton in self.subviews) {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [tabbarbuttonArray addObject:tabBarButton];
//        }
//    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.08;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
    
   indexFlag = (int)index;
    
}

@end
